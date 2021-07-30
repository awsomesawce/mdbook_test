# Just Found Out

Here is where I write things I just found out that are interesting.

> The same people behind some of the biggest compression/archive programs are the official authors of the `zlib` library!
> That includes Jean-Loup Gailly and Mark Adler

## Writing site building function in powershell

So I'm writing a site building function in powershell that contains `[switch]` parameters that
will make a tarfile of the output of `mdbook build` and also copy files from `.\book\*` into
my build git repo.

And in addition to that, it will _push_ the additions to remote!
