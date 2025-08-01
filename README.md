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
- cd backend
- mix deps.get
- Create a .env file or export your OpenAI API key (required for backend to function):
- export OPENAI_API_KEY=your-openai-api-key

- Start the Phoenix server:
mix phx.server

### Frontend Setup
- cd frontend
- npm install
- npm run dev

### Running Tests (Backend)
- cd backend
- mix test
# API Endpoint
POST /api/estimate
Body Example:
{
  "ingredients": "beef, rice"
}
Response Example:
{
  Estimated Calories
The calorie content of beef and rice can vary depending on the type and preparation method. However, as a general estimate:

- 3 ounces of cooked beef (such as sirloin or ground beef) contains around 200-250 calories.
- 1 cup of cooked white rice contains around 200 calories.

So, a meal consisting of 3 ounces of beef and 1 cup of rice would likely contain around 400-450 calories.
}
