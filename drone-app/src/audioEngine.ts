import type { AudioEngineNote, IAudioEngine } from "./base/typeDefinitions";

// audioEngine.ts
export class AudioEngine implements IAudioEngine {
  private ctx: AudioContext;

  constructor() {
    this.ctx = new AudioContext();
  }

  playFreq(note: AudioEngineNote) {
    const osc = this.ctx.createOscillator();
    const gain = this.ctx.createGain();

    osc.type = "triangle";
    osc.frequency.value = note.freq;

    const now = this.ctx.currentTime;
    const attack = 0.05;
    const release = 0.05;

    gain.gain.setValueAtTime(0, now);
    gain.gain.linearRampToValueAtTime(1, now + attack);
    gain.gain.setValueAtTime(1, now + note.duration - release);
    gain.gain.linearRampToValueAtTime(0, now + note.duration);

    osc.connect(gain).connect(this.ctx.destination);
    osc.start(now);
    osc.stop(now + note.duration);
  }
}
