# 🚀 Azure Terraform Learning Repo

![MIT License](https://img.shields.io/github/license/findashu/az-terraform)
![GitHub Repo stars](https://img.shields.io/github/stars/findashu/az-terraform?style=social)

Welcome! This repository is a hands-on guide for learning Infrastructure as Code (IaC) on Microsoft Azure using Terraform. It is structured for beginners and self-learners, with step-by-step instructions and practical demos.

---

## 📚 Table of Contents


1. [Install Tools](01-Install-Tools/README.md)  
	Install Terraform, Azure CLI, VS Code, and Git on macOS.
2. [Terraform Command Basics](02-Terraform-command-basics/readme.md)  
	Learn and practice core Terraform commands (`init`, `validate`, `plan`, `apply`, `destroy`).
3. [Terraform Language Basics](03-Terraform-language-basics/README.md)  
	Understand HCL syntax, blocks, arguments, and meta-arguments.

4. [Resource Syntax, Behavior & State](04-tf-resource-behaviour-state/README.md)  
	Learn about resource block syntax, lifecycle behavior, and Terraform state management.
5. [Azure VNET, Subnets & NSG (Hands-On)](05-Azure-Vnet-Subnet-NSG/README.md)  
	Build a multi-tier Azure Virtual Network with subnets and NSGs using advanced Terraform concepts.
6. [Azure Linux VM (Hands-On)](06-azure-linux-vm/README.md)  
	Build an Azure Linux Virtual Machine on top of the networking created in the previous section.

---

## 🏁 Getting Started

1. **Clone this repository:**
	```sh
	git clone <your-repo-url>
	cd az-terraform
	```
2. **Follow the [Install Tools](01-Install-Tools/README.md) guide** to set up your environment.
3. Work through each section in order, starting with [Terraform Command Basics](02-Terraform-command-basics/readme.md).

---

## 💡 Why Terraform?

Terraform enables you to define, provision, and manage Azure infrastructure using code. This approach brings repeatability, version control, and collaboration to cloud resource management.

---

## How Terraform Executes Multiple Files

Terraform treats all `.tf` files in a directory as a single configuration. When you run commands like `terraform init`, `plan`, or `apply`, Terraform:

1. **Loads all .tf files** in the working directory (order does not matter).
2. **Merges the configuration** into a single in-memory graph, combining resources, variables, locals, outputs, and providers.
3. **Resolves dependencies** between resources automatically (using references, `depends_on`, etc.).
4. **Executes the plan** based on the dependency graph, ensuring resources are created, updated, or destroyed in the correct order.

This modular approach lets you split your configuration into logical files (e.g., one for each resource type or feature), making your code organized and maintainable. Terraform handles the orchestration behind the scenes!

---

## Terraform File Naming Convention

This repository uses a numbered Terraform file naming convention to make the learning flow easier to follow across sections.

Example patterns:

- `c5-01-versions.tf`
- `c5-02-generic-input-variables.tf`
- `c6-01-web-linuxvm-input-variables.tf`
- `c6-05-web-linuxvm.tf`

How to read the naming pattern:

- `c5` means the file belongs to section 05.
- `c6` means the file belongs to section 06.
- The two-digit number such as `01`, `02`, or `05` represents the recommended reading and build sequence within that section.
- The remaining part of the filename describes the purpose of the file.

Why this helps:

- It keeps the file order easy to understand for beginners.
- It makes it clear which files were carried forward from earlier sections.
- It helps when a later section reuses and extends code from a previous hands-on module.

Recommended approach when reusing code from earlier sections:

- Keep files copied forward from section 05 with the `c5-xx-...` prefix.
- Add new files introduced in section 06 with the `c6-xx-...` prefix.
- Continue the same pattern in future sections so the module history stays obvious.

Important: Terraform does not execute files based on filename order. Terraform loads all `.tf` files in a directory as one configuration and determines execution order from the dependency graph. The filename convention is for readability, teaching flow, and maintainability.

---


## 📝 Notes

- This repo is a work in progress. Advanced topics (modules, variables, outputs, etc.) will be added soon.
- Each module may include a `tf-manifests` folder containing Azure resource Terraform code. Use these as hands-on exercises to practice and reinforce your learning.
- Feedback and suggestions are welcome!

---

Happy Learning! 🎉