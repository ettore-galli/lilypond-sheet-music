import { type IAudioEngine, SequencerNote, type ITimer, SequencerOperationState } from "../base/typeDefinitions";
import { AudioEngineNote, noteIntervalsMap } from "../base/typeDefinitions";

class Sequencer {
    timer: ITimer
    audioEngine: IAudioEngine;

    bpm: number
    loop: boolean
    sequence: SequencerNote[]
    playSequence: boolean
    sequenceIndex: number
    staccatoFactor: number

    sequencerOperationStateChangeCallback: (index: SequencerOperationState) => void

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

        this.sequencerOperationStateChangeCallback = ((_state: SequencerOperationState) => { })

    }

    notifyCurrentState(): void {
        this.sequencerOperationStateChangeCallback(
            new SequencerOperationState(
                this.bpm,
                this.loop,
                this.sequence,
                this.playSequence,
                this.sequenceIndex,
                this.staccatoFactor
            )
        )
    }

    getNoteDurationSeconds(): number {
        return (60 / this.bpm);
    }
    getNoteDurationMilliseconds(): number {
        return 1000 * this.getNoteDurationSeconds();
    }

    get playSequenceValue(): boolean {
        return this.playSequence;
    }

    set playSequenceValue(value: boolean) {
        this.playSequence = value;
        this.notifyCurrentState();
    }

    get bpmValue(): number {
        return this.bpm;
    }

    set bpmValue(value: number) {
        this.bpm = value;
        this.notifyCurrentState();
    }

    get loopValue(): boolean {
        return this.loop;
    }

    set loopValue(value: boolean) {
        this.loop = value;
        this.notifyCurrentState();
    }

    get sequenceValue(): SequencerNote[] {
        return this.sequence;
    }

    set sequenceValue(value: SequencerNote[]) {
        this.sequence = value;
        this.notifyCurrentState();
    }

    addNoteToSequence(note: SequencerNote) {
        this.sequence.push(note);
        this.notifyCurrentState();
    }

    get sequenceIndexValue(): number {
        return this.sequenceIndex;
    }

    set sequencerOperationStateChangeCallbackValue(cb: (state: SequencerOperationState) => void) {
        this.sequencerOperationStateChangeCallback = cb ?? ((_state: SequencerOperationState) => { });
    }

    private set sequenceIndexValue(value: number) {
        this.sequenceIndex = value;
        this.notifyCurrentState();
    }

    setNextSequenceElement() {
        this.sequenceIndexValue++;
        if (this.playSequenceValue && this.sequenceIndexValue >= this.sequenceValue.length) {
            this.sequenceIndexValue = 0;
            if (this.loop) {
            } else {
                this.playSequence = false;
                return;
            }
        }
    }

    playNextNote(): void {
        if (this.playSequenceValue) {

            const note: AudioEngineNote = this.buildNote(
                this.sequenceValue[this.sequenceIndexValue],
                this.staccatoFactor * this.getNoteDurationSeconds()
            );

            this.audioEngine.playFreq(note);

            this.timer.setTimeout(
                () => {
                    this.setNextSequenceElement();
                    this.playNextNote();
                },
                this.getNoteDurationMilliseconds()
            );

            this.notifyCurrentState();
        }

    }

    start(): void {
        this.sequenceIndexValue = 0;
        this.playSequence = true;
        this.notifyCurrentState();
        this.playNextNote()
    }

    stop(): void {
        this.playSequence = false;
        this.audioEngine.stop();
        this.notifyCurrentState();
    }

    reset(): void {
        this.sequenceIndexValue = 0;
        this.playSequence = false;
        this.notifyCurrentState();
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