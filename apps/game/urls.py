# apps/game/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('play/', views.game_view, name='play_game'),
    # Enpoints API existentes
    path("api/add_experience/", views.add_experience, name="add_experience"),
    path("api/get_user/", views.get_user, name="get_user"),
]