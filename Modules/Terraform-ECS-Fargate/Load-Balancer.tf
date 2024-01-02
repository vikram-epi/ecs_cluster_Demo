resource "aws_lb" "Main-LB3" {
  name               = "Main-LB3"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.SG3.id]

  tags = {
    Name = "Main-LB3"
  }
}

resource "aws_alb_listener" "Listener" {
  load_balancer_arn = aws_lb.Main-LB3.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.Main-TG3.id
    type             = "forward"
  }
}
