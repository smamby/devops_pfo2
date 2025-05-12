# PFO2 - DevOps

## Parte 1
## Contenerizacion de aplicacion

Construir las imagenes antes, y luego correrlas:  
docker-compose up -d --build

Levantar app:  
docker-compose up -d

Visitar app  
http://localhost:8080

endpoint backend:  
http://localhost:3001/data

posteo desde terminal:  
curl -X POST -H "Content-Type: Application/json" -d {"name": "Carla", "email": "carla@email.com"} http://localhost:3001/data


Detener app:  
docker-compose down

