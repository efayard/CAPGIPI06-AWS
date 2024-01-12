# Indication sur le provider utilisé : 
provider "aws" {
  region = var.region
  access_key = "AWS_ACCESS_KEY_ID"
  secret_key = "AWS_SECRET_ACCESS_KEY"
}

# Création du backend s3 :
terraform {
  backend "s3" {
    bucket = "buckettpawsefayard"
    key    = "tfstate/buckettpawsefayard.tfstate"
    region = "eu-west-3"
  }
}

# Création du VPC :
resource "aws_vpc" "efayard_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Création d'un security group
resource "aws_security_group" "efayard_group" {
  name        = "efayard_group"
  depends_on = [aws_vpc.efayard_vpc]
  description = "Security Group pour mon instance EC2"

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.efayard_vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

# Création de l'instance :
resource "aws_instance" "efayard_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.efayard_group.id]

  tags = {
    Name = var.instance_name
  }
}