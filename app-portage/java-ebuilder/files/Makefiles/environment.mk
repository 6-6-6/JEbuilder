#

# determine EROOT
EROOT=$(shell python -c "import portage;print(portage.root)")

# java-ebuilder.conf
CONFIG?=${EROOT}/etc/java-ebuilder.conf
include ${CONFIG}

# shells
TSH=${EROOT}/usr/lib/java-ebuilder/tree.sh
TSH_WRAPPER=${EROOT}/usr/lib/java-ebuilder/tree-wrapper.sh
FILL_CACHE=${EROOT}/usr/lib/java-ebuilder/LUT/fill_cache

# stage
STAGE1_DIR?=${EROOT}/var/lib/java-ebuilder/stage1/
STAGE2_GENERATOR?=${EROOT}/usr/lib/java-ebuilder/tree.sh
STAGE2_MAKEFILE?=/tmp/maven.mk

# PORTAGE REPOS
## portage di
NULLDIR=$(shell portageq get_repo_path ${EROOT} wxxwswddadafef22SA)
PORTDIR?=$(shell portageq get_repo_path ${EROOT} gentoo)
JAVA_OVERLAY_DIR?=$(shell portageq get_repo_path ${EROOT} java-overlay)

# cache
LUTFILE?=${EROOT}/usr/lib/java-ebuilder/LUT/LUT
GENTOO_CACHE?=${CACHEDIR}/gentoo-cache
ifneq (${PORTDIR}, ${NULLDIR})
	CACHE_TARGET+=${CACHEDIR}/gentoo.cache
endif
ifneq (${JAVA_OVERLAY_DIR}, ${NULLDIR})
	CACHE_TARGET+=${CACHEDIR}/java.cache
endif


