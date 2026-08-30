import { type IAudioEngine, SequencerNote, type ITimer } from "./base/typeDefinitions";
import { AudioEngineNote, noteIntervalsMap } from "./base/typeDefinitions";

class Sequencer {
    timer: ITimer
    audioEngine: IAudioEngine;

    bpm: number
    loop: boolean
    octave: number
    sequence: SequencerNote[]
    playSequence: boolean
    sequenceIndex: number
    staccatoFactor: number

    constructor(
        timer: ITimer,
        audioEngine: IAudioEngine,
        bpm?: number,
        loop?: boolean,
        octave?: number,
        sequence?: SequencerNote[],
    ) {
        this.timer = timer;
        this.audioEngine = audioEngine;

        this.bpm = bpm ?? 120;
        this.loop = loop ?? false;
        this.octave = octave ?? 4;
        this.sequence = sequence ?? [];

        this.playSequence = false;
        this.sequenceIndex = 0;
        this.staccatoFactor = 0.9;
    }

    getNoteDurationMilliseconds(): number {
        return 1000 * (60 / this.bpm);
    }

    get bpmValue(): number {
        return this.bpm;
    }

    set bpmValue(value: number) {
        this.bpm = value;
    }

    get loopValue(): boolean {
        return this.loop;
    }

    set loopValue(value: boolean) {
        this.loop = value;
    }

    get octaveValue(): number {
        return this.octave;
    }

    set octaveValue(value: number) {
        this.octave = value;
    }

    get sequenceValue(): SequencerNote[] {
        return this.sequence;
    }

    set sequenceValue(value: SequencerNote[]) {
        this.sequence = value;
    }

    addNoteByName(noteName: string) {
        const seqNote = new SequencerNote(
            noteName, this.octave
        )
        this.sequence.push(seqNote);
    }


    playNextNote(): void {
        
        if (this.playSequence && this.sequenceIndex >= this.sequence.length) {
            if (this.loop) {
                this.sequenceIndex = 0;
            } else {
                this.playSequence = false;
                return;
            }
        }

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