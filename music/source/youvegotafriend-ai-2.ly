\version "2.24.0"

\header {
  title = "You've Got a Friend"
  subtitle = "Parte di Violino – Versione 2 (segue il cantato + riempie le pause)"
  composer = "Carole King"
  arranger = "Accompagnamento più melodico"
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
  
  % 3-6  "When you're down and troubled..."
  c'4^\markup { \italic "When you're down and troubled..." } \mp des'4 c'4 f'4 |
  e'4 f'4 e'4 g'4 | e'4 f'4 e'4 g'4 | c'4 des'4 c'4 f'4 |
  
  % 7-10 "and nothing is going right..."
  des'4^\markup { \italic "and nothing is going right..." } ees'4 des'4 f'4 |
  d'4 ees'4 d'4 f'4 | des'4 ees'4 des'4 f'4 | ees'4 f'4 ees'4 g'4 |
  
  % 11-14 "Close your eyes and think of me..."
  c'4^\markup { \italic "Close your eyes and think of me..." } des'4 c'4 ees'4 |
  c'4 des'4 c'4 f'4 | des'4 ees'4 des'4 f'4 | e'4 f'4 e'4 g'4 |
  
  % 15-18 "and soon I will be there..."
  c'4^\markup { \italic "and soon I will be there..." } des'4 c'4 f'4 |
  des'4 ees'4 des'4 f'4 | e'4 f'4 e'4 g'4 | c'2. r4 |
  
  % 19-22 "You just call out my name..."
  des'4^\markup { \italic "You just call out my name..." } \mf ees'4 des'4 f'4 |
  c'4 des'4 c'4 ees'4 | des'4 ees'4 des'4 f'4 | c'4 des'4 c'4 ees'4 |
  
  % 23-26 "and you know wherever I am..."
  des'4^\markup { \italic "and you know wherever I am..." } ees'4 des'4 f'4 |
  c'4 des'4 c'4 f'4 | des'4 ees'4 des'4 f'4 | e'4 f'4 e'4 g'4 |
  
  % 27-30 "I'll come running..."
  c'4^\markup { \italic "I'll come running..." } des'4 c'4 f'4 |
  des'4 ees'4 des'4 f'4 | e'4 f'4 e'4 g'4 | c'2. r4 |
  
  % 31-34 "Winter, spring, summer or fall..."
  des'4^\markup { \italic "Winter, spring, summer or fall..." } \mf ees'4 des'4 f'4 |
  c'4 des'4 c'4 ees'4 | des'4 ees'4 des'4 f'4 | c'4 des'4 c'4 ees'4 |
  
  % 35-38 "All you have to do is call..."
  des'4^\markup { \italic "All you have to do is call..." } ees'4 des'4 f'4 |
  c'4 des'4 c'4 f'4 | e'4 f'4 e'4 g'4 | c'2. r4 |
  
  % 39-42 "You've got a friend"
  c'4^\markup { \italic "You've got a friend" } \f des'4 c'4 f'4 |
  e'4 f'4 e'4 g'4 | c'2. ~ c'4 | c'2. r4 |
  
  % Bridge
  des'4^\markup { \italic "If the sky above you..." } \mp ees'4 des'4 f'4 |
  c'4 des'4 c'4 f'4 | des'4 ees'4 des'4 f'4 | e'4 f'4 e'4 g'4 |
  
  % 
  c'4^\markup { \italic "Now ain't it good to know..." } des'4 c'4 f'4 |
  des'4 ees'4 des'4 f'4 | e'4 f'4 e'4 g'4 | c'2. r4 |
  
  % Coda
  \repeat volta 2 {
    c'4^\markup { \italic "You've got a friend..." } \mp des'4 c'4 f'4 |
    e'4 f'4 e'4 g'4 | c'4 des'4 c'4 f'4 | e'4 f'4 e'4 g'4 |
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