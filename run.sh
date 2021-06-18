#!/usr/bin/env bash -e

pushd /source
# For testing (create fake commit)
#git config --global user.email "you@example.com"
#git config --global user.name "Your Name"
#
#echo " 1 " >> README.md
#git add README.md
#git commit -am "fake work"


packagr-bumpr start --scm github --package_type golang
go build -o golang_analogj_test cmd/test.go
packagr-releasr start --scm github --package_type golang
packagr-publishr start --scm github --package_type golang --upload_artifact golang_analogj_test
