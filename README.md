# `jcd-new`

A set of bash scripts and file templates to help create various dotnet solution structures. *(Currently just class libraries)*

## Examples
```bash
# Create a .NET Standard 2.1 class library and push it to github 
jcd-new classlib --project-name=Jcd.Delete.Me1
jcd-new classlib --project=Jcd.Delete.Me2
jcd-new classlib -p=Jcd.Delete.Me3

# Create a .NET Standard 1.0 class library and push it to GitHub 
jcd-new classlib -p=Jcd.Delete.Me1 --netstandard-version=1.0
jcd-new classlib -p=Jcd.Delete.Me1 -nsv=1.0

# Create a class library, perform the initial local commit, but DO NOT push it to GitHub 
jcd-new classlib -p=Jcd.Delete.Me4 --no-github 
jcd-new classlib -p=Jcd.Delete.Me5 -ngh

# Create a class library, DO NOT perform the initial local commit nor push it to GitHub 
jcd-new classlib -p=Jcd.Delete.Me6 --no-commit 
jcd-new classlib -p=Jcd.Delete.Me7 -nc

# Create a class library, with the BSD 1-Clause license, and push to GitHub 
jcd-new classlib -p=Jcd.Delete.Me8 --license=BSD-1
jcd-new classlib -p=Jcd.Delete.Me9 -lic=BSD-1

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

* $FULL_NAME - is required for generating the correct documentation from various template files.

## Optional, But Useful, Environment Variables 

While you don't need to have the following environment variables defined, they can be helpful:

* $KOFI_ID - This is your id on ko-fi.com, assuming you have one. If not provide this entry in .github/FUNDING.yml will be blank.
  If you don't want to solicit any funding, remove .github/FUNDING.yml after the project is created.
* $PATREON_ID - This is your id on patreon.com, assuming you have one. If not this entry in .github/FUNDING.yml will be blank.
  If you don't want to solicit any funding, remove .github/FUNDING.yml after the project is created.
* $PROJECT_EMAIL - This is the email address where you want people to contact you at regarding this project.
  If it's not provided the following will be used: project.email@not.a.real.domain.org; edit CODE_OF_CONDUCT.md
  to remove references to it if you do not want people to contact you via email for the project.
* $NUGET_PACKAGE_ICON_URL - This is the URL to the image that will be used when packaging the nuget package. If it's 
  not provided the default nuget icon will be used.

## Optional, Deprecated, Environment Variable

* $GITHUB_TOKEN - this will be used, if present, but issue a warning about it being a security risk.

## Setting your environment variables
First off, yes, I know, passing the GITHUB_TOKEN in an environment variable isn't secure. 
But I allow for it, if the user insists. Hey. It's your system. Who am I to tell you how to manage it?
The script does warn if this is used. So anyone inspecting the logs from a run will see the warning.

To set the non-sensitive environment variables edit your ~/.bash_profile or ~/.profile and add them 
in a manner similar to the script below. (*Which file to use depends entirely on which OS you're using
and how you've configured your account on it.*)
```bash
export github=~/Source/your-personal-github-folder # I keep mine separate from others' for personal edification. 
export FULL_NAME="Your Full Name" # or at least how you want it to appear in the LICENSE file.
export GITHUB_USER_NAME=your-github-name
export KOFI_ID=yourkofiname
export PATREON_ID=yourpatreonname
export PROJECT_EMAIL=your.oss.email@some.email.com
export NUGET_PACKAGE_ICON_URL="https://some.imagehost.com/image-url-goes-here"
```

Of course, you could set them every time before you run these scripts, but that would be... odd.

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
