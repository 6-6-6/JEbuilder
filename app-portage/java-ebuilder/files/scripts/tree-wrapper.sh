#!/bin/bash

[[ -z "${CUR_STAGE_DIR}" ]] && exit 1
[[ -z "${CONFIG}" ]] && exit 1

source ${CONFIG}

mkdir -p "${POMDIR}"
mkdir -p "${CUR_STAGE_DIR}/app-maven"

for artifact in ${SEED_DIR}/*ebuild; do
	$TSH $artifact
	[[ $? -ne 0 ]] && echo TSH returned an error
done

for art in $MAVEN_ARTS; do
	$TSH $art
	[[ $? -ne 0 ]] && echo TSH returned an error
done

