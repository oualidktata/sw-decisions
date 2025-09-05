## How to deploy OPA?



## 1- Add policies to server
```
PUT /v1/policies/example1 HTTP/1.1
Content-Type: text/plain
```
Body:
```
package opa.examples

import data.servers
import data.networks
import data.ports

public_servers[server] {
  some k, m
	server := servers[_]
	server.ports[_] == ports[k].id
	ports[k].networks[_] == networks[m].id
	networks[m].public == true
}
```
1- through the API

## OPAL or Styra to manage Opa:

[OPAL] https://docs.opal.ac/getting-started/running-opal/as-python-package/overview/


# Policy authoring
The policy authoring process is divided into the following tasks.

- Write Policies
OPA gives you a high-level declarative language (Rego) to author fine-grained policies that codify important requirements in your system.
- Test Policies
To help you verify the correctness of your policies, OPA also gives you a framework that you can use to write tests for your policies. By writing tests for your policies you can speed up the development process of new rules and reduce the amount of time it takes to modify rules as requirements evolve.

## rego

Rego style guide[3]

# Resources
[1] https://docs.styra.com/policies/policy-authoring/write-policies
[2] https://docs.aws.amazon.com/prescriptive-guidance/latest/saas-multitenant-api-access-authorization/abac-examples.html
[3] https://github.com/StyraInc/rego-style-guide
[4] REST api: https://www.openpolicyagent.org/docs/latest/rest-api
[5] OPAL :https://docs.opal.ac/overview/architecture