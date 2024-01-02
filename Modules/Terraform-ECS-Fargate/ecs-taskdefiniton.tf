resource "aws_ecs_task_definition" "TD2" {
  family                   = "Nginx-TD"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.iam-role.arn
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  container_definitions = jsonencode([
    {
      name      = "main-container2"
      image     = "public.ecr.aws/g2b6m8b9/helloworldrepo:latest"
      cpu       = 1024
      memory    = 2048
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 80
        }
      ]
    }
  ])
}


data "aws_ecs_task_definition" "TD2" {
  task_definition = aws_ecs_task_definition.TD2.family
}
