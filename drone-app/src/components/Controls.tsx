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
        
        {/*  */}
        <button className="double-width" onClick={onStart}>START</button>
        <button className="double-width" onClick={onStop}>STOP</button>
        <button className="double-width" onClick={onReset}>RESET</button>

        {/*  */}
        <span className="label-display">BPM</span>
        <span className="value-display">{bpm}</span>
        <button onClick={() => onBpmChange(-5)}>−</button>
        <button onClick={() => onBpmChange(+5)}>+</button>
        <span className="label-display">Loop</span>
        <button className={loop ? "loop-on" : "loop-off"} onClick={onToggleLoop}>
          {loop ? "ON" : "OFF"}
        </button>

        {/*  */}
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
