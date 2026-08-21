\version "2.24.2"

\header {
  title = "Joline"
  composer = "Dolly Parton"
}

\paper {
  line-width = 170\mm
  indent = 0\mm
}

melody =   {
  \set Staff.instrumentName = "Vl."
  \key c \minor
  \time 3/4

  \set Score.barNumberVisibility = #all-bar-numbers-visible

  \repeat volta 2 {
    
    \mark \markup {"Strofa"}
    
    \new Voice = "melody" {
     \voiceOne
      c''4.  d''4.   | ees''4.  d''4.   |   ees''8 d''8 c''8 bes'8   |
    }

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