// ─── STATE ───────────────────────────────────────────────
let symAlgo = "DES";
let symMode = "CBC";
let symOp = "encrypt";
let asymOp = "encrypt";
let hashAlgo = "MD5";
let rsaKeyPair = null;

// ─── KEY SIZE MAP ─────────────────────────────────────────
const keyInfo = {
  DES: { bytes: 8, bits: 64, label: "DES: 8 bytes (64-bit)" },
  "3DES": { bytes: 24, bits: 192, label: "3DES: 24 bytes (192-bit)" },
  AES: { bytes: 32, bits: 256, label: "AES: 16 / 24 / 32 bytes" },
};

const keyHints = {
  DES: "Key will be exactly 8 bytes. Shorter keys are padded; longer keys are truncated.",
  "3DES": "Key will be exactly 24 bytes. 3DES uses three 8-byte DES keys.",
  AES: "AES supports 128-bit (16 bytes), 192-bit (24 bytes), or 256-bit (32 bytes) keys.",
};

// ─── TAB SWITCHING ────────────────────────────────────────
function switchTab(id) {
  document.querySelectorAll(".tab-btn").forEach((b, i) => {
    b.classList.toggle("active", ["sym", "asym", "hash"][i] === id);
  });
  document
    .querySelectorAll(".panel")
    .forEach((p) => p.classList.remove("active"));
  document.getElementById("panel-" + id).classList.add("active");
}

// ─── SYMMETRIC ───────────────────────────────────────────
function selectSymAlgo(btn, algo) {
  document
    .querySelectorAll("#sym-algos .algo-btn")
    .forEach((b) => b.classList.remove("active"));
  btn.classList.add("active");
  symAlgo = algo;
  updateSymInfo();
}

function selectSymMode(btn, mode) {
  document
    .querySelectorAll("#sym-modes .algo-btn")
    .forEach((b) => b.classList.remove("active"));
  btn.classList.add("active");
  symMode = mode;
  document.getElementById("sym-iv-row").style.display =
    mode === "ECB" ? "none" : "";
}

function setSymMode(btn, op) {
  document
    .querySelectorAll(".mode-toggle .mode-btn")
    .forEach((b) => b.classList.remove("active"));
  btn.classList.add("active");
  symOp = op;
  document.getElementById("sym-input-label").textContent =
    op === "encrypt" ? "Plaintext *" : "Ciphertext (Base64) *";
  document.getElementById("sym-input").placeholder =
    op === "encrypt" ? "Enter plaintext..." : "Paste Base64 ciphertext...";
  document.getElementById("sym-run-btn").textContent =
    op === "encrypt" ? "▶ Encrypt" : "▶ Decrypt";
}

function updateSymInfo() {
  const info = keyInfo[symAlgo];
  document.getElementById("sym-key-badge").textContent = info.label;
  document.getElementById("sym-key-hint").textContent = keyHints[symAlgo];
}

function generateSymKey() {
  const sizes = { DES: 8, "3DES": 24, AES: 32 };
  const bytes = sizes[symAlgo] || 16;
  const arr = new Uint8Array(bytes);
  crypto.getRandomValues(arr);
  document.getElementById("sym-key").value = Array.from(arr)
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");
}

function getCJSMode(mode) {
  return (
    {
      CBC: CryptoJS.mode.CBC,
      ECB: CryptoJS.mode.ECB,
      CFB: CryptoJS.mode.CFB,
      OFB: CryptoJS.mode.OFB,
    }[mode] || CryptoJS.mode.CBC
  );
}

function runSymmetric() {
  const input = document.getElementById("sym-input").value.trim();
  const keyHex = document.getElementById("sym-key").value.trim();
  const ivHex = document.getElementById("sym-iv").value.trim();

  if (!input) return showError("sym-result", "Input text is required.");
  if (!keyHex) return showError("sym-result", "Secret key is required.");

  try {
    // Parse key
    const keyStr = keyHex.match(/^[0-9a-fA-F]+$/)
      ? CryptoJS.enc.Hex.parse(keyHex)
      : CryptoJS.enc.Utf8.parse(keyHex);

    const modeObj = getCJSMode(symMode);
    const opts = { mode: modeObj, padding: CryptoJS.pad.Pkcs7 };

    if (symMode !== "ECB") {
      const ivParsed = ivHex
        ? ivHex.match(/^[0-9a-fA-F]+$/)
          ? CryptoJS.enc.Hex.parse(ivHex)
          : CryptoJS.enc.Utf8.parse(ivHex)
        : CryptoJS.lib.WordArray.random(symAlgo === "AES" ? 16 : 8);
      opts.iv = ivParsed;
      // Show used IV
      document.getElementById("sym-iv").value = ivParsed.toString(
        CryptoJS.enc.Hex,
      );
    }

    let result;

    if (symOp === "encrypt") {
      const encFn = {
        DES: CryptoJS.DES,
        "3DES": CryptoJS.TripleDES,
        AES: CryptoJS.AES,
      }[symAlgo];
      result = encFn.encrypt(input, keyStr, opts).toString();
      showResult(
        "sym-result",
        result,
        `${symAlgo}-${symMode} ENCRYPTED (Base64)`,
      );
    } else {
      const encFn = {
        DES: CryptoJS.DES,
        "3DES": CryptoJS.TripleDES,
        AES: CryptoJS.AES,
      }[symAlgo];
      const dec = encFn.decrypt(input, keyStr, opts);
      result = dec.toString(CryptoJS.enc.Utf8);
      if (!result)
        throw new Error("Decryption failed. Check your key/IV/ciphertext.");
      showResult("sym-result", result, `${symAlgo}-${symMode} DECRYPTED`);
    }
  } catch (e) {
    showError("sym-result", e.message || "Operation failed.");
  }
}

