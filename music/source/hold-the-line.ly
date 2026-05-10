\version "2.24.2"

\header {
  title = "Hold The Line"
  subtitle = "Adattamento per Violino"
  composer = "Toto"
}

global = {
  \key fis \minor
  \time 4/4
  \tempo 4 = 96
}

violinoPart = \relative c' {
  \global
  \compressEmptyMeasures

  % Intro: Tacet di 4 misure
  \mark \markup {"Intro (piano)"} 
  R1*4 |

  % INTRO
  \mark \markup {"Inciso"} 
  fis4 r4 \tuplet 3/2 { cis4 d4 d4 } | e4 r4 r2 |
  fis4 r4 \tuplet 3/2 { cis4 d4 d4 } | e4 r4 \tuplet 3/2 { e4 cis4 c4 } |

  \break 

  % STROFA  
  \mark \markup {"Strofa"} 
  b4 \tuplet 3/2 { r8 b8 c8 } cis4 \tuplet 3/2 { r8 cis8 e8 } |
  fis4  \tuplet 3/2 { r8 cis8 e8 } \tuplet 3/2 { fis8 r8 cis8( }  \tuplet 3/2 { cis8) c8 ( c8) }

  b4 \tuplet 3/2 { r8 b8 c8 } cis4 \tuplet 3/2 { r8 cis8 e8 } |
  fis4  \tuplet 3/2 { r8 cis8 e8 } \tuplet 3/2 { fis8 r8 cis8( }  \tuplet 3/2 { cis8) c8 ( c8) }

  b4 \tuplet 3/2 { r8 b8 b8 } cis4 \tuplet 3/2 { r8 cis8 cis8 } |
  d4 \tuplet 3/2 { r8 d8 d8 } \tuplet 3/2 { e8 r8 cis8( }  \tuplet 3/2 { cis8) c8 ( c8) }

  b4 \tuplet 3/2 { r8 b8 b8 } cis4 \tuplet 3/2 { r8 cis8 cis8 } |
  d4 \tuplet 3/2 { r8 d8 d8 } \tuplet 3/2 { e8 r8 cis8( }  \tuplet 3/2 { cis8) c8 ( c8) }

  b4 \tuplet 3/2 { r8 b8 b8 } cis4 \tuplet 3/2 { r8 cis8 cis8 } |  
  d4 \tuplet 3/2 { r8 d8 d8 } \tuplet 3/2 { e8 r8 cis8( }  \tuplet 3/2 { cis8) c8 ( c8) }

  b4 \tuplet 3/2 { r8 b8 b8 } cis4 \tuplet 3/2 { r8 cis8 cis8 } |  
  \tuplet 3/2 { d8 d8 d8 }\tuplet 3/2 { d8 d8 d8 } \tuplet 3/2 { e8 e8 e8 } \tuplet 3/2 { e8 cis8 e8 }

  \break 

  % RITORNELLO  
  \mark \markup {"Ritornello 1"} 
  fis4 r4 \tuplet 3/2 { cis4 d4 d4 } | e4 r4 r2 |
  fis4 r4 \tuplet 3/2 { cis4 d4 d4 } | e4 r4 r2 |
  fis4 r4 \tuplet 3/2 { cis4 d4 d4 } | e4 r4 r2 |
  fis4 r4 \tuplet 3/2 { cis4 d4 d4 } | e4 r4 \tuplet 3/2 { e4 cis4 c4 } |

  \break

  \mark \markup {"Strofa"} 
  r1 |


}

\score {
  \new Staff \with {
    % instrumentName = "Violino"
    midiInstrument = "violin"
  } {
    \violinoPart
  }
  \layout { 
    indent = 0\mm
  }
  \midi { }
}