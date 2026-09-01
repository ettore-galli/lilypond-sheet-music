import { describe, it, expect } from 'vitest'
import { Sequencer } from '../sequencer';
import { SequencerNote, AudioEngineNote, noteNamesMap } from '../base/typeDefinitions';
import type { ITimer, TimerCallback } from '../base/typeDefinitions';


class MockTimer implements ITimer {

    time: number;
    timeoutDelay: number

    callbackFunction?: TimerCallback;

    constructor() {
        this.time = 0;
        this.timeoutDelay = 0;
        this.callbackFunction = undefined;
    }

    advanceTimeBy(time: number): void {
        this.time += time;

        if (this.time > this.timeoutDelay) {
            if (this.callbackFunction !== undefined) {
                try {
                    this.callbackFunction();
                } catch (err) {
                    console.error("Timer callback error:", err);
                }
            }
        }


    }

    setTimeout(callbackFunction: TimerCallback, timeoutDelay: number): void {
        this.callbackFunction = callbackFunction;
        this.timeoutDelay = timeoutDelay;
    }
}

class mockAudioEngine {
    sequence: AudioEngineNote[]

    constructor() {
        this.sequence = [];
    }

    playFreq(note: AudioEngineNote): void {
        this.sequence.push(note);
    }
}



describe("sequencer", () => {
    const sequenceToPlay: SequencerNote[] = [
        new SequencerNote(noteNamesMap.C, 4),
        new SequencerNote(noteNamesMap.CSharp, 4),
        new SequencerNote(noteNamesMap.D, 4),
        new SequencerNote(noteNamesMap.DSharp, 4),
        new SequencerNote(noteNamesMap.E, 4),
        new SequencerNote(noteNamesMap.F, 4),
        new SequencerNote(noteNamesMap.FSharp, 4),
        new SequencerNote(noteNamesMap.G, 4),
        new SequencerNote(noteNamesMap.GSharp, 4),
        new SequencerNote(noteNamesMap.A, 4),
        new SequencerNote(noteNamesMap.ASharp, 4),
        new SequencerNote(noteNamesMap.B, 5),
    ];

    it("is correctly initalized", () => {

        const timer = new MockTimer();

        const seq = new Sequencer(
            timer,
            new mockAudioEngine()
        );
        seq.sequenceValue = sequenceToPlay;

        expect(seq.sequence).toEqual(sequenceToPlay);
    })

    it("runs through the sequence", () => {
        const timer = new MockTimer();

        const audioEngine = new mockAudioEngine();

        const seq = new Sequencer(
            timer,
            audioEngine
        );
        seq.sequenceValue = sequenceToPlay;

        seq.start();

        expect(audioEngine.sequence).toEqual([
            new AudioEngineNote(261.6255653005986, 0.450),
        ]);

        for (let i = 0; i < 11; i++) {
            timer.advanceTimeBy(501);
        }
        audioEngine.sequence.forEach((n) => {
            console.log("new AudioEngineNote(", n.freq, n.duration, "),")
        })
        expect(audioEngine.sequence).toEqual(
            [
                new AudioEngineNote(261.6255653005986, 0.45),
                new AudioEngineNote(277.1826309768721, 0.45),
                new AudioEngineNote(293.6647679174076, 0.45),
                new AudioEngineNote(311.1269837220809, 0.45),
                new AudioEngineNote(329.6275569128699, 0.45),
                new AudioEngineNote(349.2282314330039, 0.45),
                new AudioEngineNote(369.9944227116344, 0.45),
                new AudioEngineNote(391.99543598174927, 0.45),
                new AudioEngineNote(415.3046975799451, 0.45),
                new AudioEngineNote(440, 0.45),
                new AudioEngineNote(466.1637615180899, 0.45),
                new AudioEngineNote(987.7666025122483, 0.45),
            ]

        );
    })
});

