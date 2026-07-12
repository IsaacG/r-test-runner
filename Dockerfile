# target: r-minimal:latest
FROM rhub/r-minimal:4.6.1@sha256:535bbac3b8b008f9e216580a2ae92fa8725f10b08888a452062f05b1c5b706e6

RUN apk --update add jq

RUN installr -d \
    -t "curl-dev libxml2-dev linux-headers gfortran fontconfig-dev fribidi-dev harfbuzz-dev freetype-dev libpng-dev tiff-dev" \
    -a "libcurl libxml2 fontconfig fribidi harfbuzz freetype libpng tiff libjpeg icu-libs" \
    tidyverse  \
    testthat

COPY . /opt/test-runner
WORKDIR /opt/test-runner
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
