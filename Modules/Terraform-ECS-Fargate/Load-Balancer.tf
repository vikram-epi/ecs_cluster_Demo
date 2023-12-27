resource "aws_lb" "LB1" {
  name               = "Main-LB1"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.SG1.id]
  subnets            = [aws_subnet.subnet11.id, aws_subnet.subnet12.id]

  tags = {
    Name = "Main-LB1"
  }
}

resource "aws_alb_listener" "Listener" {
  load_balancer_arn = aws_lb.LB1.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.TG1.id
    type             = "forward"
  }
}
