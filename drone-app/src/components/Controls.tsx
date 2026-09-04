interface Props {
  bpm: number;
  loop: boolean;
  octave: number,
  onStart: () => void;
  onStop: () => void;
  onReset: () => void;
  onBpmChange: (delta: number) => void;
  onToggleLoop: () => void;
  onOctaveChange: (oct: number) => void;
}

export function Controls({
  bpm,
  loop,
  octave,
  onStart,
  onStop,
  onReset,
  onBpmChange,
  onToggleLoop,
  onOctaveChange
}: Props) {
  return (
    <div className="controls">

      <div className="controls-row">
        <button onClick={onStart}>START</button>
        <button onClick={onStop}>STOP</button>
        <button onClick={onReset}>RESET</button>
      </div>

      <div className="controls-row">
        <span className="label-display">BPM</span><span className="value-display">{bpm}</span>
        <button onClick={() => onBpmChange(-5)}>−</button>
        <button onClick={() => onBpmChange(+5)}>+</button>
        <span className="label-display">BPM</span>
        <button className={loop ? "loop-on" : "loop-off"} onClick={onToggleLoop}>
          {loop ? "ON" : "OFF"}
        </button>
      </div>

      <div className="controls-row">
        <span className="label-display">8va</span>
        <span className="value-display">{octave}</span>
        <button onClick={() => onOctaveChange(octave - 1)}>-</button>
        <button onClick={() => onOctaveChange(octave + 1)}>+</button>
        <span className="label-display">&nbsp;</span>
        <span className="label-display">&nbsp;</span>
      </div>

    </div>
  );
}
