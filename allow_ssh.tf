# Define a variable for the CIDR block of your allowed IP address
variable "allowed_ip" {
  type    = string
  default = "73.116.216.200"
}

resource "aws_security_group" "my_sg" {
  name        = "secure_ssh"
  description = "Your description here"
  vpc_id      = vpc-02ef769587dd081cf

  tags = {
    Name = "secure_ssh"
  }

  # Inbound Access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  # Outbound Access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

