# DisplayPad-Scripts
A collection of powershell scripts and icons for use with the Mountain DisplayPad and BaseCamp

# Building
- Install ps2exe `Install-Module -Name ps2exe -Scope CurrentUser`
- Open a terminal
- Run `build.ps1` with `. .\build.ps1`
- (Optional) Run with `-v` if your builds are failing

# Creating
- Create new folder
- Create `.ps1` script
- (Optional) Add `.png` you'd like the exe to have

> [!NOTE]  
> Most of the time if you are looking for documentation you should be looking at [P2EXE's](https://github.com/MScholtes/PS2EXE) documentation. This script is litterally just for invoking that on all ps1 scripts in the directory.

# Using
- Once build has been run open BaseCamp
- Assign bind exe to button as shown
- (Optional) if the generated `ico` file attached to the `exe` looks off, then change the icon to the `png` in the same folder

<video controls src="20250118-1249-42.1213150.mp4" title="Building and Assigning in action"></video>

# Attributes
- <a href="https://www.flaticon.com/free-icons/example" title="example icons">Example icon created by Freepik - Flaticon</a>
- <a href="https://www.flaticon.com/free-icons/document-type" title="document-type icons">Document-type icon created by Freepik - Flaticon</a>
- <a href="https://www.flaticon.com/free-icons/terminal" title="terminal icons">Terminal icon created by HideMaru - Flaticon</a>