from django.db import models
from .models import User


# Create your models here.
class Item(models.Model):
    name = models.CharField(max_length=100)
    type = models.CharField(max_length=50)
    description = models.TextField()
    best_practice = models.TextField()

    def __str__(self):
        return self.name
    
class Level(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    status = models.CharField(max_length=50)

    def __str__(self):
        return self.name

class Inventory(models.Model):
    item = models.ForeignKey(Item, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    effects = models.TextField()
    description = models.TextField()
    location = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Mission(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    instructions = models.TextField()
    description = models.TextField()
    status = models.CharField(max_length=50)
    inventory = models.ForeignKey(Inventory, on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.name

class MissionLevel(models.Model):
    mission = models.ForeignKey(Mission, on_delete=models.CASCADE)
    level = models.ForeignKey(Level, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.mission.name} - {self.level.name}"

class Reward(models.Model):
    name = models.CharField(max_length=100)
    type = models.CharField(max_length=50)
    description = models.TextField()
    status = models.CharField(max_length=50)

    def __str__(self):
        return self.name

class LevelReward(models.Model):
    level = models.ForeignKey(Level, on_delete=models.CASCADE)
    reward = models.ForeignKey(Reward, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.level.name} - {self.reward.name}"

class RewardUser(models.Model):
    reward = models.ForeignKey(Reward, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.user.name} - {self.reward.name}"

class Lobby(models.Model):
    description = models.TextField()

    def __str__(self):
        return f"Lobby {self.id}"

class LobbyLevel(models.Model):
    lobby = models.ForeignKey(Lobby, on_delete=models.CASCADE)
    level = models.ForeignKey(Level, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.lobby} - {self.level}"
