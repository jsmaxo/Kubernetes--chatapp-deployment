#!/bin/bash

set -e  # stop script on error

echo "🚀 Applying Kubernetes resources in order..."

# 1. Namespace
kubectl apply -f namespace.yml

# 2. Secrets
kubectl apply -f secrets.yml

# 3. Storage (MongoDB)
kubectl apply -f mongodb-pv.yml
kubectl apply -f mongodb-pvc.yml

# 4. MongoDB Deployment & Service
kubectl apply -f mongodb-deployment.yml
kubectl apply -f mongodb-service.yml

# Wait for MongoDB pod to be ready
echo "⏳ Waiting for MongoDB to be ready..."
kubectl wait --for=condition=available --timeout=120s deployment/mongodb-deployment -n chat-app || true

# 5. Backend
kubectl apply -f backend-deployment.yml
kubectl apply -f backend-service.yml

# Wait for backend
echo "⏳ Waiting for Backend to be ready..."
kubectl wait --for=condition=available --timeout=120s deployment/backend-deployment -n chat-app || true

# 6. Frontend
kubectl apply -f frontend-deployment.yml
kubectl apply -f frontend-service.yml

# Wait for frontend
echo "⏳ Waiting for Frontend to be ready..."
kubectl wait --for=condition=available --timeout=120s deployment/frontend-deployment -n chat-app || true

echo "✅ Deployment completed!"