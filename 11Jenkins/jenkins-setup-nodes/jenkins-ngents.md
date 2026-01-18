## Jenkins Container - Setup 

### Step 1 ; Jenkins Controller
Jenkins follow master-salaves architecture. Jenkins runs as a controller (sometimes called master).

The controller provides:
	- The web UI (port 8080).
	- The job scheduling logic (decides what to run, when).
	- The plugin ecosystem (Git, Maven, Docker integrations, etc.).

```bash
docker run --name jenkins `
  --detach `
  --publish 8080:8080 `
  --publish 50000:50000 `
  --volume "D:\Expertise Repository\01 CloudAndDevOps\devops-track-on-the-run\11Jenkins\jenkins-docker\vol:/var/jenkins_home" `
  jenkins/jenkins:lts

```
Port 50000 is used by Jenkins for agent-to-controller communication over TCP. If you're only using Jenkins locally via the web UI on port 8080 and not connecting remote build agents, you don't need to expose port 50000.

| **Port** | **Purpose** | **Required When** |
|----------|-------------|-------------------|
| **8080** | Jenkins Web UI | Always — for accessing Jenkins dashboard |
| **50000** | TCP agent listener | Only when using *inbound agents* (e.g., remote build nodes) |

- **Port 8080**: This is the default HTTP port for Jenkins. You use it to access the Jenkins dashboard in your browser.
- **Port 50000**: This is used for **inbound agents** to connect back to the Jenkins controller. It’s part of Jenkins’ *JNLP (Java Network Launch Protocol)* communication.

So, If you only expose port 8080, you can log in, configure jobs, and run them on the controller itself.
# docker restart jenkins
# docker stop jenkins
# docker rm jenkins
# docker logs -f jenkins

### Step 2 : Why Agents Exists


**Agents (also called nodes or slaves)** are machines/container/server/pods that Jenkins uses to run jobs. The Jenkins controller (your main Jenkins instance) delegates tasks to these agents.

There are two types of agents:
- **Inbound agents**: Connect *to* the controller (need port 50000 open).
- **Outbound agents**: Are connected *by* the controller (don’t need port 50000).

Agents are useful when:
- You want to distribute builds across multiple machines.
- You need different environments (e.g., Linux, Windows, Docker).
- You want to isolate builds for performance or security.

Running everything on the controller is not scalable or safe. Agents (also called nodes/slaves) are extra machines/container/server/pods Jenkins can use to:
	- Distribute builds across multiple servers.
	- Run jobs in different environments (Linux, Windows, Docker).
	- Isolate workloads for performance and security.

👉 Agents = workers that execute jobs, while the controller = brain that coordinates.


### Step 3: Agent Communication 

If you only expose port 8080:
- Jenkins will work fine for **local jobs** and **web access**.
- You **won’t be able to connect inbound agents** (e.g., remote Docker containers, Kubernetes pods, or other VMs).
- You can still use **outbound agents** or **Docker-based builds** if configured properly.

There are two main ways agents connect:

- Inbound agents (JNLP)
	- Agent initiates connection to the controller.
	- Uses TCP port 50000.
	- Example: a remote VM running java -jar agent.jar connects back to Jenkins.

- Outbound agents (SSH/Docker/Kubernetes)
	- Controller initiates connection to the agent.
	- Doesn’t need port 50000 exposed.
	- Example: Jenkins connects via SSH to a Linux node.

👉 Port 50000 is only needed for inbound agents. Thats why we need to expose 50000

Again Use it if:
- You're setting up **remote build agents** (e.g., on another VM or cloud instance).
- You're using **Kubernetes or Docker Swarm** with Jenkins agents.
- You're configuring **JNLP-based agents** (common in Jenkins pipelines).


### Step 4: What Happens If You Skip Port 50000
	- Jenkins still works fine on 8080 for:
	- Web UI access.
	- Running jobs directly on the controller.
	- But you cannot use inbound agents (remote nodes connecting back).
	- You can still use outbound methods (SSH, Docker plugins, Kubernetes).

### Step 5: When to Use Port 50000
Enable it if:

	- You plan to scale Jenkins with remote agents.
	- You want agents to connect from outside your Docker host.
	- You’re using JNLP-based pipelines.

Skip it if:
	- You’re just experimenting locally.
	- All jobs run on the controller.
	- You use outbound agent strategies.


---

## Jenkins Nodes Configuration &  Setup 
Nodes As mentioned can be 
	- Containers -using secrets 
	- build image with username and connect via ssh 
	- Ec2/Vm, ..etc on any cloud provider
