\version "2.24.2"

\header {
  title = "In The Name Of Love"
  composer = "Bebe Rexha"
}

gchords = \chordmode {
  bes1:7sus4 | s1  | d1:m | c1
}

melody = {
  \set Staff.instrumentName = "Vl."
  \key d \minor
  \time 4/4

  \repeat volta 2 {
   %  \mark \markup {"Inciso"} 
    c''4   a'8  d''8   c''4 a'4  | r8   c''4   a'8   g'8   a'8  c''4    
    c''4   a'8  d''8   c''4 a'4  | r8   c''4   a'8   bes'8   a'8  f'4   
  }  
}

\score {
  <<

  \new Staff {
    \clef treble
    \melody
  }

  \new ChordNames {
    \gchords
  }
  
  >>
  \layout { }
  \midi { \tempo 4 = 70 }
}
