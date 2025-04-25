# forms.py
from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from .models import CustomUser

class CustomUserCreationForm(UserCreationForm):
    email = forms.EmailField(
        required=True, 
        help_text='Requerido. Ingresa una dirección de correo válida.',
        widget=forms.EmailInput(attrs={
            'class': 'w-full rounded-lg border border-red-500 bg-black/50 p-3 text-white focus:border-white focus:outline-none focus:ring-2 focus:ring-red-500/50',
            'placeholder': 'tu@email.com'
        })
    )
    
    class Meta:
        model = CustomUser
        fields = ('username', 'email', 'password1', 'password2')
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
        # Personalizar textos de ayuda
        self.fields['username'].help_text = 'Opcional. 150 caracteres o menos. Letras, dígitos y @/./+/-/_.'
        self.fields['password1'].help_text = 'La contraseña debe tener al menos 8 caracteres.'
        self.fields['password2'].help_text = 'Ingresa la misma contraseña para verificación.'
        
        # Personalizar placeholders
        self.fields['username'].widget.attrs['placeholder'] = 'Elige un nombre de usuario'
        self.fields['password1'].widget.attrs['placeholder'] = 'Crea una contraseña segura'
        self.fields['password2'].widget.attrs['placeholder'] = 'Repite tu contraseña'
        
        # Añadir clases para estilos CSS de Tailwind
        for field in self.fields:
            self.fields[field].widget.attrs.update({
                'class': 'w-full rounded-lg border border-red-500 bg-black/50 p-3 text-white focus:border-white focus:outline-none focus:ring-2 focus:ring-red-500/50'
            })
            
            # Agregar iconos y otras clases específicas según sea necesario
            if field == 'username':
                self.fields[field].widget.attrs['class'] += ' pl-10'  # Padding left para el icono
            elif field == 'password1' or field == 'password2':
                self.fields[field].widget.attrs['class'] += ' pl-10'  # Padding left para el icono

class CustomAuthenticationForm(AuthenticationForm):
    username = forms.CharField(
        label='Usuario o Correo',
        widget=forms.TextInput(attrs={
            'class': 'w-full rounded-lg border border-red-500 bg-black/50 p-3 text-white focus:border-white focus:outline-none focus:ring-2 focus:ring-red-500/50',
            'placeholder': 'Ingresa tu nombre de usuario o email'
        })
    )
    
    password = forms.CharField(
        label='Contraseña',
        widget=forms.PasswordInput(attrs={
            'class': 'w-full rounded-lg border border-red-500 bg-black/50 p-3 text-white focus:border-white focus:outline-none focus:ring-2 focus:ring-red-500/50',
            'placeholder': 'Ingresa tu contraseña',
            'id': 'password'
        })
    )
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
        # Personalización adicional si es necesaria
        self.fields['username'].widget.attrs.update({
            'autofocus': True,
            'id': 'username'
        })