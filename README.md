git-svn-externals-fetcher
=========================

Fetches all the SVN:externals in your project and performs a git svn clone in the appropriate directory.

# Usage
=======

Perform a 'git svn clone *url*' as you normally would. Once that completes, copy the fetchSvnExternals.sh file into your newly cloned git repo. From there, run the shell script and let it do its thang.

That should be it. 

NOTE: I am severely aware of the fact that this code is not robust. I am sure there are many ways to break this and many cases I am not handling properly. But the fact is that I needed this tool for our team and it works for us. Feel free to tweak it however you need it to suit your needs.
