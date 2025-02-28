import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import './login.css'; // Importa el archivo CSS personalizado

const Login = ({ setIsAuthenticated }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errorMessage, setErrorMessage] = useState('');
  const [successMessage, setSuccessMessage] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    // Limpiar mensajes previos
    setErrorMessage('');
    setSuccessMessage('');
    setIsLoading(true);

    try {
      const response = await axios.post('http://localhost:3000/users/sign_in', {
        user: {
          email,
          password,
        },
      }, { withCredentials: true });

      console.log('API is working correctly:', response.data);
      
      // Mostrar mensaje de éxito
      setSuccessMessage('¡Inicio de sesión exitoso! Redirigiendo...');
      
      // Guardar token
      localStorage.setItem('auth_token', response.data.token);
      
      if (setIsAuthenticated) {
        setIsAuthenticated(true);
      }
      
      // Esperar un momento para que el usuario vea el mensaje de éxito
      setTimeout(() => {
        navigate('/dashboard');
      }, 1500); // Redirigir después de 1.5 segundos
      
    } catch (error) {
      console.error('Login failed:', error.response ? error.response.data : error.message);
      setErrorMessage('Usuario o contraseña incorrectos');
      setIsLoading(false);
    }
  };

  return (
    <div className="full-screen-bg">
      <div className="container d-flex justify-content-center align-items-center min-vh-100">
        <div className="card custom-card p-4 shadow-lg">
          <h1 className="text-center mb-4 custom-title">Employee of the Month</h1>
          
          {errorMessage && (
            <div className="alert alert-danger" role="alert">
              {errorMessage}
            </div>
          )}
          
          {successMessage && (
            <div className="alert alert-success" role="alert">
              {successMessage}
            </div>
          )}
          
          <form onSubmit={handleSubmit}>
            <div className="form-group">
              <input
                type="email"
                className="form-control"
                placeholder="Email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
                disabled={isLoading}
              />
            </div>
            <div className="form-group">
              <input
                type="password"
                className="form-control"
                placeholder="Password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
                disabled={isLoading}
              />
            </div>
            <button 
              type="submit" 
              className="btn btn-primary btn-block"
              disabled={isLoading}
            >
              {isLoading ? 'Iniciando sesión...' : 'Login'}
            </button>
          </form>
        </div>
      </div>
    </div>
  );
};

export default Login;