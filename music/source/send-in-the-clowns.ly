\version "2.24.2"

\header {
  title = "Send in the Clowns"
  composer = "Stephen Sondheim"
}

melody =   {
  \set Staff.instrumentName = "T.W."
  \key a \major
  \time 12/8
  \tempo "Lento"

  \set Score.barNumberVisibility = #all-bar-numbers-visible

  \partial 4.
  % ----------------------------------------------------------------
  d'8      e'       a'       |
  \repeat volta 2 {
    a'4.     r4.      r4.      d'8      e'8      a'8      |
    a'4.     r4.      r4.      b'8      cis''8   a'8      |
    \time 9/8
    b'8      cis''8   cis''8   cis''4.  cis''8   e''8     e'8      |
    % ----------------------------------------------------------------
    \time 12/8
    fis'4.   r4.      r4.      fis'8    a'8      d'8      |
    e'2.     r2.      |
    r2.      r4.      d'8      e'       a'       |
    a'4.     r4.      r4.      d'8      e'8      a'8      |
    % ----------------------------------------------------------------
    a'4.     r4.      r4.      b'8      cis''8   a'8      |
    \time 9/8
    b'8      cis''8   cis''8   cis''4.  cis''8   e''8     e'8      |
    \time 12/8
    fis'4.   r4.      r4.      fis'8    a'8      d'8      |
    e'2.     r4.      fis'8    a'8      gis'8    |
    % ----------------------------------------------------------------
    a'2.     r4.      gis'8    cis''8   b'8      |
    cis''2.  r4.      gis'8    cis''8   b'8      |
    cis''2.  r4.      gis'8    dis''8   b'8      |
    cis''2.  r4.      gis'8    dis''8   b'8      |
    % ----------------------------------------------------------------
    \time 9/8
    cis''8   dis''8   dis''8   dis''8   e''8     e''8     e''8     dis''8   b'8      |
    \time 12/8
    cis''2.  r4.      gis'8    cis''8   gis'8    |
    \time 9/8
    a'8      b'8      b'8      b'8      cis''8   cis''8   cis''8   b'8      fis'8    |
    \time 12/8
    gis'2.   r4.      f'8      a'8      f'8      |
    % ----------------------------------------------------------------
    gis'2.   r4.      fis'8    a'8      d'8      |
    \alternative {
      {e'2.     r4.       d'8      e'8      a'8   |}
      {
        e'2.     r4       e'8      fis'8    a'8      d'8    |
        e'2.     r4       e'8      fis'8    a'8      d'8    |
        e'2.     r4       d'8      e'8      a'8      gis'8    |
        a'2.     r2.      |
      }
    }
  }

}

\score {
  \new Staff {
    \clef treble
    \melody
  }
  \layout { }
  \midi { tempoWholesPerMinute = #70 }
}