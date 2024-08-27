#!/bin/bash

# Verificar si se proporcionó un nombre para la nueva aplicación
if [ -z "$1" ]; then
  echo "Por favor, proporciona un nombre para la nueva aplicación."
  exit 1
fi

APP_NAME=$1
APPS_DIR="$(dirname "$0")/apps"
BOILERPLATE_DIR="boilerplate"
APP_DIR="$APPS_DIR/$APP_NAME"

# Patrón para validar el nombre de la carpeta
PATTERN="^(?:(?:@(?:[a-z0-9-*~][a-z0-9-*._~]*)?/[a-z0-9-._~])|[a-z0-9-~])[a-z0-9-._~]*$"

# Verificar si el nombre de la carpeta cumple con el patrón
if [[ ! $APP_NAME =~ $PATTERN ]]; then
  echo "El nombre de la carpeta no cumple con el patrón especificado."
  echo "Ejemplo de un nombre correcto: my-app o @scope/my-app"
  exit 1
fi

# Verificar si la carpeta boilerplate existe
if [ ! -d "$BOILERPLATE_DIR" ]; then
  echo "La carpeta boilerplate no existe."
  exit 1
fi

# Crear la carpeta de la nueva aplicación copiando la carpeta boilerplate
cp -r "$BOILERPLATE_DIR" "$APP_DIR"

# Buscar y reemplazar todas las referencias a "boilerplate" en los archivos de la nueva carpeta
find "$APP_DIR" -type f -exec sed -i '' "s/boilerplate/$APP_NAME/g" {} +

echo "Aplicación $APP_NAME creada exitosamente."