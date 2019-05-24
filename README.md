
This is a quick way to get going with a new
[Accelerator](https://github.com/eBay/accelerator)
project.  See below for installation instructions.



Use and Purpose
===============

This is one of three repositories that are intended to be used together:
1.    https://github.com/eBay/accelerator-project_skeleton
2.    https://github.com/eBay/accelerator-gzutil
3.    https://github.com/eBay/accelerator

The purpose of the Accelerator project is to allow for fast data processing with big data. Extensive documentation on the purpose and how to use the Accelerator projects is covered in the reference manual found here:

[Reference Manual](https://berkeman.github.io/pdf/acc_manual.pdf) \
[Installation Manual](https://berkeman.github.io/pdf/acc_install.pdf)



Build and Runtime Environment
=============================

The Accelerator projects has been built, tested, and runs on:
 - Ubuntu16.04 and Debian 9,
 - FreeBSD 11.1

but is in no way limited to these systems or versions.



System Installation
===================

1. Decide a folder where the accelerator should be placed (default: /srv/accelerator/skeleton). This folder will be referenced as $ACC_DIR.
2. Clone the https://github.com/eBay/accelerator-project_skeleton repository to $ACC_DIR.
3. In case of installing with a different default directory, replace all occurrencies of /srv/accelerator in install.sh, urd.service, accelerator.service, daemon.sh and init.py.
4. Run installation script. Make sure that you have superuser priviledges and sudo installed. It will install and enable all services. That means that the accelerator will be started at boot.
5. Done.  The Accelerator is now ready for use. You can run automatarunner without caring about the daemon, as it should have already been installed. To manage the daemon, and see available options run `daemon --help`.


License
=======

Copyright 2017-2018 eBay Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
