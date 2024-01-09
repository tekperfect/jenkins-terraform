resource "aws_key_pair" "autodeploy" {
  key_name   = "autodeploy"
  public_key = file("/var/jenkins_home/.ssh/id_rsa.pub")
}

resource "aws_security_group" "ssh_access" {
  name        = "ssh_access"
  description = "Security group for SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.team_ips  # Reference to variable holding team IPs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }
}

resource "aws_instance" "public_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.autodeploy.key_name
  security_groups = [aws_security_group.ssh_access.name]

  tags = {
    Name = var.name_tag
  }
}
resource "aws_key_pair" "autodeploy" {
  key_name   = "autodeploy"  # Set a unique name for your key pair
  public_key = file("/var/jenkins_home/.ssh/id_rsa.pub")
}

resource "aws_instance" "public_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.name_tag,
  }
  
  key_name = aws_key_pair.autodeploy.key_name  # Link the key pair to the instance
}
