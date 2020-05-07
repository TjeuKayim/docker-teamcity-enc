FROM jetbrains/teamcity-agent:latest

RUN apt-get update && \
	apt-get install -y build-essential && \
	curl -sL https://deb.nodesource.com/setup_13.x | bash - && \
	apt-get install -y nodejs && \
	apt-get install -y man && \
	apt-get install -y curl zip && \
	apt-get clean all && \
	curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.2/bin/linux/amd64/kubectl && \
	chmod +x ./kubectl && \
	mv ./kubectl /usr/local/bin/kubectl
