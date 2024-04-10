*******************************************************************************
### What organization or people are asking to have this signed?
*******************************************************************************
AlmaLinux OS Foundation

*******************************************************************************
### What product or service is this for?
*******************************************************************************
AlmaLinux OS 8

*******************************************************************************
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
*******************************************************************************
AlmaLinux OS is a popular RHEL compatible OS with more than 800.000 installations

*******************************************************************************
### Why are you unable to reuse shim from another distro that is already signed?
*******************************************************************************
We have our own separate certificates to distinguish from RHEL or Fedora

*******************************************************************************
### Who is the primary contact for security updates, etc.?
*******************************************************************************
- Name: Andrew Lukoshko
- Position: AlmaLinux OS Architect
- Email address: alukoshko@almalinux.org
- PGP key fingerprint: FB45 5AE4 AF07 A4E1 CC26 27A6 AFB1 408D CF15 F687
- PGP key: https://keyserver.ubuntu.com/pks/lookup?op=vindex&search=0xafb1408dcf15f687
(Key should be signed by the other security contacts, pushed to a keyserver like keyserver.ubuntu.com, and preferably have signatures that are reasonably well known in the Linux community.)

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Who is the secondary contact for security updates, etc.?
*******************************************************************************
- Name: Jack Aboutboul
- Position: AlmaLinux OS Foundation Board member and Community manager
- Email address: jack@almalinux.org
- PGP key fingerprint: 3A11 DD79 1E7D 605D 6841 B0BF D2F7 F268 6583 BD6E
- PGP key: https://keyserver.ubuntu.com/pks/lookup?op=vindex&search=0xd2f7f2686583bd6e

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Were these binaries created from the 15.8 shim release tar?
Please create your shim binaries starting with the 15.8 shim release tar file: https://github.com/rhboot/shim/releases/download/15.8/shim-15.8.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.8 and contains the appropriate gnu-efi source.

*******************************************************************************
This is the unmodified shim-15.8 release.

*******************************************************************************
### URL for a repo that contains the exact code which was built to get this binary:
*******************************************************************************
https://github.com/rhboot/shim/tree/15.8
Source rpm is: https://github.com/almalinux/shim-review/blob/master/shim-unsigned-x64-15.8-2.el8.alma.1.src.rpm
Repositories which were used: http://repo.almalinux.org/almalinux/8.9/

*******************************************************************************
### What patches are being applied and why:
*******************************************************************************
None.

*******************************************************************************
### Do you have the NX bit set in your shim? If so, is your entire boot stack NX-compatible and what testing have you done to ensure such compatibility?

See https://techcommunity.microsoft.com/t5/hardware-dev-center/nx-exception-for-shim-community/ba-p/3976522 for more details on the signing of shim without NX bit.
*******************************************************************************
No

*******************************************************************************
### If shim is loading GRUB2 bootloader what exact implementation of Secureboot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
*******************************************************************************
This is a "RHEL-like" implementation.

*******************************************************************************
### If shim is loading GRUB2 bootloader and your previously released shim booted a version of GRUB2 affected by any of the CVEs in the July 2020, the March 2021, the June 7th 2022, the November 15th 2022, or 3rd of October 2023 GRUB2 CVE list, have fixes for all these CVEs been applied?

2020 July - BootHole
Details: https://lists.gnu.org/archive/html/grub-devel/2020-07/msg00034.html
CVE-2020-10713
CVE-2020-14308
CVE-2020-14309
CVE-2020-14310
CVE-2020-14311
CVE-2020-15705
CVE-2020-15706
CVE-2020-15707
March 2021
Details: https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html
CVE-2020-14372
CVE-2020-25632
CVE-2020-25647
CVE-2020-27749
CVE-2020-27779
CVE-2021-3418 (if you are shipping the shim_lock module)
CVE-2021-20225
CVE-2021-20233
June 2022
Details: https://lists.gnu.org/archive/html/grub-devel/2022-06/msg00035.html, SBAT increase to 2
CVE-2021-3695
CVE-2021-3696
CVE-2021-3697
CVE-2022-28733
CVE-2022-28734
CVE-2022-28735
CVE-2022-28736
CVE-2022-28737
November 2022
Details: https://lists.gnu.org/archive/html/grub-devel/2022-11/msg00059.html, SBAT increase to 3
CVE-2022-2601
CVE-2022-3775
October 2023 - NTFS vulnerabilities
Details: https://lists.gnu.org/archive/html/grub-devel/2023-10/msg00028.html, SBAT increase to 4
CVE-2023-4693
CVE-2023-4692
*******************************************************************************
Yes

