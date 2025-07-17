resource "aws_lb" "franchise_service_alb" {
  name               = "franchise-service-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
}

resource "aws_lb_target_group" "franchise_service_tg" {
  name         = "franchise-service-tg"
  port         = 80
  protocol     = "HTTP"
  vpc_id       = aws_vpc.main.id
  target_type  = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = 5
    unhealthy_threshold = 3
    timeout             = 120
    interval            = 121
    path                = "/actuator/health"
    matcher             = 200
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.franchise_service_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.franchise_service_tg.arn
  }
}

resource "aws_lb_listener_rule" "default_rule" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.franchise_service_tg.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}