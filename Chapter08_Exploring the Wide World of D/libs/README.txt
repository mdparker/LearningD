Compile hello.d and goodbye.d into two separate libraries and output them to the subdirectory 'separate' with the following command lines:

dmd -lib -odseparate hello.d
dmd -lib -odseparate hello.d

Combine both modules into one ('greets.lib' or 'libgreets.a') and write it out to the 'combined' subdirectory with the following command line:

dmd -lib -odcombined -ofgreets hello.d goodbye.d