# cabextract 1.6.1

### Description:

A program to extract Microsoft Cabinet files.

(C) 2000-2015 Stuart Caie <kyzer@4u.net>  
This is free software with ABSOLUTELY NO WARRANTY.  
License: GNU GPL Version 3 - See COPYING in the source.

Cabinet (.CAB) files are a form of archive, which Microsoft use to distribute their software, and things like Windows Font Packs. The cabextract program unpacks these files.

For more information, see http://www.cabextract.org.uk/ or run the command 'cabextract --help'. This repository is a simple `fork` of that [source](https://github.com/kyz/libmspack/), with a CMske build system added, and built in WIN32/WIN64 using MSVC 2015 (msvc140).

Microsoft cabinet files should not be confused with InstallShield cabinet files. InstallShield files are generally called "_sys.cab", "data1.hdr" "data1.cab", "data2.cab" and so on, and are found in the same directory as "setup.exe". They begin with the magic characters "ISc(" rather than "MSCF". cabextract will print the message "This is probably an InstallShield file." when it finds such a file. The file "doc/magic" in the cabextract source archive includes additional file-identification rules for the UNIX file(1) command, which distinguishes between Microsoft and InstallShield cabinet files.

The project includes a `mspack` library, hence the name of the repository.

### Building:

This source now uses [CMake](https://cmake.org/) for configuration and generation of the build files of your choice.

#### In Unix:

This should be as simple as -

```
$ cd build
$ cmake .. [options]
$ make
$ [sudo] make install (if desired)
```

#### In Windows:

If for example you have {MS Visual Studio](https://www.visualstudio.com/vs/community/) (MSVC) installed -

```
> cd build
> cmake .. [options]
> cmake --build . --config Release
```

CMake also has a [GUI](https://cmake.org/runningcmake/) - Set the `source` directory, and the `binary` directory to the **build** directory. Click the [Configure], choose the generator to use. When there are no `red` items, clicking [Ok] will generate the makefiles/solution files chosen. 

Of course, if using MSVC, the generated solution file can be loaded, select the Release build, and build the project.


### Example usage:

Extracting files from a cabinet file:  
$ cabextract wibble.cab

Extracting files from an executable which contains a cabinet file:  
$ cabextract wibble.exe  
cabextract will automatically search executables for embedded cabinets

Extracting files from a set of cabinet files; wib01.cab, wib02.cab, ...:  
$ cabextract wib01.cab  
cabextract will automatically get the names of the other files

Extracting files to a directory of your choice (in this case, 'boogie'):  
$ cabextract -d boogie wibble.cab  
cabextract will create the directory if it does not already exist

Listing files from a cabinet file:  
$ cabextract -l wibble.cab

Testing the integrity of a cabinet file, without extracting it:  
$ cabextract -t wibble.cab

Just show the file included in the CAB:  
$ cabinfo wibble.cab

Stuart Caie <kyzer@4u.net>, March 2015  
Geoff R. McLane <reports _at_ geoffair _dot_ info>, April 2017  

; eof
