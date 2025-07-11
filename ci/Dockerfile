FROM ubuntu

# ---------- BASE ----------

RUN apt-get update && \  
    apt-get install -y lilypond  

ENV HOME=/var/lilypond

RUN groupadd -g 501 lily    
RUN useradd -m \
    -d $HOME \
    -s /usr/bin/bash \
    -g lily \
    -G sudo \
    -u 501 \
    lily

RUN echo "lily:password" | chpasswd

USER lily:sudo

WORKDIR $HOME 

