# docker build -t jlatex .

FROM blang/latex:ctanfull

RUN apt-get update \
     && apt-get install -qy python python-pip mercurial\
     && pip install pygments \
     #
     && hg clone https://jomi_hubner@bitbucket.org/jomi_hubner/pygments-jacamo  \
     && cd pygments-jacamo && make mapfiles  \
     && python setup.py install \
     #
     && rm -rf /var/lib/apt/lists/*
