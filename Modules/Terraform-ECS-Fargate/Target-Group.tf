resource "aws_lb_target_group" "TG" {
  name        = "Main-TG1"
  port        = "80"
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "Main-TG1"
  }
}
