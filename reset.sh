!/bin/bash


echo "Ingrese el nombre de la imagen (ej: mi-app):"
read imagene
echo "Ingrese la url imagen (ej: . o ./public):"
read url
echo "Ingrese puertos: (ej: '8080:8080'):"
read ports

docker stop $imagene

docker rm $imagene

docker build -t $imagene $url
docker run -d \
  --name $imagene \
  -p $ports \
  --network nw_pfo2 \
  $imagene

