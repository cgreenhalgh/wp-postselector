#!/bin/sh

[ ! -f postselector.zip ] || rm postselector.zip
cd plugins
zip -r ../postselector.zip postselector/

