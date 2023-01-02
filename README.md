# FrozenBaron
Repositorio para el equipo del bootcamp educacionit
# Explicación del script cloneGit.sh by Leonardo Rojas
1.- Para usar el API de Git uso la siguiente url: https://api.github.com/users/edgaregonzalez/repos) (Repo del user del profesor)
2.- utilizo el curl para luego mostrarlo con un echo y le agregue el comando sleep 2 segundo para chequear los repositorio con más detalles
3.- Creo una nueva variable donde uso un nuevo comando jq para extrar todos los nombre (hay que instalar previamente apt-get install jq)
4.- Luego creo un for para que me recorra todos los nombres del repo anteriormente leido y lo descargue uno a uno, con un git clone 
  4.1- Se puede eliminar el for y agregar directamente git clone y la URL completa del repo que necesite, pero el desafio era usar el api, y para eso 
       se uso un comando y pueda recorrer dentro del user los diferentes repo y luego descargarlo, es posible filtrar con más detalles con jq pero no lo investigue
       a profundidad el comando jq
