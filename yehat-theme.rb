use_bpm 125

$delay = 0.25

# The instrument set significantly affects the sound.
$instruments = [
  :unused, #0
  {sample: :drum_heavy_kick, amp: 1.15, rate: 1}, #1
  {sample: :drum_snare_soft, amp: 1.15, rate: 1}, #2
  {synth: :prophet, amp: 0.45, release: 1, pitch: 0}, #3
  {synth: :piano, amp: 1.3, release: $delay*20, pitch: 0}, #4
  {synth: :blade, amp: 0.75, release: 1, pitch: 0}, #5
  :unused, #6
  {sample: :bd_zome, amp: 0.45, rate: 1.3}, #7
]

def run(notes)
  with_fx :reverb, mix: 0.3 do
    run_track(0, notes, -0.7)
    run_track(1, notes, -0.3)
    run_track(2, notes, 0.3)
    run_track(3, notes, 0.7)
  end
end

def run_track(id, notes, pan)
  in_thread do
    current_instrument = nil

    notes.each { |x|
      if x.is_a? Integer
        sleep (x * $delay)
        next
      end

      note = x[id]
      if not note.empty?
        note_instrument = $instruments[note[1]]
        if note_instrument.key? :sample
          sample note_instrument[:sample], pan: pan, rate: note_instrument[:rate], amp: note_instrument[:amp]
        else
          if note_instrument != current_instrument
            current_instrument = note_instrument
            use_synth current_instrument[:synth]
          end
          i = current_instrument
          play note[0], pan: pan, amp: i[:amp], release: i[:release], pitch: i[:pitch]
        end
      end

      sleep $delay
    }
  end
end

p0 = [
  [[], [:Db3, 4], [:Db4, 4], [:Cb4, 5]],
  [[], [], [], []],
  [[], [], [], [:Db4, 5]],
  7,
  [[], [], [], [:Db4, 5]],
  2,
  [[], [], [], [:Gb4, 5]],
  2,
  [[], [], [], [:Ab4, 5]],
  5,
  [[], [], [], [:Gb4, 5]],
  5,
  [[], [], [], [:Ab4, 5]],
  3,
  [[], [:A3, 4], [], [:Gb4, 5]],
  1,
  [[], [], [], [:Fb4, 5]],
  1,
  [[], [], [], [:Eb4, 5]],
  1,
  [[], [], [], [:Fb4, 5]],
  1,
  [[], [], [], [:Eb4, 5]],
  [[], [], [], []],
  [[], [], [], [:Db4, 5]],
  5,
  [[], [:Ab3, 4], [], [:Cb4, 5]],
  5,
  [[], [], [], [:Db4, 5]],
  5,
  [[], [], [], [:Eb4, 5]],
  3,
]

p1 = [
  [[:Gb4, 1], [:Db4, 3], [:Db4, 3], []],
  1,
  [[], [:Db5, 3], [], []],
  1,
  [[], [:Db4, 3], [], []],
  1,
  [[:Gb4, 1], [:Db5, 3], [], []],
  1,
  [[:Gb4, 1], [:Db4, 3], [], []],
  1,
  [[], [:Db5, 3], [], []],
  1,
  [[], [:Db4, 3], [], []],
  1,
  [[:Gb4, 1], [:Cb4, 3], [:Db5, 3], []],
  1,
  [[], [:Cb5, 3], [:Cb5, 3], []],
  1,
  [[], [:Cb4, 3], [:Db5, 3], []],
  1,
  [[], [:Cb5, 3], [:Eb5, 3], []],
  1,
  [[:Gb4, 1], [:Cb5, 3], [], []],
  1,
  [[], [:Cb5, 3], [], []],
  1,
  [[], [:Cb4, 3], [:Fb5, 3], []],
  1,
  [[], [:Cb5, 3], [], []],
  1,
  [[:Gb4, 1], [:A4, 3], [:Gb5, 3], []],
  1,
  [[], [:A5, 3], [], []],
  1,
  [[], [:A4, 3], [], []],
  1,
  [[:Gb4, 1], [:A5, 3], [:Fb5, 3], []],
  1,
  [[:Gb4, 1], [:Ab4, 3], [], []],
  1,
  [[], [:A5, 3], [], []],
  1,
  [[], [:A4, 3], [:Ab5, 3], []],
  1,
  [[], [:A5, 3], [], []],
  1,
  [[:Gb4, 1], [:Ab4, 3], [:Gb5, 3], []],
  1,
  [[], [:Ab5, 3], [:Fb5, 3], []],
  1,
  [[], [:Ab4, 3], [:Eb5, 3], []],
  1,
  [[], [:Ab5, 3], [:Fb5, 3], []],
  1,
  [[:Gb4, 1], [:Ab4, 3], [:Eb4, 3], []],
  1,
  [[], [:Ab5, 3], [:Db5, 3], []],
  1,
  [[:Fb4, 2], [:Ab4, 3], [], []],
  [[:Gb4, 1], [], [], []],
  [[:Gb4, 1], [:Ab5, 3], [:Cb5, 3], []],
  [[:Gb4, 1], [], [], []],
]

