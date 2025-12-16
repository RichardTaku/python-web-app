### Building and running your application

##Containerization with Docker

This application is containerized using a production-ready Dockerfile, following security and performance best practices.

🔑 Key Highlights

Uses Python 3.10 slim image for a smaller attack surface

Runs as a non-root user for improved container security

Installs dependencies efficiently using pip cache

Exposes the application on port 5000

Fully compatible with Kubernetes Deployment and Ingress
*Full Dockerfile: Dockerfile

#Build & Run Locally
docker build -t my-python-app .
docker run -p 5000:5000 my-python-app

#Access the app in your browser:
http://localhost:5000


