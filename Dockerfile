ARG arch
FROM jiesu/jre8:ubuntu-bionic-${arch}

COPY bfg-1.13.0.jar /home/jie/
COPY start.sh /
RUN chmod +x /start.sh

# bfg generates report file at this location
RUN mkdir /repo.bfg-report && chown jie:jie /repo.bfg-report

VOLUME /repo

ENTRYPOINT ["/start.sh" ]

USER jie

