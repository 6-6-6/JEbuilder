#!/bin/bash

[[ -z "${CUR_STAGE_DIR}" ]] && exit 1
[[ -z "${CONFIG}" ]] && exit 1

source ${CONFIG}

mkdir -p "${POMDIR}"
mkdir -p "${CUR_STAGE_DIR}/app-maven"

for artifact in ${SEED_DIR}/*ebuild; do
	$TSH $artifact
	[[ $? -ne 0 ]] && echo While processing $artifact, TSH returned an error && exit 1
done

for artifact in ${HANDMADE_EBUILDS}; do
	JUST_MFILL=1 $TSH $artifact
	[[ $? -ne 0 ]] && echo While processing $artifact, TSH returned an error && exit 1
done

for artifact in $MAVEN_ARTS; do
	$TSH $artifact
	[[ $? -ne 0 ]] && echo While processing $artifact, TSH returned an error && exit 1
done

