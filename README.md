
﻿# reset-cli

reset-cli is a powerfull package that allow you to reset your linux system (Archlinux only for now).

![Discord](https://img.shields.io/discord/1138108139443593246?style=for-the-badge)
![GitHub Repo stars](https://img.shields.io/github/stars/nuageeee/reset-linux?style=for-the-badge)
![GitHub issues](https://img.shields.io/github/issues/nuageeee/reset-linux?style=for-the-badge)

## Table of contents

- [description](#description)
- [Installation](#installation)
- [Roadmap](#roadmap)
- [Contributing](#contributing)

## Description

Reset-cli is a powerful package that lets you reset a linux system without reinstalling it!
To make this possible, the script, once installed and run, will download your system's base file (the root directory) and copy all the files back into their directories.

## Installation

- archlinux : 

To install this script on archlinux, just follow the instruction bellow this message :

```bash
# clone the repo
git clone https://github.com/nuageeee/reset-cli-linux reset-cli
# enter in the folder
cd reset-cli
# select the arch folder
cd arch
# then, build the pakage
makepkg -si
```

Once it's done, you will be allow to run reset-cli with this command :
```bash
sudo reset-cli -h
```
## Roadmap

This is the early development version. I am currently working on :

- [ ] Possibility to backup file.
- [ ] Add auto backup for shadow and passwd files.
- [ ] Initialize V0.2.0.
- [ ] Add first GUI in Flutter.
- [ ] Add more OS's.
	- [ ] Ubuntu/Debian
	- [ ] Kali linux/Parrot os
	- [ ] Linux mint
- [ ] Possibility to check server availability.
- [ ] Possibility to reset the system to default.


## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

The license used is [GPL](https://choosealicense.com/licenses/agpl-3.0/).
