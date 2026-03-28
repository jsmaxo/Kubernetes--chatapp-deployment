# 💬 Chat App Deployment on Kubernetes

## 📝 Introduction

This project delivers a real-time chat application designed to be scalable, secure, and modern. It uses modern technologies to provide a smooth user experience and easy maintenance.

---

## 🏗️ Architecture Overview

### 🔹 User Interaction
Users interact with the frontend through a web browser. They can:
- Log in
- Send messages
- Navigate the chat interface

---

### 🔹 Frontend (React + TailwindCSS)
- Handles UI rendering and user inputs
- Communicates with backend using:
  - HTTP (REST APIs)
  - WebSockets (Socket.io) for real-time updates

---

### 🔹 Backend (Node.js + Express + Socket.io)
- Handles server-side logic
- Processes API requests:
  - Authentication (JWT)
  - Message handling
- Enables real-time communication:
  - Typing indicators
  - Instant messaging

---

### 🔹 Database (MongoDB)
- Stores:
  - User data
  - Messages
  - Application data
- Backend performs CRUD operations

---

## ✨ Features

- ⚡ Real-time Messaging (Socket.io)
- 🔐 User Authentication & Authorization (JWT)
- 📈 Scalable Architecture
- 🎨 Modern UI (React + TailwindCSS + DaisyUI)
- 👤 Profile Management
- 🟢 Online/Offline Status

---

## 🛠️ Tech Stack

- **Frontend:** React, TailwindCSS, DaisyUI
- **Backend:** Node.js, Express, Socket.io
- **Database:** MongoDB
- **State Management:** Zustand
- **Authentication:** JWT
- **Containerization:** Docker
- **Orchestration:** Kubernetes
- **Web Server:** Nginx

---

## 🔧 Prerequisites

Make sure you have installed:

- Docker → https://www.docker.com/get-started  
- Git → https://git-scm.com/downloads  
- kubectl → https://kubernetes.io/docs/tasks/tools/  
- Minikube → https://minikube.sigs.k8s.io/docs/start/

---

## 🚀 Setup & Deployment

### 1. Start Minikube

```bash
minikube start --driver=docker
```

### 2. Deploy the Application

```bash
cd k8s
chmod +x deploy.sh
./deploy.sh
```

### 3. Verify Deployment

```bash
kubectl get pods -n chat-app
kubectl get svc -n chat-app
```

---

## 🌐 Access the Application

### Port Forwarding

#### Frontend

```bash
kubectl port-forward svc/frontend 80:80 -n chat-app &
```

#### Backend

```bash
kubectl port-forward svc/backend 5001:5001 -n chat-app &
```

### 🌍 Open in Browser

```
http://localhost:80
```

---
