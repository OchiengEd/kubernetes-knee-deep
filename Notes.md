What should you consider prior to deploying Kubernetes? Join Edmund Ochieng as he explores 
potential issues and best practices when deploying Kubernetes. He will draw comparisons 
between GKE and self-hosted environments during the talk.


# Topics
- Ingress Controllers
- MetalLB (Self-hosted k8s)
- Dependency of the microservices
- Microservices Considerations
- Liveness and Readiness probes
- Continuous Integration/Continuous Deployment (Consistency and testing)
- Security(Pod Security)

# Self-Hosted vs GKE
- Seamless upgrade
- Security due to ability to run the most up to date cluster
- Load Balancers - Nginx, IPtables and MetalLB

# Microservices Considerations
- There should only be a one to one dependency
- Minimize the number of layers
- Structure of your code

# Microservices Dependencies
- What does the microservice depend on
- Deploy services, ConfigMaps and Volumes first
- Liveness Probes on a reverse proxy could be detrimental

# Pod Security
- Read-only filesystem
- Use Non-root user to run services
  * When using a non-root user, you have to use PID vs a username
- Disable privilege escalation

# Continous Integration/Continuous Development
- Build triggers
- Docker Hub vs GCR
- Blue/Green (also referred to as Red/Black) deployment strategies
- Spinnaker