p2 = [
  [[:Gb4, 1], [:Db4, 3], [:Db5, 3], [:Eb5, 3]],
  1,
  [[], [:Db5, 3], [], []],
  1,
  [[], [:Db4, 3], [], []],
  1,
  [[:Gb4, 1], [:Db5, 3], [], [:Db3, 3]],
  1,
  [[:Gb4, 1], [:Db4, 3], [], []],
  1,
  [[], [:Db5, 3], [], [:Db3, 3]],
  1,
  [[], [:Db4, 3], [], []],
  1,
  [[], [:Db5, 3], [], []],
  1,
  [[:Gb4, 1], [:Cb4, 3], [:Db5, 3], [:Eb4, 3]],
  1,
  [[], [:Cb5, 3], [:Cb5, 3], []],
  1,
  [[], [:Cb4, 3], [:Db5, 3], []],
  1,
  [[], [:Cb5, 3], [:Eb5, 3], [:Cb3, 3]],
  1,
  [[:Gb4, 1], [:Cb4, 3], [], []],
  1,
  [[], [:Cb5, 3], [], [:Cb3, 3]],
  1,
  [[], [:Cb4, 3], [:Fb5, 3], []],
  1,
  [[], [:Cb5, 3], [], []],
  1,
  [[:Gb4, 1], [:A4, 3], [:Gb5, 3], [:Eb4, 3]],
  1,
  [[], [:A5, 3], [], []],
  1,
  [[], [:A4, 3], [], []],
  1,
  [[:Gb4, 1], [:A5, 3], [:Fb5, 3], [:A3, 3]],
  1,
  [[:Gb4, 1], [:A4, 3], [], []],
  1,
  [[], [:A5, 3], [], [:A3, 3]],
  1,
  [[], [:A4, 3], [:Ab5, 3], []],
  1,
  [[], [:A5, 3], [], []],
  1,
  [[:Gb4, 1], [:Ab4, 3], [:Gb5, 3], [:Eb4, 3]],
  1,
  [[], [:Ab5, 3], [:Fb5, 3], []],
  1,
  [[], [:Ab4, 3], [:Eb5, 3], []],
  1,
  [[], [:Ab5, 3], [:Fb5, 3], [:Ab3, 3]],
  1,
  [[:Gb4, 1], [:Ab4, 3], [:Eb5, 3], []],
  1,
  [[], [:Ab5, 3], [:Db5, 3], [:Ab3, 3]],
  1,
  [[:Fb4, 2], [:Ab4, 3], [], []],
  [[:Gb4, 1], [], [], []],
  [[:Gb4, 1], [:Ab5, 3], [:Cb5, 3], []],
  [[:Gb4, 1], [], [], []],
]