function clearSym() {
  ["sym-input", "sym-key", "sym-iv"].forEach(
    (id) => (document.getElementById(id).value = ""),
  );
  document.getElementById("sym-result").style.display = "none";
}

// ─── RSA / ASYMMETRIC ────────────────────────────────────
function generateRSAKeys() {
  const bits = parseInt(document.getElementById("rsa-keysize").value);
  const statusEl = document.getElementById("rsa-gen-status");
  const btn = document.getElementById("rsa-gen-btn");
  btn.disabled = true;
  statusEl.innerHTML =
    '<span class="status-tag loading"><span class="spinner"></span> Generating…</span>';

  setTimeout(() => {
    try {
      const keypair = forge.pki.rsa.generateKeyPair({ bits, e: 0x10001 });
      rsaKeyPair = keypair;

      const pubPem = forge.pki.publicKeyToPem(keypair.publicKey);
      const privPem = forge.pki.privateKeyToPem(keypair.privateKey);

      document.getElementById("rsa-pub-key").textContent = pubPem;
      document.getElementById("rsa-priv-key").textContent = privPem;

      statusEl.innerHTML = `<span class="status-tag ok">✓ ${bits}-bit pair generated</span>`;
    } catch (e) {
      statusEl.innerHTML = `<span class="status-tag err">✗ ${e.message}</span>`;
    }
    btn.disabled = false;
  }, 50);
}

function setAsymMode(btn, op) {
  document
    .querySelectorAll("#panel-asym .mode-toggle .mode-btn")
    .forEach((b) => b.classList.remove("active"));
  btn.classList.add("active");
  asymOp = op;
  document.getElementById("rsa-input-label").textContent =
    op === "encrypt" ? "Plaintext *" : "Ciphertext (Base64) *";
  document.getElementById("rsa-key-label").innerHTML =
    op === "encrypt"
      ? 'Public Key (PEM) <span class="req">*</span><span style="color:var(--text-dim); font-size:9px;">&nbsp;— encrypt with public key</span>'
      : 'Private Key (PEM) <span class="req">*</span><span style="color:var(--text-dim); font-size:9px;">&nbsp;— decrypt with private key</span>';
  document.getElementById("rsa-key-input").placeholder =
    op === "encrypt"
      ? "-----BEGIN PUBLIC KEY-----\n...\n-----END PUBLIC KEY-----"
      : "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----";
}

function pasteGeneratedKey() {
  if (!rsaKeyPair) return showError("rsa-result", "Generate a key pair first.");
  if (asymOp === "encrypt") {
    document.getElementById("rsa-key-input").value = forge.pki.publicKeyToPem(
      rsaKeyPair.publicKey,
    );
  } else {
    document.getElementById("rsa-key-input").value = forge.pki.privateKeyToPem(
      rsaKeyPair.privateKey,
    );
  }
}

function runRSA() {
  const input = document.getElementById("rsa-input").value.trim();
  const keyPem = document.getElementById("rsa-key-input").value.trim();

  if (!input) return showError("rsa-result", "Input text is required.");
  if (!keyPem) return showError("rsa-result", "Key PEM is required.");

  try {
    let result;
    if (asymOp === "encrypt") {
      const pubKey = forge.pki.publicKeyFromPem(keyPem);
      const enc = pubKey.encrypt(input, "RSA-OAEP");
      result = forge.util.encode64(enc);
      showResult("rsa-result", result, "RSA ENCRYPTED (Base64)");
    } else {
      const privKey = forge.pki.privateKeyFromPem(keyPem);
      const dec = privKey.decrypt(forge.util.decode64(input), "RSA-OAEP");
      showResult("rsa-result", dec, "RSA DECRYPTED");
    }
  } catch (e) {
    showError("rsa-result", "RSA Error: " + (e.message || "Operation failed."));
  }
}

function clearRSA() {
  document.getElementById("rsa-input").value = "";
  document.getElementById("rsa-key-input").value = "";
  document.getElementById("rsa-result").style.display = "none";
}

