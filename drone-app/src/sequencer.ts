import { type IAudioEngine, SequencerNote, type ITimer } from "./base/typeDefinitions";
import { AudioEngineNote, noteIntervalsMap } from "./base/typeDefinitions";

class Sequencer {
    timer: ITimer
    audioEngine: IAudioEngine;

    bpm: number
    loop: boolean
    sequence: SequencerNote[]
    playSequence: boolean
    sequenceIndex: number
    staccatoFactor: number

    constructor(
        timer: ITimer,
        audioEngine: IAudioEngine,
        bpm?: number,
        loop?: boolean,
        sequence?: SequencerNote[],
    ) {
        this.timer = timer;
        this.audioEngine = audioEngine;

        this.bpm = bpm ?? 120;
        this.loop = loop ?? false;
        this.sequence = sequence ?? [];

        this.playSequence = false;
        this.sequenceIndex = 0;
        this.staccatoFactor = 0.9;
    }

    getNoteDurationSeconds(): number {
        return (60 / this.bpm);
    }
    getNoteDurationMilliseconds(): number {
        return 1000 * this.getNoteDurationSeconds();
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

    get sequenceValue(): SequencerNote[] {
        return this.sequence;
    }

    set sequenceValue(value: SequencerNote[]) {
        this.sequence = value;
    }

    addNoteToSequence(note: SequencerNote) {
        this.sequence.push(note);
    }

    get sequenceIndexValue(): number {
        return this.sequenceIndex;
    }

    private set sequenceIndexValue(value: number) {
        this.sequenceIndex = value;
    }

    playNextNote(): void {

        if (this.playSequence && this.sequenceIndexValue >= this.sequence.length) {
            if (this.loop) {
                this.sequenceIndexValue = 0;
            } else {
                this.playSequence = false;
                return;
            }
        }

        if (this.playSequence) {
            const note: AudioEngineNote = this.buildNote(
                this.sequence[this.sequenceIndex], this.staccatoFactor * this.getNoteDurationSeconds()
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
        this.sequenceIndexValue = 0;
        this.playSequence = true;
        this.playNextNote()
    }

    stop(): void {
        this.playSequence = false;
    }

    reset(): void {
        this.sequenceIndexValue = 0;
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