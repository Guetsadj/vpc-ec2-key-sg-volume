# EC2 Instance
resource "aws_instance" "server1" {
  ami           = "ami-02f624c08a83ca16f"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.pusub2.id
  key_name      = aws_key_pair.key1.key_name
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]

  root_block_device {
    volume_size = 20
  }
user_data= filebase64("setup.sh")
  
tags = {
    Name       = "Terraform_instance"
    Team       = "Cloud Transformation"
    Env        = "Dev"
    
  
}
}