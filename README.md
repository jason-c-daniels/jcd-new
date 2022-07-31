# jcd-new

A set of bash scripts and file templates to help me manage creating various dotnet solution structures.

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
jcd-new classlib --version

# Get help on using jcd-new
jcd-new help

# get help on using jcd-new classlib
jcd-new help classlib
```

## Installation

Copy this folder structure to any folder in bash's PATH.

To find a suitable location you can execute one of the following commands.
```bash
# List PATH locations from just your HOME directory 
echo "${PATH//:/$'\n'}" | sort -u | grep "$HOME"

# List all PATH locations (some of these will require admin privileges) 
echo "${PATH//:/$'\n'}" | sort -u 

# List all PATH locations excluding your HOME directory (all of these will require admin privileges) 
echo "${PATH//:/$'\n'}" | sort -u | grep -v "$HOME"
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
