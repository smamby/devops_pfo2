#!/bin/bash

# --- Configuración ---
REPO_URL="https://github.com/smamby/devops_pfo2.git"
REPO_DIR_NAME=$(basename "$REPO_URL" .git) # Obtiene el nombre del directorio del repo
COMPOSE_FILE="docker-compose.yml"

# --- Funciones ---

# Función para verificar si un comando está instalado
command_exists () {
  command -v "$1" >/dev/null 2>&1
}

# Función para clonar el repositorio
clone_repo () {
  echo "Clonando el repositorio desde: $REPO_URL"
  if [ -d "$REPO_DIR_NAME" ]; then
    echo "El directorio '$REPO_DIR_NAME' ya existe. ¿Desea eliminarlo y clonar de nuevo? (s/N)"
    read -r respuesta
    if [[ "$respuesta" =~ ^[Ss]$ ]]; then
      echo "Eliminando el directorio '$REPO_DIR_NAME'..."
      rm -rf "$REPO_DIR_NAME"
      git clone "$REPO_URL"
      echo "Repositorio clonado exitosamente en '$REPO_DIR_NAME'."
      cd "$REPO_DIR_NAME"
    else
      echo "Usando el repositorio existente en '$REPO_DIR_NAME'."
      cd "$REPO_DIR_NAME"
    fi
  else
    git clone "$REPO_URL"
    echo "Repositorio clonado exitosamente en '$REPO_DIR_NAME'."
    cd "$REPO_DIR_NAME"
  fi
}

# Función para levantar la aplicación con Docker Compose
run_docker_compose () {
  echo "Ejecutando Docker Compose para levantar la aplicación..."
  if [ -f "$COMPOSE_FILE" ]; then
    docker-compose up -d
    if [ $? -eq 0 ]; then
      echo "Aplicación levantada exitosamente en segundo plano."
      echo "Puedes acceder a los servicios en los puertos definidos en '$COMPOSE_FILE'."
    else
      echo "Error al ejecutar 'docker-compose up -d'."
      exit 1
    fi
  else
    echo "No se encontró el archivo '$COMPOSE_FILE' en el directorio actual."
    exit 1
  fi
}

# --- Main ---

echo "--- Preparando para correr la aplicación Docker ---"

# Verificar dependencias
echo "Verificando dependencias..."
if ! command_exists git; then
  echo "Error: git no está instalado. Por favor, instálalo antes de continuar."
  exit 1
fi
if ! command_exists docker; then
  echo "Error: docker no está instalado. Por favor, instálalo antes de continuar."
  exit 1
fi
if ! command_exists docker-compose; then
  echo "Error: docker-compose no está instalado. Por favor, instálalo antes de continuar."
  exit 1
fi
echo "Dependencias verificadas."

# Clonar el repositorio
clone_repo

# Levantar la aplicación con Docker Compose
run_docker_compose

echo "--- Proceso completado ---"

docker ps -a
echo pwd
ls -l ./db_init.sql
sleep 5

docker exec -i devops_pfo2-db-1 mysql -u root -p'admin' < ./db_init.sql

sleep 2
start chrome http://localhost:8080