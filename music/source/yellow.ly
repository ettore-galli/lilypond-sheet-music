\version "2.24.2"

\header {
  title = "Yellow"
  composer = "Coldplay"
}

\paper {
  line-width = 170\mm
  indent = 0\mm
}

melody =   {
  \set Staff.instrumentName = "Vl."
  \key b \major
  \time 4/4

  \set Score.barNumberVisibility = #all-bar-numbers-visible

  \repeat volta 2 {
    
    \mark \markup {"Strofa"}

    <<
    \new Voice = "melody" {
     \voiceOne
      <b-3 dis'-1>1   |   <ais-2 fis'-3>1    |   <gis-1 e'-2>1     |    <b-3 dis'-1>1    |
    }

    \new Voice = "slashes" \with {
      \override NoteHead.style = #'slash
    } {
      \voiceTwo
      \stemUp e''8 [ e''8 e''8 ] e''8 [ e''8 e''8 ] e''8 [ e''8 ]
      \stemUp e''8 [ e''8 e''8 ] e''8 [ e''8 e''8 ] e''8 [ e''8 ]
      \stemUp e''8 [ e''8 e''8 ] e''8 [ e''8 e''8 ] e''8 [ e''8 ]
      \stemUp e''8 [ e''8 e''8 ] e''8 [ e''8 e''8 ] e''8 [ e''8 ]
    }
    >>
  }

  \break

  \repeat volta 3 {
    \mark \markup {"Ritornello"}
    
    e'4~-1 e'8 fis'4-2( gis'8-3 ) cis''8-1 [gis'8-3]  | 
    dis''4~-1 dis''8-1 gis'8~-3 gis'2-3 |

    e'4~-1 e'8 fis'4-2( gis'8-3 ) cis''8-1 [gis'8-3]  | 
    dis''4~-1 dis''8-1 gis'8~-3 gis'2-3 |
  }

  \repeat volta 1 {
    e'1-1 |
  }

  \break

}

\score {
  \new Staff {
    \clef treble
    \melody
  }
  \layout {
  }
  \midi { tempoWholesPerMinute = #70 }
}
