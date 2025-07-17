resource "aws_ecs_task_definition" "franchise_service_task" {
  family                   = "franchise-service-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name  = "franchise-service"
    image = "${aws_ecr_repository.test_franchise.repository_url}:latest"
    essential = true
    portMappings = [{
      containerPort = 8080
      hostPort      = 8080
    }]
    environment = [
      { name = "USER_DB", value = "test" },
      { name = "PASSWORD_DB", value = "franchise2025*" },
      { name = "HOST_DB", value = "${aws_db_instance.franchise_rds.address}" },
      { name = "DATABASE_DB", value = "franchisedb" },
      { name = "PORT_DB", value = "5432" },
      { name = "SCHEMA_DB", value = "public" }
    ]
  }])

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
}