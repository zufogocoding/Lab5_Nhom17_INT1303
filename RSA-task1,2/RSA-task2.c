#include <stdio.h>
#include <openssl/bn.h>

/* Hàm bổ trợ in số BIGNUM dưới dạng Hex */
void printBN(char *msg, BIGNUM *a) {
    char *number_str = BN_bn2hex(a);
    printf("%s %s\n", msg, number_str);
    OPENSSL_free(number_str);
}

int main() {
    printf("--- TASK 2: ENCRYPTING A MESSAGE ---\n");
    BN_CTX *ctx = BN_CTX_new();
    BIGNUM *n = BN_new();
    BIGNUM *e = BN_new();
    BIGNUM *M = BN_new();
    BIGNUM *C = BN_new();

    // 1. Khởi tạo khóa công khai (e, n)
    BN_hex2bn(&n, "DCBFFE3E51F62E09CE7032E2677A78946A849DC4CDDE3A4D0CB81629242FB1A5");
    BN_hex2bn(&e, "010001");

    // 2. Chuyển thông điệp "A top secret!" sang Hex
    // Lệnh chuyển: python -c 'print("A top secret!".encode("hex"))'
    BN_hex2bn(&M, "4120746f702073656372657421");

    // 3. Thực hiện mã hóa: C = M^e mod n
    BN_mod_exp(C, M, e, n, ctx);
    printBN("Ciphertext C =", C);

    // Giải phóng bộ nhớ
    BN_free(n); BN_free(e); BN_free(M); BN_free(C);
    BN_CTX_free(ctx);

    return 0;
}
