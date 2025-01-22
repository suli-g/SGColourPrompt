# SGColourPrompt

A simple, easy-to-use colour prompt for the shell.

## Features

- Customizes your shell prompt with vibrant, colour-coded information.
- Displays the current directory, Git branch, and status in a visually appealing format.
- Fully customizable for your needs.

## Installation

### Prerequisites

- PowerShell 5.1 or higher
- The latest version of [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Via PowerShell Gallery

To install the module via the PowerShell Gallery:

```powershell
Install-Module SGColourPrompt
```

### Via Cloning The Repo

Alternatively, clone the repository from GitHub:

```sh
git clone https://github.com/suli-g/SGColourPrompt.git
```

You may then access the module from the cloned directory by using the `import-module` command in windows powershell.

```powershell
Import-Module path/to/SGColourPrompt
```

## Usage

### If you installed the module [via powershell gallery](#powershell)

- You should have immediate access to the `use-colour` function.

### Enabling the Coloured Prompt

After installation, define a `prompt` function in your PowerShell profile that uses
the use-colour function:

1. Open the `$PROFILE` file in your editor of choice:

> The `$PROFILE` environment variable contains the path to the current user's 
> PowerShell profile file and is accessible from any Powershell session.

```powershell
notepad $PROFILE
```

2. If you If you [cloned this repository](#via-cloning-the-repo), you'll need to first import the module into your profile.

- You'll need to import the module via the following command:

```powershell
Import-Module path/to/SGColourPrompt
```

3. Add the following to the file:

```powershell
function prompt {
   use-colour
}
```

3. Open a new Powershell window, and your prompt should look as follows:

![SGColourPrompt](./images/SGColourPrompt.png)

### Colour Functions

This module also provides the following functions when [in use](#usage):
|Function|Alias|Effect|
|---|---|---|
|`set-background-colour`|`bgc`|Sets a background colour for the given text.|
|`set-foreground-colour`|`fgc`|Sets a foreground colour for the given text.|
|`use-colour`|-|Used to restyle the powershell prompt.[^1]|

[^1]: <https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_prompts?view=powershell-7.4>

- For more information about the above-mentioned functions, use the `Get-Help` command.

Example:

```powershell
get-help set-background-colour
get-help set-foreground-colour
get-help fgc
get-help bgc
get-help use-colour
```

2. Enjoy your newly styled prompt! It should automatically update and adapt to show contextual information like:

   - Current working directory
   - Git branch (if applicable)
   - Git status indicators:
    - No changes (green)
    - Unstaged changes (red)
    - Staged changes (yellow)
    - Untracked files (red)

3. To persist this setup, add the following to your PowerShell profile:

   ```powershell
   Import-Module path/to/SGColourPrompt
   ```

   To edit your profile, use:

   ```powershell
   notepad $PROFILE
   ```

## Deactivating

### If installed via PowerShell Gallery

```powershell
Remove-Module SGColourPrompt
```

### If cloned the repo

The script should be deactivated between powershell sessions.

## Troubleshooting

- **Git status not appearing**:
  Make sure `git` is installed and available in your PATH. Test by running:
  ```powershell
  git --version
  ```

## Contributions

Contributions are welcome! Feel free to fork the repository, create a branch, and submit a pull request. Whether it's bug fixes, new features, or documentation improvements, your input is valued.

## License

This project is licensed under the [MIT License](./LICENSE).
