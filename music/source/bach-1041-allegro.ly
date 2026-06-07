\version "2.24.0"

\header {
  title = "Concerto in La minore BWV 1041"
  subtitle = "I. Allegro"
  composer = "J. S. Bach"
}

violin = \relative a' {
  \key a \minor
  \time 4/4
  \tempo "Allegro"

  % --- TEMA PRINCIPALE ---
  a8-1 b-2 c-3 d-4 e-1 f-2 g-3 a-4 |
  b8-1^\markup "III" c-2 d-3 e-4 f-1 g-2 a-3 b-4 |
  c8-1 d-2 e-3 f-4 g-1 a-2 b-3 c-4 |
  d4-1 c8-2 b-1 a4-1 g8-2 f-1 |

  % --- SEQUENZA ---
  e8-1 f-2 g-3 a-4 b-1 c-2 d-3 e-4 |
  f4-1 e8-2 d-1 c4-1 b8-2 a-1 |

  % --- PASSAGGIO SCALARE ---
  a8-1 b-2 c-3 d-4 e-1 f-2 g-3 a-4 |
  g8-3 f-2 e-1 d-1 c-3 b-2 a-1 g-1 |

  % --- SEZIONE CENTRALE ---
  e'8-1^\markup "III" d-2 c-1 b-2 a-1 g-2 f-1 e-1 |
  d8-1 e-2 f-3 g-4 a-1 b-2 c-3 d-4 |
  e4-1 d8-2 c-1 b4-1 a8-2 g-1 |

  % --- RIPRESA ---
  a8-1 b-2 c-3 d-4 e-1 f-2 g-3 a-4 |
  b8-1^\markup "III" c-2 d-3 e-4 f-1 g-2 a-3 b-4 |
  c8-1 d-2 e-3 f-4 g-1 a-2 b-3 c-4 |
  d4-1 c8-2 b-1 a4-1 g8-2 f-1 |

  % --- CODA ---
  e8-1 f-2 g-3 a-4 b-1 c-2 d-3 e-4 |
  f4-1 e8-2 d-1 c4-1 b8-2 a-1 |
  a1-1
}

continuo = \relative a {
  \key a \minor
  \time 4/4

  a2 e |
  a e |
  a1 |
  e2 a |
  d a |
  e1 |
  a2 e |
  a1 |
}

\score {
  <<
    \new Staff \with { instrumentName = "Violino" }
      { \clef treble \violin }

    \new Staff \with { instrumentName = "Basso" }
      { \clef bass \continuo }
  >>
  \layout { }
}
