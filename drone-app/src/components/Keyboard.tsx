// Keyboard.tsx
import "../index.css";

const NATURALS = ["C", "D", "E", "F", "G", "A", "B"];
const SHARPS = ["C#", "D#", "", "F#", "G#", "A#", ""]; 
const FLATS  = ["Db", "Eb", "", "Gb", "Ab", "Bb", ""]; 

interface Props {
  onNote: (note: string) => void;
  octave: number;
}

export function Keyboard({ onNote, octave }: Props) {
  return (
    <div className="keyboard">
      {NATURALS.map((n, i) => (
        <div key={i} className="key-wrapper">
          {/* tasto bianco */}
          <button
            className="white-key"
            onClick={() => onNote(n + octave)}
          >
            <span className="white-label">{n}</span>
          </button>

          {/* tasto nero sfalsato */}
          {SHARPS[i] && (
            <button
              className="black-key"
              onClick={() => onNote(SHARPS[i] + octave)}
            >
              <span className="black-label-flat">{FLATS[i]}</span>
              <span className="black-label-sharp">{SHARPS[i]}</span>
            </button>
          )}
        </div>
      ))}
    </div>
  );
}
