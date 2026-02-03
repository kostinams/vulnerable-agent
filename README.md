# 🧭 AI Travel Planner - Web Application

An intelligent travel planning web application powered by multiple AI agents working together to create personalized travel itineraries.

## Features

- **Multi-Agent System**: Specialized agents for flights, hotels, activities, and itinerary synthesis
- **Web Interface**: User-friendly form to submit travel requests
- **Real-time Processing**: Watch as different agents work on your travel plan
- **Flexible Inputs**: Specify origin, destination, dates, or let the AI infer from your description
- **REST API**: JSON API endpoints for integration

## Setup

1. **Install Dependencies**
```bash
pip install -r requirements.txt
```

2. **Configure Environment**
Create a `.env` file with your Azure credentials:
```
AZURE_INFERENCE_ENDPOINT=your_endpoint_here
AZURE_INFERENCE_MODEL=gpt-4o
```

3. **Run the Web Server**
```bash
python travel_agent.py
```

The server will start on `http://localhost:5000`

4. **CLI Mode** (optional)
To run the original CLI version:
```bash
python travel_agent.py --cli
```

## Usage

### Web Interface

1. Open your browser to `http://localhost:5000`
2. Fill in the travel request form:
   - Describe your trip in natural language
   - Optionally specify origin, destination, dates, and number of travelers
3. Click "Plan My Trip"
4. Wait for the AI agents to generate your itinerary

### API Endpoints

**POST /api/plan**
```json
{
  "request": "We're planning a trip to Tokyo from Seattle",
  "origin": "Seattle",
  "destination": "Tokyo",
  "departure": "2026-03-15",
  "return_date": "2026-03-22",
  "travellers": 2
}
```

Response:
```json
{
  "success": true,
  "session_id": "uuid",
  "itinerary": "Full itinerary text...",
  "flight_summary": "...",
  "hotel_summary": "...",
  "activities_summary": "...",
  "steps": [...],
  "details": {
    "origin": "Seattle",
    "destination": "Tokyo",
    "departure": "2026-03-15",
    "return_date": "2026-03-22",
    "travellers": 2
  }
}
```

**GET /api/destinations**

Returns available destinations with their details.

## Architecture

The application uses a LangGraph workflow with specialized agents:

1. **Coordinator**: Extracts key details from user requests
2. **Flight Specialist**: Searches and recommends flights
3. **Hotel Specialist**: Finds suitable accommodations
4. **Activity Specialist**: Curates memorable experiences
5. **Plan Synthesizer**: Combines all recommendations into a polished itinerary
6. **Itinerary Editor** (nested): Refines the final output

## Docker Support

Build and run with Docker:
```bash
docker build -t travel-agent .
docker run -p 5000:5000 --env-file .env travel-agent
```

## Available Destinations

- **Paris, France** (CDG)
- **Tokyo, Japan** (HND)
- **Rome, Italy** (FCO)

## Technologies

- **Flask**: Web framework
- **LangChain**: AI agent orchestration
- **LangGraph**: Agent workflow management
- **Azure AI**: Language model integration
