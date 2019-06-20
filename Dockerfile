FROM ubuntu:19.04
LABEL maintainer="Strongbrent"

# Install Dependencies
RUN apt-get update \
    && apt-get upgrade -y --no-install-recommends \
    && apt-get clean

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        sudo \
        curl \
        wget \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# Create test user and add to sudoers
RUN useradd -m -s /bin/bash testuser
RUN usermod -aG sudo testuser
RUN echo "testuser   ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers

# Switch to testuser
USER testuser
ENV HOME /home/testuser

# Change working directory
WORKDIR /home/testuser

CMD ["/bin/bash"]
