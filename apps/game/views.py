from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth.decorators import login_required


@login_required
def game_view(request):
    user = request.user
    context = {
        'user_id': user.id,
        'username': user.username,
    }
    return render(request, 'game.html', context)

@api_view(['POST'])
def add_experience(request):
    try:
        user = request.user
        amount = int(request.data.get('amount', 0))
        
        if amount <= 0:
            return Response({'error': 'Amount must be positive.'}, status=status.HTTP_400_BAD_REQUEST)

        if amount >= user.score:
            user.score = amount
            user.save()
            return Response({'message': 'Experience updated.', 'new_experience': user.score})
        else:  
            return Response({'message': 'Experience maintained.', 'new_experience': user.score})
    
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    
@api_view(['GET'])
def get_user(request):
    try:
        user = request.user
        return Response({
            'email': user.email,
            'username': user.username,
            'experience': user.score,
            
        }, status=status.HTTP_200_OK)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
