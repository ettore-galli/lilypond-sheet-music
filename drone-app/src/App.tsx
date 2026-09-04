import { useEffect, useState, useRef } from "react";
import { AudioEngine } from "./audioEngine";
import { Timer } from "./timer";

import { Sequencer } from "./sequencer";
import { loadState, saveState, type AppState } from "./applicationState";
import { SequenceGrid } from "./components/SequenceGrid";
import { Controls } from "./components/Controls";
import { Keyboard } from "./components/Keyboard";
import { OctaveSelector } from "./components/OctaveSelector";
import "./styles.css";
import { SequencerNote } from "./base/typeDefinitions";


function updateSequencer(seq: Sequencer, state: AppState) {
  seq.bpmValue = state.bpm;
  seq.loopValue = state.loop;
  seq.sequenceValue = state.sequence ? state.sequence.map((item) => {
    return new SequencerNote(item.noteName, item.octave)
  }) : [];
}

export default function App() {
  const sequencerRef = useRef<Sequencer | null>(null);
  const [state, setState] = useState(loadState());
  const [sequenceIndex, setSequenceIndex] = useState(0);

  const sequenceIndexChangeCallback: (index: number) => void = (index: number) => {
    setSequenceIndex(index);
  }

  const createSequencer: () => Sequencer = () => {
    const audioEngine: AudioEngine = new AudioEngine();
    const timer = new Timer();
    const seq = new Sequencer(timer, audioEngine);
    seq.sequenceIndexChangeCallbackValue = sequenceIndexChangeCallback
    return seq;
  }

  useEffect(() => {
    sequencerRef.current = createSequencer();
  }, []);

  useEffect(() => {
    saveState(state);
  }, [state]);

  useEffect(() => {
    const seq = sequencerRef.current;
    if (!seq) return;
    updateSequencer(seq, state);
  }, [state]);


  function addNote(note: string) {
    if (state.sequence.length < 16) {
      setState({
        ...state, sequence: [...state.sequence,
        { "noteName": note, "octave": state.octave }
        ]
      });
    }
  }

  function clearSequence() {
    if (state.sequence.length < 16) {
      setState({
        ...state, sequence: []
      });
    }
  }
  function start() {
    sequencerRef.current?.start();
  }
  function stop() {
    sequencerRef.current?.stop();
  }
  function reset() {
    sequencerRef.current?.reset();
  }


  return (
    <div className="app">
      <SequenceGrid
        sequence={state.sequence}
        currentIndex={sequenceIndex}
      />

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

      <Keyboard
        onNote={addNote}
        onClear={clearSequence}
      />
    </div>
  );
}

