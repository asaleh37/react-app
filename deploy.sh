#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
NAMESPACE="default" # Change to your desired namespace
DEPLOYMENT_FILE="deployment.yaml"
SERVICE_FILE="service.yaml"
APP_NAME="react-app" # Replace with your app name

echo "Starting deployment process for $APP_NAME..."

# Ensure the namespace exists (optional)
if ! kubectl get namespace "$NAMESPACE" &>/dev/null; then
    echo "Namespace $NAMESPACE does not exist. Creating it..."
    kubectl create namespace "$NAMESPACE"
fi

# Apply deployment and service configurations
echo "Applying deployment manifest..."
kubectl apply -f "$DEPLOYMENT_FILE" -n "$NAMESPACE"

echo "Applying service manifest..."
kubectl apply -f "$SERVICE_FILE" -n "$NAMESPACE"

# Wait for deployment to be ready
echo "Waiting for deployment to be ready..."
kubectl rollout status deployment/"$APP_NAME" -n "$NAMESPACE"

# Verify the status of pods
echo "Deployment completed. Checking pod status..."
kubectl get pods -n "$NAMESPACE" -l app="$APP_NAME"

# Optionally describe service to display its configuration
echo "Describing service $APP_NAME..."
kubectl describe service "$APP_NAME" -n "$NAMESPACE"

echo "Deployment to Kubernetes cluster completed successfully!"
