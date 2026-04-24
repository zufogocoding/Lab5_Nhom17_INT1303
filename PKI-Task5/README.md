# PKI Task 5: MITM Attack

## Muc tieu
Simulate tan cong Man-In-The-Middle (MITM) de chung minh PKI co the ngan chan tan cong nay.

## Cac buoc thuc hien

### Buoc 1: Tao Root CA
- Tao self-signed certificate cho CA (ca.crt, ca.key)
- CA nay duoc dung de ky certificate cho server ptit.com

### Buoc 2: Tao certificate cho server ptit.com
- Tao RSA key pair cho server (server.key)
- Tao CSR (server.csr)
- CA ky CSR tao ra server.crt

### Buoc 3: Tao Fake CA cua Hacker
- Tao CA gia (ca-hacker.crt, ca-hacker.key)
- Tao certificate gia cho ptit.com (hacker.crt)
- CA gia nay KHONG duoc browser tin tuong

### Buoc 4: Setup Apache voi fake certificate
- Cau hinh Apache HTTPS voi hacker.crt
- Them ptit.com vao /etc/hosts -> 127.0.0.1

### Buoc 5: Ket qua
- Browser hien thi "Warning: Potential Security Risk Ahead"
- Firefox tu choi ket noi vi CA khong duoc tin tuong
- PKI da ngan chan thanh cong tan cong MITM!

## Ket luan
PKI ngan chan MITM bang cach yeu cau certificate phai duoc ky boi CA ma browser tin tuong.
Ke tan cong can ca certificate VA CA duoc tin tuong moi qua duoc bao mat.
