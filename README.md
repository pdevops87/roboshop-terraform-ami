# roboshop-terraform-ami


syslog vs rsyslog:
=================
All systemd-managed services have their service logs in journald by default (stdout/stderr and errors).
Some application-specific logs may still go to separate log files unless configured to log to stdout/stderr.


systemd service logs are available in journald by default
rsyslog can read from journald and store logs in files or forward them
Together, they allow both real-time querying (journald) and long-term storage / centralization (rsyslog)


* find . "*rsyslog*"
* find . -name "*rsyslog*"
* cat ./d61/ansible/roles/common/templates/rsyslog.conf
* cat ./d61/ansible/roles/common/tasks/filebeat.yml
* cat ./d61/ansible/roles/common/tasks/main.yml
* cat /etc/rsyslog.d/23-cloud-init.conf


docker:
======
Docker is a container management tool that leverages Linux kernel features like namespaces for isolation and cgroups for resource limits. Inside Docker you have:

Docker Engine (runtime) : to run containers
Docker Daemon (background service): to run backend services like nginx,node
Docker CLI (command tool): to run through cli like linux server
Storage, Networking, and Image management
It uses Linux kernel features to actually run containers

*** Linux kernel features (Namespaces, cgroups, OverlayFS) : These are the actual mechanisms that make containers possible — isolation and resource limits.

You (CLI) --> API request --> Docker Daemon --> Docker Engine --> Container runs nginx

CLI → Sends the request
Daemon → Interprets request, manages resources
Engine → Runs the containerized process


** flow
=======
Docker CLI = client sending API requests
Docker Daemon = background service interpreting requests
Docker Engine = runtime that executes containers
Container process (nginx) = the actual application running

Step-by-step flow
-------------------
You type the command:

docker run nginx (API request)


* This is done via Docker CLI.
* CLI is just a client; it does not run the container itself.
* CLI sends an API request to Docker Daemon
* The CLI communicates with Docker Daemon through:
* Unix socket (default on Linux) → /var/run/docker.sock

Or TCP socket (if configured)

API request = a structured message that says:

“Hey Docker Daemon, create a container from the nginx image and start it.”
Docker Daemon receives the request
Docker Daemon interprets the API request.

It manages container lifecycle:
==============================

Pulls the image (if not present)
Creates the container
Sets up networking, storage, namespaces, cgroups
Docker Engine actually runs the container
Docker Engine (runtime, usually containerd + runc) is responsible for:
Starting the process inside the container
Setting up namespaces (isolation)
Applying cgroups (resource limits)
Mounting filesystems and overlays
At this point, the nginx process is actually running inside the container.
