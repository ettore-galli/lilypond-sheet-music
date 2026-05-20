\version "2.24.2"

\header {
  title = "Viva la vida"
  composer = "Coldplay"
}

\paper {
  line-width = 170\mm
  indent = 0\mm
}

gchords = \chordmode {

}

melody = {
  \set Staff.instrumentName = "Vl."
  \key b \major
  \time 4/4
  \tempo 4 = 96
  
  \mark \markup {"Intro | Strofa 1 | Intermezzo 1"}
  \repeat volta 2 {
    % Esecuzione standard sulla corda RE
    e'4-.-1\3   e'4-.   e'4-.  e'8  fis'8-2( | fis'8) fis'4-.  fis'8  fis'4-.  fis'4-.
    fis'4-.   fis'4-.   fis'4-.  fis'8  gis'8-3( | gis'8) gis'4-.  gis'8  gis'4-.  gis'4-.
  }

  \break
  \mark \markup {"Pre strofa 2"}
  % \repeat volta 2 {
    % Il primo dito sul LA fa il Si e si arriccia indietro per il La#
    b'2.-1\2-\finger "I pos."(  b'8) ais'8-1-\finger "I pos. arr."( | ais'1) | 
    b'2.-1(  b'8) ais'8-1( | ais'1) |
    b'2.-1(  b'8) ais'8-1( | ais'1) |
    b'2.-1(  b'8) ais'8-1( | ais'2) b'8-1\2 ais'8-1 gis'8-3\3 fis'8-2 |
  % }

  \repeat volta 2 {
    \mark \markup {"Strofa 2"}
    \break
    gis'1-3\3 | 
    fis'2-2 b'8-1\2 ais'8-1 fis'8-2\3 dis'8-4\4 | 
    fis'2.-2\3( fis'8) dis'8-4\4( | 
    dis'2) b'8-1\2 ais'8-1 gis'8-3\3 fis'8-2 |

    \break
    gis'1-3\3 | 
    fis'2-2 b'8-1\2 ais'8-1 fis'8-2\3 dis'8-4\4 | 
    fis'2.-2\3( fis'8 )gis'8-3( | 
    gis'1)  |

    \break
    b'4-1\2 cis''8-2 b'8-1( b'4-1) cis''8-2 b'8-1( | b'4-1) cis''8-2 b'8-1( b'2-1)

    \break
    b'4-1\2 cis''8-2 b'8-1( b'4-1) cis''8-2 b'8-1( | b'2-1) b'8-1 ais'8-1 gis'8-3\3 fis'8-2 |
  }

  \break

  \mark \markup {"Ritornello"}
  \repeat volta 2 {
    % Blocco fisso in Prima Posizione senza cambi di corda repentini
    e'4-1\3   e'4   e'4  e'8  fis'8-2( | fis'8) fis'4  fis'8  fis'4  fis'4
    b'4-4\3   b'4   b'4  b'8  gis'8-3( | gis'8) gis'4  gis'8  gis'4  gis'4
  }

  \break

  \mark \markup {"Intermezzo"}
  \repeat volta 2 {
    % Corda RE e passaggio al quarto dito sulla corda SOL
    e'4-1\3   e'4   e'4  e'8  dis'8-4\4( | dis'8) dis'4  dis'8  dis'4  dis'4
    e'4-1\3   e'4   e'4  e'8  dis'8-4\4( | dis'8) dis'4  dis'8  dis'4  dis'4
    \break
    e'4-1\3   e'4   e'4  e'8  dis'8-4\4( | dis'8) dis'4  dis'8  dis'4  dis'4
    fis'1-2\3 |  
    fis'1-2 |  
  }
}

\score {
  <<
    \new Staff {
      \clef treble
      \melody
    }
    \new ChordNames {
      \gchords
    }
  >>
  \layout { 
    \context {
      \Voice
      \romanStringNumbers
      \override StringNumber.direction = #DOWN
      \override Fingering.direction = #UP
    }
  }
  \midi { \tempo 4 = 96 }
}