p3 = [
  [[:Gb4, 1], [:Db4, 3], [:Db5, 3], [:Eb5, 3]],
  1,
  [[], [:Db5, 3], [], []],
  [[:Gb4, 1], [], [], []],
  [[], [:Db4, 3], [], []],
  1,
  [[:Gb4, 1], [:Db5, 3], [], [:Db3, 3]],
  1,
  [[:Gb4, 1], [:Db4, 3], [], []],
  1,
  [[], [:Db5, 3], [], [:Db3, 3]],
  1,
  [[:Fb4, 2], [:Db4, 3], [], []],
  1,
  [[], [:Db5, 3], [], []],
  1,
  [[:Gb4, 1], [:Cb4, 3], [:Db5, 3], [:Eb4, 3]],
  1,
  [[], [:Cb5, 3], [:Cb5, 3], []],
  1,
  [[], [:Cb4, 3], [:Db5, 3], []],
  1,
  [[:Gb4, 1], [:Cb5, 3], [:Eb5, 3], [:Cb3, 3]],
  1,
  [[:Gb4, 1], [:Cb4, 3], [], []],
  1,
  [[], [:Cb5, 3], [], [:Cb3, 3]],
  1,
  [[:Fb4, 2], [:Cb4, 3], [:Fb5, 3], []],
  1,
  [[], [:Cb5, 3], [], []],
  1,
  [[:Gb4, 1], [:A4, 3], [:Gb5, 3], [:Eb4, 3]],
  1,
  [[], [:A5, 3], [], []],
  [[:Gb4, 1], [], [], []],
  [[], [:A4, 3], [], []],
  1,
  [[:Gb4, 1], [:A5, 3], [:Fb5, 3], [:A3, 3]],
  1,
  [[:Gb4, 1], [:A4, 3], [], []],
  1,
  [[], [:A5, 3], [], [:A3, 3]],
  1,
  [[:Fb4, 2], [:A4, 3], [:Ab5, 3], []],
  1,
  [[], [:A5, 3], [], []],
  1,
  [[:Gb4, 1], [:Ab4, 3], [:Gb5, 3], [:Eb4, 3]],
  1,
  [[], [:Ab5, 3], [:Fb5, 3], []],
  [[:Gb4, 1], [], [], []],
  [[], [:Ab4, 3], [:Eb5, 3], []],
  1,
  [[:Gb4, 1], [:Ab5, 3], [:Fb5, 3], [:Ab3, 3]],
  1,
  [[:Gb4, 1], [:Ab4, 3], [:Eb5, 3], []],
  1,
  [[:Gb4, 1], [:Ab5, 3], [:Db5, 3], [:Ab3, 3]],
  1,
  [[:Fb4, 2], [:Ab4, 3], [], []],
  1,
  [[:Gb4, 1], [:Ab5, 3], [:Cb5, 3], []],
  [[:Gb4, 1], [], [], []],
]

p4 = [
  [[:Gb4, 1], [:Db4, 3], [:Db3, 4], [:Eb5, 3]],
  1,
  [[], [:Db5, 3], [], []],
  [[:Gb4, 1], [], [], []],
  [[], [:Db4, 3], [], []],
  1,
  [[:Gb4, 1], [:Db5, 3], [], [:Db3, 3]],
  1,
  [[:Gb4, 1], [:Db4, 3], [], []],
  1,
  [[], [:Db5, 3], [], [:Db3, 3]],
  1,
  [[:Fb4, 2], [:Db4, 3], [], []],
  1,
  [[], [:Db5, 3], [], []],
  1,
  [[:Gb4, 1], [:Cb4, 3], [:Db5, 3], [:Eb4, 3]],
  1,
  [[], [:Cb5, 3], [:Cb5, 3], []],
  1,
  [[], [:Cb4, 3], [:Db5, 3], []],
  1,
  [[:Gb4, 1], [:Cb5, 3], [:Eb5, 3], [:Cb3, 3]],
  1,
  [[:Gb4, 1], [:Cb4, 3], [], []],
  1,
  [[], [:Cb5, 3], [], [:Cb3, 3]],
  1,
  [[:Fb4, 2], [:Cb4, 3], [:Fb5, 3], []],
  1,
  [[], [:Cb5, 3], [], []],
  1,
  [[:Gb4, 1], [:A4, 3], [:Gb5, 3], [:Eb4, 3]],
  1,
  [[], [:A5, 3], [], []],
  [[:Gb4, 1], [], [], []],
  [[], [:A4, 3], [], []],
  1,
  [[:Gb4, 1], [:A5, 3], [:Fb5, 3], [:A3, 3]],
  1,
  [[:Gb4, 1], [:A4, 3], [], []],
  1,
  [[], [:A5, 3], [], [:A3, 3]],
  1,
  [[:Fb4, 2], [:A4, 3], [:Ab5, 3], []],
  1,
  [[], [:A5, 3], [], []],
  1,
  [[:Gb4, 1], [:Ab4, 3], [:Gb5, 3], [:Eb4, 3]],
  1,
  [[], [:Ab5, 3], [:Fb5, 3], []],
  [[:Gb4, 1], [], [], []],
  [[], [:Ab4, 3], [:Eb5, 3], []],
  1,
  [[:Gb4, 1], [:Ab5, 3], [:Fb5, 3], [:Ab3, 3]],
  1,
  [[:Gb4, 1], [:Ab4, 3], [:Eb5, 3], []],
  1,
  [[:Gb4, 1], [:Ab5, 3], [:Db5, 3], [:Ab3, 3]],
  3,
  [[:Gb4, 1], [], [:Cb5, 3], []],
  [[:Gb4, 1], [], [], []],
]

