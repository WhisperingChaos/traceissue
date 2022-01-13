FROM idebase

# install 1.18beta1 compiler generics support
USER $ACCOUNT_VSCODE
RUN mkdir "$HOME/go1.18beta1"                                                                         \ 
 && cd "$HOME/go1.18beta1"                                                                            \
 &&	curl -L -o go1.18beta1.linux-amd64.tar.gz  https://golang.org/dl/go1.18beta1.linux-amd64.tar.gz 	\
 && tar -C "$HOME/go1.18beta1" -xzf go1.18beta1.linux-amd64.tar.gz

# Create symbolic link to reference 1.18beta1 compiler that's referenced
# by vscode.  vscode can locate compiler without changing its
# configuration settings.  Ensure compiler is runnable by all
# "staff"
USER root
RUN mkdir -p /usr/local/bin                                     \ 
 && ln -s "$HOME/go1.18beta1/go/bin/go" /usr/local/bin/go       \
 && chown :staff /usr/local/bin/go                              \
 && ln -s "$HOME/go1.18beta1/go/bin/gofmt" /usr/local/bin/gofmt \
 && chown :staff /usr/local/bin/gofmt
 
# Install "Analsis" tools needed by gopls

  # GCC is required by cgo to "install" delve (dlv) - the go
  # debugger.
  USER root 
  RUN apt update  \
  &&  apt install -y gcc
  
  # Install delve - go debugger
  USER $ACCOUNT_VSCODE
  RUN PATH=$PATH:"$HOME/go1.18beta1/go/pkg/tool/linux_amd64"  \
   && go install github.com/go-delve/delve/cmd/dlv@v1.7.2
  # vscode requires dlv be named dlv-dap.  Create symbolic link
  # so the same dlv is available via both names. 
  RUN  ln -sr  "$HOME/go/bin/dlv" "$HOME/go/bin/dlv-dap"

  RUN go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@v2.1.2 \
   && go install github.com/ramya-rao-a/go-outline@1.0.0        \
   && go install honnef.co/go/tools/cmd/staticcheck@2021.1.1

# Install gopls
USER $ACCOUNT_VSCODE
RUN go install golang.org/x/tools/gopls@latest

#Install vscode go extension that's an interface to gopls
USER $ACCOUNT_VSCODE
COPY extension/golang.Go-0.30.0.vsix /tmp
RUN code --install-extension /tmp/golang.Go-0.30.0.vsix

# install primary go tasks
USER $ACCOUNT_VSCODE
COPY tasks.json "$HOME/.vscode/"

# include startup code for vscode in container's PATH
USER $ACCOUNT_VSCODE
COPY idego.sh /usr/local/bin

# container must be started with "root" in order to
# create pseudo tty using "su" command.  That then provides
# ability to start X Window session. Therefore, do not 
# specify "user" on "docker run" or in compose yml file,
# as it will break this functionality.
# note, when base image is created, the "user" account is
# assigned the same UID and GID of the go.mod file in 
# source directory.
USER root
CMD ["idego.sh"]
