#!/bin/bash

# Definir rutas
archivo_original="docs/informe.txt"
directorio_respaldo="respaldos"

# Verificar si el archivo original existe
if [ ! -f "$archivo_original" ]; then
    echo "Error: El archivo $archivo_original no existe. No se puede generar respaldo."
    exit 1
fi

# Crear directorio de respaldos si no existe
mkdir -p "$directorio_respaldo"

# Obtener fecha actual para el nombre del respaldo
fecha=$(date +"%Y%m%d_%H%M%S")
nombre_respaldo="informe_$fecha.txt"

# Copiar el archivo original al directorio de respaldos
cp "$archivo_original" "$directorio_respaldo/$nombre_respaldo"

# Registrar el respaldo en log_respaldo.txt
echo "Respaldo generado el $(date +"%Y-%m-%d %H:%M:%S") -> $directorio_respaldo/$nombre_respaldo" >> log_respaldo.txt

# Mensaje de confirmación
echo "Respaldo generado en: $directorio_respaldo/$nombre_respaldo"
