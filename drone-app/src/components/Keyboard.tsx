import type { JSX } from "react";
import { noteNamesMap } from "../base/typeDefinitions";

const NATURALS = [noteNamesMap.C, noteNamesMap.D, noteNamesMap.E, noteNamesMap.F, noteNamesMap.G, noteNamesMap.A, noteNamesMap.B];
const SHARPS = [noteNamesMap.CSharp, noteNamesMap.DSharp, noteNamesMap.NoKey, noteNamesMap.FSharp, noteNamesMap.GSharp, noteNamesMap.ASharp, noteNamesMap.NoKey];
const FLATS = [noteNamesMap.DFlat, noteNamesMap.EFlat, noteNamesMap.NoKey, noteNamesMap.GFlat, noteNamesMap.AFlat, noteNamesMap.BFlat, noteNamesMap.NoKey];

interface Props {
  onNote: (note: string) => void;
  onClear: () => void;

}

export function Keyboard({ onNote, onClear }: Props) {

  const buildWhiteKey: ((noteName: string) => JSX.Element) = (noteName: string) => {
    return <button
      className="white-key"
      onClick={() => onNote(noteName)}
    >
      <span className="white-label">{noteName}</span>
    </button>
  }

  const buildBlackKey: ((flatNoteName: string, sharpNoteName: string) => JSX.Element) = (flatNoteName: string, sharpNoteName: string) => {
    return <button
      className="black-key"
      onClick={() => onNote(sharpNoteName)}
    >
      <span className="black-label-flat">{flatNoteName}</span>
      <span className="black-label-sharp">{sharpNoteName}</span>
    </button>
  }

  const buildClearKey: (() => JSX.Element) = () => {
    return <button
      className="clear-key"
      onClick={() => onClear()}
    >
      <span className="clear-label">CLR</span>
    </button>
  }

  return (
    <div className="keyboard">

      {NATURALS.map((n, i) => (
        <div key={i} className="key-wrapper">

          {buildWhiteKey(n)}

          {/* tasto nero sfalsato */}
          {(SHARPS[i] && SHARPS[i] !== noteNamesMap.NoKey) && (
            buildBlackKey(FLATS[i], SHARPS[i])
          )}

        </div>
      ))}

      <div key={"CLEAR"} className="key-wrapper">
        {buildClearKey()}
      </div>

    </div>
  );
}
