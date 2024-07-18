Confirm the following are included in your repo, checking each box:

 - [X] completed README.md file with the necessary information
 - [X] shim.efi to be signed
 - [X] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [X] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [X] any extra patches to shim via your own git tree or as files
 - [X] any extra patches to grub via your own git tree or as files
 - [X] build logs
 - [X] a Dockerfile to reproduce the build of the provided shim EFI binaries

*******************************************************************************
### What is the link to your tag in a repo cloned from rhboot/shim-review?
*******************************************************************************
`https://github.com/AlmaLinux/shim-review/tree/almalinux-8-shim-aarch64-20240718`

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
```
1b3142f0c76df4942088fda2b2e4693d3d727893db2a7aaf5eb6fcefaec51b7a  shimaa64.efi
```

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
 - shim-15.5: rhboot#235
 - shim-15.6: rhboot#250
 - shim-15.8: rhboot#407

*******************************************************************************
### If no security contacts have changed since verification, what is the link to your request, where they've been verified (if any, otherwise N/A)?
*******************************************************************************
 - rhboot#250
