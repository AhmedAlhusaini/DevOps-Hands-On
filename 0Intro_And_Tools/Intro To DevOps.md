### What Is The Benefit of DevOps



* Deliver Features / Code Fast 
* Align With Business Needs 
* Enhance UI/UX
* Deploy With Stability of infrastructure \& Security





### What is DevOps



It's about applying methodologies to scale the SDLC cycle :

* Different Environment 
* Using Tools 
* Test User Scenarios 
* Handling Bugs / Errors Till Go Production 





### Road Map To DevOps - DEPI  

* Linux 
* Bash 
* Automation / Scripting 
* Web Servers 
* Source Control ( GIT )
* Cloud 
* Terraform 
* Ansible 
* Docker 
* Kubernetes 
* Jenkins ( CI/CD )
* Monitoring \& Logging Tools --> SRE Engineer 

### IT Concepts - Pre DevOps
* History of  IT Delivery Concept Map - @Metwally Labs 
![IT Delivery Timeline](./Assests/History%20Of%20IT%20Delivery.png)

## **I. Fundamentals of Information Technology (IT)**

*   **Core Definition of IT**: Information Technology (IT) is an industry that **encompasses both hardware and software**. Any role or process that requires hardware or software for its operation is considered part of the IT industry.
*   **Hardware Components**: These are the **physical components of a computer system**. Key examples include the **Central Processing Unit (CPU)**, which is the "brain" involved in all operations; **Random Access Memory (RAM)**, used to run applications and hold data during processing; **Storage** (Hard Disk Drives/HDDs or Solid State Drives/SSDs), providing persistent storage for operating systems, data, and applications; **Network Cards/Interfaces**, which connect computing devices to the outside world wirelessly (WiFi) or wired (Ethernet/LAN cables); **Monitors**, used to read/view data; and **Graphic CPU (GCPU) cards**, used to accelerate video operations. There are also other components like fans, USB interfaces, and power supplies.
    *   **Measurement Units**: CPU speed is measured in GHz. Memory and storage are measured in Giga Bytes (GB/GiB) or Tera Bytes (TB/TiB). Network Interface Card speed is measured in Mega bits/second (Mbps) or Giga bits/second (Gbps).
*   **Software Components**: These are the **programs and operating information used by a computer**. This includes operating systems (like Windows OS), applications, and scripts. Software is fundamental for hardware to function properly.
*   **Procurement Process**: This term specifically refers to the **act of obtaining or buying the necessary hardware and software** required for an application to function.
*   **Traditional IT Challenges**: Managing IT infrastructure (hardware, software, networking) is **inherently complex** and requires specialized expertise. It involves significant **capital expenditure (CAPEX)** for hardware, software licenses, maintenance, and power. Traditional IT also suffered from **scalability limitations**, making it difficult to rapidly adjust resources based on demand, leading to either over-provisioning or under-provisioning. Furthermore, there was a **lack of flexibility**, as the rigid IT infrastructure often **dictated software design**, rather than software needs driving infrastructure choices.

## **II. Historical IT Delivery Models**

*   **Mainframe Era (1950s)**: A revolutionary and powerful **central computer system** designed for high-volume data processing and centralizing IT operations.
    *   **Dumb Terminals**: These were simple input/output devices (screens, keyboards, mice) that **lacked processing power or local storage** and relied entirely on the mainframe for all their functionality. All processing and data storage happened on the mainframe itself. The mainframe model represents an early, centralized approach to IT delivery.
*   **Client-Server Architecture**: This is a **distributed computing model** where **processing and storage responsibilities are divided** between **client devices** (e.g., personal computers) and **servers**. It improved upon the mainframe by distributing computing power. This model predated the internet but became much more prevalent with its advent, allowing clients and servers to be geographically separated. In this model, the client initiates a request, and the server processes it and sends a response.
*   **Web Hosting**: An IT delivery model primarily focused on **making websites accessible 24/7**. Initially, companies might host websites on their own servers, but the growing demand for robust and scalable web accessibility led to the emergence of specialized hosting companies with dedicated infrastructure designed to handle large user loads.

