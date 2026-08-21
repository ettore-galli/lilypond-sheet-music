// SequenceGrid.tsx
interface Props {
  sequence: string[];
  currentIndex: number | null;
}

export function SequenceGrid({ sequence, currentIndex }: Props) {
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
          {sequence[i] || ""}
        </div>
      ))}
    </div>
  );
}
