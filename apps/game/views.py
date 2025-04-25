from django.shortcuts import render
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from .models import CustomUser

@api_view(['POST'])
@permission_classes([IsAuthenticated])
def add_experience(request):
    try:
        user = request.user
        amount = int(request.data.get('amount', 0))
        
        if amount <= 0:
            return Response({'error': 'Amount must be positive.'}, status=status.HTTP_400_BAD_REQUEST)

        if amount >= user.experience:
            user.experience = amount
            user.save()
            return Response({'message': 'Experience updated.', 'new_experience': user.experience})
        else:  
            return Response({'message': 'Experience maintained.', 'new_experience': user.experience})
    
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_user(request):
    try:
        user = request.user
        return Response({
            'email': user.email,
            'username': user.username,
            'experience': user.experience,
            'time_played': user.time_played,
        }, status=status.HTTP_200_OK)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
