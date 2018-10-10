FROM       scratch
MAINTAINER Jeff Lindsay <progrium@gmail.com>

ADD ./rootfs.tar /
ADD ./opkg.conf         /etc/opkg.conf
ADD ./opkg-install      /usr/bin/opkg-install
ADD ./functions.sh      /lib/functions.sh
RUN opkg-cl install http://downloads.lede-project.org/snapshots/targets/x86/64/packages/libgcc_7.3.0-1_x86_64.ipk
RUN opkg-cl install http://downloads.lede-project.org/snapshots/targets/x86/64/packages/libc_1.1.20-1_x86_64.ipk

CMD ["/bin/sh"]
