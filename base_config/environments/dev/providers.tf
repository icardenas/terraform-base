terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # --- DIFERENCIA DE BACKENDS ---

  # 1. BACKEND LOCAL (Actual): El estado se guarda en tu PC. Riesgo: Si borras el archivo, pierdes el control de la nube.
  backend "local" {
    path = "terraform.tfstate"
  }

  # 2. BACKEND REMOTO (Recomendado): El estado se guarda en Azure.
  # Permite: Trabajo en equipo, bloqueo de estado (State Locking) y mayor seguridad.
  # Para usarlo: Comenta el bloque "local", descomenta este y ejecuta 'terraform init'.
  /*
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "sttfstate001" # Debe ser único globalmente
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
  */
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
