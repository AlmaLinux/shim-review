FROM --platform=linux/arm64 almalinux:8.10

COPY rpmmacros /root/.rpmmacros
COPY shim-unsigned-aarch64-15.8-2.el8.alma.1.src.rpm /
RUN rpm -ivh shim-unsigned-aarch64-15.8-2.el8.alma.1.src.rpm
RUN dnf install --releasever=8.10 -y dnf-plugins-core rpm-build almalinux-release-devel gcc-toolset-12-binutils
RUN dnf builddep -y --enablerepo=powertools --enablerepo=devel --releasever=8.10 /builddir/build/SPECS/shim-unsigned-aarch64.spec
RUN rpmbuild -bb /builddir/build/SPECS/shim-unsigned-aarch64.spec
COPY shimaa64.efi /
RUN rpm2cpio /builddir/build/RPMS/aarch64/shim-unsigned-aarch64-15.8-2.el8.alma.1.aarch64.rpm | cpio -diu
RUN ls -l /*.efi ./usr/share/shim/15.8-2.el8.alma.1/*/shim*.efi

RUN hexdump -Cv ./usr/share/shim/15.8-2.el8.alma.1/aa64/shimaa64.efi > built-aa64.hex
RUN hexdump -Cv /shimaa64.efi > orig-aa64.hex
RUN diff -u orig-aa64.hex built-aa64.hex
RUN pesign -h -P -i /usr/share/shim/15.8-2.el8.alma.1/aa64/shimaa64.efi
RUN pesign -h -P -i /shimaa64.efi
RUN /opt/rh/gcc-toolset-12/root/usr/bin/objdump -h /usr/share/shim/15.8-2.el8.alma.1/aa64/shimaa64.efi

RUN sha256sum /usr/share/shim/15.8-2.el8.alma.1/aa64/shimaa64.efi /shimaa64.efi
