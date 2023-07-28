
# Reto SiiColombia

## Requisitos:

1. Tener instalado Terraform
2. Crear archivo example.tfvars con las variables del archivo variables.tf
3. Tener configuradas las credenciales de aws con el comando `aws configure` y asegurarse de que el usuario tenga suficientes permisos.

## Pasos para ejecutar en AWS con Terraform:

1. Correr el comando `terraform init`
2. Correr el comando `terraform plan`
3. Por ultimo creamos los recursos en AWS con el comando `terraform apply`,
4. Debe tener en cuenta que la primera ejecución del codepipeline fallara ya que debera acceder a AWS ingresar a configuracion de codepipeline y aprobar manualmente la conexion con github.
5. Una vez echo el paso anterior podra reintentar la ejecución de codepipeline o subir un nuevo cambio a la rama Main para que se ejecute automaticamente.
6. https://api-gateway-url/dev/{apis}
