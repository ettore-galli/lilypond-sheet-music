// App.tsx
import { useEffect, useState } from "react";
import { AudioEngine } from "./audioEngine";
import { loadState, saveState } from "./sequenceStore";
import { SequenceGrid } from "./components/SequenceGrid";
import { Controls } from "./components/Controls";
import { Keyboard } from "./components/Keyboard";
import { OctaveSelector } from "./components/OctaveSelector";
import "./styles.css";

const engine = new AudioEngine();

export default function App() {
  const [state, setState] = useState(loadState());
  const [currentIndex, setCurrentIndex] = useState<number | null>(null);

  useEffect(() => {
    saveState(state);
  }, [state]);

  function addNote(note: string) {
    if (state.sequence.length < 16) {
      setState({ ...state, sequence: [...state.sequence, note] });
    }
  }

  function start() {
    let i = 0;
    const beat = 60 / state.bpm;

    function playNext() {
      if (i >= state.sequence.length) {
        if (state.loop) {
          i = 0;
        } else {
          setCurrentIndex(null);
          return;
        }
      }

      const note = state.sequence[i];
      const freq = noteToFreq(note);
      setCurrentIndex(i);
      engine.playFreq(freq, beat);

      i++;
      setTimeout(playNext, beat * 1000);
    }

    playNext();
  }

  function stop() {
    setCurrentIndex(null);
  }

  function reset() {
    setCurrentIndex(null);
  }

  return (
    <div className="app">
      <SequenceGrid sequence={state.sequence} currentIndex={currentIndex} />

      <Controls
        bpm={state.bpm}
        loop={state.loop}
        onStart={start}
        onStop={stop}
        onReset={reset}
        onBpmChange={(d) => setState({ ...state, bpm: Math.max(40, Math.min(200, state.bpm + d)) })}
        onToggleLoop={() => setState({ ...state, loop: !state.loop })}
      />

      <OctaveSelector
        octave={state.octave}
        onChange={(oct) => setState({ ...state, octave: Math.max(2, Math.min(6, oct)) })}
      />

      <Keyboard onNote={addNote} octave={state.octave} />
    </div>
  );
}

function noteToFreq(note: string): number {
  const A4 = 440;
  const map: Record<string, number> = {
    C: -9, "C#": -8, Db: -8,
    D: -7, "D#": -6, Eb: -6,
    E: -5,
    F: -4, "F#": -3, Gb: -3,
    G: -2, "G#": -1, Ab: -1,
    A: 0, "A#": 1, Bb: 1,
    B: 2
  };

  const name = note.slice(0, -1);
  const oct = Number(note.slice(-1));
  const semitone = map[name] + (oct - 4) * 12;
  return A4 * Math.pow(2, semitone / 12);
}
