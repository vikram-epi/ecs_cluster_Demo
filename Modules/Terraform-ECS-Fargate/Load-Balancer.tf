resource "aws_lb" "Main-LB2" {
  name               = "Main-LB2"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.SG2.id]
  subnets            = [aws_subnet.subnet111.id, aws_subnet.subnet112.id]

  tags = {
    Name = "LB2"
  }
}

resource "aws_alb_listener" "Listener" {
  load_balancer_arn = aws_lb.Main-LB2.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.Main-TG2.id
    type             = "forward"
  }
}
