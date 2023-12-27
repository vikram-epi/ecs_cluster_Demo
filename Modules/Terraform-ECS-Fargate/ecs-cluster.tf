resource "aws_ecs_cluster" "ECS1" {
  name = "Main-Cluster1"

  tags = {
    Name = "Main-Cluster1"
  }
}   
