ARG BASE_IMAGE=debian:buster-slim
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get install --fix-broken apt-utils --yes \
  && apt-get install --yes \
    curl \
    emacs-intl-fonts \
    fontconfig \
    fonts-arphic-bkai00mp \
    fonts-arphic-bsmi00lp \
    fonts-arphic-gbsn00lp \
    fonts-arphic-gkai00mp \
    fonts-arphic-ukai \
    fonts-arphic-uming \
    fonts-dejavu \
    fonts-dejavu-core \
    fonts-dejavu-extra \
    fonts-droid-fallback \
    fonts-guru \
    fonts-guru-extra \
    fonts-liberation \
    fonts-noto-cjk \
    fonts-opensymbol \
    fonts-roboto \
    fonts-roboto-hinted \
    fonts-stix \
    fonts-symbola \
    fonts-texgyre \
    fonts-unfonts-core \
    ttf-wqy-microhei \
    ttf-wqy-zenhei \
    xfonts-intl-chinese \
    xfonts-intl-chinese-big \
    xfonts-wqy \
  && echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections \
  && echo "ttf-mscorefonts-installer msttcorefonts/present-mscorefonts-eula note" | debconf-set-selections \
  && curl -sL "http://ftp.de.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb" --output "/tmp/mscorefonts.deb" \
  && apt install -f -y --no-install-recommends "/tmp/mscorefonts.deb" \
  && rm -f "/tmp/mscorefonts.deb" \
  && curl -sL "http://corefonts.sourceforge.net/eula.htm" --output "/root/mscorefonts-eula" \
  && apt-get install --fix-broken --yes \
    ghostscript \
    make \
    latex-cjk-common \
    latex-cjk-chinese \
    texlive-full \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-lang-all \
    texlive-lang-cjk \
    texlive-lang-cyrillic \
    texlive-luatex \
    texlive-pstricks \
    texlive-science \
    texlive-xetex \
    texlive-bibtex-extra \
    poppler-utils \
    latexmk \
  && apt-get purge --fix-broken --yes \
    make-doc \
    texlive-fonts-extra-doc \
    texlive-fonts-recommended-doc \
    texlive-humanities-doc \
    texlive-latex-base-doc \
    texlive-latex-extra-doc \
    texlive-latex-recommended-doc \
    texlive-metapost-doc \
    texlive-pictures-doc \
    texlive-pstricks-doc \
    texlive-science-doc \
  && fc-cache -fv \
  && apt-get clean \
  && apt-get autoclean --yes \
  && apt-get autoremove --yes \
  && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /etc/ssh/ssh_host_*

ENTRYPOINT ["xelatex"]
CMD ["--help"]
