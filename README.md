# TypeScript Container Demo

A simple TypeScript web application containerized with Docker and deployed to Azure Container Apps.

## Table of Contents

- [Project Overview](#project-overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Local Development](#local-development)
- [Docker Container](#docker-container)
- [Deployment to Azure](#deployment-to-azure)
- [CI/CD Pipeline](#cicd-pipeline)
- [Monitoring and Management](#monitoring-and-management)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## Project Overview

This project demonstrates how to create a simple web application using TypeScript and Express, containerize it with Docker, and deploy it to Azure Container Apps. The application includes a basic frontend with HTML, CSS, and JavaScript, and a backend API endpoint for health checks.

## Architecture

The application follows a modern cloud-native architecture with containerization for portability and scalability.

![Container_Test](https://github.com/user-attachments/assets/91d37998-d370-4ca9-a7df-8fba79b27015)


### Components:

1. **Frontend**: Simple HTML/CSS/JS interface
2. **Backend**: Express.js server written in TypeScript
3. **Container**: Docker container packaging the application
4. **Registry**: Azure Container Registry (ACR) for storing container images
5. **Hosting**: Azure Container Apps for running the containerized application
6. **CI/CD**: GitHub Actions or Azure DevOps for continuous integration and deployment

## Prerequisites

- [Node.js](https://nodejs.org/) (v18 or later)
- [npm](https://www.npmjs.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Azure Account](https://azure.microsoft.com/free/)
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) (optional for deployment)
- [Git](https://git-scm.com/)

## Project Structure

```
typescript-container-demo/
├── dist/                      # Compiled JavaScript files (created after build)
├── node_modules/              # Node.js dependencies
├── src/
│   ├── app.ts                 # Main application file
│   └── public/
│       ├── app.js             # Frontend JavaScript
│       ├── index.html         # HTML template
│       └── styles.css         # CSS styles
├── .dockerignore              # Files to exclude from Docker
├── .github/
│   └── workflows/
│       └── deploy.yml         # GitHub Actions workflow for CI/CD
├── Dockerfile                 # Docker configuration
├── package.json               # Project metadata and scripts
├── package-lock.json          # Dependency lock file
├── README.md                  # Project documentation
└── tsconfig.json              # TypeScript configuration
```

## Local Development

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/sahilcmd3/typescript-container-demo.git
   cd typescript-container-demo
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Run in development mode:
   ```bash
   npm run dev
   ```

4. Access the application at http://localhost:3000

### Building the Application

Build the TypeScript code:
```bash
npm run build
```

This compiles TypeScript files to JavaScript in the `dist` directory.

## Docker Container

### Building the Container

1. Build the Docker image:
   ```bash
   docker build -t typescript-container-demo .
   ```

2. Run the container locally:
   ```bash
   docker run -p 8080:80 typescript-container-demo
   ```

3. Access the containerized application at http://localhost:8080

### Docker Commands

- View all images: `docker images`
- List running containers: `docker ps`
- Stop a container: `docker stop <container_id>`
- Remove a container: `docker rm <container_id>`
- Remove an image: `docker rmi <image_id>`

## Deployment to Azure

### Azure Container Registry (ACR)

1. Create an Azure Container Registry:
   - Go to [Azure Portal](https://portal.azure.com)
   - Create a new Container Registry resource
   - Enable Admin user

2. Log in to ACR:
   ```bash
   docker login <your-acr-name>.azurecr.io -u <username> -p <password>
   ```

3. Tag and push your image:
   ```bash
   docker tag typescript-container-demo <your-acr-name>.azurecr.io/typescript-container-demo:latest
   docker push <your-acr-name>.azurecr.io/typescript-container-demo:latest
   ```

### Azure Container Apps

1. Create a Container App in Azure Portal:
   - Go to "Create a resource" > "Container Apps"
   - Create a new Container Apps environment
   - Link to your ACR image
   - Enable external ingress on port 80

2. Access your application:
   - Use the provided application URL from the Overview page

## CI/CD Pipeline

### GitHub Actions Setup

1. Create the `.github/workflows/deploy.yml` file with the workflow configuration
2. Set up repository secrets:
   - `AZURE_CREDENTIALS`: Azure service principal credentials
   - `REGISTRY_LOGIN_SERVER`: ACR login server
   - `REGISTRY_USERNAME`: ACR username
   - `REGISTRY_PASSWORD`: ACR password
   - `CONTAINER_APP_NAME`: Container App name
   - `RESOURCE_GROUP`: Resource group name

3. Push changes to trigger the pipeline:
   ```bash
   git add .
   git commit -m "Update application code"
   git push
   ```

The CI/CD pipeline will automatically:
- Build a new Docker image
- Push it to Azure Container Registry
- Deploy to Azure Container Apps

## Monitoring and Management

### Monitoring in Azure

1. View application logs:
   - Go to your Container App in Azure Portal
   - Select "Logs" from the monitoring section

2. Set up alerts:
   - Go to "Alerts" in your Container App
   - Configure alert rules based on metrics or log queries

### Managing Revisions

1. View revisions:
   - Go to "Revisions" in your Container App
   - See all deployed versions of your application

2. Create a new revision:
   - Click "Create revision"
   - Update configuration as needed

3. Manage traffic:
   - Split traffic between revisions for A/B testing or blue/green deployments

## Troubleshooting

### Common Issues

1. **Docker login failure**:
   - Verify ACR credentials are correct
   - Ensure ACR admin user is enabled

2. **Container fails to start**:
   - Check container logs with `docker logs <container_id>`
   - Verify environment variables are set correctly

3. **Application not accessible**:
   - Confirm container port mapping is correct
   - Check Azure Container App ingress configuration

4. **CI/CD pipeline failure**:
   - Verify GitHub secrets are set correctly
   - Check workflow logs in GitHub Actions tab

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---
*Last updated by sahilcmd3 on 2025-05-17*
