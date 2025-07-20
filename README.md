# Calorie Estimator App

A simple full-stack web app built with **Phoenix (Elixir)** and **React (Vite)** that estimates meal calories using the OpenAI API.

## Features

- Enter a list of ingredients seperated by commas
- Get an AI-powered calorie estimation
- Responsive and clean UI
- Handles OpenAI errors gracefully

## Tech Stack

- **Backend**: Phoenix (Elixir), OpenAI API
- **Frontend**: React (Vite)
- **HTTP**: Axios

### Backend Setup
cd backend
mix deps.get
Create a .env file or export your OpenAI API key (required for backend to function):
export OPENAI_API_KEY=your-openai-api-key

Start the Phoenix server:
mix phx.server

### Frontend Setup
cd frontend
npm install
npm run dev

### Running Tests (Backend)
cd backend
mix test
API Endpoint
POST /api/estimate
Body Example:
{
  "ingredients": "beef, rice"
}
Response Example:
{
  "calories": "A meal with chicken, rice, and olive oil has around 370 calories..."
}
