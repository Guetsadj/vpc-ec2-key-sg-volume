# Security Group
resource "aws_security_group" "web_server_sg" {
    name = "web-server-sg"
    description = "allow web traffic and ssh"
  vpc_id = aws_vpc.utc-app1.id

  ingress {
    description = "SSH from a specific ip Address"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["64.217.148.232/32"] # Replace with your IP
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "web-server-security-group"
  }
  depends_on = [ aws_vpc.utc-app1 ]
}