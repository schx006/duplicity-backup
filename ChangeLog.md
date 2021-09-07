# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased] - 2021-09-07
### Added

### Changed

### Fixed
- MAJOR . Fixed the wrong order of the Duplicity parameters.
("full | incr" parameter must be in first position instead it is ignored.
If it is not specified (or ignored), Duplicity runs incremental backup,
but forces a full backup if no full backup already exists.)

## [1.0.2] - 2021-09-06
### Added

### Changed

### Fixed
- PATCH . Fixed small errors and added clarifications to the README.md file

## [1.0.1] - 2021-09-05
### Added

### Changed

### Fixed
- MAJOR . Fix bug in the shebang
(an unsupported encoding argument prevents the script from running)

## [v1.0] - 2021-09-05

first release

### Added
- GnuPG signed and encrypted "full" backup of the directories of a VPS,
defined in a list, to an S3 Object Storage server.

### Changed

### Fixed
