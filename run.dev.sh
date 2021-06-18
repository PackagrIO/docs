#!/usr/bin/env bash -e

date
apt-get install -y ca-certificates

pushd /go/src/packagrio/bumpr/
go mod vendor
mkdir -p vendor/gopkg.in/libgit2/git2go.v25/vendor/libgit2/build/
cp /usr/local/linux/lib/pkgconfig/libgit2.pc vendor/gopkg.in/libgit2/git2go.v25/vendor/libgit2/build/libgit2.pc
. /scripts/toolchains/linux/linux-build-env.sh && go build -mod vendor -ldflags "-X main.goos=linux -X main.goarch=amd64" -o /go/bin/packagr-bumpr -tags "static" cmd/bumpr/bumpr.go
chmod +x /go/bin/packagr-bumpr
packagr-bumpr --version
popd

pushd /go/src/packagrio/releasr/
go mod vendor
mkdir -p vendor/gopkg.in/libgit2/git2go.v25/vendor/libgit2/build/
cp /usr/local/linux/lib/pkgconfig/libgit2.pc vendor/gopkg.in/libgit2/git2go.v25/vendor/libgit2/build/libgit2.pc
. /scripts/toolchains/linux/linux-build-env.sh && go build -mod vendor -ldflags "-X main.goos=linux -X main.goarch=amd64" -o /go/bin/packagr-releasr -tags "static" cmd/releasr/releasr.go
chmod +x /go/bin/packagr-releasr
packagr-releasr --version
popd

pushd /go/src/packagrio/publishr/
go mod vendor
mkdir -p vendor/gopkg.in/libgit2/git2go.v25/vendor/libgit2/build/
cp /usr/local/linux/lib/pkgconfig/libgit2.pc vendor/gopkg.in/libgit2/git2go.v25/vendor/libgit2/build/libgit2.pc
. /scripts/toolchains/linux/linux-build-env.sh && go build -mod vendor -ldflags "-X main.goos=linux -X main.goarch=amd64" -o /go/bin/packagr-publishr -tags "static" cmd/publishr/publishr.go
chmod +x /go/bin/packagr-publishr
packagr-publishr --version

popd

cd /source
# PR SPECIFIC TESTING VARS
#git fetch origin refs/pull/26/merge:pr26
#git checkout pr26
#
#export PACKAGR_SCM_PULL_REQUEST=26
#export PACKAGR_SCM_REPO_FULL_NAME=AnalogJ/golang_analogj_test
#


/run.sh
