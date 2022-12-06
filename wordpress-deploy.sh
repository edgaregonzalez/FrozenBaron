WPPATH = "/var/www/wordpress"
WPPACKAGE = "latest.tar.gz"
SITEDIR = "/var/www/wordpress"


# crear el entorno (instalar los servicios necesarios para que corra el producto)

sudo apt update -y
sudo apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
sudo apt install apache2 -y
sudo apt install php libapache2-mod-php php-mysql -y
sudo apt install mysql-server -y

# desplegar la aplicacion

sudo wget https://wordpress.org/$WPPACKAGE
sudo tar -xzvf $WPPACKAGE


docker run --name database -e MYSQL_ROOT_PASSWORD=o4D46Wc^ItiU -e MYSQL_USER=wpuser -e MYSQL_PASSWORD=abc1234 -e MYSQL_DATABASE=wordpress -d mysql:latest

# configurar la aplicacion

cd $WORDPRESSPATH

sudo mv wp-config-sample.php wp-config.php