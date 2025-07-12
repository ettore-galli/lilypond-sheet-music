\version "2.24.2"

\header {
  title = "Send in the Clowns (Tin Whistle in D)"
  composer = "Stephen Sondheim"
}

melody =   {
  \key d \major
  \time 12/8
  \tempo "Lento"

  % ---------------------------------------------------------------- 
  %       *       *       *       *       *       *       *       *       
  r2. r4. d'8 e' a' |
  a'4. r4. r4. d'8 e'8 a'8            |
  a'4. r4. r4. b'8 cis''8 a'8           |
  \time 9/8
  b'8 cis''8 cis''8 cis''4. cis''8 e''8 e'8   |
  \time 12/8
  fis'4. r4. r4. fis'8 a'8 d'8        |
  e'2. r2.                            |

  % ---------------------------------
  r2. r4. d'8 e' a' |
  a'4. r4. r4. d'8 e'8 a'8            |
  a'4. r4. r4. b'8 cis''8 a'8           |
  \time 9/8
  b'8 cis''8 cis''8 cis''4. cis''8 e''8 e'8   |
  \time 12/8
  fis'4. r4. r4. fis'8 a'8 d'8        |
  e'2. r4.       fis'8 a'8 gis'8      |
  a'2. r4.       g'8  cis''8 b'8       |

  % ---------------------------------

  cis''2. r4. g'8  cis''8 b'8       |
  cis''2. r4. g'8  dis''8   b'8       |
  cis''2. r4. g'8  dis''8   b'8       |
  \time 9/8
  cis''8 dis''8 dis''8 dis''8 e''8 e''8 e''8 dis''8 b'8 |
  \time 12/8
  cis''2. r4. g'8  cis''8   g'8       |
  \time 9/8
  a'8 b'8 b'8 b'8 cis''8 cis''8 cis''8 b'8 fis'8 |
  \time 12/8
  g'2. r4.  f'8   a'8  f'8  |
  g'2. r4.  fis'8 a'8  d'8  |
  e'2. r4  d'8 e'8 a'8 g'8  |
  a'2. r2. |
}

\score {
  \new Staff {
    \clef treble
    \melody
  }
  \layout { }
  \midi { tempoWholesPerMinute = #60 }
}