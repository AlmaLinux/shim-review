-------------------------------------------------------------------------------
### What organization or people are asking to have this signed?
-------------------------------------------------------------------------------
AlmaLinux OS Foundation

-------------------------------------------------------------------------------
### What product or service is this for?
-------------------------------------------------------------------------------
AlmaLinux OS 8

-------------------------------------------------------------------------------
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
-------------------------------------------------------------------------------
AlmaLinux OS is a popular 1:1 binary compatible clone of RHEL with more than 100.000 installations

-------------------------------------------------------------------------------
### Who is the primary contact for security updates, etc.?
-------------------------------------------------------------------------------
- Name: Andrew Lukoshko
- Position: AlmaLinux OS Architect
- Email address: alukoshko@almalinux.org
- PGP key fingerprint: FB45 5AE4 AF07 A4E1 CC26 27A6 AFB1 408D CF15 F687
- PGP key: https://github.com/AlmaLinux/shim-review/raw/main/alukoshko.pub

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

-------------------------------------------------------------------------------
### Who is the secondary contact for security updates, etc.?
-------------------------------------------------------------------------------
- Name: Jack Aboutboul
- Position: AlmaLinux OS Foundation Board member and Community manager
- Email address: jack@almalinux.org
- PGP key fingerprint: 3A11 DD79 1E7D 605D 6841 B0BF D2F7 F268 6583 BD6E
- PGP key: https://github.com/AlmaLinux/shim-review/raw/main/jaboutboul.pub

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

-------------------------------------------------------------------------------
### Please create your shim binaries starting with the 15.4 shim release tar file: https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2
### This matches https://github.com/rhboot/shim/releases/tag/15.4 and contains the appropriate gnu-efi source.
-------------------------------------------------------------------------------
This is the unmodified shim-15.5 release.

-------------------------------------------------------------------------------
### URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
https://github.com/rhboot/shim/tree/15.5  
Source rpm is: https://github.com/AlmaLinux/shim-review/blob/main/shim-unsigned-x64-15.5-1.el8.alma.src.rpm  
Repos for build deps etc are: http://repo.almalinux.org/almalinux/8/

-------------------------------------------------------------------------------
### What patches are being applied and why:
-------------------------------------------------------------------------------
None.

-------------------------------------------------------------------------------
### If bootloader, shim loading is, GRUB2: is CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749, CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713, CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705, and if you are shipping the shim_lock module CVE-2021-3418
-------------------------------------------------------------------------------
This is our first submission so cert this shim trusts has never been used to
build any grub2 or kernel with these vulnerabilities.

-------------------------------------------------------------------------------
### What exact implementation of Secureboot in GRUB2 ( if this is your bootloader ) you have ?
### * Upstream GRUB2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?
-------------------------------------------------------------------------------
This is a "RHEL-like" implementation.

-------------------------------------------------------------------------------
### If bootloader, shim loading is, GRUB2, and previous shims were trusting affected by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749, CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713, CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705, and if you were shipping the shim_lock module CVE-2021-3418 ( July 2020 grub2 CVE list + March 2021 grub2 CVE list ) grub2:
* were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update ?
* Does your new chain of trust disallow booting old, affected by CVE-2020-14372,
  CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2 builds ?
-------------------------------------------------------------------------------
This is our first submission so no old grub2 binaries allowed.

-------------------------------------------------------------------------------
### If your boot chain of trust includes a linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
-------------------------------------------------------------------------------
All of the following commits are present:

475fb4e8b2f4444d1d7b406ff3a7d21bc89a1e6f 1957a85b0032a81e6482ca4aab883643b8dae06e 612bd01fc6e04c3ce9eb59587b4a7e4ebd6aff35 75b0cea7bf307f362057cc778efe89af4c615354 435d1a471598752446a72ad1201b3c980526d869

And the configuration setting CONFIG_EFI_CUSTOM_SSDT_OVERLAYS is disabled.

-------------------------------------------------------------------------------
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
-------------------------------------------------------------------------------
2 certificates enrolled in vendor_db:

* EV cert to sign shim MokManager, fallback binaries and fwupd
* EV cert to sign grub2 and kernel

No allow-listed hashes in vendor_db.

-------------------------------------------------------------------------------
### If you are re-using a previously used (CA) certificate, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs to vendor_dbx in shim in order to prevent GRUB2 from being able to chainload those older GRUB2 binaries. If you are changing to a new (CA) certificate, this does not apply.
### Please describe your strategy.
-------------------------------------------------------------------------------
We don't use vendor_dbx in this build

-------------------------------------------------------------------------------
### What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as closely as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
### If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and what the differences would be.
-------------------------------------------------------------------------------
This is built on a AlmaLinux OS 8.5. The Dockerfile in this repository can be used to launch an identical buildroot.

-------------------------------------------------------------------------------
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.

-------------------------------------------------------------------------------
root.log and build.log in this repo.

-------------------------------------------------------------------------------
### Add any additional information you think we may need to validate this shim.
-------------------------------------------------------------------------------
