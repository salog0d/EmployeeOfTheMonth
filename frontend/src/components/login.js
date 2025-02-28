import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import './login.css'; // Importa el archivo CSS personalizado

const Login = ({ setIsAuthenticated }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await axios.post('http://localhost:3000/users/sign_in', {
        user: {
          email,
          password,
        },
      }, { withCredentials: true });

      console.log('API is working correctly:', response.data);

      localStorage.setItem('auth_token', response.data.token);

      navigate('/dashboard');
    } catch (error) {
      console.error('Login failed:', error.response ? error.response.data : error.message);
    }
  };

  return (
    <div className="full-screen-bg">
      <div className="container d-flex justify-content-center align-items-center min-vh-100">
        <div className="card custom-card p-4 shadow-lg">
          <h1 className="text-center mb-4 custom-title">Employee of the Month</h1>
          <form onSubmit={handleSubmit}>
            <div className="form-group">
              <input
                type="email"
                className="form-control"
                placeholder="Email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
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
              />
            </div>
            <button type="submit" className="btn btn-primary btn-block">Login</button>
          </form>
        </div>
      </div>
    </div>
  );
};

export default Login;
