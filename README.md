# Certificate Authority

This repository contains scripts for creating a root certificate
authority (CA) as well as key pairs signed by said authority.

Credit is due to the authors of the pages linked in the references section,
whose work I used to produce this repository.


## Scripts

*  `create-root-ca.bash`: Uses the configuration in `root-ca.conf` to create
   a root certificate authority keypair, which is stored in a `root-ca` folder.

*  `create-cert.bash`: Creates a key pair signed by the CA. Takes one parameter,
   a name for the certificate, which should match an existing `$name.conf` file that
   defines the parameters for (see `example.conf` for a starting point). The resultant
   files are stored in folder matching the provided name `$name`.


## References

*  [Openssl.conf Walkthru](https://www.phildev.net/ssl/opensslconf.html)
*  [IAM Roles Anywhere with an external certificate authority
](https://aws.amazon.com/blogs/security/iam-roles-anywhere-with-an-external-certificate-authority)
