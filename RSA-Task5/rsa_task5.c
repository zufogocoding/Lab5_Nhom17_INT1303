#include <stdio.h>
#include <openssl/bn.h>

void printBN(char *msg, BIGNUM *a) {
    char *number_str = BN_bn2hex(a);
    printf("%s %s\n", msg, number_str);
    OPENSSL_free(number_str);
}

int main() {
    BN_CTX *ctx = BN_CTX_new();
    BIGNUM *n = BN_new();
    BIGNUM *e = BN_new();
    BIGNUM *S = BN_new();
    BIGNUM *S_corrupt = BN_new();
    BIGNUM *res = BN_new();

    // Public key cua Alice
    BN_hex2bn(&n, "AE1CD4DC432798D933779FBD46C6E1247F0CF1233595113AA51B450F18116115");
    BN_hex2bn(&e, "010001");

    // Signature goc
    BN_hex2bn(&S, "643D6F34902D9C7EC90CB0B2BCA36C47FA37165C0005CAB026C0542CBDB6802F");

    printf("=== RSA Task 5: Verify Signature ===\n\n");
    printf("Message: Launch a missile.\n");
    printf("Signature (S): 643D6F34902D9C7EC90CB0B2BCA36C47FA37165C0005CAB026C0542CBDB6802F\n\n");

    // Verify chu ky goc: tinh S^e mod n
    BN_mod_exp(res, S, e, n, ctx);
    printBN("Ket qua S^e mod n:", res);
    printf("-> Chu ky hop le!\n\n");

    // Signature bi loi (doi byte cuoi 2F thanh 3F)
    BN_hex2bn(&S_corrupt, "643D6F34902D9C7EC90CB0B2BCA36C47FA37165C0005CAB026C0542CBDB6803F");
    printf("Signature bi loi (2F->3F): 643D6F34902D9C7EC90CB0B2BCA36C47FA37165C0005CAB026C0542CBDB6803F\n\n");

    BN_mod_exp(res, S_corrupt, e, n, ctx);
    printBN("Ket qua S^e mod n (chu ky loi):", res);
    printf("-> Ket qua hoan toan khac! Chu ky khong hop le!\n");

    BN_free(n); BN_free(e); BN_free(S);
    BN_free(S_corrupt); BN_free(res);
    BN_CTX_free(ctx);
    return 0;
}
