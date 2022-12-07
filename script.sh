#!/bin/bash
# which bash # para saber donde esta instalado bash



# funciones

function getWordpress() { 
    # parametros
    local URL=$1
    echo "Descargando Wordpress"
    wget -O /tmp/wordpress.tar.gz $URL
    echo "Descomprimiendo Wordpress"
    tar -xzf /tmp/wordpress.tar.gz -C /tmp
    echo "Cambiar a directorio de wordpress"
    cd /tmp/wordpress
    echo "mover a directorio web"
    mv * /var/www/html  
}

function configureWordpress() {
    # parametros
    local DBNAME=$1
    local DBUSER=$2
    local DBPASS=$3
    local DBHOST=$4
    echo "Configurando Wordpress"
    cd /var/www/html
    mv wp-config-sample.php wp-config.php
    sed -i "s/database_name_here/$DBNAME/g" wp-config.php
    sed -i "s/username_here/$DBUSER/g" wp-config.php
    sed -i "s/password_here/$DBPASS/g" wp-config.php
    sed -i "s/localhost/$DBHOST/g" wp-config.php
}


# condicionales
# bucles

function main() {
    # variables

    local VERSION="6.0" 
    local REPOURL="https://wordpress.org/latest.tar.gz"
    local DBNAME="wordpress"
    local DBUSER="wpuser"
    local DBPASS="Abc12345678."
    local DBHOST="127.0.0.1"

    echo "busco el paquete de wordpress"
    getWordpress $REPOURL
    echo "configuro wordpress"
    configureWordpress $DBNAME $DBUSER $DBPASS $DBHOST

}
main