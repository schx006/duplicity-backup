# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

<!-- ----- ----- ----- ----- ----- ----- ----- ----- ----- -->

## [Unreleased] - 2021-09-09

will be version 2.

### Added
- 

### Changed
- Configuration file (.duplicity.conf) moved to a directory (.duplicity/)
and split for easy maintenance.    
New configuration files are:
     > .duplicity/duplicity.conf    
     > .duplicity/backup-auth.conf    
     > .duplicity/backup-dirlist.conf    

### Deprecated
- 

### Removed
- 

### Fixed
- MAJOR . Fixed the wrong order of the Duplicity parameters.
("full | incr" parameter must be in first position instead it is ignored.
If it is not specified (or ignored), Duplicity runs incremental backup,
but forces a full backup if no full backup already exists.)

### Security
- 




## [1.0.2] - 2021-09-06
### Fixed
- PATCH . Fixed small errors and added clarifications to the README.md file


## [1.0.1] - 2021-09-05

Semantic Versioning is not respected for this release.

### Fixed
- MAJOR . Fix bug in the shebang
(an unsupported encoding argument prevents the script from running)


## [1.0.0] - 2021-09-05

first release — defective version

### Added
- GnuPG signed and encrypted "full" backup of the directories of a VPS,
defined in a list, to an S3 Object Storage server.
- Removes backups older than 8 weeks (delay set up in the configuration file).
