package rbac

admin_token := io.jwt.encode_sign({
    "typ": "JWT",
    "alg": "HS256"
}, {
    "roles": [
        "admin",
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
        "reader"
    ],
}, {
    "kty": "oct",
    "k": "test-signing-key"
})

test_admin_can_create_document {
    allow with input as {
        "token": admin_token,
        "operation": "uploadDocument",
    }
}

test_reader_can_view_document {
    allow with input as {
        "token": reader_token,
        "operation": "viewDocument",
    }
}
