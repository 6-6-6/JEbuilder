
${STAGE2_MAKEFILE}: ${GENTOO_CACHE}
	TARGET_MAKEFILE=$@ GENTOO_CACHE="${GENTOO_CACHE}" CONFIG="${CONFIG}" ${TSH_WRAPPER}

clean-stage1:
	rm ${STAGE2_MAKEFILE}