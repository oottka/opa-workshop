test:
	@cd opa/rego && opa test . --explain fails

eval:
	@cd opa && opa eval -i input.json -d rego "data"

curl:
	@cd opa && curl -s \
		--header "Content-Type: application/json" \
		--request POST \
		--data @input.json \
		http://localhost:8181/v1/data/rbac \
	| jq --color-output .