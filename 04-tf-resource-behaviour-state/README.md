# Terraform Resource Syntax

Understanding resource syntax is fundamental to writing Terraform code. Each resource block defines a piece of infrastructure to be managed.

---

## Resource Block Structure

Every Terraform resource has:

- **Resource Type:** The kind of infrastructure object to manage (e.g., `azurerm_resource_group`).
- **Resource Local Name:** A unique name within the module, used for referencing this resource elsewhere (e.g., `myrg2`).
- **Arguments:** Key-value pairs that configure the resource. Arguments can be required or optional, depending on the resource type.

---

### Example

```hcl
resource "azurerm_resource_group" "myrg2" {
    name     = "myrg-2"
    location = "eastus"
}
```

---

## Referencing Resource Attributes

You can reference attributes of a resource elsewhere in your configuration using:

```
<resource_type>.<resource_name>.<attribute>
```

Example:

```hcl
resource "azurerm_virtual_network" "myvnet" {
    name                = "myvnet-1"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.myrg2.location
    resource_group_name = azurerm_resource_group.myrg2.name
}
```

---


## Resource Behavior

Terraform manages resources through a series of actions based on the configuration and the current state. The main behaviors are:

- **Create Resource:**
    - Terraform creates resources that are defined in your configuration but do not yet exist in the state file or in your cloud provider.
- **Destroy Resource:**
    - Terraform destroys resources that exist in the state file but have been removed from your configuration.
- **Update In-Place:**
    - If you change arguments for a resource and the provider supports in-place updates, Terraform will update the resource without destroying it.
- **Destroy and Re-Create:**
    - If certain arguments change that cannot be updated in-place (due to provider or API limitations), Terraform will destroy the existing resource and create a new one.

Understanding these behaviors helps you predict what will happen when you run `terraform plan` and `terraform apply`.

---

## Exercise: Provision Resources with tf-manifests

The `tf-manifests` folder contains Terraform code to provision foundational Azure resources. Completing this exercise will set up infrastructure used in future modules.

**Resources created:**
- Resource Group
- Virtual Network
- Subnet
- Public IP
- Network Interface

### Instructions
1. Open a terminal and navigate to the `tf-manifests` folder.
2. Run the following Terraform commands to provision the resources:

     ```sh
     terraform init
     terraform plan
     terraform apply
     ```

3. Review the Azure Portal to verify the resources were created.
4. These resources will be referenced and used in upcoming examples and exercises.

---


### Key CLI Observations

- `terraform init` downloads providers and creates a lock file.
- `terraform validate` checks configuration syntax.
- `terraform fmt` formats your `.tf` files.
- `terraform plan` shows what changes will be made (look for `+ create`, `~ update in-place`, `-/+ destroy and create replacement`).
- `terraform apply` creates or updates resources and generates the `terraform.tfstate` file.
- `terraform destroy` removes all managed resources.

---

## Terraform State (Overview)

- Terraform state is a local or remote file that maps your configuration to real infrastructure objects.
- It is essential for tracking resource changes and dependencies.
- State files are JSON-based and should not be edited manually.
- Use a remote backend for team collaboration and safety (covered later).

---

## Resource Lifecycle Examples

- **Create Resource:** Add a new resource block and apply.
- **Update In-Place:** Change an argument (e.g., add a tag) and apply; resource is updated without replacement.
- **Destroy and Re-Create:** Change a non-updatable argument (e.g., resource name); resource is destroyed and recreated.
- **Destroy Resource:** Remove a resource block or run `terraform destroy` to remove resources.

---

## Desired vs. Current State

- **Desired State:** Defined in your Terraform configuration files (`*.tf`).
- **Current State:** Actual resources deployed in your cloud provider.

Terraform ensures your current state matches the desired state.

---

## Clean-Up

To remove all resources and local state files:

```sh
terraform destroy -auto-approve
rm -rf .terraform*
rm -rf terraform.tfstate*
```

---

## References
- [Terraform State](https://www.terraform.io/docs/language/state/index.html)
- [Manipulating Terraform State](https://www.terraform.io/docs/cli/state/index.html)