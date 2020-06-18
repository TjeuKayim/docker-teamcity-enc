FROM jetbrains/teamcity-agent:latest

USER root
RUN 	curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add && \
	echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
	echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
        apt-get update -y && \
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
	apt-get -y install google-chrome-stable && \
	apt-get install google-cloud-sdk -y && \
	apt-get clean all && \
	curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.2/bin/linux/amd64/kubectl && \
	chmod +x ./kubectl && \
	mv ./kubectl /usr/local/bin/kubectl
USER root
