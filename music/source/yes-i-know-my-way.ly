\version "2.24.2"

\header {
  title = "Yes I know my way"
  composer = "Pino Daniele"
}
\paper {
  line-width = 170\mm
  indent = 0\mm
}

gchords = \chordmode {

  % Intro (8 misure)
  e1:m7 | e4.:m7 fis8:m7( fis2:m7) |
  e1:m7 | e4.:m7 fis8:m7( fis2:m7) |
  e1:m7 | e4.:m7 fis8:m7( fis2:m7) |
  e1:m7 | e4.:m7 fis8:m7( fis2:m7) |

  % Strofa – blocco 1
  e1:m9 | e4.:m9 fis8:m7 fis2:m7 |
  e1:m9 | e4.:m9 fis8:m7 fis2:m7 |
  e1:m9 | e4.:m9 fis8:m7 fis2:m7 |
  e1:m9 | e4.:m9 fis8:m7 fis2:m7 |

  % Strofa – blocco 2
  c1:maj7 | c4.:maj7 d8:maj7 d2:maj7 |
  c1:maj7 | c4.:maj7 d8:maj7 d2:maj7 |

  % Strofa – blocco 3
  b1:m7 | b4.:m7 c8:maj7 c2:maj7 |
  b1:m7 | b4.:m7 c8:maj7 c2:maj7 |

  % Strofa – blocco 4
  a1:m7 | a1:m7 |
  a4.:m7 b8:m7( b2:m7) |
  s8 c4.:7.9+ s8 b4.:7.9+ |

  % Ritornello
  c1   | b1:m7 | bes1  | a1:m
  c1   | b1:m7 | bes1  | a1:m

}





melody = {
  \set Staff.instrumentName = "Vl."
  \key e \minor
  \time 4/4

  \repeat volta 2 {
    \mark \markup {"Intro"}
    e'1  | e'4. fis'8( fis'2)
    e'1  | e'4. fis'8( fis'2)
    e'1  | e'4. fis'8( fis'2)
    e'1  | e'4. fis'8( fis'2)
  }

  \break

  \repeat volta 2 {
    \mark \markup {"Strofa"}
    e'1  | e'4. fis'8( fis'2)
    e'1  | e'4. fis'8( fis'2)
    e'1  | e'4. fis'8( fis'2)
    e'1  | e'4. fis'8( fis'2)

    \break
    e'1  | e'4. d'8( d'2)
    e'1  | e'4. d'8( d'2)

    \break
    fis'1  | fis'4. e'8( e'2)
    fis'1  | fis'4. e'8( e'2)

    \break
    e'1  | e'1
    e'4. fis'8(fis'2)  | r8 f'4. r8 e'4.

  }

  \break

  \repeat volta 2 {
    \mark \markup {"Ritornello"}
    g'1  | fis'1 | f'1  | e'1
    g'1  | fis'1 | f'1  | e'1

  }

}

\score {
  <<

    \new Staff {
      \clef treble
      \melody
    }

    \new ChordNames {
      \set chordChanges = ##t
      \gchords
    }

  >>
  \layout { }
  \midi { \tempo 4 = 70 }
}
