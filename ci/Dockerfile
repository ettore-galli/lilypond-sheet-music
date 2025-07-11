FROM --platform=linux/amd64 ubuntu

# ---------- BASE ----------

ENV VERSION=2.24.2
RUN apt-get update && \  
    apt-get install -y sudo wget 
RUN wget "https://gitlab.com/lilypond/lilypond/-/releases/v${VERSION}/downloads/lilypond-${VERSION}-linux-x86_64.tar.gz" && \
    tar -xzf lilypond-${VERSION}-linux-x86_64.tar.gz && \
    mv lilypond-${VERSION} /opt/lilypond && \
    ln -s /opt/lilypond/bin/lilypond /usr/local/bin/lilypond && \
    rm lilypond-${VERSION}-linux-x86_64.tar.gz

ENV HOME=/var/lilypond

RUN groupadd -g 501 lily    
RUN useradd -m \
    -d $HOME \
    -s /usr/bin/bash \
    -g lily \
    -G sudo \
    -u 501 \
    lily

RUN echo "root:password" | chpasswd
RUN echo "lily:password" | chpasswd

USER lily:sudo

WORKDIR $HOME 

