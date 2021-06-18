# How to contribute

Thanks! There are tons of different programming languages & SCM's, making it difficult to develop and keep everything up
to date. We want to keep it as easy as possible to
contribute to `packagr`, so that you can automate package management for your favorite language.
There are a few guidelines that we need contributors to follow so that
we can keep on top of things.

## Getting Started

Fork, then clone the tools repos & common lib:

    $ git clone git@github.com:your-username/bumpr.git
    $ git clone git@github.com:your-username/releasr.git
    $ git clone git@github.com:your-username/publishrr.git
    $ git clone git@github.com:your-username/go-common.git

Ensure you have docker installed.

	$ docker version
	Client:
     Version:           18.06.0-ce
     API version:       1.38
     Go version:        go1.10.3
     Git commit:        0ffa825
     Built:             Wed Jul 18 19:05:26 2018
     OS/Arch:           darwin/amd64
     Experimental:      false

    Server:
     Engine:
      Version:          18.06.0-ce
      API version:      1.38 (minimum version 1.12)
      Go version:       go1.10.3
      Git commit:       0ffa825
      Built:            Wed Jul 18 19:13:46 2018
      OS/Arch:          linux/amd64
      Experimental:     true

Run the Packagr docker development environment:

    $ docker-compose up -f docker-compose.dev.yml

