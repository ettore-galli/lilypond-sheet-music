\version "2.24.0"

\header {
  title = "I'll be over you"
  subtitle = ""
  composer = "Toto"
  arranger = ""
  tagline = ##f
}

global = {
  \key bes \major
  \time 4/4
  \tempo "Moderately" 4 = 72
}

violin = {
  \global
  \clef treble
  
  % Intro

  R1*9
  \break
  
  R1*8
  \break

  R1^\markup { \italic "It takes some time..." } |
  f''1             | 
  f''2   ees''2    | 
  ees''1           | 
  d''2   c''8. d''16~d''8 f''8  |
  
  \break  

  d''2^\markup { \italic "Heart stops breakin'..." }     c''4    f''4 | 
  bes'2    a'4    f'4  |
  d''2    c''4    f''4 | 
  bes'2    a'4    f'4  |
  ees''2   bes'2       | 
  c''1                 |
  bes'1 \fermata 

  \break

  d''2^\markup { \italic "Heart stops breakin'...(alt)" }     c''4    f''4 | 
  bes'2    a'4    f'4  |
  d''2    c''4    f''4 | 
  bes'2    a'4    f'4  |
  ees''1               |
  c''2     a'2         | 
  bes'1 \fermata 

  \break

  d''2^\markup { \italic "Heart stops breakin'...(alt)" }     c''4    f''4 | 
  bes'2    a'4    f'4  |
  d''2    c''4    f''4 | 
  bes'2    a'4    f'4  |
  ees''2   d''2        |
  c''2     f'2         | 
  bes'1 \fermata 

  \break

  aes'1^\markup { \italic "Solo" }  |
  g'1   |
  ges'1 |
  f'1   |
  g'2  f'2 |
  g'1
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
    }
  }
  \midi { }
}