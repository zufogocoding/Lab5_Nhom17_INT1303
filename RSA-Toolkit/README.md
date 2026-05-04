# RSA Toolkit — Feature 2: Asymmetric Encryption

Nhóm 17 · INT1303 · Lab 5

## Mô tả
Web app thực hiện mã hóa bất đối xứng RSA gồm 3 chức năng:
- **Key Generation** — Tạo cặp khóa Public/Private (1024 / 2048 / 4096-bit)
- **Encrypt** — Mã hóa plaintext bằng Public Key → Ciphertext (Base64, RSA-OAEP)
- **Decrypt** — Giải mã Ciphertext bằng Private Key → Plaintext

## Công nghệ sử dụng
- HTML / CSS / JavaScript (thuần, không framework)
- [forge.js v1.3.1](https://github.com/digitalbazaar/forge) — thư viện crypto, load qua CDN

## Cách chạy
Mở file `index.html` trực tiếp trên trình duyệt. Không cần server hay cài đặt gì thêm.

## Cấu trúc file
```
RSA-Toolkit/
├── index.html    ← Toàn bộ source code (HTML + CSS + JS)
└── README.md     ← Tài liệu mô tả
```

## Thuật toán
- **RSA-OAEP** (Optimal Asymmetric Encryption Padding) — padding chuẩn, an toàn hơn PKCS#1 v1.5
- Khóa xuất ra định dạng **PEM**
- Ciphertext mã hóa **Base64**
- Toàn bộ xử lý chạy **client-side** — không gửi dữ liệu lên server

## Lưu ý
MD5 và DES được đưa vào project với mục đích giáo dục. RSA trong thực tế vẫn được sử dụng rộng rãi với key size >= 2048-bit.
