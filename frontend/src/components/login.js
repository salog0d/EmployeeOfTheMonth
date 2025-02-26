import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';  // Import useNavigate

const Login = ({ setIsAuthenticated }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const navigate = useNavigate();  // Initialize the useNavigate hook

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
      
      
      // Use navigate to redirect to the dashboard
      navigate('/dashboard');
    } catch (error) {
      console.error('Login failed:', error.response ? error.response.data : error.message);
    }
  };

  return (
    <div>
      <h1>Login</h1>
      <form onSubmit={handleSubmit}>
        <input
          type="email"
          placeholder="Email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
        <input
          type="password"
          placeholder="Password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
        <button type="submit">Login</button>
      </form>
    </div>
  );
};

export default Login;

