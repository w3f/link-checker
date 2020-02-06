FROM nikolaik/python-nodejs:python3.8-nodejs10

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 23E7166788B63E1E && \
  apt update  && \
  apt install -y --no-install-recommends \
  netcat && \
  pip install pylinkvalidator html5lib && \
  sed -i -e 's/\(decode("ascii")\)/\1.replace(" ", "%20")/g' /usr/local/lib/python3.8/site-packages/pylinkvalidator/urlutil.py
