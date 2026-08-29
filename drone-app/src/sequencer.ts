import type { IAudioEngine, SequencerNote, ITimer } from "./base/typeDefinitions";
import { AudioEngineNote, noteIntervalsMap } from "./base/typeDefinitions";



class Sequencer {
    timer: ITimer
    bpm: number
    loop: boolean
    sequence: SequencerNote[]
    playSequence: boolean
    sequenceIndex: number
    staccatoFactor: number

    audioEngine: IAudioEngine;

    constructor(
        timer: ITimer,
        bpm: number,
        loop: boolean,
        sequence: SequencerNote[],
        audioEngine: IAudioEngine
    ) {
        this.timer = timer;
        this.bpm = bpm;
        this.loop = loop;
        this.sequence = sequence;
        this.audioEngine = audioEngine;

        this.playSequence = false;
        this.sequenceIndex = 0;
        this.staccatoFactor = 0.9;
    }

    getNoteDurationMilliseconds(): number {
        return 1000 * (60 / this.bpm);
    }

    playNextNote(): void {
        console.log("Play Next Note")

        if (this.playSequence && this.sequenceIndex >= this.sequence.length) {
            if (this.loop) {
                this.sequenceIndex = 0;
            } else {
                this.playSequence = false;
                return;
            }
        }
        console.log(`this.playSequence=${this.playSequence}`)
        console.log(`this =${this.playSequence}`)

        if (this.playSequence) {
            const note: AudioEngineNote = this.buildNote(
                this.sequence[this.sequenceIndex], this.staccatoFactor * this.getNoteDurationMilliseconds()
            )

            this.audioEngine.playFreq(note);

            this.sequenceIndex++;

            this.timer.setTimeout(
                () => { this.playNextNote() },
                this.getNoteDurationMilliseconds()
            );
        }

    }

    start(): void {
        this.sequenceIndex = 0;
        this.playSequence = true;
        this.playNextNote()
    }

    stop(): void {
        this.playSequence = false;
    }

    reset(): void {
        this.sequenceIndex = 0;
    }

    buildNote(note: SequencerNote, duration: number, diapason: number = 440): AudioEngineNote {
        const semitone: number = noteIntervalsMap[note.noteName] + (note.octave - 4) * 12;
        const frequency: number = diapason * Math.pow(2, semitone / 12);
        return new AudioEngineNote(
            frequency, duration
        );
    }

}

export { Sequencer }