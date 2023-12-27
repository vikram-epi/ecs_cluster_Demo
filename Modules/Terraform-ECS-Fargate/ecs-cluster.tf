resource "aws_ecs_cluster" "ECS" {
  name = "Main-Cluster1"

  tags = {
    Name = "Main-Cluster1"
  }
}   
