# Ce fichier liste les variables utilisées dans le projet et leur assigne une valeur par défaut.
# Leurs valeurs sont définies dans le fichier terraform.tfvars

# Variable qui donne son nom à l'instance :
variable "instance_name" {
  description = "Nom de l'instance créée"
  type        = string
}

# Variable qui donne son type à l'instance, ici une t2.micro :
variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
}

# Variable qui indique l'ID de l'AMI utilisée :
variable "ami_id" {
  description = "L'AMI utilisée"
  type        = string
}

# Variable qui définit la région :
variable "region" {
  description = "Région utilisée"
  type        = string
}