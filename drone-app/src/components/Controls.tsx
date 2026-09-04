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

      <div className="controls-section">
        <button onClick={onStart}>Start</button>
        <button onClick={onStop}>Stop</button>
        <button onClick={onReset}>Reset</button>
      </div>

      <div className="controls-section">
        <button onClick={() => onBpmChange(-5)}>Tempo −</button>
        <span className="bpm-display">{bpm} BPM</span>
        <button onClick={() => onBpmChange(+5)}>Tempo +</button>

        <button onClick={onToggleLoop}>
          Loop: {loop ? "ON" : "OFF"}
        </button>
      </div>

    </div>
  );
}
