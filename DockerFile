# Usamos una imagen ligera de Python
FROM python:3.9-slim

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos el archivo de dependencias (si lo tienes) o instalamos flask directamente
COPY . .
RUN pip install --no-cache-dir flask pytest

# Exponemos el puerto que usa Flask (por defecto 5000)
EXPOSE 5000

# Comando para ejecutar la aplicación
CMD ["python", "app.py"]
