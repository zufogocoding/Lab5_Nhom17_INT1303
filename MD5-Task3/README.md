# MD5 Task 3: Generating Two Executable Files with the Same MD5 Hash

## Muc tieu
Tao 2 file thuc thi khac nhau nhung co cung MD5 hash.

## Cac buoc thuc hien

### Buoc 1: Viet va compile chuong trinh C
- Tao file task3_main.c voi mang 200 byte gia tri 0x41 (chu A)
- Compile: gcc task3_main.c -o task3.out

### Buoc 2: Tim vi tri mang trong binary
- Dung xxd de tim dia chi mang 0x41
- Mang bat dau tai dia chi 0x3040 = 12352 decimal
- 12352 / 64 = 193 (chia het cho 64, hop le!)

### Buoc 3: Extract prefix va tao MD5 collision
- Extract 12352 bytes dau: head -c 12352 task3.out > task3_prefix
- Tao collision: md5collgen -p task3_prefix -o task3_out1.bin task3_out2.bin
- 2 file output co cung MD5 hash nhung noi dung khac nhau

### Buoc 4: Extract suffix va ghep file
- Extract suffix: tail -c +12481 task3.out > task3_suffix
- Ghep file 1: cat task3_out1.bin task3_suffix > task3_prog1.out
- Ghep file 2: cat task3_out2.bin task3_suffix > task3_prog2.out

### Buoc 5: Ket qua
- md5sum task3_prog1.out = md5sum task3_prog2.out (cung hash!)
- Nhung 2 chuong trinh in ra gia tri khac nhau

## Ket luan
MD5 collision attack cho phep tao 2 file thuc thi khac nhau nhung co
cung MD5 hash, chung to MD5 khong con an toan de kiem tra tinh toan ven.
