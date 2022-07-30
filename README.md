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