FROM gitpod/workspace-postgres

RUN sudo wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.3-linux-x86_64.tar.gz \
  && tar -xvzf julia-1.8.3-linux-x86_64.tar.gz 
# Install direnv
RUN sudo apt-get update && sudo apt-get install -y direnv \
  && direnv hook bash >> /home/gitpod/.bashrc \
  && mkdir -p .config/direnv \
  && echo '[whitelist]' > .config/direnv/config.toml \
  && echo 'prefix = [ "/workspace" ]' >> .config/direnv/config.toml 
  && echo 'prefix = [ "~/.julia/geniebuilder/apps/GenieBuildLifeProto" ]' >> .config/direnv/config.toml 
  