use_bpm 56.95
use_synth :piano
beat_1="C:/Users/momen/Downloads/G Dragon - Black Recreated  Piano and Beat tutorial Y-one short na 1.wav"
beat_2="C:/Users/momen/Downloads/G Dragon - Black Recreated  Piano and Beat tutorial Y-one short nn 2.wav"
beat_3="C:/Users/momen/Downloads/G Dragon - Black Recreated  Piano and Beat tutorial Y-one short nh 3.wav"

wonky="C:/Users/momen/Downloads/Wonky.wav"

vocal="C:/Users/momen/Downloads/Real vocal.wav"


transition_rain="C:/Users/momen/Downloads/Real rain.wav"


transition_walking="C:/Users/momen/Downloads/Real walking.wav"


Fmaj7=[:F2, :F3, :A3, :C4, :E4]
Cmaj=[:C2, :C3, :G3, :C3, :E2]
Emin7=[:E2, :E3, :G3, :B3, :D4]
Amaj7=[:A2, :A3, :G3, :B3, :D4]

define :beat1 do
  sample beat_1, sustain_level: 0.4, amp: 16
end

define :beat2 do
  sample beat_2, sustain_level: 0.2, amp: 18
end

define :beat3 do
  sample beat_3, sustain_level: 0.3, amp: 18
end


define :play_my_chord do |chord, slp|
  play_chord chord, sustain: 4, release: 4, amp: 6
  sleep slp
end

# Fade-in
amp_level = 0

5.times do
  sample transition_rain, amp: amp_level
  sleep 0.8
  amp_level = amp_level + 0.2
end

sleep 1  # optional: stay at full volume briefly

# Fade-out
5.times do
  sample transition_rain, amp: amp_level
  sleep 0.4
  amp_level = amp_level - 0.2
end

sleep 2   # original sleep after rain sample

# Fade-out for transition_walking
amp_level = 4    # start at full volume
fade_steps = 8   # more steps for smoother fade

fade_steps.times do
  sample transition_walking, amp: amp_level
  sleep 0.5
  amp_level = amp_level - 0.5
end

sleep 4   # original sleep after walking sample
live_loop :chords do
  with_fx :reverb, mix: 0.4, room: 1 do
    12.times do
      
      play_my_chord Fmaj7, 2.53
      play_my_chord Cmaj, 2.53
      play_my_chord Emin7, 2.53
      play_my_chord Amaj7, 0.95
      
      play :Cs4, sustain: 3, release: 4, amp: 1.5
      sleep 0.96
      
      play :A3, sustain: 3, release: 4, amp: 1.5
      sleep 0.62
    end
    stop
  end
end

live_loop :drum do
  40.times do
    beat1
    sleep 0.65
    beat2
    sleep 0.34
    beat3
    sleep 0.16
    beat3
    beat1
    sleep 0.43
    beat3
    beat1
    sleep 0.32
    beat2
    sleep 0.15
    beat3
    sleep 0.48
  end
  stop
end

sleep 19.2

sample vocal, sync: :piano , amp: 3

sleep 9.6

amp_level = 0

live_loop :wonky_sound do
  10.times do
    sample wonky, amp: amp_level, release: 10
    sleep 10
    amp_level = [amp_level + 0.5, 3.5].min
  end
  stop
end
