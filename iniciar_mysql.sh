#!/bin/bash

# Iniciar el servicio MariaDB
echo "Iniciando MariaDB..."
sudo systemctl start mariadb

# Verificar si se inició correctamente
if systemctl is-active --quiet mariadb; then
    echo "MariaDB está activo."
else
    echo "Error al iniciar MariaDB."
    exit 1
fi

# Abrir el cliente mysql como root
echo "Abriendo consola MariaDB como root..."
sudo mysql -u root -p

# Preguntar si quiere apagar el servicio
read -p "¿Apagar servicio MariaDB? (y/n): " RESPUESTA
if [[ "$RESPUESTA" =~ ^[Yy]$ ]]; then
    echo "Deteniendo MariaDB..."
    sudo systemctl stop mariadb
    echo "MariaDB detenido."
else
    echo "MariaDB seguirá en ejecución."
fi
