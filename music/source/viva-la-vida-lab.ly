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
    des'4-.-4   des'4-. -4  des'4-. -4 des'8-4  es'8-1( |
    es'8-1) es'4-. -1 es'8-1  es'4-. -1 es'4-. -1
    es'4-. -1  es'4-. -1  es'4-. -1 es'8-1  f'8-2( |
    f'8-2) f'4-. -2 f'8-2  f'4-. -2  f'4-. -2
  }

  \break
  \mark \markup {"Pre strofa 2"}

    aes'2.-4(  aes'8-4) g'8-3( | g'1-3) | 
    aes'2.-4(  aes'8-4) g'8-3( | g'1-3) |
    aes'2.-4(  aes'8-4) g'8-3( | g'1-3) |
    aes'2.-4(  aes'8-4) g'8-3( | g'2-4) aes'8-4 g'8-3 f'8-2 es'8-1 |

  \repeat volta 2 {
    \mark \markup {"Strofa 2"}
    \break
    f'1-2 |
    es'2-1 aes'8-4 g'8-3 es'8-1 c'8-3 |
    es'2.-1( es'8-1) c'8-3( |
    c'2-3) aes'8-4 g'8-3 f'8-2 es'8-1 |

    \break
    f'1-2 |
    es'2-1 aes'8-4 g'8-3 es'8-1 c'8-3 |
    es'2.-1( es'8-1 )f'8-2( |
    f'1-2)  |

    \break
    aes'4-4 bes'8-1 aes'8-4( aes'4-4) bes'8-1 aes'8-4( |
    aes'4-4) bes'8-1 aes'8-4( aes'2-4)

    \break
    aes'4-4 bes'8-1 aes'8-4( aes'4-4) bes'8-1 aes'8-4( |
    aes'2-4) aes'8-4 g'8-3 f'8-2 es'8-1 |
  }

  \break

  \mark \markup {"Ritornello"}
  \repeat volta 2 {
    des'4-4   des'4-4   des'4-4  des'8-4  es'8-1( |
    es'8-1) es'4-1  es'8-1  es'4-1  es'4-1
    aes'4-4   aes'4-4   aes'4-4  aes'8-4  f'8-2( |
    f'8-2) f'4-2  f'8-2  f'4-2  f'4-2
  }

  \break

  \mark \markup {"Intermezzo"}
  \repeat volta 2 {
    des'4-4   des'4-4   des'4-4  des'8-4  c'8-3( |
    c'8-3) c'4-3  c'8-3  c'4-3  c'4-3
    des'4-4   des'4-4   des'4-4  des'8-4  c'8-3( |
    c'8-3) c'4-3  c'8-3  c'4-3  c'4-3
    \break
    des'4-4   des'4-4   des'4-4  des'8-4  c'8-3( |
    c'8-3) c'4-3  c'8-3  c'4-3  c'4-3
    es'1-1 |  
    es'1-1 |  
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
