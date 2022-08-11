resource "aws_security_group" "ec2-sg" {
  name   = "${var.product}.${var.environment}-ec2-sg"
  vpc_id = var.vpc_id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Port Open for SSH"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Port Open for HTTP"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Port Open for Appache Tomcat webserver"
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "All trafic allowed"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}