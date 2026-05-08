\version "2.24.2"

#(define (code-block str)
   (markup #:box #:typewriter str))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1) Accidental
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

accExample = { cis'4 ees'4 fis'4 gis'4 }

\markup \bold "1) Accidental"
\markup "Mostra alterazioni standard."

\markup \column {
  "Codice:"
  \box \typewriter
  "{
  { cis'4 ees'4 fis'4 gis'4 }
  }"
}

\score { \accExample }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2) Ambitus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ambExample = { c'4 e' g' c'' }

\markup \vspace #1
\markup \bold "2) Ambitus"
\markup "Mostra l'estensione del rigo."

\markup \column {
  "Codice:"
  \box \typewriter
  "{
  \\new Staff
    \\with { \\consists Ambitus_engraver }
    { c'4 e' g' c'' }
  }"
}

\score {
  \new Staff
    \with { \consists Ambitus_engraver }
    \ambExample
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 3) BarLine
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

barExample = { c'4 d' e' f' \bar "||" g' a' b' c'' }

\markup \vspace #1
\markup \bold "3) BarLine"

\markup \column {
  "Codice:"
  \box \typewriter
  "{
  { c'4 d' e' f' \\bar \"||\" g' a' b' c'' }
  }"
}

\score { \barExample }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 4) Beam
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beamExample = { c'8 d' e' f' g' a' b' c'' }

\markup \vspace #1
\markup \bold "4) Beam"

\markup \column {
  "Codice:"
  \box \typewriter
  "{
  { c'8 d' e' f' g' a' b' c'' }
  }"
}

\score { \beamExample }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 5) Clef
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clefExample = { \clef bass c,4 d, e, f, }

\markup \vspace #1
\markup \bold "5) Clef"

\markup \column {
  "Codice:"
  \box \typewriter
  "{
  { \\clef bass c,4 d, e, f, }
  }"
}

\score { \clefExample }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 6) KeySignature
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

keyExample = { \key d \major d'4 e' fis' g' }

\markup \vspace #1
\markup \bold "6) KeySignature"

\markup \column {
  "Codice:"
  \box \typewriter
  "{
  { \\key d \\major d'4 e' fis' g' }
  }"
}

\score { \keyExample }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 7) NoteHead
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

noteheadExample = { c'4 d' e' f' }

\markup \vspace #1
\markup \bold "7) NoteHead"

\markup \column {
  "Codice:"
  \box \typewriter
  "{
  { c'4 d' e' f' }
  }"
}

\score { \noteheadExample }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 8) Rest
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

restExample = { r4 c'4 r4 d'4 }

\markup \vspace #1
\markup \bold "8) Rest"

\markup \column {
  "Codice:"
  \box \typewriter
  "{
  { r4 c'4 r4 d'4 }
  }"
}

\score { \restExample }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 9) Slur
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

slurExample = { c'4( d' e' f') }

\markup \vspace #1
\markup \bold "9) Slur"

\markup \column {
  "Codice:"
  \box \typewriter
  "{
  { c'4( d' e' f') }
  }"
}

\score { \slurExample }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 10) Stem
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

stemExample = { c'4 d' e' f' }

\markup \vspace #1
\markup \bold "10) Stem"

\markup \column {
  "Codice:"
  \box \typewriter
  "{
  { c'4 d' e' f' }
  }"
}

\score { \stemExample }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 11) TimeSignature
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

timeExample = { \time 3/4 c'4 d' e' f' g' a' }

\markup \vspace #1
\markup \bold "11) TimeSignature"

\markup \column {
  "Codice:"
  \box \typewriter
  "{
  { \\time 3/4 c'4 d' e' f' g' a' }
  }"
}

\score { \timeExample }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 12) Tie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tieExample = { c'2~ c'2 }

\markup \vspace #1
\markup \bold "12) Tie"

\markup \column {
  "Codice:"
  \box \typewriter
  "{
  { c'2~ c'2 }
  }"
}

\score { \tieExample }