## **III. Enabling Technologies for Cloud Computing**

*   **Virtualization**: This is a core technology that allows a **single physical machine (hardware) to be divided into multiple isolated virtual machines (VMs)**, with each VM behaving like an independent computer.
    *   **Hypervisor**: A crucial software layer (e.g., VMware) that enables virtualization by creating and running these virtual machines, effectively **abstracting the underlying physical hardware from the VMs**.
    *   **Virtual Machine (VM)**: A software-based emulation of a physical computer that can run its own operating system and applications. Virtualization significantly improves the **efficient utilization of hardware resources** and allows for isolated environments for different applications. VMs can also be easily backed up via snapshots.
*   **Storage Area Network (SAN)**: A dedicated high-speed network that provides access to **consolidated, block-level data storage**. This technology optimizes IT infrastructure by separating storage resources from computational resources.
*   **Data Centers**: In traditional IT, servers and applications were housed in **client-specific, purpose-designed IT data centers**, which are large, air-conditioned, secured, and manned facilities. Servers within these data centers are typically mounted and cabled inside physically secured racks. A crucial distinction is that a data center infrastructure **requires a layer of orchestration and automation to truly become a "cloud"** for provisioning, updating, and monitoring services; thus, a data center is a *component* of a cloud, but not a synonym for one.

## **IV. Cloud Computing Defined**

*   **Core Definition**: Cloud computing is fundamentally the **delivery of IT services—including servers, storage, databases, networking, software, analytics, and intelligence—over the Internet** ("the cloud"). It is recognized as the **latest type of IT delivery** in our current era.
*   **Emergence of Cloud**: Cloud computing emerged as a direct response to the limitations of traditional IT, driven by the increasing need for more **flexible, scalable, and cost-effective IT solutions**, particularly due to the rise of large-scale applications with **millions of simultaneous users** (e.g., Facebook, Amazon).
    *   **Amazon's Pioneering Role**: Amazon.com, facing immense internal IT demands for its rapidly growing e-commerce platform, developed its own highly advanced and scalable IT infrastructure. Recognizing the broader potential of these internal capabilities, Amazon launched these services to the public as **Amazon Web Services (AWS) in 2006**. A key initial offering was **EC2 (Elastic Compute Cloud)**, which provided rentable virtual machines by the hour, a significant departure from previous models.
    *   **Market Growth**: Following Amazon's success, other major technology companies like **Microsoft Azure and Google Cloud Platform (GCP)** entered the market, offering similar cloud services.
*   **Key Characteristics of Cloud Computing**:
    *   **On-Demand Availability**: Cloud resources are **provisioned and accessible instantly when needed**, without manual human intervention or delays, much like a utility service such as water or electricity.
    *   **Pay-as-you-go Model**: Users are charged **only for the resources they actually consume**, without the need for long-term contracts. While long-term commitments can offer discounts, the fundamental principle is consumption-based billing.
    *   **High Flexibility**: This is a defining trait of cloud computing, offering the **ability to easily provision, configure, and de-provision IT components** (servers, networks, storage) as needed. This flexibility allows **software to be designed first, and then the infrastructure is adapted to meet its needs**, reversing the traditional paradigm where infrastructure dictated software. This capability provides "unprecedented agility and customization".
    *   **Modularity**: In the cloud, various IT components (e.g., operating systems, applications, storage) are **separated and can be assembled, disassembled, and interchanged independently**.
    *   **Resource Pooling (Apparent Infinity)**: Cloud providers maintain **vast pools of computing resources** that serve multiple consumers. This pooling creates the **impression of limitless capacity** for users, enabling highly efficient resource utilization by the provider.
    *   **Global Distribution**: Cloud services are strategically distributed across multiple geographic **Regions** and **Availability Zones (AZs)**.
        *   **Region**: A large, geographically separate area where a cloud provider hosts its services, typically containing multiple Availability Zones.
        *   **Availability Zone (AZ)**: Comprises one or more discrete data centers within a cloud region, designed to be isolated from failures in other AZs. This global distribution and redundancy enhance **high availability and fault tolerance** for cloud services.
    *   **Managed Services**: Cloud providers handle the **underlying hardware and infrastructure management**, abstracting the complexities away from the user. This allows users to concentrate on developing and deploying their applications rather than managing the infrastructure.
    *   **Software-Defined Infrastructure**: Cloud services are fundamentally implemented as **intelligent software managing sophisticated hardware**. This software abstracts the underlying complexity, providing a more manageable and programmable infrastructure layer to users.

