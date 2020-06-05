
${CACHEDIR}/gentoo.cache.raw:
	java-ebuilder --refresh-cache -t "${PORTDIR}" --cache-file $@

${CACHEDIR}/gentoo.cache: ${CACHEDIR}/gentoo.cache.raw
	${FILL_CACHE} --dst-cache $@ --src-cache $^ --LUT ${LUTFILE}

${CACHEDIR}/java.cache.raw:
	java-ebuilder --refresh-cache -t "${JAVA_OVERLAY_DIR}" --cache-file $@

${CACHEDIR}/java.cache: ${CACHEDIR}/java.cache.raw
	${FILL_CACHE} --dst-cache $@ --src-cache $^ --LUT ${LUTFILE}

${GENTOO_CACHE}: ${CACHE_TARGET}
	echo 1.0 > $@
	cat $^ >> $@

clean-cache:
	rm -rf ${CACHEDIR}/gentoo.cache.raw ${CACHEDIR}/gentoo.cache ${CACHEDIR}/java.cache.raw ${CACHEDIR}/java.cache ${GENTOO_CACHE}
