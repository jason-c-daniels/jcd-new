# `jcd-new`

A set of bash scripts and file templates to help create various dotnet solution structures. *(Currently just class libraries)*

## Examples
```bash
# Create a .NET Standard 2.1 class library and push it to github 
jcd-new classlib --project-name=Jcd.Delete.Me1
jcd-new classlib --project=Jcd.Delete.Me2
jcd-new classlib -p=Jcd.Delete.Me3

# Create a .NET Standard 1.0 class library and push it to github 
jcd-new classlib -p=Jcd.Delete.Me1 --netstandard-version=1.0
jcd-new classlib -p=Jcd.Delete.Me1 -nsv=1.0

# Create a class library and DO NOT push it to github 
jcd-new classlib -p=Jcd.Delete.Me4 --no-github 
jcd-new classlib -p=Jcd.Delete.Me5 -ngh

# Display the version number for jcd-new
jcd-new version
jcd-new --version
jcd-new classlib --version

# Get help on using jcd-new
jcd-new help

# get help on using jcd-new classlib
jcd-new help classlib
```

## Installation from this GitHub repository.

### First find a suitable installation location

To find a suitable location you can execute one of the following commands.
```bash
# List PATH locations from just your HOME directory 
echo "${PATH//:/$'\n'}" | sort -u | grep "$HOME"

# List all PATH locations (some of these will require admin privileges) 
echo "${PATH//:/$'\n'}" | sort -u 

# List all PATH locations excluding your HOME directory (all of these will require admin privileges) 
echo "${PATH//:/$'\n'}" | sort -u | grep -v "$HOME"
```

### Next run `install.sh` from the src directory of your clone of this repository
```bash
# $THIS_GIT_REPO needs to be set to the directory where you cloned this repository, or you can manually substitute the correct value.
cd $THIS_GIT_REPO/src

# install to ~/bin
bash ./install.sh

# install to ~/bin2 (which will need to already exist.)
bash ./install.sh ~/bin2

# Now verify the installation worked
jcd-new --version
```

## Required External Tools

* gh - This is the GitHub command-line. It's required to automatically upload your code to GitHub.
  On Windows this is available through chocolatey via: ```choco install gh```
  To install on linux see this document: https://github.com/cli/cli/blob/trunk/docs/install_linux.md

* dotnet - This is the .NET Core command-line. It's required to create the project structure. 
  See [Microsoft's page](https://dotnet.microsoft.com/en-us/download) for installation instructions.

## Required Environment Variables

You must have the following environment variables defined:
* $github - must point to the root folder for your personal GitHub repositories.

* $GITHUB_USER_NAME - is required for generating the correct documentation from various template files.

* $GITHUB_TOKEN - is required for the gh tool to push code to GitHub.

* $FULL_NAME - is required for generating the correct documentation from various template files.

## Advice for the first time you run jcd-new.

If you're not sure if you'll like the output from jcd-new classlib, do a dry run locally without pushing to GitHub.
To do that pass the --no-github (-ngh) flag.
```bash
# An example of what that might look like follows:
jcd-new classlib --no-githhub --project-name=My.Test.Project
```
After generating your test project, inspect the output to see if it's what you desire. Don't just open the solution in
your IDE and verify it compiles (It should have as part of the project creation.) Actually read the text contents of the
.csproj files. Ensure they contain exactly what you want and/or expected.

## Why did I use bash instead of the built-in templating features in `dotnet new`?

*Simply put: Familiarity, control, simplicity, and cross-platform compatibility concerns.*

Much of what I do in these scripts just is unsuitable for a `dotnet new` template, thus requiring wrapper script to call
the custom `dotnet new` template. That template would have to be independently maintained as a nuget package. This would 
complicate the whole process. I have no want for that complexity. 

On top of that, the wrapper script would have been so remarkably similar to what I currently have (i.e. netstandard1.0 
post-processing would still be required) making the whole exercise a moot point and more time-consuming. Instead, I chose
to execute the `dotnet` command-line to achieve the same results.

Don't get me wrong tho, the `dotnet new` templating engine is quite impressive and VERY useful. It's just not appropriate 
for this use case at this time.

Finally, these scripts are for my own personal use. They're shared on GitHub just in case others might take inspiration 
from them, or perhaps even find them directly useful. 