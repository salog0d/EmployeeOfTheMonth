from django.db import models
from .models import User

# Create your models here.
class Leaderboard(models.Model):
    players = models.IntegerField()
    name = models.CharField(max_length=100)
    score = models.IntegerField()

    def __str__(self):
        return self.name

class UserLeaderboard(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    leaderboard = models.ForeignKey(Leaderboard, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.user.name} - {self.leaderboard.name}"

