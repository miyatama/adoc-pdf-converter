#!/bin/bash

set -e 

echo "start convert"

cd data
test ! -e ./output && mkdir output 
TARGETS=(`find /data -name *.adoc | awk '{ printf("%s ", $0); }'`)
for TARGET in "${TARGETS[@]}" ;
do
  echo "${TARGET}"
  TARGET_DIR=`dirname ${TARGET}`
  TARGET_BASENAME=`basename ${TARGET}`
  OUTPUT_DIR=output/${TARGET_DIR}
  ADOCHTML=`echo "${TARGET_BASENAME}" | sed -e 's/\(.*\)\.adoc$/\1\.html/g'`
  TARGET_PDFNAME=`echo "${TARGET_BASENAME}" | sed -e 's/\(.*\)\.adoc$/\1\.pdf/g'`

  mkdir -p ./${OUTPUT_DIR}
  asciidoctor ${TARGET}
  mv ${TARGET_DIR}/${ADOCHTML} ./${OUTPUT_DIR}/${ADOCHTML}
  chrome --headless --disable-gpu --no-sandbox --print-to-pdf file:///data/./${OUTPUT_DIR}/${ADOCHTML}
  mv output.pdf ./${OUTPUT_DIR}/${TARGET_PDFNAME}
  rm ./${OUTPUT_DIR}/${ADOCHTML}
done 

echo "finish"
