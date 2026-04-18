# Terraform Language Basics

## Basic Files 

* Code in the Terraform language is stored in **plain text files** with the `.tf` file extension
* There is also a **JSON-based** variant of the language that is named with the `.tf.json` file extension

## Configuration Syntax

   - HCL - HashiCorp Language
     - Terraform
       - Blocks
       - Arguments
       - Identifier
       - Comments

```t
# Template
<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>"   {
  # Block body
  <IDENTIFIER> = <EXPRESSION> # Argument
}

# Azure Example
# Create a resource group
resource "azurerm_resource_group" "myrg" { # Resource BLOCK
  name = "myrg-1" # Argument
  location = "East US" # Argument 
}
# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" { # Resource BLOCK
  name                = "myvnet-1" # Argument
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myrg.location # Argument with value as expression
  resource_group_name = azurerm_resource_group.myrg.name # Argument with value as expression
}
```

## Understand about Arguments, Attributes and Meta-Arguments.
- Arguments can be `required` or `optional`
- Attribues format looks like `resource_type.resource_name.attribute_name`
- Meta-Arguments change a resource type's behavior (Example: count, for_each)
- [Additional Reference](https://learn.hashicorp.com/tutorials/terraform/resource?in=terraform/configuration-language) 
- [Resource: Azure Resource Group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group)
- [Resource: Azure Resource Group Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group#arguments-reference)
- [Resource: Azure Resource Group Attribute Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group#attributes-reference)
- [Resource: Meta-Arguments](https://www.terraform.io/docs/language/meta-arguments/depends_on.html)

## Understand about Terraform Top-Level Blocks

- Discuss about Terraform Top-Level blocks
1. Terraform Settings Block
2. Provider Block
3. Resource Block
4. Input Variables Block
5. Output Values Block
6. Local Values Block
7. Data Sources Block
8. Modules Block

## Create a simple terraform block and play with required_version
- `required_version` focuses on underlying Terraform CLI installed on your desktop
- If the running version of Terraform on your local desktop doesn't match the constraints specified in your terraform block, Terraform will produce an error and exit without taking any further actions.

| Operator              | Description | 
| :---------------- | :------: | 
| =, no operator        |   Allows only one exact version number. Cannot be combined with other conditions.  | 
| !=           |   Excludes an exact version number.   | 
| >,>=, <, <=   |  Compares to a specified version. Terraform allows versions that resolve to `true`. The `>` and `>=` operators request newer versions. The `<` and `<=` operators request older versions.   | 
| Codecademy Hoodie |  False   | 



- By changing the versions try `terraform init` and observe whats happening
```t
# Play with Terraform CLI Version (We installed 1.0.0 version)
  required_version = "~> 0.14.3" - Will fail
  required_version = "~> 0.14"   - Will fail  
  required_version = "= 0.14.4"  - Will fail
  required_version = ">= 0.13"   - will pass
  required_version = "= 1.0.0"   - will pass
  required_version = "1.0.0"     - will pass 
  required_version = ">= 1.0.0"   - will pass   
 
# Terraform Block
terraform {
  required_version = ">= 1.0.0"
}

# To view my Terraform CLI Version installed on my desktop
terraform version

# Initialize Terraform
terraform init
```