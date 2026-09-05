import type { AudioEngineNote, IAudioEngine } from "./base/typeDefinitions";

// audioEngine.ts
export class AudioEngine implements IAudioEngine {
  private readonly ctx: AudioContext;
  private osc: OscillatorNode;
  private gain: GainNode;

  constructor() {
    this.ctx = new AudioContext();
    this.osc = this.ctx.createOscillator();
    this.gain = this.ctx.createGain();
  }

  playFreq(note: AudioEngineNote) {
    this.osc.type = "triangle";
    this.osc.frequency.value = note.freq;

    const now = this.ctx.currentTime;
    const attack = 0.05;
    const release = 0.05;

    this.gain.gain.setValueAtTime(0, now);
    this.gain.gain.linearRampToValueAtTime(1, now + attack);
    this.gain.gain.setValueAtTime(1, now + note.duration - release);
    this.gain.gain.linearRampToValueAtTime(0, now + note.duration);

    this.osc.connect(this.gain).connect(this.ctx.destination);
    this.osc.start(now);
    this.osc.stop(now + note.duration);
  }

  stop() {
    if (this.osc !== null) {
      const decayDelay: number = 0.1;
      const decayTime: number = this.ctx.currentTime + decayDelay;
      this.gain.gain.linearRampToValueAtTime(0, decayTime);
      this.osc.stop(decayTime);
    }
  }
}
