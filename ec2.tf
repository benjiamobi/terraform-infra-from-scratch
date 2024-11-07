resource "aws_instance" "web" {
  ami                    = var.ami # Ubuntu 24 AMI in eu-north-1
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  user_data              = <<-EOF
              #!/bin/bash
              
              # Deploy a Static Website on Ubuntu 24 with Nginx

              # Exit immediately if a command exits with a non-zero status
              set -e

              # 1. Update System Packages
              apt update

              # 2. Install Nginx
              apt install nginx -y

              # 3. Clone the Website Code
              git clone https://github.com/GerromeSieger/Static-Site.git

              # 4. Deploy the Website
              cp -r Static-Site/* /var/www/html

              # 5. Restart Nginx
              systemctl restart nginx

              echo "Static website deployment completed."
              EOF



  tags = {
    Name = "StaticWeb-terraform"
  }
}