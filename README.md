# PFO2 - DevOps   
   
## Parte 1   
## Containerizacion de aplicacion   
   
Automatiza el clonado del repositorio:  
descarga iniciar.sh y ejecuta el script  
#### ./iniciar.sh  
se clona y crear la base de datos.
ir http://localhost:8080   
   
   
   
tambien podes clonarlo y construir las imagenes antes, y luego correrlas:    
git clone https://github.com/smamby/devops_pfo2.git  
cd devops_pfo2  
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

