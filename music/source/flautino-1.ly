\version "2.24.0"

\header {
  title = "Esercizi progressivi per flauto dolce sopranino"
  subtitle = "Lettura in Fa – suoni reali"
  composer = "Copilot"
}

common = {
  \clef "treble"
  \key f \major
  \time 4/4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 1 — Gradi congiunti (solo entro f'–c'')
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
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 2 — Intervalli di terza (senza scendere sotto f')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 2 — Intervalli di terza" }
  \new Staff {
    \common
    f' a' g' b' |
    a' c'' b' d'' |
    c'' a' g' b' |
    a' g' f'2
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 3 — Ritmica semplice (evitando e' e d')
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
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO 4 — Arpeggi entro l’estensione reale
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header { piece = "Esercizio 4 — Arpeggi" }
  \new Staff {
    \common
    f' a' c'' a' |
    g' b' d'' b' |
    a' c'' f'' c'' |
    a'2 f'
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%