# Terraform Dev Environment (Docker + Debian)

Este proyecto proporciona un entorno aislado y ligero para trabajar con Terraform, AWS CLI y Azure CLI sin instalar nada localmente.

## Requisitos

- Docker
- Docker Compose
- Make

## Uso Rápido

1. **Construir la imagen:**
   ```bash
   make build
   ```

2. **Iniciar el contenedor en segundo plano (opcional):**
   ```bash
   make up
   ```

3. **Entrar al entorno:**
   - Para una nueva sesión desechable (útil para comandos rápidos):
     ```bash
     make shell
     ```
   - Para conectarse al contenedor en ejecución (si usaste `make up`):
     ```bash
     make login
     ```

4. **Detener el contenedor:**
   ```bash
   make down
   ```

5. **Dentro del contenedor, puedes usar:**
   - `terraform --version`
   - `aws --version`
   - `az --version`

## Persistencia

Los siguientes datos se mantienen entre sesiones:
- Directorio de trabajo: `./workspace` (mapeado al root del proyecto)
- Credenciales de AWS: `~/.aws`
- Credenciales de Azure: `~/.azure`
- Plugins de Terraform: `~/.terraform.d`

Para limpiar todo (incluyendo credenciales guardadas):
```bash
make clean
```

## Notas sobre Aislamiento
El contenedor usa `network_mode: bridge`, lo que permite acceso a internet para hablar con las APIs de AWS/Azure, pero mantiene el entorno de ejecución separado de tu sistema operativo host.
