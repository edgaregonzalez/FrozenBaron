#!/bin/bash

<<com
Construye un programa denominado AGENDA que permita mediante un menú, el mantenimiento de un pequeño archivo lista.txt con el nombre, dirección y teléfono de varias personas. Debes incluir estas opciones al programa:

Añadir (añadir un registro)
Buscar (buscar entradas por nombre, dirección o teléfono)
Listar (visualizar todo el archivo).
Ordenar (ordenar los registros alfabéticamente).
Borrar (borrar el archivo).

com

# verifica si elchivo no exite y si no lo crea
function vedificarArchivo() {
    if [ ! -f lista.txt ]; then
        touch lista.txt
    fi
}

# menu function

function agregarRegistro() {
    echo -n "Nombre: "
    read nombre
    echo -n "Dirección: "
    read direccion
    echo -n "Teléfono: "
    read telefono
    echo "$nombre:$direccion:$telefono" >> lista.txt
}

# buscar una entrada

function buscarRegistro() {
    echo -n "Ingresa un criterio de busqueda: "
    read buscar
    grep -i $buscar lista.txt
}

# listar el archivo
function listarArchivo() {
    cat lista.txt
}

# ordenar el archivo
function ordenarArchivo() {
    sort lista.txt
}

# borrar el archivo
function borrarArchivo() {
    rm lista.txt
}

function menu() {
    echo "1. Añadir"
    echo "2. Buscar"
    echo "3. Listar"
    echo "4. Ordenar"
    echo "5. Borrar"
    echo "6. Salir"
    echo -n "Introduce una opción: "
    read option
    case $option in
        1) agregarRegistro ;;
        2) buscarRegistro ;;
        3) listarArchivo ;;
        4) ordenarArchivo ;;
        5) borrarArchivo ;;
        6) exit ;;
        *) echo "Opción incorrecta" ; menu ;;
    esac
}

function main() {
    # verificar el archivo
    vedificarArchivo
    # ejecuta el menu de opciones
    menu
}
main