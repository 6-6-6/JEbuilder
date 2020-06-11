.PHONY: post-stage3 stage3 clean-stage3

stage3: ${STAGE3_MAKEFILE} ${PRE_STAGE3_CACHE}
	make -f ${STAGE3_MAKEFILE} all -j -B

post-stage3:
	cd ${MAVEN_OVERLAY_DIR}/app-maven && parallel ebuild '$$(echo {}/*.ebuild | cut -d\  -f1)' digest ::: *

clean-stage3:
	make -f ${STAGE3_MAKEFILE} clean || echo No clean defined
	rm -rf ${STAGE3_MAKEFILE} ${MAVEN_OVERLAY_DIR}/app-maven
