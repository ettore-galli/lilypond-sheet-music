\version "2.24.2"

\header {
  title = "Zombie"
  composer = "Cranberries"
}

melody =   {
  \set Staff.instrumentName = "Vl."
  \key e \minor
  \time 4/4
  

  \set Score.barNumberVisibility = #all-bar-numbers-visible

 
  

  \repeat volta 2 {
    \mark \markup {"Strofa 1"} 
    e'1   |   c'1    |    g'1    |    fis'1     |
  }  

  \break

  \repeat volta 2 {
    \mark \markup {"Strofa 2"} 
    e'1    |   c'1    |    g'1    |    a'1     |
  }   
 
  \break

  \repeat volta 2 {
    \mark \markup {"Ritornello"} 
    e'1    |   c''1    |    b'1    |    a'1     |
  } 
}

\score {
  \new Staff {
    \clef treble
    \melody
  }
  \layout { }
  \midi { tempoWholesPerMinute = #70 }
}