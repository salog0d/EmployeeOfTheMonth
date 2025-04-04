# Employee Of The Month

## Descripción
Employee Of The Month es un videojuego educativo que simula la operación de un almacén y enseña buenas prácticas de gestión logística. Los jugadores gestionan operaciones de almacén y compiten por ser reconocidos como el "Empleado del Mes" basándose en su eficiencia, cumplimiento de protocolos y toma de decisiones.

Este repositorio contiene el backend y sistema de manejo de sesiones de la aplicación, desarrollado con Python y Django.

## Características
- Simulación realista de operaciones de almacén
- Sistema de recompensas y reconocimiento "Empleado del Mes"
- Escenarios de desafíos logísticos
- Seguimiento de progreso y estadísticas de jugadores
- Múltiples niveles de dificultad
- Manejo de sesiones para múltiples jugadores
- Panel de administración para instructores o supervisores

## Tecnologías utilizadas
- Backend: Python con Django
- Base de datos: SQLite (desarrollo) / PostgreSQL (producción)
- Autenticación: Django Auth
- API REST: Django Rest Framework
- Manejo de sesiones: Django Sessions

## Requisitos previos
- Python 3.8 o superior
- pip (gestor de paquetes de Python)
- Virtualenv (recomendado)

## Instalación

1. Clona el repositorio:
```bash
git clone https://github.com/salog0d/EmployeeOfTheMonth.git
cd EmployeeOfTheMonth
```

2. Crea y activa un entorno virtual:
```bash
python -m venv venv
# En Windows
venv\Scripts\activate
# En macOS/Linux
source venv/bin/activate
```

3. Instala las dependencias:
```bash
pip install -r requirements.txt
```

4. Configura las variables de entorno:
Crea un archivo `.env` en la raíz del proyecto con las siguientes variables:
```
SECRET_KEY=tu_clave_secreta
DEBUG=True
DATABASE_URL=sqlite:///db.sqlite3
```

5. Realiza las migraciones de la base de datos:
```bash
python manage.py migrate
```

6. Crea un superusuario (administrador):
```bash
python manage.py createsuperuser
```

7. Inicia el servidor de desarrollo:
```bash
python manage.py runserver
```

El backend estará disponible en `http://localhost:8000`.

## Endpoints de la API

### Autenticación
- `POST /api/login/` - Iniciar sesión de usuario
- `POST /api/logout/` - Cerrar sesión
- `POST /api/register/` - Registrar nuevo usuario

### Jugabilidad
- `GET /api/scenarios/` - Obtener escenarios disponibles
- `GET /api/scenario/<id>/` - Obtener detalles de un escenario
- `POST /api/session/start/` - Iniciar sesión de juego
- `PUT /api/session/<id>/` - Actualizar estado de sesión
- `GET /api/leaderboard/` - Obtener tabla de clasificación

### Administración
- `GET /api/stats/` - Estadísticas de jugadores
- `POST /api/scenario/create/` - Crear nuevo escenario
- `PUT /api/employees/award/` - Otorgar premio "Empleado del Mes"

## Estructura del proyecto
```
/
├── employee_of_the_month/   # Configuración principal de Django
│   ├── settings.py          # Configuración del proyecto
│   ├── urls.py              # URLs principales
│   └── wsgi.py              # Configuración WSGI
├── game/                    # Aplicación principal del juego
│   ├── models.py            # Modelos de datos (jugadores, escenarios, sesiones)
│   ├── views.py             # Vistas y lógica del juego
│   ├── serializers.py       # Serializadores para la API
│   ├── admin.py             # Configuración del admin
│   └── urls.py              # URLs de la aplicación
├── warehouse/               # Aplicación para la lógica del almacén
│   ├── models.py            # Modelos de datos (inventario, procedimientos)
│   ├── logic.py             # Lógica de simulación del almacén
│   └── utils.py             # Utilidades
├── sessions/                # Gestión de sesiones de juego
│   ├── models.py            # Modelos para sesiones
│   └── middleware.py        # Middleware personalizado de sesiones
├── templates/               # Plantillas HTML (para panel admin)
├── static/                  # Archivos estáticos (CSS, JS)
├── tests/                   # Tests unitarios e integración
├── manage.py                # Script de gestión de Django
└── requirements.txt         # Dependencias del proyecto
```

## Integración con el frontend
Este repositorio contiene únicamente el backend del juego. Para la experiencia completa, necesitarás integrar este backend con el cliente frontend correspondiente. El frontend debe comunicarse con los endpoints de la API descritos anteriormente.

## Comandos útiles
```bash
# Ejecutar tests
python manage.py test

# Crear datos de demostración
python manage.py seed_demo_data

# Reiniciar las estadísticas
python manage.py reset_stats
```

## Contribuir
1. Haz un fork del repositorio
2. Crea una rama para tu funcionalidad (`git checkout -b feature/amazing-feature`)
3. Haz commit de tus cambios (`git commit -m 'Añadir nueva funcionalidad'`)
4. Haz push a la rama (`git push origin feature/amazing-feature`)
5. Abre un Pull Request
