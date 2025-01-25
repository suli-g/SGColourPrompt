<#
.SYNOPSIS
    Implements the background_colour function.

.DESCRIPTION
    This module provides functions to style text with background colors
    using rgb values.

.EXPORTS
    background_colour - Sets a background colour for the given text.
#>

function Set-BackgroundColour {
    <#
    .SYNOPSIS
        Sets a background colour for the given text.
    
    .DESCRIPTION
        Given a string of text and RGB values for a colour, this function
        returns the text with the specified background colour.

    .PARAMETER text
        The text to be coloured.
    .PARAMETER red
        The red component of the colour.
    .PARAMETER green
        The green component of the colour.
    .PARAMETER blue
        The blue component of the colour.

    .EXAMPLE
        background_colour "Hello, world!" 255 0 0
        bgc "Hello, world!" 255 0 0
        Returns the string "Hello, world!" with a red background.
    #>
    param ([string] $text, [int16] $red, [int16] $green, [int16] $blue)
    $colour = $PSStyle.Background.FromRgb($red, $green, $blue)
    return "$colour$text$($PSStyle.Reset)"
}
set-alias bgc Set-BackgroundColour
