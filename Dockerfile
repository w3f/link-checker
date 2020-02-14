FROM nikolaik/python-nodejs:python2.7-nodejs10

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 23E7166788B63E1E \
  && apt update -qq \
  && apt install -y -qq --no-install-recommends \
  git \
  netcat \
  && pip install --no-cache-dir git+https://github.com/linkchecker/linkchecker.git@master \
  && apt -y -qq purge git \
  && apt autoremove -y -qq \
  && apt clean -y -qq all \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/locale /usr/share/man
