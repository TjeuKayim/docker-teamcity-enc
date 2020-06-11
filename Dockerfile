FROM jetbrains/teamcity-agent:latest

USER root
RUN apt-get update && \
	apt-get install -y build-essential && \
	curl -sL https://deb.nodesource.com/setup_13.x | bash - && \
	apt-get install -y nodejs && \
	apt-get install -y man && \
	apt-get install -y curl zip && \
	apt-get install -y libgbm-dev gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 \
		libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 \
		libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 \
		libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 \
		libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release \
		xdg-utils wget && \
	apt-get clean all && \
	curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.2/bin/linux/amd64/kubectl && \
	chmod +x ./kubectl && \
	mv ./kubectl /usr/local/bin/kubectl
USER root
