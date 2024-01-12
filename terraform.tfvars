# Ce fichier permet de définir des valeurs aux variables du projet dans le cas où il ne faut pas
# utiliser la valeur par défaut définie dans le fichier variables.tf
# Dans notre cas, les valeurs par défaut sont déjà les bonnes, elles sont donc répétées ici.

instance_type = "t2.micro"
instance_name = "efayard-aws-instance"
ami_id = "ami-03193cafa8bab6c71"
region = "eu-west-3"