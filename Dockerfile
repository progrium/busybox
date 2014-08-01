FROM       scratch
MAINTAINER Jeff Lindsay <progrium@gmail.com>

ADD ./rootfs.tar   /
ADD ./opkg.conf    /etc/opkg.conf
ADD ./opkg-install /usr/bin/opkg-install
RUN opkg-cl -f /etc/opkg.conf install http://downloads.openwrt.org/snapshots/trunk/x86/packages/base/libgcc_4.8-linaro-1_x86.ipk
RUN opkg-cl -f /etc/opkg.conf install http://downloads.openwrt.org/snapshots/trunk/x86/packages/base/libc_0.9.33.2-1_x86.ipk

CMD ["/bin/sh"]
