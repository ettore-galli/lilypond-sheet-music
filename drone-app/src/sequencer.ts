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

    sequenceIndexChangeCallback: (index: number) => void

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

        this.sequenceIndexChangeCallback = ((_index: number) => { })
        this.sequenceIndexChangeCallback(this.sequenceIndex);

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

    set sequenceIndexChangeCallbackValue(cb: (index: number) => void) {
        this.sequenceIndexChangeCallback = cb ?? ((_index: number) => { });
        this.sequenceIndexChangeCallback(this.sequenceIndexValue);
    }

    private set sequenceIndexValue(value: number) {
        this.sequenceIndex = value;
    }

    playNextNote(): void {

        if (this.playSequence && this.sequenceIndexValue >= this.sequence.length) {
            this.sequenceIndexValue = 0;
            if (this.loop) {
            } else {
                this.playSequence = false;
                return;
            }
        }

        if (this.playSequence) {
            const note: AudioEngineNote = this.buildNote(
                this.sequence[this.sequenceIndexValue], this.staccatoFactor * this.getNoteDurationSeconds()
            )
            this.sequenceIndexChangeCallback(this.sequenceIndexValue);
            this.audioEngine.playFreq(note);

            this.sequenceIndexValue++;

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
        this.sequenceIndexChangeCallback(this.sequenceIndexValue);
        this.playSequence = false;
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