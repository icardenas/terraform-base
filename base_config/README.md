# Base Config Example

Este es un ejemplo completo de Terraform diseñado para aprender conceptos clave:

## Conceptos Cubiertos
- **Módulos**: Organización de recursos en `modules/network`, `modules/storage`, y `modules/compute`.
- **Variables**: Definidas en `variables.tf` y alimentadas por `terraform.tfvars`.
- **Locals**: Lógica de nombres y etiquetas comunes en `locals.tf`.
- **Backend**: Configuración de estado local en `backend.tf` (con ejemplo comentado para Azure).
- **Providers**: Configuración de `azurerm` y `azurecaf` en `providers.tf`.

## Estructura de Módulos
1. **Network**: Crea una VNet y Subnets.
2. **Storage**: Crea una Storage Account siguiendo convenciones de nombres.
3. **Compute**: Crea una VM Linux con Public IP y NIC.

## Cómo usar
1. Copia `terraform.tfvars.sample` a `terraform.tfvars` y añade tu `subscription_id`.
2. Ejecuta los comandos usando el contenedor de Docker (vía Makefile):
   ```bash
   make shell
   cd base_config
   terraform init
   terraform plan
   ```

## Pre-commit
Se ha configurado un archivo `.pre-commit-config.yaml` en la raíz. Para activarlo:
1. Instala pre-commit en tu host: `pip install pre-commit`
2. Instala los hooks: `pre-commit install`
3. Ahora, cada vez que hagas un commit, Terraform se formateará y validará automáticamente.
