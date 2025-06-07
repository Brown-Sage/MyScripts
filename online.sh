#!/bin/bash

echo "Setting up development environment..."
echo '{
  "name": "movie-app",
  "version": "1.0.0",
  "scripts": {
    "dev": "concurrently \"npm run server\" \"npm run client\"",
    "server": "cd Server && npm run dev",
    "client": "cd Client && npm run dev"
  },
  "devDependencies": {
    "concurrently": "^8.2.2"
  }
}' > package.json
echo "✅ package.json created"
echo "Installing dependencies..."
npm install

echo "✅ Dependencies installed"
echo ""
echo "🚀 Setup complete! Run 'npm run dev' to start both server and client"