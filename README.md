# Employee of the Month - Game in Unity with React Web App and Rails API

## Overview

**Employee of the Month** is an engaging game developed in Unity, designed to provide a fun and interactive experience for users. The game is presented through a web application built using React, which communicates with a backend API developed in Ruby on Rails. This setup allows for a seamless integration of gameplay mechanics with web-based features, providing users with a comprehensive and enjoyable gaming experience.

## Features

- **Interactive Gameplay**: Engage in a dynamic game environment built with Unity.
- **Web Integration**: Access the game through a user-friendly web interface developed in React.
- **Robust Backend**: Powered by a Rails API to handle game data and user interactions.
- **Cross-Platform Compatibility**: Play the game on various devices and browsers.

## Setup Instructions

### Prerequisites

Before setting up the environment, ensure you have the following installed:

- [Unity Hub](https://unity.com/download)
- [Node.js](https://nodejs.org/) (with npm)
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Rails](https://guides.rubyonrails.org/getting_started.html)
- A code editor (e.g., Visual Studio Code)

### Setting Up the Unity Game

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd employee-of-the-month
   ```

2. **Open the Project in Unity**:
   - Open Unity Hub and select "Open."
   - Navigate to the cloned repository and open the Unity project.

3. **Build the Game**:
   - In Unity, go to `File > Build Settings`.
   - Select the desired platform (e.g., WebGL for web integration).
   - Click "Build" and choose a destination folder for the build.

### Setting Up the React Web App

1. **Navigate to the React App Directory**:
   ```bash
   cd frontend
   ```

2. **Install Dependencies**:
   ```bash
   npm install
   ```

3. **Start the Development Server**:
   ```bash
   npm start
   ```

4. **Integrate the Unity Build**:
   - Copy the built Unity game files into the `public` directory of the React app.
   - Ensure the Unity build files are correctly referenced in the React components.

### Setting Up the Rails API

1. **Navigate to the Rails API Directory**:
   ```bash
   cd backend
   ```

2. **Install Dependencies**:
   ```bash
   bundle install
   ```

3. **Set Up the Database**:
   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Start the Rails Server**:
   ```bash
   rails server
   ```

### Environment Configuration

- **Unity**: Ensure the game is configured to communicate with the Rails API. Update any necessary API endpoints in the Unity scripts.
- **React**: Configure the API base URL in the React app to point to the Rails server.
- **Rails**: Set up environment variables for database configuration and any other required settings.

## Running the Application

1. **Start the Rails API**:
   ```bash
   rails server
   ```

2. **Start the React Development Server**:
   ```bash
   npm start
   ```

3. **Access the Game**:
   - Open your web browser and navigate to `http://localhost:3000` to play the game.
  
## Database Architecture

![Database Schema](https://github.com/user-attachments/assets/3ebe0536-2d6a-454a-b02f-3a804e81ab3b)

### Relational Model Explained

The relational model is designed to manage a system of users, missions, levels, and rewards within a gamified platform. Below is an explanation of the key entities and their relationships:

- **User**: Represents the system's users. They can participate in missions and earn rewards.
- **Leaderboard**: Stores user scores.
- **UserLeaderboard**: Intermediate relationship between `User` and `Leaderboard`, allowing multiple records per user.
- **Lobby**: Represents a space where players can interact.
- **LobbyLevel**: Intermediate relationship between `Lobby` and `Level`, allowing a lobby to have multiple levels.
- **Mission**: Defines missions with instructions and objectives assigned to users.
- **Level**: Represents the different levels in the system.
- **MissionLevel**: Relationship between missions and levels, allowing a mission to have multiple associated levels.
- **Reward**: Represents the rewards users can earn.
- **LevelReward**: Relationship between levels and rewards.
- **Item**: Represents objects within the system that can be used in missions.
- **Inventory**: Stores items acquired by users.
- **RewardUser**: Relationship between `Reward` and `User`, allowing a user to receive multiple rewards.

This relational model enables a scalable and efficient structure, ensuring data integrity and the potential for future growth.


## Contributing

We welcome contributions from the community! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with descriptive messages.
4. Push your branch to your fork.
5. Submit a pull request to the main repository.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Thank you for your interest in **Employee of the Month**! We hope you enjoy the game and find the setup process straightforward. If you encounter any issues or have questions, please don't hesitate to reach out. Happy gaming!
