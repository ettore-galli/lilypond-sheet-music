\version "2.24.2"

violinA = {
  g'1 | b'2 d''2 |
  fis'1 | dis''2 b'2 |
  e''1 | g'2 e''2 |
  ees''1 | c''2 ees''2
}

violinB = {
  d''1 | b'2 g''2 |
  fis''1 | dis''2 fis''2 |
  g''1 | e''2 g''2 |
  g''1 | ees''2 c''2
}

gchords = \chordmode {
  g1 g1
  b1 b1
  c1 c1
  c:m1 c:m1
}

\paper {
  line-width = 170\mm
  indent = 0\mm
}

\score {
  <<
      \new ChordNames { \gchords \gchords }

      \new Staff  {

        \key g \major
        \time 4/4
        \clef treble
        
        \mark \markup {"Strofa"}
        \violinA
        
        \break

        \mark \markup {"Ritornello"}
        \violinB
      }
  >>
  \layout { }
  \midi { \tempo 4 = 70 }
}
