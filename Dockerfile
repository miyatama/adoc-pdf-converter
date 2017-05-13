FROM debian:jessie

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get -y install \
    asciidoctor \
    curl \ 
    git \
    libpangocairo-1.0 \
    libx11-xcb-dev \
    libxdamage-dev \
    libxcomposite-dev \
    libxcursor-dev \
    libxi-dev \
    libxtst-dev \
    libnss3-dev \
    libcups2 \
    libgconf2-4 \
    libxss-dev \
    libxrandr2 \
    libatk1.0 \
    libgtk3.0 \
    libasound2 \
    zip \
  && git clone https://github.com/scheib/chromium-latest-linux.git \
  && cd ./chromium-latest-linux \
  && chmod +x ./*.sh \
  && ./update.sh \
  && mkdir /opt/chrome \
  && cp -r ./latest/* /opt/chrome/ \
  && ln -s /opt/chrome/chrome /usr/local/bin/chrome \
  && cd / \
  && rm -fr /chrome-latest-linux
  
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT /docker-entrypoint.sh
