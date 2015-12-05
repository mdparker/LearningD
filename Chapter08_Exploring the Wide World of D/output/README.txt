Compile main.d with the -od and -of command line options to change the default output. For example:

dmd -odobj -ofapp main.d

This will write main.obj in a subdirectory named object and will create an executable named 'app' ('app.exe' on Windows) in this directory.