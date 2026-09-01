import { noteNamesMap } from "../base/typeDefinitions";

const NATURALS = [noteNamesMap.C, noteNamesMap.D, noteNamesMap.E, noteNamesMap.F, noteNamesMap.G, noteNamesMap.A, noteNamesMap.B];
const SHARPS = [noteNamesMap.CSharp, noteNamesMap.DSharp, noteNamesMap.NoKey, noteNamesMap.FSharp, noteNamesMap.GSharp, noteNamesMap.ASharp, noteNamesMap.NoKey];
const FLATS = [noteNamesMap.DFlat, noteNamesMap.EFlat, noteNamesMap.NoKey, noteNamesMap.GFlat, noteNamesMap.AFlat, noteNamesMap.BFlat, noteNamesMap.NoKey];

interface Props {
  onNote: (note: string) => void;
  onClear: () => void;

}

export function Keyboard({ onNote, onClear }: Props) {
  return (
    <div className="keyboard">
      {NATURALS.map((n, i) => (
        <div key={i} className="key-wrapper">
          {/* tasto bianco */}
          <button
            className="white-key"
            onClick={() => onNote(n)}
          >
            <span className="white-label">{n}</span>
          </button>

          {/* tasto nero sfalsato */}
          {(SHARPS[i] && SHARPS[i] !== noteNamesMap.NoKey) && (
            <button
              className="black-key"
              onClick={() => onNote(SHARPS[i])}
            >
              <span className="black-label-flat">{FLATS[i]}</span>
              <span className="black-label-sharp">{SHARPS[i]}</span>
            </button>
          )}
        </div>
      ))}
      <div key={"CLEAR"} className="key-wrapper">
        <button
          className="clear-key"
          onClick={() => onClear()}
        >
          <span className="clear-label">CLR</span>
        </button>

      </div>
    </div>
  );
}
