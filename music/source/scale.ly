\version "2.24.2"

\header {
  title = "Scale"
}

\paper {
  line-width = 170\mm
  indent = 0\mm
}

melody =   {
  \set Staff.instrumentName = "Vl."
  \key b \minor
  \time 4/4


  \set Score.barNumberVisibility = #all-bar-numbers-visible


  \repeat volta 2 {
    \mark \markup {"Si Minore"}
    %% --- SCALA ASCENDENTE ---
    % Corda SOL (IV) - Note sotto il Do centrale
    b4\4-2 cis'4-3 d'4-4

    % Corda RE (III) - Note dal Do centrale in su
    e'4\3-1 | fis'4-2 gis'4-3 ais'4-4

    % Corda LA (II)
    b'4\2-1 | cis''4-2 d''4-3 e''4-4

    % Corda MI (I) - Ottava superiore
    fis''4\1-1 | gis''4-2 ais''4-3 b''4-4

    % Interruzione per andare a capo
    \break

    %% --- SCALA DISCENDENTE (Modo Naturale) ---
    % Corda MI (I)
    b''4\1-4 | a''4-3 g''4-2 fis''4-1

    % Corda LA (II)
    e''4\2-4 | d''4-3 cis''4-2 b'4-1

    % Corda RE (III)
    a'4\3-4 | g'4-3 fis'4-2 e'4-1

    % Corda SOL (IV)
    d'4\4-4 | \partial 2 cis'4-3 b4-2 |

    % Barra di fine doppia
    \bar "|."

    \break

    \mark \markup {"Si Maggiore"}
    \clef treble
    \key b \major
    \time 4/4

    %% --- SCALA ASCENDENTE ---
    % Corda SOL (IV)
    b4\4-2 cis'4-3 dis'4-4

    % Corda RE (III)
    e'4\3-1 | fis'4-2 gis'4-3 ais'4-4

    % Corda LA (II)
    b'4\2-1 | cis''4-2 dis''4-3 e''4-4

    % Corda MI (I)
    fis''4\1-1 | gis''4-2 ais''4-3 b''4-4

    % Interruzione per andare a capo
    \break

    %% --- SCALA DISCENDENTE ---
    % Corda MI (I)
    b''4\1-4 | ais''4-3 gis''4-2 fis''4-1

    % Corda LA (II)
    e''4\2-4 | dis''4-3 cis''4-2 b'4-1

    % Corda RE (III)
    ais'4\3-4 | gis'4-3 fis'4-2 e'4-1

    % Corda SOL (IV)
    dis'4\4-4 | \partial 2 cis'4-3 b4-2

    % Barra di fine doppia
    \bar "|."
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