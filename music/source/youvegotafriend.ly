\version "2.24.0"

\header {
  title = "You've Got a Friend"
  composer = "Carole King"
  tagline = ##f
}

global = {
  \key f \minor
  \time 4/4
  \tempo "Slowly" 4 = 72
}

violin = {
  \global
  \clef treble
  
  % Intro
  R1*2
  
  \break

  \repeat volta 2 {
  c'1       |c'1          | f'2   ees'2 | c'1
  des'1     |f'2   ees'2   
  }
  \alternative {
    {|c'1           |c'1           }
    {|bes1          |f'2   ees'2   }
  }
    \bar "||"d'2        e'2
  
  \break
    |c'1       |c'1          |f'1        |f'1                  
    |ees'1     |ees'1        |bes1       |bes2      f'4  ees'4   

  \break
    |c'1       |c'1          |f'1        |f'2       ees'2                  
    |des'2      c'2          |bes2        f'2    
    |ees'1     |f'1          |ees'1      |d'2        e'2  
  
  \break
    |ges'1     |f'1          |ees'1      |ees'1  
    |f'1       |ges'1        |f'1        |f'1  
    |ees'1     |ees'1  
  
  \break
    |ees'1     |f'1 

  % c'1\fermata |
}

\score {
  \new Staff \with {
    instrumentName = "Violino"
    shortInstrumentName = "Vl."
  } {
    \violin
  }
  \layout {
    \context {
      \Score
      \override TextScript.font-size = #-1
      \override TextScript.direction = #UP
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8)
      \override SpacingSpanner.shortest-duration-space = #2.0
    }
  }
  \midi { }
}