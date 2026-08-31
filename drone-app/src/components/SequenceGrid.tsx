import type { AppSequencerNote } from "../applicationState";

interface Props {
  sequence: AppSequencerNote[];
  currentIndex: number | null;
}

export function SequenceGrid({ sequence, currentIndex }: Props) {
  const getSequenceDisplayValue: (note: AppSequencerNote | undefined) => string = (note) => {
    if (note !== undefined) {
      return `${note.noteName}${String(note.octave)}`;
    }
    return "";
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
          {getSequenceDisplayValue(sequence[i])}
        </div>
      ))}
    </div>
  );
}
