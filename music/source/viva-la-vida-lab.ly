\version "2.24.2"

\header {
  title = "Viva la vida"
  composer = "Coldplay"
}

\paper {
  line-width = 170\mm
  indent = 0\mm
}

gchords = \chordmode {

}

melody = {
  \set Staff.instrumentName = "Vl."
  \key aes \major
  \time 4/4
  \tempo 4 = 96
  \mark \markup {"Intro | Strofa 1 | Intermezzo 1"}
  \repeat volta 2 {
    des'4-.-2   des'4-.   des'4-.  des'8  es'8-3( | es'8) es'4-.  es'8  es'4-.  es'4-.
    es'4-.   es'4-.   es'4-.  es'8  f'8-4( | f'8) f'4-.  f'8  f'4-.  f'4-.
  }

  \break
  \mark \markup {"Pre strofa 2"}
  % \repeat volta 2 {

    aes'2.-2(  aes'8) g'8-1( | g'1) | 
    aes'2.-2(  aes'8) g'8-1( | g'1) |
    aes'2.-2(  aes'8) g'8-1( | g'1) |
    aes'2.-2(  aes'8) g'8-1( | g'2) aes'8-2 g'8-1 f'8-4 es'8-3 |
  % }

  \repeat volta 2 {
    \mark \markup {"Strofa 2"}
    \break
    f'1-4 | es'2-3 aes'8-2 g'8-1 es'8-3 c'8-1| es'2.-3( es'8) c'8-1( | c'2) aes'8-2 g'8-1 f'8-4 es'8-3 |

    \break
    f'1-4 | es'2-3 aes'8-2 g'8-1 es'8-3 c'8-1| es'2.-3( es'8 )f'8-4( | f'1)  |

    \break
    aes'4-2 bes'8-3 aes'8( aes'4-2) bes'8-3 aes'8( | aes'4-2) bes'8-3 aes'8( aes'2)

    \break
    aes'4-2 bes'8-3 aes'8( aes'4-2) bes'8-3 aes'8( | aes'2-2) aes'8-2 g'8-1 f'8-4 es'8-3 |
  }

  \break

  \mark \markup {"Ritornello"}
  \repeat volta 2 {
    des'4-2   des'4   des'4  des'8  es'8-3( | es'8) es'4  es'8  es'4  es'4
    aes'4-2   aes'4   aes'4  aes'8  f'8-4( | f'8) f'4  f'8  f'4  f'4
  }

  \break

  \mark \markup {"Intermezzo"}
  \repeat volta 2 {
    des'4-2   des'4   des'4  des'8  c'8-1( | c'8) c'4  c'8  c'4  c'4
    des'4-2   des'4   des'4  des'8  c'8-1( | c'8) c'4  c'8  c'4  c'4
    \break
    des'4-2   des'4   des'4  des'8  c'8-1( | c'8) c'4  c'8  c'4  c'4
    es'1-3 |  
    es'1-3 |  
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
