# Meetings (cadence & outputs)
## 2) Planning
# Agile (in practice)

**What it is:** A set of values & ways of working that favors fast feedback, small increments, and collaboration.
**Why it matters:** Reduces risk and improves Time To Market by delivering value in slices instead of big-bang releases.

**Core ideas**

* Deliver in **small, testable increments**.
* **Customer collaboration** beats contract negotiation.
* **Respond to change** over following a fixed plan.
* **Working software** > heavy documentation (but doc still exists).

**Common frameworks**

* **Scrum:** fixed-length sprints, roles (PO, SM, Dev Team), ceremonies.
* **Kanban:** continuous flow, WIP limits, cycle-time focus.
* **Scrumban:** hybrid; Scrum cadence + Kanban flow constraints.

---

# Meetings (cadence & outputs)

## 1) Discovery

* **Purpose:** Understand the problem, users, constraints, and success metrics.
* **Typical agenda:** Goals → current pain points → stakeholders → constraints → early risks.
* **Outputs:** Problem statement, initial scope, high-level architecture/risks, success criteria.
* **Tip:** Capture assumptions + how you’ll validate them.

## 2) Readiness (a.k.a. Definition of Ready check)

* **Purpose:** Ensure a backlog item can be started without blockers.
* **Checklist:** Clear user story, acceptance criteria, test approach, dependencies known, data/env available.
* **Outputs:** “Ready” stories; flagged gaps to unblock.
* **Anti-pattern:** Starting work with unclear acceptance criteria.

## 3) Planning (Sprint/Iteration Planning)

* **Purpose:** Choose what to deliver this iteration and how.
* **Inputs:** Prioritized backlog, team capacity, past velocity.
* **Outputs:** Sprint goal, selected & sized stories, initial task breakdown.
* **Tip:** Keep \~10–20% slack for unplanned work if your environment is noisy.

## 4) Standup (Daily)

* **Purpose:** Synchronize, reveal blockers, adjust plan.
* **Format (max 15 min):** What changed since yesterday? What’s next? Any blockers?
* **Outputs:** Updated board, owners for blockers.
* **Anti-pattern:** Status to a manager; it’s team coordination, not reporting theater.

## 5) Review & Retrospective

* **Review (Demo):** Show working increments to stakeholders; collect feedback; measure against Sprint Goal.
* **Retro (Team):** Inspect process; pick **1–3** concrete improvements for the next sprint (with owners & due dates).
* **Outputs:** Accepted work, feedback backlog, improvement actions.
* **Anti-pattern:** Turning the retro into a complaint session with no actions.

---

# Story points vs working days

**Story points**

* **What:** Relative size/effort (complexity, risk, uncertainty).
* **Why:** Avoid false precision; normalize across people; supports stable **velocity** (points/sprint).
* **How:** Compare to a baseline story (“1-pointer”), then use a scale (1,2,3,5,8…).

**Working days / hours**

* **What:** Calendar time estimates.
* **Good for:** Capacity planning, external commitments, setting expectations with non-Agile stakeholders.

**Bridging them (safely)**

* Track your **velocity** (e.g., \~35 points/sprint). Over time, you can say “we usually deliver \~35 points per 2-week sprint,” which maps indirectly to time.
* **Avoid** hard converting points→hours per story; it breaks the purpose of points.

---

# Time To Market (TTM)

**Definition:** The elapsed time from idea committed → value in users’ hands.
**Why it matters:** Lower TTM = faster learning, competitive advantage, earlier ROI.

**How to reduce it**

* **Thin vertical slices** (deployable end-to-end).
* **CI/CD** with automated tests & security gates.
* **Trunk-based development** + **feature flags** to ship safely.
* **Infra as Code** & **ephemeral environments** to kill waiting time.
* Measure **DORA metrics:** Deployment Frequency, Lead Time for Changes, Change Failure Rate, MTTR.

---

# Continuous Delivery vs Continuous Deployment

**Continuous Delivery (CDel)**

* Every change is build → test → **ready for prod**.
* **Manual approval** (or business gate) before production.
* Fit for regulated contexts or when market timing matters.

**Continuous Deployment (CDep)**

* Every passing change **auto-deploys to production**.
* Requires high test quality, strong observability, fast rollback.
* Fit for high-volume SaaS where rapid iteration is key.

**Choose based on:** risk tolerance, regulation, test maturity, and business cadence. Many teams start with CDel and evolve to CDep.

