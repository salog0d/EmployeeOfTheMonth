# Dockerfile para Employee Of The Month

# Imagen base de Python
FROM python:3.10-slim as builder

# Directorio de trabajo
WORKDIR /app

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    postgresql-client \
    gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configuración del entorno Python
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on

# Instalar e actualizar pip
RUN pip install --upgrade pip setuptools wheel

# Copiar archivos de requisitos
COPY requirements.txt .

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Crear una imagen más ligera para la fase final
FROM python:3.10-slim

WORKDIR /app

# Instalar solo las dependencias de tiempo de ejecución
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq5 \
    postgresql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configuración del entorno Python
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DJANGO_SETTINGS_MODULE=EmployeeOfTheMonth.settings.production \
    DEBUG=False

# Copiar paquetes Python desde la etapa de construcción
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Crear usuario no root para ejecutar la aplicación
RUN useradd -ms /bin/bash appuser

# Copiar el código del proyecto
COPY --chown=appuser:appuser . .

# Crear directorios para archivos estáticos y media
RUN mkdir -p /app/staticfiles /app/media \
    && chown -R appuser:appuser /app/staticfiles /app/media

# Recolectar archivos estáticos
RUN python manage.py collectstatic --noinput

# Cambiar al usuario no root
USER appuser

# Exponer el puerto de la aplicación
EXPOSE 8000

# Script de inicio
COPY --chown=appuser:appuser docker/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Ejecutar el script de entrada
ENTRYPOINT ["/docker-entrypoint.sh"]

# Comando por defecto
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "3", "EmployeeOfTheMonth.wsgi:application"]