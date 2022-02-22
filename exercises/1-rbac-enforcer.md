# Exercise 1: simple RBAC policy

## Description

FooCorp wants to add RBAC authorization to their new document management platform.
FooCorp wants to decouple authorization from the business logic so they have chosen
to implement the authorization using Open Policy Agent and Rego. You are tasked to
implement the authorization logic. The authorization system should expose an API
that can be queried to determine if an user can perform some operation.

### Input

The authorization system should expose an API that takes the following input:

```json
{
    "token": <jwt token of the user>,
    "operation": <name of the operation being done>
}
```

The token is the encoded JWT token of the user. A sample encoded token and it's
decoded form is shown below:

```text
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJyb2xlcyI6WyJhZG1pbiIsInJlYWRlciJdfQ.CuJRuja0__alCKKe0aKFxLyElkRGh2ab554D4pcQyC0
```

```json
{
  "sub": "1234567890",
  "name": "John Doe",
  "iat": 1516239022,
  "roles": [
    "admin",
    "reader"
  ]
}
```

The token includes an array of `roles`. The possible roles are `admin` and `reader`.

The operation is a string that denotes the operation being performed (i.e. the API that is called).
The following operations exist:

* `viewDocument`: all users with the `reader` role can perform this operation
* `uploadDocument`: all users with the `admin` role can perform this operation

More operations and roles may be added in the future.

### Output

The API must respond with an output that includes an `allow: true|false` field depending
on if the request is authorized or not. By default a request is not authorized.
