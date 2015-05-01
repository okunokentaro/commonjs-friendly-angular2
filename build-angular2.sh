#!/bin/sh
NPM_BIN=node_modules/.bin
BABEL=${NPM_BIN}/babel

${BABEL} node_modules/angular2/es6/dev --out-dir .tmp-angular2-to-es5
${BABEL} node_modules/angular2/node_modules/rtts_assert/es6 --out-dir .tmp-rtts_assert-to-es5
rm -f .tmp-rtts_assert-to-es5/es5build.js
mv node_modules/angular2 node_modules/angular2-original
mv .tmp-angular2-to-es5 node_modules/angular2
mv node_modules/angular2-original/node_modules/rtts_assert node_modules/angular2-original/node_modules/rtts_assert-original
mv .tmp-rtts_assert-to-es5 node_modules/rtts_assert
mkdir node_modules/angular2/node_modules
cp -r node_modules/angular2-original/node_modules/rx node_modules/angular2/node_modules
