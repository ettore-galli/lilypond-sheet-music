interface Props {
  octave: number;
  onChange: (oct: number) => void;
}

export function OctaveSelector({ octave, onChange }: Props) {
  return (
    <div className="octave-row">
      <button onClick={() => onChange(octave - 1)}>-</button>
      <span className="octave-display">Ottava {octave}</span>
      <button onClick={() => onChange(octave + 1)}>+</button>
    </div>
  );
}
