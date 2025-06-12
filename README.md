# Franchise_IaC

Este repositorio contiene la infraestructura como código (IaC) para un servicio de gestión de franquicias, implementado en AWS utilizando Terraform. La arquitectura está diseñada para proporcionar una solución escalable y mantenible para la gestión de franquicias.

## Descripción

El proyecto implementa una arquitectura completa en AWS que incluye:
- Red VPC con subredes públicas y privadas
- Cluster ECS para la ejecución de contenedores
- Base de datos RDS para almacenamiento persistente
- Balanceador de carga para distribución de tráfico
- Roles y políticas IAM para seguridad
- Grupos de seguridad para control de acceso

## Requisitos Previos

- Terraform >= 1.0.0
- AWS CLI configurado con credenciales válidas
- Acceso a una cuenta AWS con permisos suficientes
- Git

## Instalación

1. Clonar el repositorio:
```bash
git clone https://github.com/yonathancarvajal/Franchise_IaC.git
cd Franchise_IaC
```

2. Inicializar Terraform:
```bash
terraform init
```

3. Revisar el plan de ejecución:
```bash
terraform plan
```

4. Aplicar la infraestructura:
```bash
terraform apply
```

5. Destruir la infraestructura:
```bash
terraform destroy
```

## Estructura del Proyecto

```
.
├── vpc.tf                # Configuración de VPC
├── subnets.tf            # Definición de subredes
├── internet_gateway.tf   # Gateway de internet
├── route_table.tf        # Tablas de rutas
├── security_groups.tf    # Grupos de seguridad
├── cluster.tf            # Cluster ECS
├── service.tf            # Servicio ECS
├── task_definition.tf    # Definición de tareas
├── repository.tf         # Repositorio ECR
├── db_instance.tf        # Instancia de base de datos
├── load_balancer.tf      # Balanceador de carga
├── roles.tf              # Roles y políticas IAM
├── provider.tf           # Configuración del proveedor AWS
└── main.tf              # Archivo principal
```

## Uso

1. **Configuración de Variables**
   - Revisar y ajustar las variables en los archivos de configuración según sea necesario
   - Asegurarse de que las credenciales AWS estén correctamente configuradas

2. **Despliegue**
   - Ejecutar `terraform apply` para desplegar la infraestructura
   - Verificar la salida para obtener los endpoints y recursos creados

3. **Mantenimiento**
   - Usar `terraform plan` antes de realizar cambios
   - Mantener actualizado el estado de Terraform
   - Realizar backups regulares del estado

## Seguridad

- Las credenciales sensibles deben manejarse a través de variables de entorno o AWS Secrets Manager
- Los grupos de seguridad están configurados con el principio de mínimo privilegio
- Se recomienda revisar regularmente los permisos IAM

## Contribución

1. Fork el proyecto
2. Crear una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir un Pull Request