p5 = [
  [[:Gb4, 1], [:Db4, 3], [:Db4, 4], []],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Fb4, 2], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], [:Db3, 3]],
  [[], [:Db4, 3], [], []],
  [[:Gb4, 1], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [:Db4, 3], [:Db3, 3]],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Fb4, 2], [:Db4, 3], [:Fb4, 3], []],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [:Gb4, 3], []],
  [[], [:Db4, 3], [], []],
  [[:Gb4, 1], [:Cb4, 3], [:Gb4, 5], [:Eb4, 3]],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [:Fb4, 5], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[:Fb4, 2], [:Cb4, 3], [:Gb4, 5], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [:Fb4, 5], [:Cb3, 3]],
  [[], [:Cb4, 3], [], []],
  [[:Gb4, 1], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [:Eb4, 5], [:Cb3, 3]],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[:Fb4, 2], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [:A4, 4], [:Eb4, 3]],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Fb4, 2], [:A4, 3], [], []],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [:A4, 4], [:A3, 3]],
  [[], [:A4, 3], [], []],
  [[:Gb4, 1], [:A4, 3], [], []],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [:A4, 5], [:A3, 3]],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Fb4, 2], [:A4, 3], [:Ab4, 5], []],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [:A4, 5], []],
  [[], [:A4, 3], [], []],
  [[:Gb4, 1], [:Ab4, 3], [:Ab4, 4], [:Eb4, 3]],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [], []],
  [[:Fb4, 2], [:Ab4, 3], [], []],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [:Ab4, 5], [:Ab3, 3]],
  [[], [:Ab4, 3], [], []],
  [[:Gb4, 1], [:Ab4, 3], [], []],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [:Gb4, 5], [:Ab3, 3]],
  [[:Bb4, 7], [:Ab4, 3], [], []],
  [[:Fb4, 2], [:Ab4, 3], [:Fb4, 5], []],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [:Gb4, 5], []],
  [[], [:Ab4, 3], [], []],
]

p6 = [
  [[:Cb5, 5], [:Gb4, 1], [:Db4, 5], [:Db4, 4]],
  1,
  [[:Db5, 5], [], [], []],
  1,
  [[:Db5, 5], [], [], []],
  1,
  [[:Db5, 5], [:Gb4, 1], [], []],
  1,
  [[], [:Gb4, 1], [], []],
  1,
  [[], [], [:Cb4, 5], []],
  1,
  [[], [], [:Db4, 5], []],
  1,
  [[], [], [:Eb4, 5], []],
  1,
  [[:Cb5, 5], [:Gb4, 1], [:Fb4, 5], [:Cb4, 4]],
  1,
  [[:Db5, 5], [], [], []],
  1,
  [[:Fb5, 5], [], [], []],
  1,
  [[:Gb5, 5], [], [], []],
  1,
  [[], [:Gb4, 1], [], []],
  1,
  [[], [], [:Gb4, 5], []],
  1,
  [[], [], [:Fb4, 5], []],
  1,
  [[], [], [:Gb4, 5], []],
  1,
  [[:Cb5, 5], [:Gb4, 1], [:Fb4, 5], [:A3, 4]],
  1,
  [[:Db5, 5], [], [], []],
  1,
  [[:Db5, 5], [], [], []],
  1,
  [[:Db5, 5], [:Gb4, 1], [], []],
  1,
  [[], [:Gb4, 1], [], []],
  1,
  [[], [], [:Db4, 5], []],
  5,
  [[:Gb5, 5], [:Gb4, 1], [:Db4, 5], [:Ab3, 4]],
  1,
  [[:Fb5, 5], [], [], []],
  1,
  [[:Db5, 5], [], [], []],
  1,
  [[:Cb5, 5], [], [:Ab4, 5], []],
  1,
  [[], [:Gb4, 1], [], []],
  1,
  [[:Db5, 5], [], [:Gb4, 5], []],
  1,
  [[], [:Fb4, 2], [:Fb4, 5], []],
  [[], [:Gb4, 1], [], []],
  [[], [:Gb4, 1], [:Gb4, 5], []],
  [[], [:Gb4, 1], [], []],
]

