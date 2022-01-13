FROM idebase

USER root
RUN mkdir -p /deb_packages/install  \
 && curl -L -o /deb_packages/install/google-chrome-stable_97.0.4692.71-1_amd64.deb https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_97.0.4692.71-1_amd64.deb  \
 && apt-get update  \
 && apt-get install -y /deb_packages/install/google-chrome-stable_97.0.4692.71-1_amd64.deb  \
 && rm -fr /deb_packages

USER root
COPY local.conf /etc/fonts/local.conf

USER $ACCOUNT_VSCODE
RUN mkdir -p "$HOME"/chrome/data

# Autorun chrome
USER $ACCOUNT_VSCODE
ENTRYPOINT [ "google-chrome" ]
CMD [ "--user-data-dir="$HOME"/chrome/data", "--no-sandbox" ]