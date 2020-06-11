
include environment.mk
include cache.mk
include stage1.mk
include stage2.mk
include stage3.mk

#include ${STAGE2_MAKEFILE}

.PHONY: stage3 clean

all: stage3

clean: clean-cache clean-stage1 clean-stage2 clean-stage3
