\version "2.24.0"

\header {
  title = "You've Got a Friend"
  subtitle = "Parte di Violino di Accompagnamento (1ª posizione)"
  composer = "Carole King"
  arranger = "Accompagnamento discreto"
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
  
  % 3-6
  c'2.\mp^\markup { \italic "When you're down and troubled..." } f'4 |
  e'2. g'4 | e'2. g'4 | c'2. f'4 |
  
  % 7-10
  des'2.^\markup { \italic "and nothing is going right..." } f'4 |
  d'2. f'4 | des'2. f'4 | ees'2. g'4 |
  
  % 11-14
  c'2.^\markup { \italic "Close your eyes and think of me..." } ees'4 |
  c'2. f'4 | des'2. f'4 | e'2. g'4 |
  
  % 15-18
  c'2.^\markup { \italic "and soon I will be there..." } f'4 |
  des'2. f'4 | e'2. g'4 | c'2. r4 |
  
  % 19-22
  des'2.^\markup { \italic "You just call out my name..." } \mf f'4 |
  c'2. ees'4 | des'2. f'4 | c'2. ees'4 |
  
  % 23-26
  des'2.^\markup { \italic "and you know wherever I am..." } f'4 |
  c'2. f'4 | des'2. f'4 | e'2. g'4 |
  
  % 27-30
  c'2.^\markup { \italic "I'll come running..." } f'4 |
  des'2. f'4 | e'2. g'4 | c'2. r4 |
  
  % 31-34
  des'2.^\markup { \italic "Winter, spring, summer or fall..." } \mf f'4 |
  c'2. ees'4 | des'2. f'4 | c'2. ees'4 |
  
  % 35-38
  des'2.^\markup { \italic "All you have to do is call..." } f'4 |
  c'2. f'4 | e'2. g'4 | c'2. r4 |
  
  % 39-42
  c'2.^\markup { \italic "You've got a friend" } \f f'4 |
  e'2. g'4 | c'1 ~ | c'2. r4 |
  
  % Bridge
  des'2.^\markup { \italic "If the sky above you..." } \mp f'4 |
  c'2. f'4 | des'2. f'4 | e'2. g'4 |
  
  % 
  c'2.^\markup { \italic "Now ain't it good to know..." } f'4 |
  des'2. f'4 | e'2. g'4 | c'2. r4 |
  
  % Coda
  \repeat volta 2 {
    c'2.^\markup { \italic "You've got a friend..." } \mp f'4 |
    e'2. g'4 | c'2. f'4 | e'2. g'4 |
  }
  
  c'1\fermata |
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