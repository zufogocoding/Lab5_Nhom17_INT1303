n = int("DCBFFE3E51F62E09CE7032E2677A78946A849DC4CDDE3A4D0CB81629242FB1A5", 16)
d = int("74D806F9F3A62BAE331FFE3F0A68AFE35B3D2E4794148AACBC26AA381CD7D30D", 16)
C = int("8C0F971DF2F3672B28811407E2DABBE1DA0FEBBBDFC7DCB67396567EA1E2493F", 16)
"""This part basically turn C and d and n into hex because string
does not get regcognize as hex by default"""

M = pow(C, d, n)  # this perform C^d %%n
hex_msg = hex(M)[2:]
print(hex_msg)
###we are doing this because the return of hex(M) probably something like 0x something something
print(bytes.fromhex(hex_msg).decode())
# and the value of hex_msg currently is hex so we decode this and get the message
# sure it is, let's check
