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
const MINUS_SIGN_SYMBOL = "\u2212";
const PLUS_SIGN_SYMBOL = "\u002B";

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
        <button className="double-width big-font" onClick={onStart}>START</button>
        <button className="double-width big-font" onClick={onStop}>STOP</button>
        <button className="double-width big-font" onClick={onReset}>RESET</button>

        {/*  */}
        <span className="label-display big-font">BPM</span>
        <span className="value-display big-font">{bpm}</span>
        <button className="big-font" onClick={() => onBpmChange(-5)}>{MINUS_SIGN_SYMBOL}</button>
        <button className="big-font" onClick={() => onBpmChange(+5)}>{PLUS_SIGN_SYMBOL}</button>
        <span className="label-display big-font">LOOP</span>
        <button className={(loop ? "loop-on" : "loop-off") + " big-font"} onClick={onToggleLoop}>
          {loop ? "ON" : "OFF"}
        </button>

        {/*  */}
        <span className="label-display big-font">8<span className="label-display big-font superscript">va</span></span>
        <span className="value-display big-font">{octave}</span>
        <button className="big-font" onClick={() => onOctaveChange(octave - 1)}>{MINUS_SIGN_SYMBOL}</button>
        <button className="big-font" onClick={() => onOctaveChange(octave + 1)}>{PLUS_SIGN_SYMBOL}</button>
        <span className="label-display">&nbsp;</span>
        <span className="label-display">&nbsp;</span>

      </div>

    </div>
  );
}
