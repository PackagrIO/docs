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


# Tools

- [Bumpr](https://github.com/PackagrIO/bumpr) - is a tool to bump version files using SemVer. It natively understands metadata/version files for multiple languages and packaging specs.
- [Releasr](https://github.com/PackagrIO/releasr) - is a tool for committing local changes & creating a tag. Natively understands metadata/version files for multiple languages, and will use the provided SemVer for tagging. (Nothing is pushed to the origin)
- [Publishr](https://github.com/PackagrIO/publishr) - is a tool for publishing changes. It will push git changes to your SCM, uploads packages to your language package index (RubyGems/PyPi/Supermarket, etc). It will also create a Github Release with a Changelog & attached artifacts.


