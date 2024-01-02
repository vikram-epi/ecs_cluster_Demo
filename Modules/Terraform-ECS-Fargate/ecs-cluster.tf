resource "aws_ecs_cluster" "ECS1" {
  name = "Main-Cluster2"

  tags = {
    Name = "Main-Cluster2"
  }
}   
