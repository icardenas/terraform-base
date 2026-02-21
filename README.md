# Terraform Dev Environment (Docker + Debian)

Este proyecto proporciona un entorno aislado y profesional para trabajar con Terraform, AWS CLI y Azure CLI, incluyendo automatización de calidad de código.

## Requisitos
- Docker y Docker Compose
- Make

## Uso Rápido
1. **Construir y entrar al entorno:**
   ```bash
   make shell
   ```
2. **Configurar Git y Calidad (Solo la primera vez dentro del contenedor):**
   ```bash
   git config --global user.name "Tu Nombre"
   git config --global user.email "tu@email.com"
   pre-commit install
   ```

## Estructura del Proyecto
- `base_config/modules/`: Lógica reutilizable de infraestructura (Network, Storage, Compute).
- `base_config/environments/`: Configuraciones específicas por entorno (`dev`, `staging`, `prod`).
- `.pre-commit-config.yaml`: Automatización de `terraform fmt` y validación en cada commit.

## Comandos del Makefile
- `make shell`: Construye y entra al contenedor (limpia al salir).
- `make rebuild`: Reconstruye la imagen sin usar caché.
- `make clean`: Elimina contenedores y volúmenes (borra credenciales y estado local).

## Persistencia
Se mantienen entre sesiones:
- `~/.azure`: Credenciales de Azure.
- `~/.aws`: Credenciales de AWS.
- `~/.terraform.d`: Plugins de Terraform.
