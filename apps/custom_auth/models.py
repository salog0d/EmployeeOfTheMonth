# models.py (añadir a tus modelos existentes)

from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils.translation import gettext_lazy as _
import uuid

class CustomUser(AbstractUser):
    email = models.EmailField(_('email address'), unique=True)
    is_email_verified = models.BooleanField(default=False)
    verification_token = models.UUIDField(default=uuid.uuid4, editable=False)
    score = models.IntegerField(default=0)
    game_tag= models.CharField(max_length=100, blank=True, null=True)
    
    # Campos adicionales que podrías querer

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']
    
    def __str__(self):
        return self.email