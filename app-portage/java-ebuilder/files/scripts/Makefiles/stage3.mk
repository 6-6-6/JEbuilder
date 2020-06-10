.PHONY: stage3 clean-stage3

stage3: ${STAGE3_MAKEFILE} ${PRE_STAGE3_CACHE}
	make -f ${STAGE3_MAKEFILE} all -j -B

clean-stage3:
	make -f ${STAGE3_MAKEFILE} clean
