# Infraestructura Modular Multi-Entorno

Este ejemplo implementa una arquitectura profesional de Terraform separando la lógica (módulos) de la configuración (entornos).

## Conceptos Clave
- **Modules (`/modules`)**: Recursos genéricos y parametrizados.
  - `network`: VNet y Subnets dinámicas.
  - `storage`: Cuenta de almacenamiento con convenciones de nombres.
  - `compute`: VM Linux con IP pública y red.
- **Environments (`/environments`)**: Instancias específicas de la infraestructura.
  - `dev`: Entorno de desarrollo (máquinas pequeñas, costos bajos).
  - `staging`: Pre-producción.
  - `prod`: Producción (alta disponibilidad, mayores recursos).
- **Quality Control**: `pre-commit` integrado para asegurar que todo el código esté siempre formateado (`terraform fmt`) y validado.

## Cómo ejecutar un entorno (ej: dev)
1. Entra al contenedor: `make shell`
2. Ve al entorno deseado: `cd base_config/environments/dev`
3. Configura tus variables: Edita `terraform.tfvars` con tu `subscription_id`.
4. Ejecuta Terraform:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Mejores Prácticas Incluidas
1. **DRY (Don't Repeat Yourself)**: Los módulos se comparten entre todos los entornos.
2. **Aislamiento de Estado**: Cada entorno mantiene su propio archivo `.tfstate`.
3. **Etiquetado Común**: Todos los recursos incluyen tags automáticos (Proyecto, Entorno, ManagedBy).