*******************************************************************************
### If shim is loading GRUB2 bootloader, and if these fixes have been applied, is the upstream global SBAT generation in your GRUB2 binary set to 4?
The entry should look similar to: `grub,4,Free Software Foundation,grub,GRUB_UPSTREAM_VERSION,https://www.gnu.org/software/grub/`
*******************************************************************************
NTFS module affected by CVE-2023-4692 and CVE-2023-4693 is not included into signed GRUB2 binary.
So GRUB2 SBAT generation is 3 but it's not vulnerable.

*******************************************************************************
### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
*******************************************************************************
Old shims hashes are provided to Microsoft.
Old GRUB2 builds are disallowed to boot because they have generation < 3 in SBAT.

*******************************************************************************
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?
*******************************************************************************
All mentioned upstream commits are applied.

*******************************************************************************
### Do you build your signed kernel with additional local patches? What do they do?
*******************************************************************************
No.

*******************************************************************************
### Do you use an ephemeral key for signing kernel modules?
### If not, please describe how you ensure that one kernel build does not load modules built for another kernel.
*******************************************************************************
Yes

*******************************************************************************
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
*******************************************************************************
3 certificates enrolled in vendor_db:

EV cert to sign shim MokManager, fallback binaries and fwupd (almalinux-sb-cert-1.der)
EV cert to sign grub2 and kernel (almalinux-sb-cert-2.der)
Self-signed cert to use after Jan 2025 (almalinux-sb-cert-3.der)
No allow-listed hashes in vendor_db.

*******************************************************************************
### If you are re-using a previously used (CA) certificate, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs to vendor_dbx in shim in order to prevent GRUB2 from being able to chainload those older GRUB2 binaries. If you are changing to a new (CA) certificate, this does not apply.
### Please describe your strategy.
*******************************************************************************
We don't use vendor_dbx in this build.
Old GRUB2 builds are disallowed to boot because they have generation < 3 in SBAT.

*******************************************************************************
### What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as closely as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
### If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and what the differences would be.
*******************************************************************************
This is built on a AlmaLinux OS 8.9.
The Dockerfile in this repository can be used to launch an identical buildroot.

*******************************************************************************
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
*******************************************************************************
root.log and build.log in this repo.

*******************************************************************************
### What changes were made in the distro's secure boot chain since your SHIM was last signed?
For example, signing new kernel's variants, UKI, systemd-boot, new certs, new CA, etc..
*******************************************************************************
Update shim from 15.6 to 15.8 and include new certificate.

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
a872d4a6b1ae5ed2827825a64b7c4feb792f86d1726cf178f0747e11036b7cf9  shimx64.efi
be32ae82e0b75dcee8b79c22531bb908e4ac736636ba648ae835cec8c5e8680f  shimia32.efi

*******************************************************************************
### How do you manage and protect the keys used in your SHIM?
*******************************************************************************
They're stored in an FIPS 140-2 certified HSM tokens provided by Certification Authorities.

*******************************************************************************
### Do you use EV certificates as embedded certificates in the SHIM?
*******************************************************************************
Two of included certs are EV, third is self-signed.

