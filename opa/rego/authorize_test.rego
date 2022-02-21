package rbac

admin_token := io.jwt.encode_sign({
    "typ": "JWT",
    "alg": "HS256"
}, {
    "roles": [
        "cp:admin",
        "cp:reader"
    ],
}, {
    "kty": "oct",
    "k": "test-signing-key"
})

reader_token := io.jwt.encode_sign({
    "typ": "JWT",
    "alg": "HS256"
}, {
    "roles": [
        "cp:admin",
        "cp:reader"
    ],
}, {
    "kty": "oct",
    "k": "test-signing-key"
})

test_admin_can_create_tenant {
    allow with input as {
        "token": admin_token,
        "operation": "tenant.createTenant",
    }
}

test_reader_can_read_tenant {
    allow with input as {
        "token": reader_token,
        "operation": "tenant.getTenant",
    }
}
