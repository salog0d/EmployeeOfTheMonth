from django.db import models
from apps.custom_auth.models import CustomUser


class Minigame(models.Model):
    username = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    tries = models.IntegerField(default=0)

    def __str__(self):
        return self.name