---

# Docker vs container

**Containers (concept)**

* A **standard packaging & isolation** method (namespaces/cgroups) that runs processes with their dependencies.
* **OCI** (Open Container Initiative) standardizes **image** and **runtime** specs.

**Docker (one popular implementation)**

* **Build** images (`Dockerfile`), **run** containers (`docker run`), and **publish** to registries (Docker Hub).
* Uses **containerd** under the hood; alternatives include **Podman**, **Buildah**, **nerdctl**.
* **Compose** for multi-container local stacks; for production orchestration use **Kubernetes** (K8s).

**Containers vs VMs**

* Containers share the host kernel → **lighter & faster startup**.
* VMs emulate hardware with separate OS → **stronger isolation**, heavier.

**Practical tips**

* Keep images **small** (multi-stage builds).
* Run as **non-root** where possible.
* Pin base images & scan for vulnerabilities.
* Externalize config via **env vars/Secrets**.


# TL;DR

* **Docker** = tools to **build** and **run a single container** (or a few on one machine).
* **Kubernetes** = a **cluster orchestrator** to run **lots of containers across many machines** with high availability, scaling, and self-healing.

They’re complementary: you typically build images with Docker (or another OCI builder), push to a registry, then Kubernetes pulls and runs them in a cluster.

---

# Mental model (analogy)

* **Docker** is like packaging one app into a sealed shipping container and starting it on your laptop/server.
* **Kubernetes** is the global logistics system: fleets of trucks, routes, dispatch, health checks, scaling up/down, replacing broken trucks automatically.

---

# What Docker gives you

* **Image build**: `Dockerfile` → immutable image (OCI format).
* **Run**: `docker run` starts a container (a process with isolation).
* **Local networking & volumes**: simple links, ports, mounted data.
* **Compose (optional)**: a lightweight way to run a few containers together on a single host for dev/test.
* **Registry**: push/pull images (Docker Hub, ECR, ACR, GitHub, etc.).

**Use Docker when:** you’re developing, testing locally, or running a small service on one VM.

---

# What Kubernetes gives you

Kubernetes assumes you **already have container images**. It adds:

* **Desired state & scheduling**: you declare “I want 5 replicas,” K8s finds where to run them.
* **Self-healing**: restarts crashed containers, reschedules on healthy nodes.
* **Scaling**: manual or auto (HPA) based on CPU/metrics.
* **Rolling updates & rollbacks**: zero-downtime deploys; revert fast if needed.
* **Service discovery & load balancing**: stable virtual IPs/Names for talking between services.
* **Config & Secrets**: inject env/config safely and consistently.
* **Multi-node & multi-AZ**: resilience and capacity beyond a single machine.
* **Observability hooks**: liveness/readiness/startup probes, events, labels for metrics/tracing.

**Use Kubernetes when:** you have multiple services, need HA/scale, automated rollouts/rollbacks, and standardized ops.

---

# How they work together (typical flow)

1. **Build image** (usually with Docker/BuildKit):
   `docker build -t registry/app:1.0 .`
2. **Push to registry**:
   `docker push registry/app:1.0`
3. **Deploy to Kubernetes** (YAML/Helm/ArgoCD):
   `kubectl apply -f deployment.yaml`
   K8s will pull `registry/app:1.0`, run it on some node(s), probe health, expose it via a Service/Ingress, and handle scaling.

> Note: Modern K8s uses **containerd** or **CRI-O** under the hood. Docker-built images still run fine because they follow the **OCI** image standard.

---

# Side-by-side: common tasks

| Need                      | With Docker                 | With Kubernetes                            |
| ------------------------- | --------------------------- | ------------------------------------------ |
| Build app image           | `docker build`              | (same; outside K8s)                        |
| Run the app               | `docker run -p 8080:80 app` | `Deployment` + `Service` (YAML)            |
| Multiple replicas         | `docker run` x N (manual)   | `spec.replicas: N` (auto managed)          |
| Update with zero downtime | manual stop/start           | `kubectl rollout restart` (rolling update) |
| Auto-restart on crash     | `--restart` (limited)       | Built-in self-healing                      |
| Auto-scale                | scripts/manual              | HPA (metrics-driven)                       |
| Service discovery         | manual host\:port           | Cluster DNS + Services                     |
| Secrets/config            | env/volumes                 | `Secret` / `ConfigMap`                     |
| Multi-host HA             | DIY                         | Native                                     |

