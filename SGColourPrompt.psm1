<#
.SYNOPSIS
    A PowerShell module that modifies the prompt.

.DESCRIPTION
    This module provides functions to style text with background and foreground colors.
    It includes functions to set background colors and foreground colors for given text.

.EXPORTS
    background_colour - Sets a background colour for the given text.
    foreground_colour - Sets a foreground colour for the given text.
    prompt - Customises the PowerShell prompt.

.AUTHOR
    Sulaiman Gafoor <https://github.com/suli-g>

.VERSION
    1.0.0
#>
function use-colour {
    <#
    .SYNOPSIS
        Customises the PowerShell prompt.
    
    .DESCRIPTION
        This function customises the PowerShell prompt to include the current
        working directory and the current git branch, using the following format:

        <branch> PS [<directory-leaf>]>
    
    .EXAMPLE
        <main> PS [example]> pwd
        >> C:\Users\username\Documents\example

        <main> PS [example]> git branch
        >> * main
    #>
    # Get the current path and branch name. Replace username with ~:
    $path_leaf = (split-path -path $pwd -leaf)
    $path_leaf = if ($path_leaf -eq [Environment]::UserName) { "~" } else { $path_leaf }

    # Exit early if the current directory is not a git repository:
    # Reference: https://stackoverflow.com/questions/2180270
    $not_git_repo = -not (git rev-parse --is-inside-work-tree)
    if ($not_git_repo) {
        return "PS [$path_leaf]> "
    }
    
    # Use the branch name in the prompt or "..." if the branch
    # cannot be determined (possible if no commits have been made):
    # Remove the need to replace the * by showing only the current branch.
    # Reference: https://stackoverflow.com/a/6245587
    $branch_name = (git branch --show-current)
    $branch_name = if ($null -eq $branch_name) { "..." } else { $branch_name }
    
    # Check if there are any tracked or untracked changes:
    # Reference: https://stackoverflow.com/a/3801554
    $tracked_changes = $null -ne (git status --short)
    $untracked_changes = $null -ne (git ls-files --others --exclude-standard)
    
    # Use different colours for the branch name depending on whether
    # it has untracked changes:
    $branch = if ($untracked_changes -and $tracked_changes) { 
        background_colour "<$branch_name>" 245 100 180
    } elseif ($untracked_changes) {
        background_colour "<$branch_name>" 245 80 80
    } elseif ($tracked_changes) { 
        background_colour "<$branch_name>" 245 180 100
    } else { 
        background_colour "<$branch_name>" 100 245 120
    }
    
    return "$branch PS [$path_leaf]> "
}