*   **Cloud Service Models**: These models define the level of control and management the user retains versus what the cloud provider manages:
    *   **IaaS (Infrastructure as a Service)**: Provides the **most basic computing infrastructure**, such as virtual machines, networks, and storage (e.g., AWS EC2).
    *   **PaaS (Platform as a Service)**: Offers a complete platform for developing, running, and managing applications without the user needing to manage the underlying infrastructure components.
    *   **SaaS (Software as a Service)**: Delivers fully functional software applications over the internet, typically on a subscription basis, with the provider managing all underlying infrastructure and application layers.

*   **Cloud Deployment Types**:
    *   **Private Cloud (On-Premise Cloud)**: A cloud computing environment that is **deployed and managed within an organization's own data center**, using cloud technologies and principles for internal use. Companies might choose this model due to specific regulatory or security requirements, or simply to maintain full control over their data and infrastructure. **OpenStack** is a notable collection of open-source software modules that provides a framework for creating and managing private and public clouds. Setting up an on-premise cloud still requires specialized knowledge and significant investment.
    *   **Public Cloud**: Cloud services offered by third-party providers (like AWS, Azure, GCP) over the public internet, accessible to anyone.
    *   **Hybrid Cloud**: A combination of public and on-premises private cloud environments that are **orchestrated to run a single task** or set of related tasks. It is generally more complex to manage but offers advantages for cost-effectiveness, backup, disaster recovery, and development/testing.
    *   **Multi-Cloud**: This refers to the **use of multiple cloud computing and storage services from different cloud providers** in a single heterogeneous architecture. Organizations often use multi-cloud for different use cases.

## **V. DevOps and Related Modern IT Practices**

*   **Target Audiences for Cloud Education**: Cloud education programs typically categorize users into three main groups based on their needs and depth of understanding:
    *   **Newcomers**: Individuals new to the IT field or general users who require a basic understanding of cloud concepts.
    *   **Intermediate Users**: Those who grasp that cloud involves using computers over the internet but need deeper technical insights into cloud services.
    *   **Advanced Users/DevOps**: This crucial group consists of professionals such as **developers, operations engineers, and architects who use cloud services extensively for complex applications**. They require a **detailed and in-depth understanding of cloud nuances and advanced capabilities**, as their cloud usage is "different" and highly sophisticated.
*   **Software Development Life Cycle (SDLC)**: A structured framework that defines the **series of steps used to create software applications**.
    *   **Benefits**: Following SDLC standard practices provides a way to **measure and improve the development process**, allows for accurate analysis of every step, facilitates **faster software delivery**, achieves **higher software quality**, and leads to a better user experience by meeting or exceeding customer expectations.
    *   **Stages**: A typical software development workflow goes through several stages: writing code by developers, building the code into the application (merging), testing for errors/bugs, providing feedback for fixes, and finally, releasing and deployment. **Automating** these different tasks is critical for ensuring better quality and fewer bugs or integration issues.
    *   **Methodologies**: The sources mention two distinctive methodologies for completing projects:
        *   **Waterfall**: A **sequential methodology** where project phases progress linearly.
        *   **Agile**: An **iterative methodology** that incorporates a cyclic and collaborative process, emphasizing more frequent design, code, and test phases before reaching deployment.
