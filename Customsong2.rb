use_bpm 60

use_synth :piano
live_loop :chords do
  with_fx :reverb, mix: -0, sync: :drum, room: 1 do
    play_chord [:F2, :F3, :A3, :C3, :E4], sustain: 400, release: 400, amp: 6
    sleep 2.65
    play_chord [:C2, :C3, :G3, :C3, :E3], sustain: 400, release: 400, amp: 6
    sleep 2.65
    play_chord [:E2, :E3, :G3, :B3, :D4], sustain: 400, release: 400, amp: 6
    sleep 2.65
    play_chord [:A2, :A3, :G3, :B3, :D4], sustain: 400, release: 400, amp: 6
    sleep 0.98
    play :Cs4, sustain: 300, release: 400, amp: 1.5
    sleep 1
    play :A3, sustain: 300, release: 400, amp: 1.5
    sleep 0.66
  end
end

live_loop :drum do
  sample :bd_klub, sustain_level: 0.4, amp: 3
  sleep 0.67
  sample :sn_dolf, sustain_level: 0.2, amp: 2
  sleep 0.36
  sample :bd_fat, sustain_level: 2, amp: 2
  sleep 0.17
  sample :bd_fat, sustain_level: 0.3, amp: 2
  sample :bd_klub, sustain_level: 0.4, amp: 3
  sleep 0.45
  sample :bd_fat, sustain_level: 0.5, amp: 2
  sample :bd_klub, sustain_level: 0.4, amp: 3
  sleep 0.34
  sample :sn_dolf, sustain_level: 0.2, amp: 2
  sleep 0.16
  sample :bd_fat, sustain_level: 2, amp: 2
  sleep 0.5
end
