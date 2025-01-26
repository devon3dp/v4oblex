#!/bin/bash

echo "Setting up Oblexv4 environment..."

# Step 1: Update and install system dependencies
sudo apt-get update
sudo apt-get install -y python3.11 python3.11-venv python3.11-dev redis npm

# Step 2: Remove existing virtual environment if present
if [ -d "venv" ]; then
    echo "Removing existing virtual environment..."
    rm -rf venv
fi

# Step 3: Create and activate a new virtual environment
echo "Creating new Python virtual environment..."
python3.11 -m venv venv
source venv/bin/activate

# Step 4: Upgrade pip and install Python dependencies
echo "Installing Python dependencies..."
pip install --upgrade pip
pip install -r backend/requirements.txt

# Step 5: Set up the frontend
if [ -d "frontend" ]; then
    echo "Installing frontend dependencies..."
    cd frontend
    npm install
    cd ..
else
    echo "Frontend directory not found. Skipping frontend setup."
fi

# Step 6: Start backend
echo "Starting backend server..."
nohup uvicorn main:app --reload > backend.log 2>&1 &

# Step 7: Start frontend
if [ -d "frontend" ]; then
    echo "Starting frontend server..."
    cd frontend
    nohup npm start > frontend.log 2>&1 &
    cd ..
else
    echo "Frontend directory not found. Skipping frontend server startup."
fi

echo "Oblexv4 setup and servers are running!"
echo "Backend logs: backend.log"
echo "Frontend logs: frontend.log"
