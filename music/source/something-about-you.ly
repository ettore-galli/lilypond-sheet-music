\version "2.24.2"

#(set-global-staff-size 26)

\header {
  title = "Something About You"
  composer = "Level 42"
}

\paper {
  line-width = 170\mm
  indent = 0\mm

  bookTitleMarkup = \markup {
    \column {
      \fill-line {
        \fontsize #4 \fromproperty #'header:title
      }
      \fill-line {
        \fromproperty #'header:composer
      }
      \vspace #3
    }
  }
}

melody =   {
  \set Staff.instrumentName = "Vl."
  \key e \major
  \time 4/4

  \set Score.barNumberVisibility = #all-bar-numbers-visible

  % \repeat volta 2 {
  %   \mark \markup {"Strofa"}
  % }   
  % \break

  \repeat volta 3 {
    \mark \markup {"Inciso / Ritornello"}
    
    gis'?4-3  a'4-4 b'8-1[ a'8-4] gis'?8-3[ g'8-3~] | 
    g'2~    g'4.    g'8                            |
    a'2-4~  a'4.    a'8                            | 
    b'2-1~  b'4.    r8

  }


  \break

}

\score {
  \new Staff {
    \clef treble
    \melody
  }
  \layout {
  }
  \midi { tempoWholesPerMinute = #70 }
}
