\version "2.24.0"

\header {
  title = "21 Guns"
  composer = "Green Day"
  tagline = ##f
}

\paper {
  line-width = 170\mm
  indent = 0\mm
}

global = {
  \key e \minor
  \time 4/4
  % \tempo "Slowly" 4 = 72
}

violin = {
  \global
  \clef treble
  
 
 \mark \markup {"Strofa"}
 \repeat volta 2 { 
  r4        e'4     e''2 | d''4. g'8(    g'4)  fis'4 |
  e'2               e''2 | d''4. g'8(    g'4)  fis'4 |
  e'2               e''2 | d''4. g'8(    g'4)  fis'4 |
 }
 \alternative {
  {e'1                    | fis'4 g'4     a'4   fis'4 |}
  {e'1                    | R1                        |}
 }  

\break
 
\mark \markup {"Ritornello"}
\repeat volta 2 { 
 g'8 g'8    r4  fis'8 fis'8   r4 |  e'8 e'8  r4  d'8 d'8     r4 |
 c''2           b'2              |  a'1                         | 
}
{g'1                         |  a'1                         | }


\break

\mark \markup {"Bridge"}
{ 
e'2    c''2   |  b'2     d'2    |
e'2    c''2   |  b'2     fis'2  |
e'2    c''2   |  b'2     fis'2  |
g'1           |  a'1            |
}

\break

\mark \markup {"Gtr.Solo"}
{
g'2    fis'2 |  e'2   d''2  |c''2   b'2   |  a'1         |
g'2    fis'2 |  e'2   d''2  |c''2   b'2   |  a'1         |
g'1                         |  fis'8 fis'8 fis'8 fis'8 fis'8 fis'8 fis'8 fis'8 |
}



}

\score {
  \new Staff \with {
    instrumentName = "Vl."
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