
${CACHEDIR}/gentoo.cache.raw:
	java-ebuilder --refresh-cache -t "${PORTDIR}" --cache-file $@

${CACHEDIR}/gentoo.cache: ${CACHEDIR}/gentoo.cache.raw
	${FILL_CACHE} --dst-cache $@ --src-cache $^ --LUT ${LUTFILE}

${CACHEDIR}/java.cache.raw:
	java-ebuilder --refresh-cache -t "${JAVA_OVERLAY_DIR}" --cache-file $@

${CACHEDIR}/java.cache: ${CACHEDIR}/java.cache.raw
	${FILL_CACHE} --dst-cache $@ --src-cache $^ --LUT ${LUTFILE}
	
${PRE_STAGE1_CACHE}: ${CACHE_TARGET}
	echo 1.0 > $@
	cat $^ >> $@

${STAGE2_CACHE}: ${STAGE2_MAKEFILE}
	make -f "$^" all -j
	java-ebuilder --refresh-cache -t "${MAVEN_OVERLAY_DIR}" --cache-file $@
	
${PRE_STAGE3_CACHE}: ${STAGE2_CACHE} ${CACHE_TARGET}
	cat $^ > $@

clean-cache:
	rm -rf ${CACHEDIR}/*