p7 = [
  [[:Gb4, 1], [:Db4, 3], [:Db3, 4], [:Cb3, 5]],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], [:Db3, 5]],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Fb4, 2], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Gb4, 1], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Fb4, 2], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Gb4, 1], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[:Fb4, 2], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Gb4, 1], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[:Fb4, 2], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], [:Cb3, 5]],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], [:Cb3, 3]],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], [:Db3, 3]],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Fb4, 2], [:A4, 3], [], []],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[], [:A4, 3], [], []],
  [[:Gb4, 1], [:A4, 3], [], []],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Fb4, 2], [:A4, 3], [], []],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[], [:A4, 3], [], []],
  [[:Gb4, 1], [:Ab4, 3], [], []],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [], []],
  [[:Fb4, 2], [:Ab4, 3], [], [:Db4, 4]],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [], []],
  [[], [:Ab4, 3], [], []],
  [[:Gb4, 1], [:Ab4, 3], [], []],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [:Cb4, 4], []],
  [[:Bb4, 7], [:Ab4, 3], [], []],
  [[:Fb4, 2], [:Ab4, 3], [], []],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [], [:Db3, 5]],
  [[], [:Ab4, 3], [], []],
]

p8 = [
  [[:Gb4, 1], [:Db4, 3], [:Db4, 3], [:Eb5, 5]],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Fb4, 2], [:Db4, 3], [], [:Db5, 5]],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Gb4, 1], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [:Db4, 3], [:Db5, 5]],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Fb4, 2], [:Db4, 3], [:Fb4, 3], [:Fb5, 5]],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [:Gb4, 3], []],
  [[], [:Db4, 3], [], []],
  [[:Gb4, 1], [:Cb4, 3], [:Gb4, 5], [:Eb5, 5]],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [:Fb4, 5], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[:Fb4, 2], [:Cb4, 3], [:Gb4, 5], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [:Fb4, 5], [:Cb5, 5]],
  [[], [:Cb4, 3], [], []],
  [[:Gb4, 1], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [:Eb4, 5], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[:Fb4, 2], [:Cb4, 3], [], [:Db5, 5]],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [:A4, 4], [:Fb5, 5]],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Fb4, 2], [:A4, 3], [], [:Eb5, 5]],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [:A4, 4], []],
  [[], [:A4, 3], [], []],
  [[:Gb4, 1], [:A4, 3], [], []],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [:A4, 5], [:Db5, 5]],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Fb4, 2], [:A4, 3], [:Ab4, 5], []],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [:A4, 5], []],
  [[], [:A4, 3], [], []],
  [[:Gb4, 1], [:Ab4, 3], [:Ab4, 4], [:Eb5, 5]],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [], [:Fb5, 5]],
  [[:Fb4, 2], [:Ab4, 3], [], []],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [:Ab4, 5], [:Db5, 5]],
  [[], [:Ab4, 3], [], []],
  [[:Gb4, 1], [:Ab4, 3], [], []],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [:Gb4, 5], [:Eb5, 5]],
  [[:Bb4, 7], [:Ab4, 3], [], []],
  [[:Fb4, 2], [:Ab4, 3], [:Fb4, 5], [:Cb5, 5]],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [:Gb4, 5], []],
  [[], [:Ab4, 3], [], []],
]

p9 = [
  [[:Gb4, 1], [:Db4, 3], [:Db4, 3], [:Eb5, 5]],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Fb4, 2], [:Db4, 3], [], [:Db5, 5]],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Gb4, 1], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [:Db4, 3], [:Db5, 5]],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Fb4, 2], [:Db4, 3], [:Fb4, 3], [:Fb5, 5]],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [:Gb4, 3], []],
  [[], [:Db4, 3], [], []],
  [[:Gb4, 1], [:Cb4, 3], [:Gb4, 5], [:Eb5, 5]],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [:Fb4, 5], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[:Fb4, 2], [:Cb4, 3], [:Gb4, 5], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [:Fb4, 5], [:Cb5, 5]],
  [[], [:Cb4, 3], [], []],
  [[:Gb4, 1], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [:Eb4, 5], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[:Fb4, 2], [:Cb4, 3], [], [:Db5, 5]],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [:A4, 4], [:Fb5, 5]],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Fb4, 2], [:A4, 3], [], [:Eb5, 5]],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [:A4, 4], []],
  [[], [:A4, 3], [], []],
  [[:Gb4, 1], [:A4, 3], [], []],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [:A4, 5], [:Db5, 5]],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Fb4, 2], [:A4, 3], [:Ab4, 5], []],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [:A4, 5], []],
  [[], [:A4, 3], [], []],
  [[:Gb4, 1], [:Ab4, 3], [:Ab4, 4], [:Eb5, 5]],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [], []],
  [[:Fb4, 2], [:Ab4, 3], [], []],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [:Ab4, 4], []],
  [[], [:Ab4, 3], [], []],
  [[:Gb4, 1], [:Ab4, 3], [], []],
  [[], [:Ab4, 3], [], []],
  [[:Bb4, 7], [:Ab4, 3], [:Gb4, 5], []],
  [[:Bb4, 7], [:Ab4, 3], [], []],
  [[:Fb4, 2], [:Ab4, 3], [:Fb4, 5], []],
  3,
]

