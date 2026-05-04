#include <stdio.h>
#include <openssl/bn.h>

/* Hàm bổ trợ in số BIGNUM dưới dạng Hex */
void printBN(char *msg, BIGNUM *a) {
    char *number_str = BN_bn2hex(a);
    printf("%s %s\n", msg, number_str);
    OPENSSL_free(number_str);
}

int main() {
    printf("--- TASK 1: DERIVING THE PRIVATE KEY ---\n");
    BN_CTX *ctx = BN_CTX_new();
    BIGNUM *p = BN_new();
    BIGNUM *q = BN_new();
    BIGNUM *e = BN_new();
    BIGNUM *n = BN_new();
    BIGNUM *phi = BN_new();
    BIGNUM *d = BN_new();
    BIGNUM *p_minus_1 = BN_new();
    BIGNUM *q_minus_1 = BN_new();
    BIGNUM *one = BN_new();

    // 1. Khởi tạo giá trị
    BN_hex2bn(&p, "F7E75FDC469067FFDC4E847C51F452DF");
    BN_hex2bn(&q, "E85CED54AF57E53E092113E62F436F4F");
    BN_hex2bn(&e, "0D88C3");
    BN_dec2bn(&one, "1");

    // 2. Tính n = p * q
    BN_mul(n, p, q, ctx);
    printBN("Public Key n (p*q) =", n);

    // 3. Tính phi(n) = (p-1)*(q-1)
    BN_sub(p_minus_1, p, one);
    BN_sub(q_minus_1, q, one);
    BN_mul(phi, p_minus_1, q_minus_1, ctx);
    printBN("phi(n) =", phi);

    // 4. Tính d = e^-1 mod phi(n)
    if (BN_mod_inverse(d, e, phi, ctx)) {
        printBN("Private Key d =", d);
    } else {
        printf("Error: Modular inverse does not exist.\n");
    }

    // Giải phóng bộ nhớ
    BN_free(p); BN_free(q); BN_free(e); BN_free(n);
    BN_free(phi); BN_free(d); BN_free(p_minus_1);
    BN_free(q_minus_1); BN_free(one);
    BN_CTX_free(ctx);

    return 0;
}
