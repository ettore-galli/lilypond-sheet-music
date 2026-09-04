interface Props {
  bpm: number;
  loop: boolean;
  onStart: () => void;
  onStop: () => void;
  onReset: () => void;
  onBpmChange: (delta: number) => void;
  onToggleLoop: () => void;
}

export function Controls({
  bpm,
  loop,
  onStart,
  onStop,
  onReset,
  onBpmChange,
  onToggleLoop
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
        <button className={loop ? "loop-on" : "loop-off"} onClick={onToggleLoop}>
          LOOP: {loop ? "ON" : "OFF"}
        </button>
      </div>

    </div>
  );
}
