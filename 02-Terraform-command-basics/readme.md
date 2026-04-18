---

# Terraform Command Basics

This guide covers the essential Terraform commands for managing infrastructure as code on Azure. You will learn how to initialize, validate, plan, apply, and destroy resources using Terraform CLI.

---

## 1. Introduction

Terraform is an open-source tool for provisioning and managing cloud infrastructure. The following core commands are fundamental to any Terraform workflow:

- `terraform init` – Initialize a working directory containing Terraform configuration files.
- `terraform validate` – Check whether the configuration is valid.
- `terraform plan` – Preview the changes Terraform will make to your infrastructure.
- `terraform apply` – Apply the planned changes to reach the desired state.
- `terraform destroy` – Destroy the managed infrastructure.

---


## 2. Prerequisites

Before running Terraform commands, ensure you have:

1. **Azure CLI installed and authenticated**
    - [Install Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
    - Login to your Azure account:
      ```sh
      az login
      ```
    - (Optional) List and set your subscription:
      ```sh
      az account list
      az account set --subscription "SUBSCRIPTION_ID"
      ```
2. **Terraform installed** ([Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli))
3. **Choose an Azure region**
    - List available regions:
      ```sh
      az account list-locations -o table
      ```
    - [Azure Regions](https://docs.microsoft.com/en-us/azure/virtual-machines/regions)

---

## 3. Review Example Terraform Manifest

Below is a sample configuration to create a resource group in Azure:

```hcl
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "my_demo_rg1" {
  location = "eastus"
  name     = "my-demo-rg1"
}
```

---


## 4. Terraform Core Commands

Run the following commands in your project directory:

```sh
# Initialize the working directory
terraform init

# Validate the configuration
terraform validate

# Preview the changes
terraform plan

# Apply the changes (provision resources)
terraform apply
```

---


## 5. Verify Resources in Azure Portal

- Go to the [Azure Portal](https://portal.azure.com/) → Resource Groups
- Confirm the new resource group is created
- Review the `terraform.tfstate` file in your project directory (tracks resource state)

---


## 6. Destroy Infrastructure

To remove all resources managed by this configuration:

```sh
terraform destroy
```

**After destroy:**
- Check in the Azure Portal that the resource group is deleted
- The `terraform.tfstate` file should be updated (or removed)
- The `terraform.tfstate.backup` file contains the previous state as a backup

**Clean up local files (optional):**
```sh
rm -rf .terraform*
rm -rf terraform.tfstate*
```

---


## 7. Conclusion

In this section, you learned how to:
- Initialize a Terraform project
- Validate configuration files
- Preview and apply infrastructure changes
- Destroy managed resources

These commands form the foundation of working with Terraform for any cloud provider.
 