# Simple attribute-based access control

## Problem

FooCorp wants to implement special authorization logic that allows only users who
use two-factor authentication to be able to perform the `uploadDocuments` operation.

To facilitate this, the input JWT token now contains the field
`authenticationType: password|two-factor`:

```json
{
  "sub": "1234567890",
  "name": "John Doe",
  "iat": 1516239022,
  "roles": [
    "admin",
    "reader"
  ],
  "authenticationType": "two-factor"
}
```

Implement the required authorization logic.
