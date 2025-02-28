import React from 'react';
import './dashboard.css'; // Importa el archivo CSS personalizado

const Dashboard = () => {
  // Datos de ejemplo para la tabla de jugadores
  const players = [
    { id: 1, name: 'Player 1', score: 1500 },
    { id: 2, name: 'Player 2', score: 1200 },
    { id: 3, name: 'Player 3', score: 900 },
    { id: 4, name: 'Player 4', score: 750 },
    { id: 5, name: 'Player 5', score: 500 },
  ];

  return (
    <div className="full-screen-bg">
      <div className="container mt-5">
        <h1 className="text-center mb-4 text-white">Welcome to the Employee of the Month</h1>

        {/* Reglas del Juego */}
        <div className="card mb-4 bg-dark text-white">
          <div className="card-body">
            <h2 className="card-title">Game Rules</h2>
            <p className="card-text">
              1. Complete daily tasks to earn points.<br />
              2. Compete with other players to top the leaderboard.<br />
              3. Special rewards are given to the top players each week.<br />
              4. Have fun and enjoy the game!
            </p>
          </div>
        </div>

        {/* Tabla de Jugadores */}
        <div className="card bg-dark text-white">
          <div className="card-body">
            <h2 className="card-title">Player Rankings</h2>
            <table className="table table-striped">
              <thead>
                <tr>
                  <th>Rank</th>
                  <th>Player Name</th>
                  <th>Score</th>
                </tr>
              </thead>
              <tbody>
                {players.map((player, index) => (
                  <tr key={player.id}>
                    <td>{index + 1}</td>
                    <td>{player.name}</td>
                    <td>{player.score}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
