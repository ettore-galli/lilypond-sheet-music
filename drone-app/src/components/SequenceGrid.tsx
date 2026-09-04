import type { AppSequencerNote } from "../applicationState";
import type { JSX } from "react";

interface Props {
  sequence: AppSequencerNote[];
  currentIndex: number | null;
}

export function SequenceGrid({ sequence, currentIndex }: Props) {
  const getSequenceDisplayValue: (note: AppSequencerNote | undefined) => (string | number)[] = (note) => {
    if (note !== undefined) {
      return [note.noteName, note.octave];
    }
    return [];
  }
  const renderSequenceDisplayValue: ((note: AppSequencerNote | undefined) => JSX.Element) = (note: AppSequencerNote | undefined) => {
    if (note !== undefined) {
      return (
        <>
          <span>{note.noteName}</span><span className="subscript">{note.octave}</span>
        </>
      );

    }
    return <></>;
  }

  return (
    <div className="grid">
      {Array.from({ length: 16 }).map((_, i) => (
        <div
          key={i}
          className={
            "cell " +
            (i === currentIndex ? "active" : "") +
            (sequence[i] ? " filled" : "")
          }
        >
          {renderSequenceDisplayValue(sequence[i])}

        </div>
      ))}
    </div>
  );
}
