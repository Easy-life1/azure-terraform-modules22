Azure Networking Terraform Module
===========

A terraform module to provide 3 tier networking setup on Azure Cloud/

This should be used an a generic template to be included in every terraform module.

Module Input Variables
----------------------

- `name` - variable name
- `environment` - variable environment

Usage
-----

```hcl
module "demo" {
  source = "github.com/my-repo/demo"

  name = "whatever variable you would like to pass"

  tags {
    "Environment" = "${var.environment}"
  }
}
```


Outputs
=======

 - `name` - does what it says on the tin
 - `environment` - does what it says on the tin