FROM gocompiler

USER root
RUN apt-get update \
 && apt-get install -y graphviz

USER root
COPY capture.sh /usr/local/bin/

USER $ACCOUNT_VSCODE
ENTRYPOINT /bin/bash