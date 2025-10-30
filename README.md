*******************************************************************************
### What organization or people are asking to have this signed?
*******************************************************************************
Organization name and website:  
AlmaLinux OS Foundation
https://almalinux.org

*******************************************************************************
### What's the legal data that proves the organization's genuineness?
The reviewers should be able to easily verify, that your organization is a legal entity, to prevent abuse.
Provide the information, which can prove the genuineness with certainty.
*******************************************************************************
Company/tax register entries or equivalent:  
(a link to the organization entry in your jurisdiction's register will do)  

AlmaLinux OS Foundation, Tax ID 86-2791864  
https://apps.irs.gov/app/eos/ (enter 86-2791864 to Search Term field) 

The public details of both your organization and the issuer in the EV certificate used for signing .cab files at Microsoft Hardware Dev Center File Signing Services.  
(**not** the CA certificate embedded in your shim binary)

Example:

```
Issuer: O=MyIssuer, Ltd., CN=MyIssuer EV Code Signing CA
Subject: C=XX, O=MyCompany, Inc., CN=MyCompany, Inc.
```

```
Issuer: C=GB, O=Sectigo Limited, CN=Sectigo Public Code Signing CA EV R36
Subject: serialNumber=F21000001730, jurisdictionC=US, jurisdictionST=Florida, businessCategory=Private Organization, C=US, ST=Florida, O=Almalinux OS Foundation, CN=Almalinux OS Foundation
```

*******************************************************************************
### What product or service is this for?
*******************************************************************************
AlmaLinux OS 9

*******************************************************************************
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
*******************************************************************************
AlmaLinux OS is a popular RHEL compatible OS with more than 1.8M installations

*******************************************************************************
### Why are you unable to reuse shim from another distro that is already signed?
*******************************************************************************
We have our own separate certificates to distinguish from RHEL or Fedora

*******************************************************************************
### Who is the primary contact for security updates, etc.?
The security contacts need to be verified before the shim can be accepted. For subsequent requests, contact verification is only necessary if the security contacts or their PGP keys have changed since the last successful verification.

An authorized reviewer will initiate contact verification by sending each security contact a PGP-encrypted email containing random words.
You will be asked to post the contents of these mails in your `shim-review` issue to prove ownership of the email addresses and PGP keys.
*******************************************************************************
- Name: Andrew Lukoshko
- Position: AlmaLinux OS Architect
- Email address: alukoshko@almalinux.org
- PGP key fingerprint: FB45 5AE4 AF07 A4E1 CC26 27A6 AFB1 408D CF15 F687
- PGP key: https://keyserver.ubuntu.com/pks/lookup?op=vindex&search=0xafb1408dcf15f687

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
### Were these binaries created from the 16.1 shim release tar?
Please create your shim binaries starting with the 16.1 shim release tar file: https://github.com/rhboot/shim/releases/download/16.1/shim-16.1.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/16.1 and contains the appropriate gnu-efi source.

Make sure the tarball is correct by verifying your download's checksum
(SHA256, SHA512) with the following ones:

```
46319cd228d8f2c06c744241c0f342412329a7c630436fce7f82cf6936b1d603  shim-16.1.tar.bz2
ca5f80e82f3b80b622028f03ef23105c98ee1b6a25f52a59c823080a3202dd4b9962266489296e99f955eb92e36ce13e0b1d57f688350006bba45f2718f159fb  shim-16.1.tar.bz2
```

Make sure that you've verified that your build process uses that file
as a source of truth (excluding external patches) and its checksum
matches. You can also further validate the release by checking the PGP
signature: there's [a detached
signature](https://github.com/rhboot/shim/releases/download/16.1/shim-16.1.tar.bz2.asc)

The release is signed by the maintainer Peter Jones - his master key
has the fingerprint `B00B48BC731AA8840FED9FB0EED266B70F4FEF10` and the
signing sub-key in the signature here has the fingerprint
`02093E0D19DDE0F7DFFBB53C1FD3F540256A1372`. A copy of his public key
is included here for reference:
[pjones.asc](https://github.com/rhboot/shim-review/blob/main/pjones.asc)

Once you're sure that the tarball you are using is correct and
authentic, please confirm this here with a simple *yes*.

A short guide on verifying public keys and signatures should be available in the [docs](./docs/) directory.
*******************************************************************************
Yes

*******************************************************************************
### URL for a repo that contains the exact code which was built to result in your binary:
Hint: If you attach all the patches and modifications that are being used to your application, you can point to the URL of your application here (*`https://github.com/YOUR_ORGANIZATION/shim-review`*).

You can also point to your custom git servers, where the code is hosted.
*******************************************************************************
Source rpms are:  
https://github.com/AlmaLinux/shim-review/blob/shim-16.1/shim-unsigned-x64-16.1-1.el9.alma.1.src.rpm  
https://github.com/AlmaLinux/shim-review/blob/shim-16.1/shim-unsigned-aarch64-16.1-2.el9.alma.1.src.rpm

Repositories which were used to build: http://repo.almalinux.org/almalinux/9.6/

*******************************************************************************
### What patches are being applied and why:
Mention all the external patches and build process modifications, which are used during your building process, that make your shim binary be the exact one that you posted as part of this application.
*******************************************************************************
None

*******************************************************************************
### Do you have the NX bit set in your shim? If so, is your entire boot stack NX-compatible and what testing have you done to ensure such compatibility?

See https://techcommunity.microsoft.com/t5/hardware-dev-center/nx-exception-for-shim-community/ba-p/3976522 for more details on the signing of shim without NX bit.
*******************************************************************************
No

*******************************************************************************
### What exact implementation of Secure Boot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
Skip this, if you're not using GRUB2.
*******************************************************************************
This is a "RHEL-like" implementation

*******************************************************************************
### Do you have fixes for all the following GRUB2 CVEs applied?
**Skip this, if you're not using GRUB2, otherwise make sure these are present and confirm with _yes_.**

* 2020 July - BootHole
  * Details: https://lists.gnu.org/archive/html/grub-devel/2020-07/msg00034.html
  * CVE-2020-10713
  * CVE-2020-14308
  * CVE-2020-14309
  * CVE-2020-14310
  * CVE-2020-14311
  * CVE-2020-15705
  * CVE-2020-15706
  * CVE-2020-15707
* March 2021
  * Details: https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html
  * CVE-2020-14372
  * CVE-2020-25632
  * CVE-2020-25647
  * CVE-2020-27749
  * CVE-2020-27779
  * CVE-2021-3418 (if you are shipping the shim_lock module)
  * CVE-2021-20225
  * CVE-2021-20233
* June 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-06/msg00035.html, SBAT increase to 2
  * CVE-2021-3695
  * CVE-2021-3696
  * CVE-2021-3697
  * CVE-2022-28733
  * CVE-2022-28734
  * CVE-2022-28735
  * CVE-2022-28736
  * CVE-2022-28737
* November 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-11/msg00059.html, SBAT increase to 3
  * CVE-2022-2601
  * CVE-2022-3775
* October 2023 - NTFS vulnerabilities
  * Details: https://lists.gnu.org/archive/html/grub-devel/2023-10/msg00028.html, SBAT increase to 4
  * CVE-2023-4693
  * CVE-2023-4692
*******************************************************************************
Yes

*******************************************************************************
### If shim is loading GRUB2 bootloader, and if these fixes have been applied, is the upstream global SBAT generation in your GRUB2 binary set to 4?
Skip this, if you're not using GRUB2, otherwise do you have an entry in your GRUB2 binary similar to:  
`grub,4,Free Software Foundation,grub,GRUB_UPSTREAM_VERSION,https://www.gnu.org/software/grub/`?
*******************************************************************************

It is grub,3 in the latest public released AlmaLinux 9 GRUB2 errata version 2.06-104, this version however addresses all SecureBoot CVE fixes up to SBAT level 5.

In the upcoming AlmaLinux 9.7 release GRUB2 will be updated to the newer package version with .sbat metadata 'grub,5'.

*******************************************************************************
### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
If you had no previous signed shim, say so here. Otherwise a simple _yes_ will do.
*******************************************************************************
Yes

*******************************************************************************
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?
Hint: upstream kernels should have all these applied, but if you ship your own heavily-modified older kernel version, that is being maintained separately from upstream, this may not be the case.  
If you are shipping an older kernel, double-check your sources; maybe you do not have all the patches, but ship a configuration, that does not expose the issue(s).
*******************************************************************************
All mentioned upstream commits are applied.

*******************************************************************************
### How does your signed kernel enforce lockdown when your system runs
### with Secure Boot enabled?
Hint: If it does not, we are not likely to sign your shim.
*******************************************************************************
All of the following commits are present:

```
475fb4e8b2f4444d1d7b406ff3a7d21bc89a1e6f
1957a85b0032a81e6482ca4aab883643b8dae06e
612bd01fc6e04c3ce9eb59587b4a7e4ebd6aff35
75b0cea7bf307f362057cc778efe89af4c615354
435d1a471598752446a72ad1201b3c980526d869
```

The configuration setting `CONFIG_EFI_CUSTOM_SSDT_OVERLAYS` is enabled, but since `1957a85b0032a81e6482ca4aab883643b8dae06e` is present, this is disabled when lockdown is on, as it is when Secure Boot is enabled.

*******************************************************************************
### Do you build your signed kernel with additional local patches? What do they do?
*******************************************************************************
No, we're following RHEL kernel.

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

1. EV cert to sign shim MokManager, fallback binaries and fwupd (almalinux-sb-cert-1.der; expired, but we keep it for smooth shim updates and compatibility with previously signed binaries)
2. EV cert to sign grub2 and kernel (almalinux-sb-cert-2.der; expired, but we keep it for smooth shim updates and compatibility with previously signed binaries)
3. Self-signed cert we're using after Jan 2025 (almalinux-sb-cert-3.der)

No allow-listed hashes in vendor_db.

*******************************************************************************
### If you are re-using the CA certificate from your last shim binary, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs mentioned earlier to vendor_dbx in shim. Please describe your strategy.
This ensures that your new shim+GRUB2 can no longer chainload those older GRUB2 binaries with issues.

If this is your first application or you're using a new CA certificate, please say so here.
*******************************************************************************
We don't use vendor_dbx in this build.
Old GRUB2 builds are disallowed to boot because they have generation < 3 in SBAT.

*******************************************************************************
### Is the Dockerfile in your repository the recipe for reproducing the building of your shim binary?
A reviewer should always be able to run ` build .` to get the exact binary you attached in your application.

Hint: Prefer using *frozen* packages for your toolchain, since an update to GCC, binutils, gnu-efi may result in building a shim binary with a different checksum.

If your shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case, what the differences would be and what build environment (OS and toolchain) is being used to reproduce this build? In this case please write a detailed guide, how to setup this build environment from scratch.
*******************************************************************************
This is built on a AlmaLinux OS 9.6.
`Dockerfile.x86_64` and `Dockerfile.aarch64` in this repository can be used to launch an identical buildroot.
```
docker build . -f Dockerfile.x86_64 --progress plain
docker build . -f Dockerfile.aarch64 --progress plain
```

*******************************************************************************
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
*******************************************************************************
root.x86_64.log, root.aarch64.log, build.x86_64.log, and build.aarch64.log in this repo.

*******************************************************************************
### What changes were made in the distro's secure boot chain since your SHIM was last signed?
For example, signing new kernel's variants, UKI, systemd-boot, new certs, new CA, etc..

Skip this, if this is your first application for having shim signed.
*******************************************************************************
Update shim from 15.8 to 16.1

*******************************************************************************
### What is the SHA256 hash of your final shim binary?
*******************************************************************************
```
e3ad85531d00f99770ce541dfceb47ba0a2a82b3da0b14fff573ba823987f34c  shimaa64.efi
d3719c40f006a6b4521f3d56506fa7eeb8043809a5d74b2e85749094fafcf730  shimx64.efi
```

*******************************************************************************
### How do you manage and protect the keys used in your shim?
Describe the security strategy that is used for key protection. This can range from using hardware tokens like HSMs or Smartcards, air-gapped vaults, physical safes to other good practices.
*******************************************************************************
They're stored in an FIPS 140-2 certified HSM tokens provided by Certification Authorities.

*******************************************************************************
### Do you use EV certificates as embedded certificates in the shim?
A _yes_ or _no_ will do. There's no penalty for the latter.
*******************************************************************************
Two of included certs are EV, third is self-signed.

*******************************************************************************
### Are you embedding a CA certificate in your shim?
A _yes_ or _no_ will do. There's no penalty for the latter. However,
if _yes_: does that certificate include the X509v3 Basic Constraints
to say that it is a CA? See the [docs](./docs/) for more guidance
about this.
*******************************************************************************
Yes to both.

*******************************************************************************
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( GRUB2, fwupd, fwupdate, systemd-boot, systemd-stub, shim + all child shim binaries )?
### Please provide the exact SBAT entries for all binaries you are booting directly through shim.
Hint: The history of SBAT and more information on how it works can be found [here](https://github.com/rhboot/shim/blob/main/SBAT.md). That document is large, so for just some examples check out [SBAT.example.md](https://github.com/rhboot/shim/blob/main/SBAT.example.md)

If you are using a downstream implementation of GRUB2 (e.g. from Fedora or Debian), make sure you have their SBAT entries preserved and that you **append** your own (don't replace theirs) to simplify revocation.

**Remember to post the entries of all the binaries. Apart from your bootloader, you may also be shipping e.g. a firmware updater, which will also have these.**

Hint: run `objcopy --only-section .sbat -O binary YOUR_EFI_BINARY /dev/stdout` to get these entries. Paste them here. Preferably surround each listing with three backticks (\`\`\`), so they render well.
*******************************************************************************
```
shim:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,4,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.almalinux,3,AlmaLinux,shim,16.1,security@almalinux.org

grub2:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,3,Free Software Foundation,grub,2.06,https//www.gnu.org/software/grub/
grub.rh,2,Red Hat,grub2,2.06-104.el9_6,mailto:secalert@redhat.com
grub.almalinux,2,AlmaLinux,grub2,2.06-104.el9_6.alma.1,mailto:security@almalinux.org

fwupd:
sbat,1,UEFI shim,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
fwupd-efi,1,Firmware update daemon,fwupd-efi,1.4,https://github.com/fwupd/fwupd-efi
fwupd-efi.rhel,1,Red Hat Enterprise Linux,fwupd,1.9.26,mail:secalert@redhat.com
fwupd-efi.almalinux,1,AlmaLinux,fwupd,1.9.26,mail:security@almalinux.org

kernel-uki-virt:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
linux,1,Red Hat,linux,5.14.0-570.55.1.el9_6.x86_64,mailto:secalert@redhat.com
linux,1,AlmaLinux,linux,5.14.0-570.55.1.el9_6.x86_64,mailto:security@almalinux.org
linux.rhel,1,Red Hat,linux,5.14.0-570.55.1.el9_6.x86_64,mailto:secalert@redhat.com
linux.almalinux,1,AlmaLinux,linux,5.14.0-570.55.1.el9_6.x86_64,mailto:security@almalinux.org
kernel-uki-virt.rhel,1,Red Hat,kernel-uki-virt,5.14.0-570.55.1.el9_6.x86_64,mailto:secalert@redhat.com
kernel-uki-virt.almalinux,1,AlmaLinux,kernel-uki-virt,5.14.0-570.55.1.el9_6.x86_64,mailto:security@almalinux.org
systemd,1,The systemd Developers,systemd,252,https://systemd.io/
systemd.rhel,1,Red Hat Enterprise Linux,systemd,252-51.el9_6.2,mailto:secalert@redhat.com
systemd.almalinux,1,AlmaLinux,systemd,252-51.el9_6.2.alma.2,mailto:security@almalinux.org
```

*******************************************************************************
### If shim is loading GRUB2 bootloader, which modules are built into your signed GRUB2 image?
Skip this, if you're not using GRUB2.

Hint: this is about those modules that are in the binary itself, not the `.mod` files in your filesystem.
*******************************************************************************
all_video boot blscfg btrfs cat configfile cryptodisk echo ext2 fat font gcry_rijndael gcry_rsa gcry_serpent gcry_sha256 gcry_twofish gcry_whirlpool gfxmenu gfxterm gzio halt hfsplus http increment iso9660 jpeg loadenv loopback linux lvm luks mdraid09 mdraid1x minicmd net normal part_apple part_msdos part_gpt password_pbkdf2 png reboot regexp search search_fs_uuid search_fs_file search_label serial sleep syslinuxcfg test tftp video xfs efi_netfs efifwsetup efinet lsefi lsefimmap connectefi backtrace chain usb usbserial_common usbserial_pl2303 usbserial_ftdi usbserial_usbdebug keylayouts at_keyboard

*******************************************************************************
### If you are using systemd-boot on arm64 or riscv, is the fix for [unverified Devicetree Blob loading](https://github.com/systemd/systemd/security/advisories/GHSA-6m6p-rjcq-334c) included?
*******************************************************************************
Yes

*******************************************************************************
### What is the origin and full version number of your bootloader (GRUB2 or systemd-boot or other)?
*******************************************************************************
RHEL9 GRUB: grub2-2.06-104.el9_6.alma.1  
https://vault.almalinux.org/9.6/BaseOS/Source/Packages/grub2-2.06-104.el9_6.alma.1.src.rpm


*******************************************************************************
### If your shim launches any other components apart from your bootloader, please provide further details on what is launched.
Hint: The most common case here will be a firmware updater like fwupd.
*******************************************************************************
It also launches fwupd and a systemd-stub UKI. sbat details are above.

*******************************************************************************
### If your GRUB2 or systemd-boot launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
Skip this, if you're not using GRUB2 or systemd-boot.
*******************************************************************************
grub2 verifies signatures on booted kernels via shim. fwupd does not include code to launch other binaries, it can only load UEFI Capsule updates.

*******************************************************************************
### How do the launched components prevent execution of unauthenticated code?
Summarize in one or two sentences, how your secure bootchain works on higher level.
*******************************************************************************
Everything has secure boot validation and and .sbat self checks.

*******************************************************************************
### Does your shim load any loaders that support loading unsigned kernels (e.g. certain GRUB2 configurations)?
*******************************************************************************
No.

*******************************************************************************
### What kernel are you using? Which patches and configuration does it include to enforce Secure Boot?
*******************************************************************************
Currently it's RHEL's kernel-5.14.0-570.55.1.el9_6. It has all the necessary patches.  
Sources:  
https://vault.almalinux.org/9.6/BaseOS/Source/Packages/kernel-5.14.0-570.55.1.el9_6.src.rpm
https://git.almalinux.org/almalinux/kernel/src/branch/a9

*******************************************************************************
### What contributions have you made to help us review the applications of other applicants?
The reviewing process is meant to be a peer-review effort and the best way to have your application reviewed faster is to help with reviewing others. We are in most cases volunteers working on this venue in our free time, rather than being employed and paid to review the applications during our business hours. 

A reasonable timeframe of waiting for a review can reach 2-3 months. Helping us is the best way to shorten this period. The more help we get, the faster and the smoother things will go.

For newcomers, the applications labeled as [*easy to review*](https://github.com/rhboot/shim-review/issues?q=is%3Aopen+is%3Aissue+label%3A%22easy+to+review%22) are recommended to start the contribution process.
*******************************************************************************
None yet, sorry.

*******************************************************************************
### Add any additional information you think we may need to validate this shim signing application.
*******************************************************************************
Previous reviews:  
shim-15.5: rhboot#235  
shim-15.6: rhboot#250  
shim-15.8: rhboot#407  
shim-15.8 aa64: rhboot#432  
