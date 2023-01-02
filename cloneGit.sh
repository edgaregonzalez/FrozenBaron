#!/bin/bash

# Obtener la lista de repositorios del usuario edgaregonzalez y almacenarla en una variable
repos_json=$(curl  https://api.github.com/users/edgaregonzalez/repos)

# Mostrar la respuesta de la API
echo "$repos_json"
sleep 2

# Extraer solo los nombres de los repositorios y almacenarlos en una lista
repos=$(echo "$repos_json" | jq -r '.[].name')

# Mostrar la lista de nombres de repositorios
echo "$repos"
sleep 2
# Iterar sobre la lista de repositorios y clonarlos uno a uno
for repo in $repos; do
  git clone https://github.com/edgaregonzalez/$repo.git
done
