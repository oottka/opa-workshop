# OPA & Rego workshop

## Initial setup

You should use the devcontainer so you have an environment with OPA installed and running as a server.
To do this, open the project in VSCode, make sure the `Remote - Containers` extension is installed
and run the VSCode command `Remote containers - Open workspace in container`.

If you use the devcontainer, an OPA server with the policies from `opa/rego` is available on
port 8182. The `opa` command line tool is also installed for you as well.

## Manual setup if not using the devcontainer

If you want to start the OPA server yourself, you can use a command similar to:

```bash
docker run --mount type=bind,src=<path-to-project>/opa-workshop/opa/rego,dst=/rego -p 8182:8181 openpolicyagent/opa:latest-debug run --server --skip-verify --watch --log-level debug /rego
```

To download the OPA command line tool yourself, check out [these instructions](https://www.openpolicyagent.org/docs/v0.14.2/#running-opa).

## Makefile

The makefile provides simple commands to interact with OPA:

* `test`: runs rego tests
* `eval`: runs rego eval with `opa/input.json` as the input
* `curl`: curls the OPA HTTP API and evaluates the RBAC policy with `opa/input.json` as the input
