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

 
  \repeat volta 3 {
    \mark \markup {"A"} 
b-1   cis'-2   d'-3   e'-4
fis'-1   g'-2   a'-4   b'-1
cis''-2  d''-3  e''-1  fis''-2
g''-3   a''-4   b''-1


      \break 

b''-1   a''-4   g''-3   fis''-2
e''-1   d''-3   cis''-2   b'-1
a'-4   g'-2   fis'-1   e'-4
d'-3   cis'-2   b-1

  } 
  
  \break

 

  % \break

  % \repeat volta 2 {
  %   \mark \markup {"Strofa 1 / c"} 
  %   g'1-3   |   e'1-1    |    d'1-4    |    fis'1-2     |
  % }  


  % \break

  % \repeat volta 2 {
  %   \mark \markup {"Strofa 2"} 
  %   e'1    |   c'1    |    g'1    |    a'1     |
  % }   
 
  % \break

  % \repeat volta 2 {
  %   \mark \markup {"Ritornello"} 
  %   <e' g'>1   |   c''1    |    b'1    |    a'1     |
  % } 
}

\score {
  \new Staff {
    \clef treble
    \melody
  }
  \layout { }
  \midi { tempoWholesPerMinute = #70 }
}