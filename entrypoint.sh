#!/bin/bash

set -xe

cd "/root/rpmbuild/SOURCES"
for f in *mod*; do tar -zcf $f.tar.gz $f; done

cd "/root/rpmbuild/SPECS/"
for f in *.spec; do rpmbuild -ba $f; done

rm -rf /root/rpmbuild/SOURCES/*.tar.gz

exit 0
