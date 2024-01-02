resource "aws_lb_target_group" "Main-TG2" {
  name        = "Main-TG2"
  port        = "80"
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.Main-VPC2.id

  tags = {
    Name = "Main-TG2"
  }
}
