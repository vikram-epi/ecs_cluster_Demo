resource "aws_ecs_cluster" "ECS2" {
  name = "Main-Cluster2"

  tags = {
    Name = "Main-Cluster2"
  }
}   