*   **DevOps**: An **evolving philosophy and a cultural adoption where the team (developers, QA team, and Operations) collectively undertake software lifecycle responsibilities**. The primary goal of DevOps is to ensure a **better, quicker, and more efficient software development and release/delivery process**.
    *   **DevOps vs. Agile**: While Agile is a philosophy about *how* to develop and deliver software through frequent design/code/test phases, **DevOps describes *how to continuously deploy code* through the use of modern tools and automated processes**. Implementing DevOps can significantly increase the number of releases ready for deployment. Historically, software development involved discrete teams, complex integrations, many bugs, and slow release processes, whereas the DevOps-inspired "new way" emphasizes collaborative teams, continuous and less complex integrations, earlier error detection, and fast release processes.
*   **CI/CD (Continuous Integration, Continuous Delivery, and Continuous Deployment)**: These are fundamental DevOps software development practices specifically aimed at **automating software development workflow tasks, improving software quality, and speeding up the software development cycle**.
    *   **Before CI/CD**: Developers used to work in isolation for extended periods and merge code less frequently, often at the end of cycles. This created major code merge (integration) issues that took longer to fix, slowing down the entire software development process.
    *   **Continuous Integration (CI)**: This DevOps practice **automates the merging of code commits (integrating the code) from multiple developers into a single shared repository**, after which automated builds and tests are conducted. The key goal of CI is to **reduce the time taken to test, find, and address issues or software bugs more quickly**, thereby improving software development and quality. Developers push their code to a shared repository, and a CI tool triggers checks.
    *   **Continuous Delivery (CD)**: Involves **deploying code changes to a staging, testing, or production environment *after* the code build step**. The deployment is dependent on the team's plans and decisions regarding release time and changes.
    *   **Continuous Deployment (CD)**: This is an extension of Continuous Delivery where **changes that pass all CI stages are automatically released to production**. There is **no human intervention** in this process; it is fully automated.
*   **Cloud Native**: An approach to building and running applications that **maximizes the advantages of the cloud computing delivery model**. It's fundamentally about *how* applications are created and deployed, not necessarily *where*. Cloud-native development typically incorporates concepts like **DevOps, continuous delivery, microservices, and containers**. Cloud-native applications are often independent services, packaged as self-contained, lightweight containers that are portable and can scale rapidly based on demand, commonly delivered via a DevOps CI/CD toolchain.
*   **DevSecOps**: A philosophy that **integrates security methods directly into a DevOps process**. The aim of DevSecOps is to make the application secure from the very start of the Software Development Life Cycle (SDLC) by introducing a variety of security techniques throughout the process.
*   **Infrastructure as Code (IaC)**: This practice means **managing your IT infrastructure using configuration files**. IaC is the process of managing and provisioning computer data centers through machine-readable definition files, rather than through manual physical hardware configuration or interactive tools. Examples of IaC tools include Terraform and AWS CloudFormation.
*   **Site Reliability Engineering (SRE)**: A practice where **software tools are used to automate systems management and application monitoring**.
    *   **Need for SRE**: While software developers are keen on frequent updates and quick releases, and DevOps focuses heavily on speed, operations teams prioritize the stability and reliability of applications to ensure overall system reliability and end-user satisfaction. SRE steps in to **fill the gap** left by DevOps' primary focus on speed, ensuring that software applications' reliability is maintained even during frequent updates from development teams. SRE defines a role specifically focused on the overall reliability of systems or applications.

## **VI. Networking Fundamentals (TCP/IP)**

