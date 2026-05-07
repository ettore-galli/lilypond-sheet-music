\version "2.24.2"

\header {
  title = "Yellow"
  composer = "Coldplay"
}

\paper {
  line-width = 170\mm
  indent = 0\mm
}

melody =   {
  \set Staff.instrumentName = "Vl."
  \key c \major
  \time 4/4

  \set Score.barNumberVisibility = #all-bar-numbers-visible

  \repeat volta 2 {
    \mark \markup {"Strofa"}
    <c'-3 e'-1>1   |   <b-2 g'-3>1    |   <a-1 f'-2>1     |    <c'-3 e'-1>1    |
  }

  \break

  \repeat volta 2 {
    \mark \markup {"Ritornello"}
    f'4~ f'8 g'4( a'8 ) d''8 [a'8]  | c''4~ c''8 a'8~ a'2 |
    f'4~ f'8 g'4( a'8 ) d''8 [a'8]  | c''4~ c''8 a'8~ a'2 |
 
  }

  \break

}

\score {
  \new Staff {
    \clef treble
    \melody
  }
  \layout {}
  \midi { tempoWholesPerMinute = #70 }
}