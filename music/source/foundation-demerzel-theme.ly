\version "2.24.2"

\header {
  title = "Demerzel song"
  composer = "Bear McCreary"
}

melody =   {
  \set Staff.instrumentName = "Voice"
  \key bes \minor
  \time 4/4
  \tempo "Lento"

  \set Score.barNumberVisibility = #all-bar-numbers-visible

 
    bes4     c'8       des'8     ees'4      aes'4      f'1        
    bes4     c'8       des'8     c'4        bes4       a1      
    bes4     c'8       des'8     ees'4      aes'4      f'4      ges'8     f'8
    des'2                        c'4        des'8      ees'8    f'4       des'4
    bes1     
 

}

\score {
  \new Staff {
    \clef treble
    \melody
  }
  \layout { }
  \midi { tempoWholesPerMinute = #70 }
}