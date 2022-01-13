FROM idego

USER root
RUN apt update   \
 && apt install -y file

# container's startup code runs go compiler
USER $ACCOUNT_VSCODE
COPY compile.sh /usr/local/bin

CMD ["compile.sh"]