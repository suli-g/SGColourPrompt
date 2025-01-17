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
import-module -name background_colour
import-module -name foreground_colour


function prompt {
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
    $leaf = (split-path -path $pwd -leaf)
    $leaf = if ($leaf -eq [Environment]::UserName) { "~" } else { $leaf }
    $branch = (background_colour "<×>" 245 100 120)
    
    # Check if working directory is a git repository:
    # Reference: https://stackoverflow.com/questions/2180270
    if ((git rev-parse --is-inside-work-tree) -eq $true) {
        # Use the branch name in the prompt or "..." if the branch
        # cannot be determined:
        $branch_name = ((git branch) -replace '\* ', '')
        $branch_name = if ($branch_name -eq "") { "..." } else { $branch_name }
        $has_untracked = ($null -eq (git status --untracked-files=no --short))
        
        # Use different colours for the branch name depending on whether
        # it has untracked changes:
        $branch = if ($has_untracked) { 
            background_colour "<$branch_name>" 100 245 120 
        } else { 
            background_colour "<$branch_name>" 245 120 0 
        }
    }
    
    return "$branch PS [$leaf]> "
}
