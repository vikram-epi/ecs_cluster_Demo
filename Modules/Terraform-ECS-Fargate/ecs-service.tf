resource "aws_ecs_service" "ECS-Service1" {
  name                               = "First-Service2"
  launch_type                        = "FARGATE"
  platform_version                   = "LATEST"
  cluster                            = aws_ecs_cluster.ECS2.id
  task_definition                    = aws_ecs_task_definition.TD2.arn
  scheduling_strategy                = "REPLICA"
  desired_count                      = 2
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  depends_on                         = [aws_alb_listener.Listener, aws_iam_role.iam-role]


  load_balancer {
    target_group_arn = aws_lb_target_group.Main-TG2.arn
    container_name   = "main-container2"
    container_port   = 80
  }


  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.SG2.id]
    subnets          = [aws_subnet.subnet111.id, aws_subnet.subnet112.id]
  }
}
