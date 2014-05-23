FROM rootbuilder
ADD ./config /tmp/buildroot/.config
RUN make oldconfig
RUN make --quiet
