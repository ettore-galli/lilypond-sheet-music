\version "2.24.4"

\header {
  title = "Send in the Clowns (Tin Whistle in D)"
  composer = "Stephen Sondheim"
}

melody = \relative d' {
  \key c \major
  \time 4/4
  \tempo "Lento"
  
  % Levare
  r4 d4 e a |
  % Introduzione (prima frase)
  a1 |
  r4 d4 e a |
  a1 |
   
}

\score {
  \new Staff {
    \clef treble
    \melody
  }
  \layout { }
  \midi { tempoWholesPerMinute = #60 }
}