*******************************************************************************
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( GRUB2, fwupd, fwupdate, systemd-boot, systemd-stub, UKI(s), shim + all child shim binaries )?
### Please provide exact SBAT entries for all shim binaries as well as all SBAT binaries that shim will directly boot.
### Where your code is only slightly modified from an upstream vendor's, please also preserve their SBAT entries to simplify revocation.
If you are using a downstream implementation of GRUB2 or systemd-boot (e.g.
from Fedora or Debian), please preserve the SBAT entry from those distributions
and only append your own. More information on how SBAT works can be found
[here](https://github.com/rhboot/shim/blob/main/SBAT.md).
*******************************************************************************
```
shim:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,4,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.almalinux,3,AlmaLinux,shim,15.8,security@almalinux.org

grub2:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,3,Free Software Foundation,grub,2.02,https//www.gnu.org/software/grub/
grub.rh,2,Red Hat,grub2,2.02-150.el8,mailto:secalert@redhat.com
grub.almalinux,2,AlmaLinux,grub2,2.02-150.el8.alma.1,mail:security@almalinux.org

fwupd:
sbat,1,UEFI shim,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
fwupd-efi,1,Firmware update daemon,fwupd-efi,1.3,https://github.com/fwupd/fwupd-efi
fwupd-efi.rhel,1,Red Hat Enterprise Linux,fwupd,1.7.8,mail:secalert@redhat.com
fwupd-efi.almalinux,1,AlmaLinux,fwupd,1.7.8,mail:security@almalinux.org
```

*******************************************************************************
### If shim is loading GRUB2 bootloader, which modules are built into your signed GRUB2 image?
*******************************************************************************
all_video boot blscfg btrfs cat configfile cryptodisk echo ext2 fat font
gcry_rijndael gcry_rsa gcry_serpent gcry_sha256 gcry_twofish gcry_whirlpool
gfxmenu gfxterm gzio halt hfsplus http increment iso9660 jpeg loadenv loopback
linux lvm luks mdraid09 mdraid1x minicmd net normal part_apple part_msdos
part_gpt password_pbkdf2 png reboot regexp search search_fs_uuid search_fs_file
search_label serial sleep syslinuxcfg test tftp video xfs efi_netfs efifwsetup
efinet lsefi lsefimmap connectefi backtrace chain usb usbserial_common
usbserial_pl2303 usbserial_ftdi usbserial_usbdebug keylayouts at_keyboard

*******************************************************************************
### If you are using systemd-boot on arm64 or riscv, is the fix for [unverified Devicetree Blob loading](https://github.com/systemd/systemd/security/advisories/GHSA-6m6p-rjcq-334c) included?
*******************************************************************************
We don't sign shim for arm and don't have a risc port

*******************************************************************************
### What is the origin and full version number of your bootloader (GRUB2 or systemd-boot or other)?
*******************************************************************************
RHEL 8 downstream, 2.02-150.el8.alma.1
https://repo.almalinux.org/vault/8.9/BaseOS/Source/Packages/grub2-2.02-150.el8.alma.1.src.rpm

*******************************************************************************
### If your SHIM launches any other components, please provide further details on what is launched.
*******************************************************************************
It also launches fwupd.

*******************************************************************************
### If your GRUB2 or systemd-boot launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
*******************************************************************************
grub2 verifies signatures on booted kernels via shim.
fwupd does not include code to launch other binaries, it can only load UEFI updates.

*******************************************************************************
### How do the launched components prevent execution of unauthenticated code?
*******************************************************************************
grub2 verifies signatures on booted kernels via shim.
fwupd does not include code to launch other binaries, it can only load UEFI updates.

*******************************************************************************
### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB2)?
*******************************************************************************
No
*******************************************************************************
### What kernel are you using? Which patches does it includes to enforce Secure Boot?
*******************************************************************************
It's RHEL8 kernel based on 4.18.0, plus a full compliment of patches for Secure Boot and relevant bug fixes.

*******************************************************************************
### Add any additional information you think we may need to validate this shim.
*******************************************************************************
Previous reviews:
shim-15.5: rhboot#235
shim-15.6: rhboot#250
