FROM       scratch
MAINTAINER Jeff Lindsay <progrium@gmail.com>

ADD ./rootfs.tar /
ADD ./opkg.conf         /etc/opkg.conf
ADD ./opkg-install      /usr/bin/opkg-install
ADD ./functions.sh      /lib/functions.sh
#RUN opkg-cl install http://archive.openwrt.org/snapshots/trunk/x86/64/packages/base/libgcc_5.3.0-1_x86_64.ipk 
#RUN opkg-cl install http://archive.openwrt.org/snapshots/trunk/x86/64/packages/base/libc_1.1.16-1_x86_64.ipk 

CMD ["/bin/sh"]
