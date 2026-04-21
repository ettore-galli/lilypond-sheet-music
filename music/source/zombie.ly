\version "2.24.2"

\header {
  title = "Zombie"
  composer = "Cranberries"
}

\paper {
  line-width = 170\mm
  indent = 0\mm
}

melody =   {
  \set Staff.instrumentName = "Vl."
  \key e \minor
  \time 4/4
  

  \set Score.barNumberVisibility = #all-bar-numbers-visible

 
  \repeat volta 2 {
    \mark \markup {"Strofa 1 / a"} 
    e'1   |   c'1    |    b1    |    a1     |
  } 
  
  \break

  \repeat volta 2 {
    \mark \markup {"Strofa 1 / b"} 
    e'1   |   c'1    |    g'1    |    fis'1     |
  }  

  \break

  \repeat volta 2 {
    \mark \markup {"Strofa 1 / c"} 
    g'1-3   |   e'1-1    |    d'1-4    |    fis'1-2     |
  }  


  \break

  \repeat volta 2 {
    \mark \markup {"Strofa 2"} 
    e'1    |   c'1    |    g'1    |    a'1     |
  }   
 
  \break

  \repeat volta 2 {
    \mark \markup {"Ritornello"} 
    <e' g'>1   |   c''1    |    b'1    |    a'1     |
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