pa = [
  [[:Cb5, 5], [:Gb4, 1], [:Db4, 5], [:Db4, 4]],
  1,
  [[:Db5, 5], [], [], []],
  1,
  [[:Db5, 5], [], [], []],
  1,
  [[:Db5, 5], [:Gb4, 1], [], []],
  1,
  [[], [:Gb4, 1], [], []],
  1,
  [[], [], [:Cb4, 5], []],
  1,
  [[], [], [:Db4, 5], []],
  1,
  [[], [], [:Eb4, 5], []],
  1,
  [[:Cb5, 5], [:Gb4, 1], [:Fb4, 5], [:Cb4, 4]],
  1,
  [[:Db5, 5], [], [], []],
  1,
  [[:Fb5, 5], [], [], []],
  1,
  [[:Gb5, 5], [], [], []],
  1,
  [[], [:Gb4, 1], [], []],
  1,
  [[], [], [:Gb4, 5], []],
  1,
  [[], [], [:Fb4, 5], []],
  1,
  [[], [], [:Gb4, 5], []],
  1,
  [[:Cb5, 5], [:Gb4, 1], [:Fb4, 5], [:A3, 4]],
  1,
  [[:Db5, 5], [], [], []],
  1,
  [[:Db5, 5], [], [], []],
  1,
  [[:Db5, 5], [:Gb4, 1], [], []],
  1,
  [[], [:Gb4, 1], [], []],
  1,
  [[], [], [:Db4, 5], []],
  5,
  [[:Gb5, 5], [:Gb4, 1], [:Db4, 5], [:Ab3, 4]],
  1,
  [[:Fb5, 5], [], [], []],
  1,
  [[:Db5, 5], [], [], []],
  1,
  [[:Cb5, 5], [], [:Ab4, 5], []],
  1,
  [[], [:Gb4, 1], [], []],
  1,
  [[:Db5, 5], [], [:Gb4, 5], []],
  1,
  [[], [:Fb4, 2], [:Fb4, 5], []],
  [[], [:Gb4, 1], [], []],
  [[], [:Gb4, 1], [:Gb4, 5], [:Db3, 5]],
  [[], [:Gb4, 1], [], []],
]

pe = [
  [[:Gb4, 1], [:Db4, 3], [:Db3, 4], [:Cb3, 5]],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], [:Db3, 5]],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Fb4, 2], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Gb4, 1], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[:Fb4, 2], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Bb4, 7], [:Db4, 3], [], []],
  [[], [:Db4, 3], [], []],
  [[:Gb4, 1], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[:Fb4, 2], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Gb4, 1], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], []],
  [[:Fb4, 2], [:Cb4, 3], [], []],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:Cb4, 3], [], [:Cb3, 5]],
  [[], [:Cb4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], [:Cb3, 3]],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], [:Db3, 3]],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Fb4, 2], [:A4, 3], [], []],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[], [:A4, 3], [], []],
  [[:Gb4, 1], [:A4, 3], [], []],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[:Fb4, 2], [:A4, 3], [], []],
  [[], [:A4, 3], [], []],
  [[:Bb4, 7], [:A4, 3], [], []],
  [[], [:A4, 3], [], []],
  [[:Gb4, 1], [], [], []],
  [[], [], [], []],
  [[], [], [], []],
  [[], [], [], []],
  [[], [], [], []],
  [[], [], [], []],
  [[], [], [], [:Ab4, 4]],
  [[], [], [], []],
  [[], [], [], []],
  [[], [], [], []],
  [[], [], [], []],
  [[], [], [], []],
  [[], [], [:Ab4, 4], []],
  [[], [], [], []],
  [[], [], [], []],
  [[], [], [], []],
]

patterns = [
  p1,
  p2,
  p3,
  p4,
  p5,
  p5,
  p8,
  p9,
  p6,
  pa,
  p7,
  pe,
  p0,
  p0,
  p5,
  p5,
  p8,
  p9,
]

all_notes = []
patterns.each { |p|
  all_notes += p
}

run(all_notes)
