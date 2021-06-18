# Packagr

<p align="center">
  <a href="https://github.com/PackagrIO/docs">
  <img width="300" alt="portfolio_view" src="https://github.com/PackagrIO/docs/raw/master/images/logo/banner-black.png">
  </a>
</p>


Packagr is a series of small, language-agnostic, dependency-free, composable tools that let  you package and release
artifacts and libraries written in any language.

Its goal is to bring automation to the packaging and deployment stage of your library release cycle.
Packagr is incredibly flexible, and works best when implemented within a CI/CD pipeline (Github Actions, Jenkins, CircleCI, Travis, etc)

# Why use Packagr

At first glance, it seems simple to publish a new library version. Just bump the version number and publish, right? Well, not always:

- If your library includes a Gemfile.lock, Berksfile.lock or other common lock files, you'll need to regenerate them as the old version number is embedded inside.
- Everyone runs their library unit tests before creating a new release (right?!), but what about validating that your library dependencies exist (maybe in your Company's private repo)?
- How about linting your source, to ensure that it follows common/team conventions?
- Who owns the gem? Is there one developer who has the credentials to push to RubyGems.org? Are they still on your team/on vacation?
- Did you remember to tag your source when the new version was created (making it easy to determine what's changed between versions?)
- Did you update your changelog?

Packagr handles all of that (and more!) for you. It pretty much guarantees that your library will have proper and consistent releases every time. Packagr is well structured, flexible and fully tested, unlike the release scripts you've manually cobbled together for each library and language. It can be customized as needed without rewriting from scratch. The best part is that Packagr uses Packagr to automate its releases. We dogfood it so we're the first ones to find any issues with a new release.

# Tools

- [Bumpr](https://github.com/PackagrIO/bumpr) - is a tool to bump version files using SemVer. It natively understands metadata/version files for multiple languages and packaging specs.
- [Releasr](https://github.com/PackagrIO/releasr) - is a tool for committing local changes & creating a tag. Natively understands metadata/version files for multiple languages, and will use the provided SemVer for tagging. (Nothing is pushed to the origin)
- [Publishr](https://github.com/PackagrIO/publishr) - is a tool for publishing changes. It will push git changes to your SCM, uploads packages to your language package index (RubyGems/PyPi/Supermarket, etc). It will also create a Github Release with a Changelog & attached artifacts.
- [Dependr]() - **coming soon.** a tool that will download your dependencies. Wraps native dependency managers, but provides consistent automation around lockfile management.
- [Formattr]() - **coming soon.** a tool that will lint (and optionally format) your source code according to (customizable) language specific best-practices.


# How do I start?

You can use Packagr to automate creating a new release from a pull request or from the latest code on your default branch.

## Automated pull request processing:

Here's how to use __docker__ to merge a pull request to your Ruby library

```bash
# git clone your repo, and checkout the branch specified in your PR.

docker run --rm -it \
-e PACKAGR_SCM_GITHUB_ACCESS_TOKEN=123456789ABCDEF \
-e PACKAGR_SCM_PULL_REQUEST=4 \
-e PACKAGR_SCM_REPO_FULL_NAME=AnalogJ/ruby_analogj_test \
-e PACKAGR_RUBYGEMS_API_KEY=ASDF12345F \
-v path/to/git/repo
ghcr.io/packagrio/packagr:latest-ruby

packagr-bumpr start --scm github --package_type ruby
packagr-releasr start --scm github --package_type ruby
packagr-publishr start --scm github --package_type ruby # optionally attach the gem to your github release using '--upload-artifact='
```


Or you could download the latest linux [release](https://github.com/AnalogJ/capsulecd/releases), and call CapsuleCD
directly to merge a pull request to your Python library:

```bash
# git clone your repo, and checkout the branch specified in your PR.

export PACKAGR_SCM_GITHUB_ACCESS_TOKEN=123456789ABCDEF
export PACKAGR_SCM_PULL_REQUEST=2
export PACKAGR_SCM_REPO_FULL_NAME=AnalogJ/pypa_analogj_test
export PACKAGR_PYPI_USERNAME=AnalogJ
export PACKAGR_PYPI_PASSWORD=mysupersecurepassword

packagr-bumpr start --scm github --package_type python

# use your own language specific testing tools as usual
tox

packagr-releasr start --scm github --package_type python
packagr-publishr start --scm github --package_type python
```

### Creating a branch release

If you want to just create a new release from your master branch, don't set the `PACKAGR_SCM_PULL_REQUEST` and `PACKAGR_SCM_REPO_FULL_NAME` variables:

```bash
# git clone your repo, and checkout the master branch

export PACKAGR_SCM_GITHUB_ACCESS_TOKEN=123456789ABCDEF
export PACKAGR_PYPI_USERNAME=AnalogJ
export PACKAGR_PYPI_PASSWORD=mysupersecurepassword

packagr-bumpr start --scm github --package_type python

# use your own language specific testing tools as usual
tox

packagr-releasr start --scm github --package_type python
packagr-publishr start --scm github --package_type python
```

---



# Contributing

If you'd like to help improve Packagr, follow the instructions in [CONTRIBUTING.md](CONTRIBUTING.md)

Note that if you would like to do development without Docker, you'll also need to ensure that you have the `git2go` dependencies installed on your machine.
You can install these dependencies by using your system's package manager.

	- openssl
	- libgit2
	- libssh2

Work your magic and then submit a pull request. We love pull requests!

If you find the documentation lacking, help us out and update this README.md.
If you don't have the time to work on Packagr, but found something we should know about, please submit an issue.

## To-do List

We're actively looking for pull requests in the following areas:

- Packagr Engines for other languages
	- C#
	- Objective C
	- Dash
	- Java
	- Lua
	- Rust
	- Scala
	- Swift
	- [Any others you can think of](https://libraries.io/)
- Packagr SCM Sources
	- GitLab
	- Bitbucket
	- Beanstalk
	- Kiln
	- Any others you can think of


# Versioning

We use SemVer for versioning. For the versions available, see the tags on this repository.

# Authors

Jason Kulatunga - Initial Development -  [@AnalogJ](https://github.com/AnalogJ)

# License

Packagr is licensed under the MIT License - see the
[LICENSE.md](https://github.com/PackagrIO/docs/blob/master/LICENSE.md) file for details



