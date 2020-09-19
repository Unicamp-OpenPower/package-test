# package-test
Repository for testing the .rpm and .deb packages.

## How to use it
If any test fails, the log_error file will be printed at the end of Travis's log.
If all test passes, a "All tests succeeded" message will be printed.

## Example:
~~~
"Unsuccessful tests:"
"Error in RPM package, docker build process: matchbox"
~~~

The "RPM" indicates that the problem occurred on the RPM package, and de "docker build process" indicates that the problem occurred in the docker build.
Those two errors indicators can also be "DEB" and "docker run process", respectively.
