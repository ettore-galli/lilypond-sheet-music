\version "2.24.2"

\header {
  title = "Esercizi progressivi per flauto dolce sopranino"
  subtitle = "Suoni reali – Estensione corretta"
  composer = "Copilot"
}

common = {
  \clef "treble"
  \key f \major
  \time 4/4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 1 — Gradi congiunti
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 1 — Gradi congiunti" }
  \new Staff {
    \common
    f' g' a' g' |
    f' g' a' c'' |
    a' g' f' a' |
    g' f' f'2
  }
  \layout { }
  \midi { \tempo 4 = 80 }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 2 — Intervalli di terza
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 2 — Intervalli di terza" }
  \new Staff {
    \common
    f' a' g' b'^"♭/♮" |
    a' c'' b'^"♭/♮" d'' |
    c'' a' g' b'^"♭/♮" |
    a' g' f'2
  }
  \layout { }
  \midi { \tempo 4 = 80 }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 3 — Ritmica semplice
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 3 — Ritmica di base" }
  \new Staff {
    \common
    f'4 g' a'2 |
    r4 a' g' f' |
    g'4 a' c''2 |
    a'1
  }
  \layout { }
  \midi { \tempo 4 = 80 }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 4 — Arpeggi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 4 — Arpeggi" }
  \new Staff {
    \common
    f' a' c'' a' |
    g' b'^"♭/♮" d'' b'^"♭/♮" |
    a' c'' f'' c'' |
    a'2 f'
  }
  \layout { }
  \midi { \tempo 4 = 80 }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 5 — Melodia progressiva
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 5 — Melodia progressiva" }
  \new Staff {
    \common
    f'4 g' a' c'' | a' g' f'2 |
    g'4 a' c'' b'^"♭/♮" | a' g' f'2 |
    f'4 a' c'' a' | g' b'^"♭/♮" d'' b'^"♭/♮" |
    c''4 a' g' f' | f'1
  }
  \layout { }
  \midi { \tempo 4 = 80 }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LIVELLO INTERMEDIO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 6 — Scala estesa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 6 — Scala estesa" }
  \new Staff {
    \common
    f' g' a' c'' |
    b'^"♭/♮" c'' d'' f'' |
    e'' d'' c'' a' |
    g' a' f'2
  }
  \layout { }
  \midi { \tempo 4 = 84 }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 7 — Arpeggi vari
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 7 — Arpeggi vari" }
  \new Staff {
    \common
    f' a' c'' a' |
    g' b'^"♭/♮" d'' b'^"♭/♮" |
    a' c'' e'' c'' |
    g' b'^"♭/♮" g'' b'^"♭/♮" |
    a' g' f'2
  }
  \layout { }
  \midi { \tempo 4 = 84 }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 8 — Ritmica intermedia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 8 — Ritmica intermedia" }
  \new Staff {
    \common
    f'4 g'8 a'8 a'4 c'' |
    b'4 c''8 d''8 d''4 f'' |
    e''8 d'' c'' a' g'4 a' |
    f'1
  }
  \layout { }
  \midi { \tempo 4 = 88 }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 9 — Registro acuto
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 9 — Registro acuto" }
  \new Staff {
    \common
    c''4 d'' e'' f'' |
    g''2 f''4 e'' |
    d'' c'' a' c'' |
    b'^"♭/♮" a' g' f' |
    f'1
  }
  \layout { }
  \midi { \tempo 4 = 88 }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 10 — Melodia articolata
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 10 — Melodia articolata" }
  \new Staff {
    \common
    f'4 a' c'' a' | g' b'^"♭/♮" d'' b'^"♭/♮" |
    c''4 d'' e'' c'' | a' g' f'2 |
    g'4 a' c'' b'^"♭/♮" | a' c'' f'' e'' |
    d''4 c'' a' g' | f'1
  }
  \layout { }
  \midi { \tempo 4 = 92 }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 11 — Arpeggi estesi e salti ampi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 11 — Arpeggi estesi" }
  \new Staff {
    \common
    f' a' c'' f'' |
    e'' c'' a' c'' |
    g' b'^"♭/♮" d'' g'' |
    f'' d'' b'^"♭/♮" g' |
    a' c'' f'' c'' |
    a' g' f'2
  }
  \layout { }
  \midi { \tempo 4 = 96 }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 12 — Cromatismi controllati (entro estensione reale)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 12 — Cromatismi" }
  \new Staff {
    \common
    f'4 fis' g' gis' |
    a'4 gis' a' b'^"♭/♮" |
    c''4 cis'' d'' dis'' |
    e''4 d'' c'' b'^"♭/♮" |
    a' g' fis' g' |
    f'1
  }
  \layout { }
  \midi { \tempo 4 = 92 }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 13 — Registro acuto avanzato (fino a g'')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 13 — Registro acuto avanzato" }
  \new Staff {
    \common
    c''8 d'' e'' f'' g'' f'
  }
}