# CAPGIPI06-AWS
Objet du TP : Déploiement d'un EC2 dans AWS via Terraform.

Les ressources suivantes doivent être déployées :
- instance EC2
- security group
- backend
- VPC

## Etape 1 - Pré-requis
- Télécharger et installer Terraform
- Configurer les clés d'accès API
- Créer un utilisateur et définir les autorisations IAM (fullEC2 et fullS3 ici)
- Configurer la région AWS : eu-west-3
- Choisir une AMI

## Etape 2 - Ecrire les fichiers de configuration Terraform
Les 3 fichiers de configuration indispensables sont :
- main.tf : fichier principal
- variables.tf : définition des variables
- terraform.tfvars : affectation des valeurs aux variables

*Note : D'autres fichiers de configuration pourraient être créés dans le cadre de projets plus complexes, mais ce n'est pas nécessaire dans notre cas.*

### Créer le fichier main.tf
Ce fichier permet de configurer Terraform afin qu'il puisse communiquer avec AWS.
J'ai regroupé la création de toutes les ressources (instance, VPC, security group, bucket) dans ce fichier.
Il aurait été possible de créer un fichier dédié à la création de ces ressources et uniquement indiquer le provider dans le fichier main.

### Créer le fichier variables.tf
Ce fichier permet de défnir les variables utilisées dans le projet.
Il est possible de leur indiquer une valeur par défaut.

### Créer le fichier terraform.tfvars
Ce fichier permet de donner des valeurs spécifiques aux variables du projet.

## Etape 3 - Appliquer la configuration
Passer les commandes
terraform init : initiation de la configuration, vérification des credentials
terraform plan : résultat de l'application des fichiers de configuration, sans action concrète pour l'instant
terraform apply : application des fichiers de conf. Si connexion au compte AWS, on peut constater que les ressources demandées sont bien créées
terraform destroy : suppression de toutes les ressources présentes dans les fichiers de conf.

## Problématiques rencontrées

J'ai eu des difficultés notamment au moment de la définition des credential. Je ne comprenais pas comment indiquer dans mes fichiers de configuration
quel compte utiliser pour la création de l'instance.
J'ai finalement réussi à consulter le contenu de mes variables d'environnement AWS dans lesquelles j'ai indiqué mes clés AWS_ACCESS_KEY_ID et AWS_SECRET_ACCESS_KEY

J'ai également eu une erreur car je n'avais pas donné les droits d'accès au bucket à mon utilisateur.
