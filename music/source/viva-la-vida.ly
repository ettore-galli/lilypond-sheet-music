\version "2.24.2"

\header {
  title = "Viva la vida"
  composer = "Coldplay"
}

gchords = \chordmode {
  bes1:7sus4 | s1  | d1:m | c1
}

melody = {
  \set Staff.instrumentName = "Vl."
  \key b \major
  \time 4/4
  \mark \markup {"Strofa 1"}
  \repeat volta 2 {
    e'4-2   e'4   e'4  e'8  fis'8-3( | fis'8) fis'4  fis'8  fis'4  fis'4
    fis'4   fis'4   fis'4  fis'8  gis'8-4( | gis'8) gis'4  gis'8  gis'4  gis'4
  }

  \break
  \mark \markup {"Strofa 2"}
  \repeat volta 2 {

    b'2.-2(  b'8) ais'8-1( | ais'1) | b'2.-2(  b'8) ais'8-1( | ais'1)
    b'2.-2(  b'8) ais'8-1( | ais'2) b'8-2 ais'8-1 gis'8-4 fis'8-3 |
  }
  \repeat volta 2 {
    \break
    gis'1-4 | fis'2-3 b'8-2 ais'8-1 fis'8-3 dis'8-1| fis'2.-3( fis'8) dis'8-1( | dis'2) b'8-2 ais'8-1 gis'8-4 fis'8-3 |

    \break
    gis'1-4 | fis'2-3 b'8-2 ais'8-1 fis'8-3 dis'8-1| fis'2.-3( fis'8 )dis'8-1( | dis'1)  |

    \break
    b'4-2 cis''8-3 b'8( b'4-2) cis''8-3 b'8( | b'4-2) cis''8-3 b'8( b'2)

    \break
    b'4-2 cis''8-3 b'8( b'4-2) cis''8-3 b'8( | b'2-2) b'8-2 ais'8-1 gis'8-4 fis'8-3 |
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
  \layout { }
  \midi { \tempo 4 = 70 }
}
