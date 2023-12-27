resource "aws_lb_target_group" "TG1" {
  name        = "Main-TG1"
  port        = "80"
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc1.id

  tags = {
    Name = "Main-TG1"
  }
}
