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
    \mark \markup {"Inciso"}
    c''4   a'8  d''8   c''4 a'4  | r8   c''4   a'8   g'8   a'8  c''4
    c''4   a'8  d''8   c''4 a'4  | r8   c''4   a'8   bes'8   a'8  f'4
  }

  \break

  \repeat volta 2 {
    \mark \markup {"Strofa"}
    bes'1 | bes'1 | a'2.  g'4( | g'1)
    f'1   | f'1   | f'2.  e'4( | e'1)
  }

  \break

  \repeat volta 2 {
    \mark \markup {"Ritornello"}
    f'1   | f'1   | a'2.  g'4( | g'1)
    f'1   | f'1   | a'2.  g'4( | g'1)
  }

  \break

  \repeat volta 2 {
    \mark \markup {"Bridge"}
    f'1   | f'1   | f'2.  e'4( | e'1)
    f'1   | f'1   | a'2.  g'4( | g'1)
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