---

# Minimal examples

**Dockerfile (build once, used by both worlds)**

```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
EXPOSE 3000
CMD ["node", "server.js"]
```

**Run locally with Docker**

```bash
docker build -t myorg/web:1.0 .
docker run -p 8080:3000 myorg/web:1.0
```

**Kubernetes Deployment + Service**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
spec:
  replicas: 3
  selector: { matchLabels: { app: web } }
  template:
    metadata: { labels: { app: web } }
    spec:
      containers:
      - name: web
        image: myorg/web:1.0
        ports: [{ containerPort: 3000 }]
        readinessProbe:
          httpGet: { path: /health, port: 3000 }
        livenessProbe:
          httpGet: { path: /live, port: 3000 }
---
apiVersion: v1
kind: Service
metadata: { name: web }
spec:
  selector: { app: web }
  ports: [{ port: 80, targetPort: 3000 }]
  type: ClusterIP
```

Deploy: `kubectl apply -f web.yaml`

---

# When to choose what (quick guide)

* **Solo dev / PoC / one VM:** Docker + Compose is enough.
* **Team, multiple services, uptime matters:** Kubernetes (or an enterprise distro like **OpenShift**).
* **Hybrid/multi-cloud, regulated environments:** Kubernetes/OpenShift for consistency, RBAC, policy, and audited rollouts.

---

# Gotchas & tips

**With Docker**

* Keep images **small** (multi-stage builds).
* Don’t run as **root** in the container.
* Scan images for CVEs; pin base images.

**With Kubernetes**

* Add **readiness/liveness** probes early.
* Set **resource requests/limits** (avoid noisy neighbors).
* Externalize config (ConfigMaps/Secrets).
* Use **Helm** or **GitOps** (ArgoCD/Flux) to manage YAML sprawl.

---

## One-liner to remember

* **Docker**: “How do I **package and run** this app in a container?”
* **Kubernetes**: “How do I **reliably run 100+ of these containers** across many machines, update them safely, and keep them healthy?”


---

# What is OpenShift?

OpenShift is **Red Hat’s enterprise Kubernetes platform**—a full stack for building, deploying, and operating containerized apps at scale. Think: Kubernetes at the core, plus curated-and-supported pieces for security, CI/CD, registries, monitoring, and day-2 operations—all tested to work together. ([Red Hat][1], [Red Hat Developer][2])

It’s built from the upstream **OKD** project (the community distribution that powers OpenShift). OKD is where features land first; OpenShift packages the stable bits with enterprise support. ([Red Hat][3])

Under the hood, OpenShift 4.x runs on **Red Hat Enterprise Linux CoreOS (RHCOS)** for control plane nodes (and often workers), giving a locked-down, auto-updated OS tailored for clusters. ([Red Hat Docs][4])

---

# How it relates to Red Hat

* **Product & support owner:** Red Hat builds, hardens, and supports OpenShift.
* **Upstream/downstream:** **OKD → OpenShift** (community → enterprise).
* **OS foundation:** Tight integration with **RHCOS/RHEL** for predictable, secure lifecycle management. ([Red Hat][3], [Red Hat Docs][4])

---

# How it relates to the Cloud

OpenShift runs **anywhere**: on-prem, private cloud, and major public clouds. You can self-manage or pick a fully managed service:

* **ROSA (Red Hat OpenShift Service on AWS):** Managed OpenShift run natively on AWS with integrated billing and AWS services. ([Amazon Web Services, Inc.][5], [Red Hat Developer][6])
* **Azure Red Hat OpenShift (ARO):** Jointly engineered & operated by Microsoft + Red Hat; managed clusters with Azure portal integration and SLA. ([Microsoft Azure][7], [Red Hat][8], [Microsoft Learn][9])

(There are also Red Hat–hosted options and offerings on other clouds, but ROSA/ARO are the flagship managed services.)

**Why this matters:** you get a **consistent platform** across environments (on-prem to cloud) so apps and pipelines look the same everywhere—key for hybrid/multi-cloud. ([Red Hat Developer][2])

---

# How it fits Microservices

OpenShift is designed for **cloud-native microservices**:

* **Container orchestration:** Kubernetes primitives (Deployments, Services, Ingress/Routes) for scaling, service discovery, and resilience—pre-integrated and supported in OpenShift. ([Red Hat][1])
* **Supply chain & CI/CD:** Built-in pipelines and GitOps options so each microservice can build, test, and ship independently. (OpenShift bundles these as part of the platform rather than you assembling tools yourself.) ([Microsoft Learn][9])
* **Service Mesh & traffic management:** Optional service-mesh add-ons (mTLS, canary, retries, circuit-breaking) to manage microservice-to-microservice traffic consistently. (Part of the curated OpenShift ecosystem.) ([Red Hat][1])
* **Day-2 ops:** Centralized logs/metrics, policy, image registry, role-based access—so many small services don’t become an operational nightmare. ([Red Hat][1])

**Mental model:**
Vanilla Kubernetes = engine + parts.
OpenShift = **the whole car** (engine + parts pre-installed, secured, and supported) so teams can focus on building microservices, not assembling the platform.

---
Got it. Here’s a compact DevOps glossary + how the pieces fit. I’ll fix the typos as we go: **virtualization**, **containerization (a.k.a. dockerization)**, **microservices**, **monolithic**, and other must-know concepts.

# Core compute models

* **Virtualization (VMs):** Runs multiple **OS instances** on one host via a **hypervisor** (KVM/ESXi/Hyper-V). Strong isolation; heavier (guest OS per VM).
  *Use when:* you need full OS isolation, legacy apps, or strict compliance.
* **Containerization (Dockerization):** Packages an app + deps into **containers** that share the host kernel (namespaces/cgroups). Light, fast, portable.
  *Use when:* you want speed, density, and consistent runtime across envs.
* **Serverless (FaaS):** Deploy **functions**; provider runs them on demand. You pay per execution.
  *Use when:* event-driven tasks, unpredictable load, minimal ops.

# App architectures

* **Monolith:** One deployable unit (single codebase/process). Simple to start; can get hard to scale/change at large size.
  *Great for:* MVPs, small teams, tightly coupled features.
* **Microservices:** Many small services, each owns a business capability; independent deploy/scale; adds **operational complexity**.
  *Great for:* large teams, rapid independent changes, varied scaling.
* **Modular Monolith:** Monolith internally **well-modularized**; one deploy, clean boundaries. Often a pragmatic middle ground.
* **Event-Driven / Async:** Services talk via events/queues (Kafka/RabbitMQ) to decouple and smooth spikes.

# Orchestration & traffic

* **Kubernetes (K8s):** Orchestrates containers across a cluster: scheduling, self-healing, scaling, rollouts.
* **OpenShift:** Enterprise distro of Kubernetes with batteries included (registry, security, pipelines).
* **API Gateway:** Single entry for external clients (auth, rate limits, routing).
* **Service Mesh (Istio/Linkerd):** Manages **service-to-service** traffic, **mTLS**, retries, canaries, telemetry—without app code changes.
* **Load Balancing:**

  * **L4** (TCP/UDP) = fast, no HTTP smarts.
  * **L7** (HTTP) = path/host rules, header routing, canary splits.

# Delivery & operations

* **CI (Continuous Integration):** Every change auto-builds & tests → fast feedback.
* **CD (Continuous Delivery):** Every green build is **deployable**; human gate to prod.
* **CD (Continuous Deployment):** Auto-deploy to prod when checks pass.
* **GitOps (Argo/Flux):** Git is the **source of truth** for env state; controllers sync clusters to what’s in Git.
* **Progressive Delivery:** **Blue/Green, Canary** rollouts; feature flags to decouple deploy from release.
* **IaC (Infrastructure as Code):** Provision infra via code (Terraform, CloudFormation).
* **Config Management:** OS/app config (Ansible/Chef).
* **Immutable Infrastructure:** Don’t patch; **rebuild** images and redeploy.
* **Secrets Management:** Securely store/inject secrets (Vault, KMS).
* **Policy as Code:** Enforce rules automatically (OPA/Gatekeeper, Kyverno).

# Observability & reliability

* **Logs / Metrics / Traces (LMT):** Full visibility; often via Prometheus + Grafana + OpenTelemetry + ELK/EFK.
* **Health probes:** Liveness/Readiness/Startup checks in K8s.
* **Auto-scaling:** HPA/VPA based on usage or SLOs.
* **SRE concepts:** SLO/SLI/SLA, error budgets, MTTR, incident response, postmortems.
* **DORA metrics:** Lead time, deploy frequency, change failure rate, MTTR.

# Data & state (don’t skip!)

* **Storage types:** Block vs File vs Object (e.g., EBS/NFS/S3).
* **DB choices:** Relational (PostgreSQL/SQL Server) vs NoSQL (Mongo/Redis).
* **Caching:** Redis/Memcached to reduce latency.
* **Patterns:** **CQRS**, **Event Sourcing** for complex, high-throughput domains.

# Security & supply chain (DevSecOps)

* **SAST/SCA/DAST:** Static code, dependency, and dynamic app scanning in CI.
* **Image scanning & SBOM:** Scan container images; publish **Software Bill of Materials**; follow **SLSA** levels.
* **Zero-Trust / mTLS:** Encrypt service-to-service, least privilege (RBAC).
* **Runtime security:** Detect anomalous behavior in containers (Falco, etc.).

---

## Quick comparison cheat sheet

| Concept        | One-liner                  | Choose it when                  | Trade-offs                  |
| -------------- | -------------------------- | ------------------------------- | --------------------------- |
| Virtualization | Full OS per VM             | Legacy, strong isolation        | Heavier, slower boot        |
| Containers     | OS-level isolation         | Speed, density, portability     | Weaker isolation than VMs   |
| Monolith       | Single deployable          | Small team, MVP, simple ops     | Harder scaling at size      |
| Microservices  | Many small services        | Large teams, independent deploy | Complex ops & networking    |
| Kubernetes     | Container orchestration    | HA, scaling, self-healing       | Steep learning curve        |
| Service Mesh   | Service-to-service control | mTLS, canary, uniform telemetry | Extra moving parts          |
| GitOps         | Ops via Git state          | Auditability, drift fix         | Requires culture/tooling    |
| Blue/Green     | Two prod slots             | Risk-free switchovers           | Double infra during rollout |
| Canary         | Gradual % rollout          | Validate in prod safely         | Needs metrics & gates       |

---

## Suggested learning path (practical)

1. **Linux & Networking basics** → processes, ports, DNS, TLS.
2. **Git + CI** → PR checks, unit tests, artifacts.
3. **Docker** → build small images, multi-stage, non-root.
4. **Kubernetes** → Deployments/Services/Ingress, probes, HPA.
5. **IaC + GitOps** → Terraform + Argo/Flux.
6. **Observability & SRE** → metrics, tracing, SLOs, incident drills.
7. **Security** → secrets, scanning, SBOM, policy as code.
8. **Advanced** → service mesh, progressive delivery, event-driven data.



# CI (build & test automation)

* **GitHub Actions** — cloud-native, huge marketplace, first-class GitHub PR integration.
* **GitLab CI** — integrated SCM+CI/CD, great pipelines-as-code.
* **Jenkins** — flexible, plugin galaxy, strong for self-hosted/hybrid.
* **CircleCI** — fast cloud runners, good DX, parallelism.
* **Azure Pipelines** — strong Windows/.NET, multi-cloud agents. ([Test Automation Tools][1], [Spacelift][2])

# Continuous Delivery (deploy orchestration / GitOps)

* **Argo CD** — Kubernetes GitOps, drift detection, multi-cluster.
* **Flux CD** — lightweight GitOps operator, Helm-friendly.
* **Octopus Deploy** — release orchestration & runbooks (K8s + VMs).
* **Spinnaker** — mature multi-cloud CD, canary analysis.
* **Harness CD** — SaaS CD with governance & cost views. ([Spacelift][3], [Octopus Deploy][4], [Harness.io][5])

# Continuous Deployment / Progressive delivery (auto-to-prod safely)

* **Argo Rollouts** — canary/blue-green for K8s, traffic shaping.
* **Flagger** — progressive delivery operator (works with Istio/NGINX/etc.).
* **Spinnaker + Kayenta** — automated canary analysis.
* **Harness CD** — built-in canary/blue-green & verification.
* **Argo CD (with automation)** — auto-sync + health gates for hands-off deploys. ([wallarm.com][6], [Medium][7])

# Feature flags (progressive + safe releases)

* **LaunchDarkly** — enterprise feature management.
* **Unleash** — open-source + enterprise, privacy-friendly.
* **Flagsmith** — open-source/self-host or SaaS.
* **CloudBees Feature Management** (Rollout.io) — enterprise controls.
* **Split.io** — flags + experimentation. ([The Product Manager][8], [Unleash][9])

# AppSec in CI/CD — SAST (static analysis)

* **SonarQube**, **Semgrep**, **Checkmarx**, **Snyk Code**, **CodeQL**. (Pick 1–2 to start; wire as PR checks.) ([mend.io][10], [Jit][11])

# AppSec in CI/CD — DAST (runtime scanning)

* **OWASP ZAP** (OSS), **Burp Suite**, **Acunetix/Invicti**, **GitLab DAST**, **Qualys/InsightAppSec** (enterprise suites). ([getastra.com][12], [Beagle Security][13], [Gartner][14])

# Container/Image scanning (shift-left containers)

* **Trivy**, **Grype**, **Clair** (OSS staples).
* **Snyk Container**, **Docker Scout** (dev-friendly SaaS). ([Aqua][15], [Pomerium][16])



# What Istio is (in one line)

An open-source **service mesh** that adds traffic control, zero-trust security (mTLS), policy, and telemetry to microservices. ([Istio][2])

# Why microservice teams use it

* **Traffic management:** smart routing, canary/blue-green, retries, timeouts, circuit breaking—configured via CRDs like `VirtualService`/`DestinationRule`. ([Istio][3])
* **Security:** mesh-wide **mTLS**, identity, and policy enforcement between services. ([Istio][2])
* **Observability:** uniform metrics, logs, and traces; often visualized with **Kiali** and **Jaeger**. ([Istio][4])

# How it works (quick architecture)

* **Data plane:** **Envoy** proxies (usually as **sidecars**) sit next to each service and intercept all inbound/outbound traffic. ([Istio][5])
* **Control plane:** **istiod** programs those proxies with routing, security, and telemetry policies. ([Istio][5])
* Newer option: **ambient mode** (reduces per-pod sidecars) if you want lower overhead. ([Istio][6])

# Relation to Red Hat / OpenShift

Red Hat ships **OpenShift Service Mesh**, which is **based on Istio + Envoy + Kiali** and integrates tightly with OpenShift. If you’re on OpenShift, this is the supported way to run a mesh. ([Red Hat][7])

# Where it fits in DevOps

* Enables **progressive delivery** (canary/blue-green) inside your CI/CD pipelines. ([Istio][3])
* Standardizes **security and telemetry** so SRE/Platform teams can enforce policy and monitor many services consistently. ([Istio][2])

# When to adopt (and when not)

* **Use it** when you have many services, need encrypted service-to-service traffic, traffic shaping, or consistent telemetry across teams. ([Google Cloud][8])
* **Maybe skip** if you have a small number of services or a monolith—start simple with Kubernetes + an API gateway; add a mesh when complexity/scale demands it. (Alternatives include **Linkerd**, **Consul**, **Kuma**.) ([DevOpsCube][9])


## Quick cheat sheet

| Topic                 | You should remember                                                                  |
| --------------------- | ------------------------------------------------------------------------------------ |
| Agile                 | Deliver small, get feedback fast, embrace change.                                    |
| Discovery → Readiness | Understand the problem → make stories startable.                                     |
| Planning              | Sprint goal + right-sized, “ready” stories.                                          |
| Standup               | Coordinate, unblock; not a status ritual.                                            |
| Review & Retro        | Show real value; pick a few improvements with owners.                                |
| Story points vs days  | Points for **relative size**; days for **capacity/commitments**. Don’t hard-convert. |
| TTM                   | Optimize flow: CI/CD, small slices, IaC, strong tests/observability.                 |
| CDel vs CDep          | Manual prod gate vs automatic to prod; pick by risk & maturity.                      |
| Docker vs container   | Docker is a popular **tooling**; a container is the **concept/format** (OCI).        |


## Quick answers

* **OpenShift?** Enterprise Kubernetes platform by Red Hat. ([Red Hat][1])
* **Relation to Red Hat?** It’s Red Hat’s product, built from OKD and coupled with RHCOS/RHEL. ([Red Hat][3], [Red Hat Docs][4])
* **Relation to Cloud?** Runs on-prem and all major clouds; also available as fully managed services (**ROSA**, **ARO**). ([Amazon Web Services, Inc.][5], [Microsoft Azure][7])
* **Relation to Microservices?** Provides the curated, secure, end-to-end toolchain to build, ship, and operate microservices at scale. ([Microsoft Learn][9])

