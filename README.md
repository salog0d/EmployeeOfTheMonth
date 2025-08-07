# Employee Of The Month


![Screenshot From 2025-04-26 13-37-42](https://github.com/user-attachments/assets/e2006005-32ef-4b7a-844f-ba0cd50b31ec)

## Descripción General

Employee Of The Month es una plataforma gamificada para entornos empresariales que transforma la gestión del rendimiento de los empleados en una experiencia interactiva y motivadora. La aplicación combina elementos de videojuegos con herramientas de productividad para crear un sistema que fomenta el reconocimiento, la sana competencia y el desarrollo profesional.

Desarrollada con Django y Django REST Framework, esta plataforma ofrece tanto una interfaz web completa como una API RESTful para integración con otros sistemas empresariales.

## Características Principales

### Sistema de Gamificación

- **Sistema de puntuación**: Los empleados acumulan puntos por completar tareas, alcanzar objetivos y recibir reconocimientos.
- **Niveles de progresión**: Los usuarios avanzan por diferentes niveles a medida que acumulan experiencia.
- **Tabla de clasificación (Leaderboard)**: Muestra los 15 mejores empleados según su rendimiento.
- **Logros y medallas**: Recompensas virtuales por hitos específicos o comportamientos deseados.
- **Misiones y desafíos**: Tareas específicas que los empleados pueden completar para ganar puntos adicionales.

### Sistema de Usuarios y Autenticación

- **Registro personalizado**: Proceso de registro con verificación por correo electrónico.
- **Autenticación flexible**: Inicio de sesión con nombre de usuario o correo electrónico.
- **Perfiles de usuario**: Cada empleado tiene un perfil personalizable con estadísticas y logros.
- **Roles y permisos**: Diferentes niveles de acceso para empleados, gerentes y administradores.

### Panel de Control

- **Dashboard personalizado**: Interfaz principal con estadísticas relevantes para cada usuario.
- **Visualización de progreso**: Seguimiento visual del avance hacia objetivos y niveles.
- **Notificaciones**: Sistema de alertas para nuevos logros, cambios de posición en el ranking, etc.
- **Gestión de tareas**: Asignación y seguimiento de responsabilidades laborales.

### API RESTful

- **Documentación completa**: Endpoints documentados con Swagger y ReDoc.
- **Autenticación mediante Token y JWT**: Seguridad robusta para acceso a la API.
- **Versionado**: Soporte para diferentes versiones de la API.
- **Throttling y caché**: Limitación de tasas y optimización del rendimiento.

## Arquitectura Técnica

### Backend

#### Django Framework (5.2)

- **Estructura modular**: Aplicaciones separadas por dominio funcional.
- **Middleware personalizado**: Para procesamiento de solicitudes, autenticación, etc.
- **Sistema ORM**: Modelos optimizados con índices y relaciones apropiadas.
- **Señales**: Implementación de señales de Django para operaciones asíncronas.
- **Gestión de caché**: Configuración de Redis para almacenamiento en caché.

#### Django REST Framework (3.14)

- **Serializers**: Conversión bidireccional entre modelos y datos JSON.
- **ViewSets y Routers**: Estructura consistente para endpoints de API.
- **Filtrado, ordenación y paginación**: Funcionalidades avanzadas para consulta de datos.
- **Validación de datos**: Sistema robusto para entrada de datos.

#### Base de Datos

- **PostgreSQL**: Base de datos principal con configuración optimizada.
- **Migraciones**: Control de versiones para la estructura de la base de datos.
- **Consultas optimizadas**: Uso de select_related, prefetch_related y funciones avanzadas de SQL.
- **Indexación**: Índices estratégicos para consultas frecuentes.

### Frontend

#### Interfaz de Usuario

- **TailwindCSS**: Framework de CSS utilizable para el diseño responsive.
- **Glassmorphism Design**: Estética moderna con efectos de transparencia y desenfoque.
- **JavaScript**: Interactividad en el lado del cliente.
- **Componentes reutilizables**: Estructura modular para mantener la consistencia visual.

#### Experiencia de Usuario

- **Animaciones fluidas**: Transiciones de elemento suaves para mejorar la experiencia.
- **Diseño responsive**: Adaptación completa a dispositivos móviles y de escritorio.
- **Accesibilidad**: Implementación de prácticas WCAG 2.1 para accesibilidad.
- **Modo oscuro/claro**: Soporte para diferentes preferencias de visualización.

### Seguridad

- **Autenticación multifactor**: Capa adicional de seguridad opcional.
- **Protección CSRF y XSS**: Medidas contra ataques comunes.
- **Limitación de tasa**: Protección contra ataques de fuerza bruta.
- **Almacenamiento seguro de contraseñas**: Utilización de algoritmos de hashing robustos (Argon2).
- **Auditoría y logging**: Registro de acciones sensibles del sistema.

### Despliegue e Infraestructura

- **Docker**: Contenedores para desarrollo y producción.
- **CI/CD**: Integración continua y despliegue mediante GitHub Actions.
- **Entornos separados**: Configuraciones distintas para desarrollo, pruebas y producción.
- **Monitoreo**: Integración con Sentry para seguimiento de errores.
- **Backups automatizados**: Copias de seguridad programadas de la base de datos.

## Estructura del Proyecto

```
EmployeeOfTheMonth/
├── apps/                    # Aplicaciones de Django
│   ├── custom_auth/         # Sistema de autenticación personalizado
│   │   ├── models.py        # Modelo CustomUser extendido
│   │   ├── forms.py         # Formularios personalizados
│   │   ├── views.py         # Vistas de autenticación
│   │   ├── templates/       # Plantillas para login/registro
│   │   └── urls.py          # URLs de la app
│   ├── api/                 # API REST
│   │   ├── serializers/     # Serializadores por modelo
│   │   ├── views/           # Viewsets y vistas de API
│   │   ├── permissions.py   # Permisos personalizados
│   │   ├── pagination.py    # Configuración de paginación
│   │   └── urls.py          # Rutas de API
│   └── core/                # Funcionalidad principal
│       ├── models/          # Modelos de datos
│       ├── services/        # Lógica de negocio
│       ├── templatetags/    # Tags personalizados
│       ├── views/           # Vistas web
│       └── templates/       # Plantillas HTML
├── static/                  # Archivos estáticos
│   ├── css/                 # Estilos compilados
│   ├── js/                  # JavaScript
│   └── images/              # Imágenes estáticas
├── templates/               # Plantillas globales
├── media/                   # Archivos subidos por usuarios
├── EmployeeOfTheMonth/      # Configuración principal del proyecto
│   ├── settings/            # Configuraciones separadas por entorno
│   │   ├── base.py          # Configuración base
│   │   ├── development.py   # Entorno de desarrollo
│   │   └── production.py    # Entorno de producción
│   ├── urls.py              # URLs principales
│   └── wsgi.py              # Configuración WSGI
├── manage.py                # Script de administración de Django
├── requirements/            # Requisitos separados por entorno
│   ├── base.txt             # Dependencias comunes
│   ├── development.txt      # Dependencias de desarrollo
│   └── production.txt       # Dependencias de producción
├── docker/                  # Configuración de Docker
│   ├── Dockerfile           # Imagen principal
│   └── docker-compose.yml   # Composición de servicios
├── scripts/                 # Scripts de utilidad
├── .env.example             # Ejemplo de variables de entorno
├── LICENSE                  # Licencia del proyecto
└── README.md                # Este archivo
```

## Modelos de Datos

### CustomUser
```python
class CustomUser(AbstractUser):
    email = models.EmailField(unique=True)
    score = models.IntegerField(default=0)
    level = models.IntegerField(default=1)
    verification_token = models.CharField(max_length=100, blank=True)
    avatar = models.ImageField(upload_to='avatars/', null=True, blank=True)
    department = models.ForeignKey('Department', on_delete=models.SET_NULL, null=True, blank=True)
    position = models.CharField(max_length=100, blank=True)
    bio = models.TextField(blank=True)
    date_joined = models.DateTimeField(auto_now_add=True)
    last_active = models.DateTimeField(auto_now=True)
```

### MiniGame

```python
class Minigame(models.Model):
    username = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    tries = models.IntegerField(default=0)
```


## API REST - Endpoints Principales

### Autenticación
- `POST /api/v1/auth/token/` - Obtener token JWT
- `POST /api/v1/auth/token/refresh/` - Refrescar token JWT
- `POST /api/v1/auth/register/` - Registrar nuevo usuario

### Usuarios
- `GET /api/v1/users/` - Listar usuarios
- `GET /api/v1/users/{id}/` - Detalle de usuario
- `PATCH /api/v1/users/{id}/` - Actualizar usuario
- `GET /api/v1/users/leaderboard/` - Obtener tabla de clasificación


## Instalación

### Requisitos previos

- Python 3.10 o superior
- PostgreSQL 13 o superior
- Node.js 16+ (para procesamiento de assets front-end)
- Docker y Docker Compose (opcional, para desarrollo con contenedores)

### Configuración con entorno virtual

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/yourusername/EmployeeOfTheMonth.git
   cd EmployeeOfTheMonth
   ```

2. Crear un entorno virtual e instalar dependencias:
   ```bash
   python -m venv venv
   source venv/bin/activate  # En Windows: venv\Scripts\activate
   pip install -r requirements/development.txt
   ```

3. Configurar variables de entorno:
   ```bash
   cp .env.example .env
   # Editar .env con tus credenciales y configuración
   ```

4. Aplicar migraciones:
   ```bash
   python manage.py migrate
   ```

5. Crear datos iniciales (opcional):
   ```bash
   python manage.py loaddata initial_data
   ```

6. Crear un superusuario:
   ```bash
   python manage.py createsuperuser
   ```

7. Ejecutar el servidor de desarrollo:
   ```bash
   python manage.py runserver
   ```


### Preparación

1. Configurar variables de entorno de producción:
   ```bash
   # En el servidor de producción
   export DJANGO_SETTINGS_MODULE=EmployeeOfTheMonth.settings.production
   export DEBUG=False
   export SECRET_KEY=your-secure-key
   export DATABASE_URL=postgresql://user:password@host:port/database
   # ... otras variables de entorno
   ```

2. Recolectar archivos estáticos:
   ```bash
   python manage.py collectstatic --no-input
   ```

### Opciones de despliegue

#### Utilizando Gunicorn y Nginx

1. Instalar Gunicorn:
   ```bash
   pip install gunicorn
   ```

2. Configurar Gunicorn como servicio:
   ```bash
   # Crear archivo systemd
   sudo nano /etc/systemd/system/employeeofthemonth.service
   ```

3. Contenido del archivo de servicio:
   ```
   [Unit]
   Description=EmployeeOfTheMonth Gunicorn daemon
   After=network.target

   [Service]
   User=www-data
   Group=www-data
   WorkingDirectory=/path/to/employeeofthemonth
   ExecStart=/path/to/venv/bin/gunicorn --workers 3 --bind unix:/path/to/employeeofthemonth.sock EmployeeOfTheMonth.wsgi:application
   Restart=on-failure

   [Install]
   WantedBy=multi-user.target
   ```

4. Configurar Nginx:
   ```
   server {
       listen 80;
       server_name yourdomain.com;

       location = /favicon.ico { access_log off; log_not_found off; }
       
       location /static/ {
           root /path/to/employeeofthemonth;
       }

       location /media/ {
           root /path/to/employeeofthemonth;
       }

       location / {
           include proxy_params;
           proxy_pass http://unix:/path/to/employeeofthemonth.sock;
       }
   }
   ```

#### Utilizando Docker en producción

1. Construir la imagen de producción:
   ```bash
   docker build -f docker/Dockerfile.prod -t employeeofthemonth:prod .
   ```

2. Ejecutar con docker-compose:
   ```bash
   docker-compose -f docker/docker-compose.prod.yml up -d
   ```

## Seguridad

- Todas las contraseñas se almacenan con el algoritmo Argon2
- Protección contra ataques CSRF en todos los formularios
- Se implementa rate limiting para prevenir ataques de fuerza bruta
- La comunicación con la API requiere autenticación mediante tokens JWT
- Cabeceras HTTP de seguridad configuradas (HSTS, X-Content-Type-Options, etc.)

## Roadmap (Próximas características)

- [ ] Integración con Slack/Teams para notificaciones
- [ ] Sistema de recompensas canjeables en el mundo real
- [ ] Análisis de datos y dashboards para gerentes
- [ ] Implementación de eventos temporales (competencias limitadas en el tiempo)
- [ ] Soporte para múltiples idiomas
- [ ] Aplicación móvil nativa

## Contribución

Agradecemos las contribuciones a Employee Of The Month. Por favor sigue estos pasos:

1. Crear un fork del repositorio
2. Crear una rama para tu característica (`git checkout -b feature/amazing-feature`)
3. Formatear el código con Black (`black .`)
4. Hacer commit de tus cambios (`git commit -m 'feat: add amazing feature'`)
5. Hacer push a la rama (`git push origin feature/amazing-feature`)
6. Abrir un Pull Request

## Licencia

Este proyecto está licenciado bajo la Licencia GNU GENERAL PUBLIC LICENSE