*   **Computing Device Communication**: All devices on the internet or private networks use **IP Addresses** to communicate.
    *   **IP Addresses**: Function like a business or home address, used to **identify computing devices** and facilitate locating them and forwarding traffic. In client-server web applications, IP addresses, along with ports and IP routing, are how clients specify which server to communicate with and how servers respond to the correct client.
    *   **TCP/IP Protocols**: Almost all data transfer today occurs over **TCP/IP** (Transmission Control Protocol / Internet Protocol).
        *   **IPv4**: A 32-bit long address format, represented in decimal notation (e.g., 120.130.233.12). It consists of 4 bytes or octets and requires a subnet mask. IPv4 addresses can be either public or private.
        *   **IPv6**: A 128-bit long address format, represented in hexadecimal notation (e.g., 2001:0db8:85a3:0000:0000:8a2e:0370:7334). It consists of 8 fields and also requires a subnet mask. All IPv6 addresses are public.
    *   **Public vs. Private IP Ranges**: **Public (Internet Routable) IP ranges** are assigned by internet registries and can be used on the public internet. **Private IP addresses** are specifically for use within enterprise networks and cannot be directly accessed from the internet. Common private ranges, defined in RFC1918, include 10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16.
*   **IP Addressing Components**:
    *   **Network Part / Host Part**: An IP address is logically divided into a network portion and a host portion, with the division determined by the subnet mask length (e.g., /24, /16).
    *   **CIDR (Classless Inter-Domain Routing)**: A method for representing IP address ranges. Any CIDR block can be broken down into smaller chunks called **subnets**.
    *   **Subnetting**: The process of dividing a larger IP network into smaller, more manageable subnetworks.
    *   **IPv4 Address Classes**: Historically, IPv4 addresses were categorized into classes (Class A, Class B, Class C), each supporting a different number of hosts and networks based on their initial bit patterns.
*   **Networking Devices**:
    *   **LAN Switches**: These are the main devices used for connectivity within a **Local Area Network (LAN)**, which connects compute devices in close physical proximity (e.g., within a house, office, building, or campus). Switches are also vital for connecting servers in data centers or within cloud infrastructure. WiFi routers also connect Wireless LAN (WLAN) devices.
    *   **Routers**: These devices are **required to connect separate IP Networks or Subnets**. Routers build and maintain routing tables (databases) of known destinations and how to reach them. These tables can be configured statically (manually) or dynamically using routing protocols like OSPF or BGP.
*   **The Internet**: The internet itself is described as a **vast number of networks interconnected using routers**.
*   **Network Security**: Involves a **zoning architecture** where the network infrastructure is divided into zones based on the criticality and security risk of different components. **Firewalls** are key devices (hardware or software-based) used to protect networks and applications, operating at both the network and application levels. The concept of a DMZ (Demilitarized Zone) is also mentioned in this context.
*   **OSI Reference Model vs. TCP/IP Model**:
    *   **OSI Model**: A 7-layer reference model designed to allow for interoperability between different vendors in data communications, providing specific standards for each layer.
    *   **TCP/IP Model**: A four-layer reference model where its layers 1-4 correspond to the same layers as the OSI Model, and its Layer 4 corresponds to layers 5, 6, and 7 of the OSI Model.
*   **TCP/IP Packet Structure**: A TCP/IP packet consists of a **Payload** (the actual data being transferred) and **Headers** (which are like an envelope containing address details). Headers include fields such as Protocol (e.g., TCP=6, UDP=17), Source IP Address/Port, and Destination IP Address/Port.
    *   **Source and Destination Ports**: These are like apartment numbers for communication within a residential building, allowing specific applications or services on a device to send or receive data. The destination port is the specific port the application on the server is listening on, while the source port is typically picked randomly/dynamically from an available range.
*   **Domain Name System (DNS)**: A crucial service on the internet that **maps human-readable domain names (e.g., www.dolfined.com) to their corresponding IP addresses**. This makes it much easier to remember website addresses than numeric IP addresses. Every device connected to the internet must have a DNS configured in its TCP/IP settings to resolve domain names to IP addresses.



![Roadmap For IT Cocnepts](./Assests/IT%20Concepts%20Pre%20DevOps.png)

Happy For you , Wish me all the best , Ahmed Alhusainy ^_^


