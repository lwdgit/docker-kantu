FROM siomiz/chrome

RUN apt-get update -y \
    && apt-get -y install ttf-wqy-microhei ttf-wqy-zenhei -y \
    && apt-get clean && rm -rf /var/cache/* /var/log/apt/* /var/lib/apt/lists/* /tmp/*

ENV VNC_SCREEN_SIZE 1440x900
ENV ENV_CHROME_WINDOW_SIZE 1440,900

RUN mkdir -p /home/chrome/Downloads \
    && chown -R chrome:chrome /home/chrome

USER chrome
ENV CHROME_EXTENSION /dist

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
