<#
.SYNOPSIS
    Implements the foreground_colour function.

.DESCRIPTION
    This module provides functions to style text with foreground colors
    using rgb values.

.EXPORTS
    foreground_colour - Sets a foreground colour for the given text.
#>

function set-foreground-colour {
    <#
    .SYNOPSIS
        Sets a foreground colour for the given text.
    
    .DESCRIPTION
        Given a string of text and RGB values for a colour, this function
        returns the text with the specified foreground colour.

    .PARAMETER text
        The text to be coloured.
    
    .PARAMETER red
        The red component of the colour.
    
    .PARAMETER green
        The green component of the colour.
    
    .PARAMETER blue
        The blue component of the colour.
    
    .EXAMPLE
        foreground_colour "Hello, world!" 255 0 0
        fgc "Hello, world!" 255 0 0
        Returns the string "Hello, world!" with a red foreground.
    #>
    param ([string] $text, [int16] $red, [int16] $green, [int16] $blue)
    $colour = $PSStyle.Foreground.FromRgb($red, $green, $blue)
    return "$colour$text$($PSStyle.Reset)"
}
set-alias fgc foreground_colour