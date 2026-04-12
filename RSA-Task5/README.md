# RSA Task 5: Verifying a Signature

## Muc tieu
Xac minh chu ky so cua Alice va quan sat ket qua khi chu ky bi thay doi.

## Thong tin
- Message: Launch a missile.
- Signature (S): 643D6F34902D9C7EC90CB0B2BCA36C47FA37165C0005CAB026C0542CBDB6802F
- Public key e: 010001
- Public key n: AE1CD4DC432798D933779FBD46C6E1247F0CF1233595113AA51B450F18116115

## Cac buoc thuc hien

### Buoc 1: Verify chu ky goc
- Tinh S^e mod n
- Ket qua: 4C61756E63682061206D697373696C652E
- Chuyen hex sang ASCII: "Launch a missile."
- Chu ky hop le!

### Buoc 2: Test chu ky bi loi
- Thay doi byte cuoi cua S: 2F -> 3F
- Tinh lai S^e mod n
- Ket qua hoan toan khac -> Chu ky khong hop le!

## Ket luan
Chi can thay doi 1 bit trong chu ky, ket qua xac minh se hoan toan sai.
Chung to tinh bao mat cua RSA trong viec phat hien chu ky gia mao.
