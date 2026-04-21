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
  \key b \major
  \time 4/4

  \set Score.barNumberVisibility = #all-bar-numbers-visible

  \repeat volta 2 {
    \mark \markup {"Strofa"}
    <b-3 dis'-1>1   |   <ais-2 fis'-3>1    |   <gis-1 e'-2>1     |   <b-3 dis'-1>1   |
  }

  \break

  \repeat volta 2 {
    \mark \markup {"Ritornello"}
    <gis-1 e'-2>1   |    <gis-1 e'-2>1     |   <b-2 gis'-3>1     |   <ais-2 fis'-3>1   |
  }

  \break

}

\score {
  \new Staff {
    \clef treble
    \melody
  }
  \layout { }
  \midi { tempoWholesPerMinute = #70 }
}