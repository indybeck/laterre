FROM openjdk:8-jre

RUN apt-get update && \
    apt-get install -y python ruby && \
    rm -rf /var/lib/apt/lists/* && \
    curl -o /usr/local/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-latest" && \
    chmod +x /usr/local/bin/digdag

EXPOSE 65432
CMD ["java", "-jar", "/usr/local/bin/digdag", "server"]

