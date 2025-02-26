import axios from 'axios';

const API_URL = 'http://localhost:3000';

// Register user
export const registerUser = (userData) => {
  return axios.post(`${API_URL}/users`, userData, { withCredentials: true });
};

// Log in user
export const loginUser = (credentials) => {
  return axios.post(`${API_URL}/users/sign_in`, credentials, { withCredentials: true });
};

// Get current user (authenticated)
export const getCurrentUser = () => {
  return axios.get(`${API_URL}/users/current_user`, { withCredentials: true });
};

// Log out user
export const logoutUser = () => {
  return axios.delete(`${API_URL}/users/sign_out`, { withCredentials: true });
};

