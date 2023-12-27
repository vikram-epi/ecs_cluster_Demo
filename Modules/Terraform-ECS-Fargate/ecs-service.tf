resource "aws_ecs_service" "ECS-Service" {
  name                               = "First-Service1"
  launch_type                        = "FARGATE"
  platform_version                   = "LATEST"
  cluster                            = aws_ecs_cluster.ECS1.id
  task_definition                    = aws_ecs_task_definition.TD1.arn
  scheduling_strategy                = "REPLICA"
  desired_count                      = 2
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  depends_on                         = [aws_alb_listener.Listener, aws_iam_role.iam-role]


  load_balancer {
    target_group_arn = aws_lb_target_group.TG1.arn
    container_name   = "main-container1"
    container_port   = 80
  }


  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.SG1.id]
    subnets          = [aws_subnet.subnet11.id, aws_subnet.subnet12.id]
  }
}
