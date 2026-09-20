import { joinClassNames } from "../base/utilities";

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

  const loopButtonValue = (loop ? "ON" : "OFF");
  const loopButtonClass = joinClassNames((loop ? "loop-on" : "loop-off"));

  return (
    <div className="controls">

      <div className="controls-row">

        {/*  */}
        <button className="double-width mid-big-font" onClick={onStart}><span className="h-shrink">START</span></button>
        <button className="double-width mid-big-font" onClick={onStop}><span className="h-shrink">STOP</span></button>
        <button className="double-width mid-big-font" onClick={onReset}><span className="h-shrink">RESET</span></button>

        {/*  */}

        <span className="label-display">
          <span className="mid-big-font h-shrink">BPM</span>
        </span>

        <button onClick={() => onBpmChange(-5)}>
          <span className="big-font">{MINUS_SIGN_SYMBOL}</span>
        </button>

        <span className="value-display ">
          <span className="mid-big-font ">{bpm}</span>
        </span>

        <button onClick={() => onBpmChange(+5)}>
          <span className="big-font">{PLUS_SIGN_SYMBOL}</span>
        </button>

        <span className="label-display">
          <span className="mid-big-font h-shrink">LOOP</span>
        </span>

        <button className={loopButtonClass} onClick={onToggleLoop}>
          <span className="mid-big-font h-shrink">{loopButtonValue}</span>
        </button>

        {/*  */}

        <span className="label-display">
          <span className="big-font h-shrink">8<span className="superscript">va</span></span>

        </span>
        <button className="big-font" onClick={() => onOctaveChange(octave - 1)}>{MINUS_SIGN_SYMBOL}</button>
        <span className="value-display big-font">{octave}</span>
        <button className="big-font" onClick={() => onOctaveChange(octave + 1)}>{PLUS_SIGN_SYMBOL}</button>
        <span className="placeholder-label-display">&nbsp;</span>
        <span className="placeholder-label-display">&nbsp;</span>

      </div>

    </div >
  );
}
