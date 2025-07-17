resource "aws_ecs_service" "franchise_ms_service" {
  name            = "franchise-ms-service"
  cluster         = aws_ecs_cluster.ecs_franchise_cluster.id
  task_definition = aws_ecs_task_definition.franchise_service_task.arn
  desired_count   = 1
  force_new_deployment = true
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.franchise_service_tg.arn
    container_name   = "franchise-service"
    container_port   = 8080
  }
}