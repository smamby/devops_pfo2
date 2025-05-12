!/bin/bash


# echo "Ingrese el nombre de la imagen (ej: mi-app):"
# read imagen
# echo "Ingrese la url imagen (ej: . o ./public):"
# read url
# echo "Ingrese puertos: (ej: '8080:8080'):"
# read ports

# Verificar que se proporcionen los tres argumentos necesarios
if [[ $# -ne 3 ]]; then
  echo "Uso: $0 <nombre_imagen> <url_imagen> <puertos>"
  echo "Ejemplo: $0 mi-app . '8080:8080'"
  exit 1
fi

# Asignar los parámetros posicionales a variables
imagen="$1"
url="$2"
ports="$3"

echo "Nombre de la imagen: $imagen"
echo "URL del dockerfile: $url"
echo "Puertos: $ports"

docker stop $imagen

docker rm $imagen

docker build -t $imagen $url
docker run -d \
  --name $imagen \
  -p $ports \
  --network nw_pfo2 \
  $imagen

