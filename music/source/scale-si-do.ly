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
  \time 4/4


  \set Score.barNumberVisibility = #all-bar-numbers-visible


  \repeat volta 2 {

    \break

    \mark \markup {"Si Maggiore"}
    \clef treble
    \key b \major
    \time 4/4

    %% --- SCALA ASCENDENTE ---
    b4\4-2 cis'4-3 dis'4-4
    e'4\3-1 | fis'4-2 gis'4-3 ais'4-4
    b'4\2-1 | cis''4-2 dis''4-3 e''4-4
    fis''4\1-1 | gis''4-2 ais''4-3 b''4-4

    \break

    %% --- SCALA DISCENDENTE ---
    b''4\1-4 | ais''4-3 gis''4-2 fis''4-1
    e''4\2-4 | dis''4-3 cis''4-2 b'4-1
    ais'4\3-4 | gis'4-3 fis'4-2 e'4-1
    dis'4\4-4 | \partial 2 cis'4-3 b4-2

    % Barra di fine doppia
    \bar "|."

    \break

    %% --- SCALA ASCENDENTE ---
    b4\4-2 cis'4-3 dis'4-4
    e'4\3-1 | fis'4-2 gis'4-3 ais'4-4
    b'4\2-1 | cis''4-2 dis''4-3 e''4-4
    fis''4\1-1 | gis''4-2 ais''4-3 b''4-4

    \break

    %% --- SCALA DISCENDENTE ---
    b''4\1-4 | ais''4-3 gis''4-2 fis''4-1
    e''4\2-4 | dis''4-3 cis''4-2 b'4-1
    ais'4\3-4 | gis'4-3 fis'4-2 e'4-1
    dis'4\4-4 | \partial 2 cis'4-3 b4-2
  }

  \break 

  \repeat volta 2 {

    \key c \major

    %% --- SCALA ASCENDENTE ---
    c'4\4-3 d'4-4 e'4\3-1 f'4-2
    g'4-3 a'4-4 b'4\2-1 c''4-2
    d''4-3 e''4-4
    e''4\1-1 f''4-2 g''4-3 a''4-4
    b''4-1 c'''4-2

    \break

    %% --- SCALA DISCENDENTE (con corde vuote) ---
    c'''4-2 b''4-1 a''4-4 g''4-3 f''4-2 e''4-1
    d''4\1-0 c''4\2-0 b'4\2-0 a'4\3-0
    g'4\3-0 f'4-2 e'4-1
    d'4\4-0 c'4\4-3

  }

}

\score {
  \new Staff {
    \clef treble
    \melody
  }
  \layout { }
  \midi { \tempo 4 = 70 }
}