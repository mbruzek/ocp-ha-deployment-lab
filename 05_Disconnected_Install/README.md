# Disconnected install lab

In a disconnected environment, the installer and applications have access to all
of the required components of their services, without requiring access to the
Internet.

A disconnected install usually occurs in a private network environment dedicated
to the cluster. Other networks dedicated to particular purposes access the
private network in a highly specified, regulated, and audited manner. Typical
networks in a highly secure architecture are likely to include separate networks
for general operations, application access, cluster management, development,
storage, etc.

You need to make sure the right stuff is downloaded before you get to the
customer location:  

* container images
* repositories
* packages (RPMs)
* random artifacts (certificates, etc)
* dependencies to get everything installed

OCP uses several containerized components. Normally these images are pulled
directly from Red Hat's container registry (registry.access.redhat.com). This
is not possible in disconnected environments.

Need to provide the container images in a disconnected environment:  

* Export the container images from the registry using skopeo or docker commands
* Save the storage to a medium (USB device)
* Import the container images into the private registry using `docker load`
