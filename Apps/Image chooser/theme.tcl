# Author: rdbende
# License: MIT license
# Theme inspired by WinUI 2.6


package require Tk 8.6

namespace eval ttk::theme::sun-valley {

    variable version 0.0
    package provide ttk::theme::sun-valley $version
    variable colors
    array set colors { -fg "#ffffff" -bg "#1c1c1c"}

    proc LoadImages {imgdir} {
        variable I
        foreach file [glob -directory $imgdir *.png] {
            set img [file tail [file rootname $file]]
            set I($img) [image create photo -file $file -format png]
        }
    }

    LoadImages [file join [file dirname [info script]] images]

    ttk::style theme create sun-valley -parent clam -settings {
        ttk::style configure . \
            -background $colors(-bg) \
            -foreground $colors(-fg) \
            -fieldbackground $colors(-bg) \
            -font {"Segoe Ui" 10}
        
        option add *font [ttk::style lookup . -font]

        ttk::style layout TRadiobutton {
            Radiobutton.button -children {
                Radiobutton.padding -children {
                    Radiobutton.indicator -children {
                        Radiobutton.label -sticky nsew
                    }
                }
            }
        }

        ttk::style configure TRadiobutton -padding 5

        ttk::style element create Radiobutton.indicator image \
            [list $I(radio-unsel) \
                {selected disabled} $I(radio-border-disabled) \
                {pressed selected} $I(radio-border-pressed) \
                {active selected} $I(radio-border-hover) \
                selected $I(radio-border-rest) \
                {pressed !selected} $I(radio-border-pressed) \
            ] -border 10 -width 116 -sticky nsew -padding 4
    }
}
