import type { AppSequencerNote } from "../applicationState";
import type { JSX } from "react";

interface Props {
  sequence: AppSequencerNote[];
  currentIndex: number | null;
  isPlaying: boolean;
}

export function SequenceGrid({ sequence, currentIndex, isPlaying }: Props) {

  const renderSequenceDisplayValue: ((note: AppSequencerNote | undefined) => JSX.Element) = (note: AppSequencerNote | undefined) => {
    if (note !== undefined) {
      return (
        <>
          <span>{note.noteName}<span className="subscript">{note.octave}</span></span>
        </>
      );
    }
    return <></>;
  }

  return (
    <div className="sequence-grid">
      {Array.from({ length: 16 }).map((_, i) => (
        <div
          key={i}
          className={
            "cell " +
            ((currentIndex !== null && isPlaying && i === currentIndex) ? "active" : "") +
            (sequence[i] ? " filled" : "")
          }
        >
          {renderSequenceDisplayValue(sequence[i])}

        </div>
      ))}
    </div>
  );
}