// ─── HASH ─────────────────────────────────────────────────
function selectHashAlgo(btn, algo) {
  document
    .querySelectorAll("#hash-algos .algo-btn")
    .forEach((b) => b.classList.remove("active"));
  btn.classList.add("active");
  hashAlgo = algo;
}

function computeHash(text, algo) {
  const fn = {
    MD5: CryptoJS.MD5,
    SHA256: CryptoJS.SHA256,
    SHA512: CryptoJS.SHA512,
    SHA1: CryptoJS.SHA1,
    RIPEMD160: CryptoJS.RIPEMD160,
  }[algo];
  if (!fn) throw new Error("Unknown algorithm");
  return fn(text).toString();
}

function runHash() {
  const input = document.getElementById("hash-input").value;
  if (!input) return showError("hash-result", "Input text is required.");

  try {
    const digest = computeHash(input, hashAlgo);
    const algoLabels = {
      MD5: "MD5",
      SHA256: "SHA-256",
      SHA512: "SHA-512",
      SHA1: "SHA-1",
      RIPEMD160: "RIPEMD-160",
    };
    showResult(
      "hash-result",
      digest,
      `${algoLabels[hashAlgo]} DIGEST (${(digest.length / 2) * 8} bits / ${digest.length} hex chars)`,
      true,
    );
  } catch (e) {
    showError("hash-result", e.message);
  }
}

function runHashCompare() {
  const text = document.getElementById("hash-compare-input").value;
  if (!text) return;

  const algos = [
    { key: "MD5", label: "MD5", bits: 128 },
    { key: "SHA1", label: "SHA-1", bits: 160 },
    { key: "RIPEMD160", label: "RIPEMD-160", bits: 160 },
    { key: "SHA256", label: "SHA-256", bits: 256 },
    { key: "SHA512", label: "SHA-512", bits: 512 },
  ];

  let html = "";
  algos.forEach((a) => {
    const h = computeHash(text, a.key);
    html += `
      <div style="margin-bottom:14px; padding:12px 14px; background:var(--bg2); border:1px solid var(--border);">
        <div style="font-size:10px; letter-spacing:0.2em; color:var(--neon); margin-bottom:6px; display:flex; justify-content:space-between;">
          <span>${a.label}</span>
          <span style="color:var(--text-dim)">${a.bits} bits · ${h.length} chars</span>
        </div>
        <div style="word-break:break-all; font-size:12px; color:var(--text-bright); line-height:1.6;">${h}</div>
        <button class="btn btn-sm btn-ghost" style="margin-top:8px;" onclick="copyRaw('${h}')">⎘ Copy</button>
      </div>`;
  });

  document.getElementById("hash-compare-result").innerHTML = html;
}

function clearHash() {
  document.getElementById("hash-input").value = "";
  document.getElementById("hash-result").style.display = "none";
}

// ─── RESULT HELPERS ───────────────────────────────────────
function showResult(id, text, label, isHash = false) {
  const box = document.getElementById(id);
  box.style.display = "block";
  box.className = "result-box visible";
  box.innerHTML = `
    <div class="result-header">
      <span class="result-label">✓ ${label}</span>
      <span class="status-tag ok">SUCCESS</span>
    </div>
    <div class="result-content ${isHash ? "hash-result" : ""}">${escHtml(text)}</div>
    <div style="padding:10px 14px; display:flex; gap:10px; border-top:1px solid var(--border);">
      <button class="btn btn-sm btn-ghost" onclick="copyRaw('${escAttr(text)}')">⎘ Copy Result</button>
      <button class="btn btn-sm btn-ghost" onclick="this.closest('.result-box').style.display='none'">✕ Dismiss</button>
    </div>`;
}

function showError(id, msg) {
  const box = document.getElementById(id);
  box.style.display = "block";
  box.className = "result-box error-box";
  box.innerHTML = `
    <div class="result-header">
      <span class="result-label error-label">✗ ERROR</span>
      <span class="status-tag err">FAILED</span>
    </div>
    <div class="result-content" style="color:var(--error);">${escHtml(msg)}</div>`;
}

function escHtml(s) {
  return String(s)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;");
}

function escAttr(s) {
  return String(s).replace(/'/g, "\\'").replace(/\n/g, "\\n");
}

function copyRaw(text) {
  // unescape newlines
  text = text.replace(/\\n/g, "\n");
  navigator.clipboard.writeText(text).then(() => showToast("✓ Copied!"));
}

function copyText(id) {
  const el = document.getElementById(id);
  navigator.clipboard
    .writeText(el.textContent)
    .then(() => showToast("✓ Copied!"));
}

function showToast(msg) {
  const t = document.getElementById("copy-toast");
  t.textContent = msg;
  t.classList.add("show");
  setTimeout(() => t.classList.remove("show"), 1800);
}

// ─── INIT ─────────────────────────────────────────────────
updateSymInfo();
