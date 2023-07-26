# crystal-lang-installer
A simple script that performs a "manual" install from the tar.gz files of the Crystal Programming Language by extracting and copying them to their respective directories.

# Preparations
1. Download the tar.gz file from the oficial Crystal Programming Language Repository: https://github.com/crystal-lang/crystal/releases
2. Download the installer. Preferably, place it in the same directory as the tar.gz file to install.
3. Give the installer permission to be executed, by running:
```
chmod +x crinstaller.sh
```

# Running the script
Run the script with the filename (if its located in the same directory as the script) or run it with the filename and the path to the file. 
```
./crinstaller.sh 'filename'
```
or 
```
./crinstaller.sh '/directory/filename'
```
And, if everything goes to plan, Crystal will be installed in no time!

# Reasons to make this script
Slackware GNU/Linux does package management way too diferent from other distros, starting from the fact that there is no main repository to install or update. Meaning that you can mainly install in two ways: compile the source code or installing through .tgz or .txz files.
Since there's not an up to date SlackBuild for Crystal, it's better to download the tar.gz file and install it manually which takes time, giving this script its purpose.

Or you could just do as explained in: https://crystal-lang.org/install/from_targz/

To make it simpler to use, you can create a symbolic link available in the path:
```
ln -s /full/path/to/bin/crystal /usr/local/bin/crystal
```
Then you can invoke the compiler by just typing:
```
crystal --version
```