describe("sequencer state management", () => {

    const sequenceToPlay: SequencerNote[] = [
        new SequencerNote(noteNamesMap.C, 4),
        new SequencerNote(noteNamesMap.CSharp, 4),
        new SequencerNote(noteNamesMap.D, 4),
        new SequencerNote(noteNamesMap.DSharp, 4),
        new SequencerNote(noteNamesMap.E, 4),
        new SequencerNote(noteNamesMap.F, 4),
        new SequencerNote(noteNamesMap.FSharp, 4),
        new SequencerNote(noteNamesMap.G, 4),
        new SequencerNote(noteNamesMap.GSharp, 4),
        new SequencerNote(noteNamesMap.A, 4),
        new SequencerNote(noteNamesMap.ASharp, 4),
        new SequencerNote(noteNamesMap.B, 5),
    ];

    it("initial getter values are correct", () => {
        const timer = new MockTimer();
        const audioEngine = new mockAudioEngine();

        const seq = new Sequencer(
            timer,
            audioEngine
        );
        seq.sequenceValue = sequenceToPlay;

        expect(seq.bpmValue).toBe(120);
        expect(seq.loopValue).toBe(false);
        expect(seq.sequenceValue).toEqual(sequenceToPlay);
    });

    it("setter correctly updates bpm", () => {
        const timer = new MockTimer();
        const audioEngine = new mockAudioEngine();

        const seq = new Sequencer(timer, audioEngine);

        seq.bpmValue = 150;
        expect(seq.bpmValue).toBe(150);
    });

    it("setter correctly updates loop", () => {
        const timer = new MockTimer();
        const audioEngine = new mockAudioEngine();

        const seq = new Sequencer(timer, audioEngine);

        seq.loopValue = true;
        expect(seq.loopValue).toBe(true);
    });

    it("setter correctly updates sequence", () => {
        const timer = new MockTimer();
        const audioEngine = new mockAudioEngine();

        const seq = new Sequencer(timer, audioEngine);

        seq.sequenceValue = sequenceToPlay;
        expect(seq.sequenceValue).toEqual(sequenceToPlay);
    });


    const baseSequence: SequencerNote[] = [
        new SequencerNote(noteNamesMap.C, 4),
        new SequencerNote(noteNamesMap.D, 4),
    ];

    it("addNoteToSequence correctly appends a note", () => {
        const timer = new MockTimer();
        const audioEngine = new mockAudioEngine();

        const seq = new Sequencer(
            timer,
            audioEngine
        );
        seq.sequenceValue = baseSequence.slice();

        seq.addNoteToSequence(new SequencerNote(noteNamesMap.E, 5));

        expect(seq.sequenceValue).toEqual([
            new SequencerNote(noteNamesMap.C, 4),
            new SequencerNote(noteNamesMap.D, 4),
            new SequencerNote(noteNamesMap.E, 5),
        ]);

        expect(baseSequence).toEqual([ // baseSequence is not altered
            new SequencerNote(noteNamesMap.C, 4),
            new SequencerNote(noteNamesMap.D, 4),
        ]);
    });

    it("addNoteToSequence uses current octave", () => {
        const timer = new MockTimer();
        const audioEngine = new mockAudioEngine();

        const seq = new Sequencer(timer, audioEngine);



        seq.addNoteToSequence(new SequencerNote(noteNamesMap.GSharp, 6));

        expect(seq.sequenceValue).toEqual([
            new SequencerNote(noteNamesMap.GSharp, 6),
        ]);
    });

    it("addNoteToSequence increases sequence length by 1", () => {
        const timer = new MockTimer();
        const audioEngine = new mockAudioEngine();

        const seq = new Sequencer(
            timer,
            audioEngine
        );
        seq.sequenceValue = baseSequence.slice();

        expect(baseSequence).toEqual([ // baseSequence is not altered
            new SequencerNote(noteNamesMap.C, 4),
            new SequencerNote(noteNamesMap.D, 4),
        ]);

        expect(seq.sequenceValue.length).toBe(2);

        seq.addNoteToSequence(new SequencerNote(noteNamesMap.A, 3));

        expect(seq.sequenceValue.length).toBe(3);
    });
});


