interface Props {
  octave: number;
  onChange: (oct: number) => void;
}

export function OctaveSelector({ octave, onChange }: Props) {
  return (
    <div className="controls-row">
      <span className="label-display">8va</span>
      <span className="value-display">{octave}</span>
      <button onClick={() => onChange(octave - 1)}>-</button>
      <button onClick={() => onChange(octave + 1)}>+</button>
      <span className="label-display">&nbsp;</span>
      <span className="label-display">&nbsp;</span>
    </div>
  );
}
