use_bpm 136
use_synth :piano

define :two_eight do
  play:E4
  sleep 1
  play:E5
  play:Gs4
  sleep 2
  play:E5
  play:Gs4
  sleep 1
end

define :three_four_six do
  play:E5
  play:Gs4
  play:B4
  sleep 1
  play:B4
  sleep 1
  play:E5
  play:Gs4
  sleep 1
end



define :five_seven do
  play:B4
  sleep 0.75
  play:As4
  sleep 0.25
  play:Gs4
  play:B4
  sleep 0.75
  play:Cs5
  sleep 0.25
  play:B4
  sleep 1
  play:Gs4
  play:E5
  sleep 1
end


live_loop:background_notes do
  
  8.times do
    play:E3, amp: 1
    sleep 1
    play:B3, amp: 1
    play:E4, amp: 1
    sleep 1
    play:B3, amp: 1
    sleep 1
    play:E4, amp: 1
    sleep 1
  end
  stop
end

# Measure 1
play:E4
play:Gs4
sleep 2
play:E5
play:Gs4
sleep 1


# Measure 2
with_fx :ping_pong do
  two_eight
end


# Measure 3
with_fx :mono do
  three_four_six
end

# Measure 4
with_fx :mono do
  three_four_six
end


# Measure 5
with_fx :pan do
  five_seven
end


# Measure 6
with_fx :mono do
  three_four_six
end


# Measure 7
with_fx :wobble do
  five_seven
end


# Measure 8
with_fx :reverb do
  two_eight
end


play :E3, amp: 4, sustain: 4
play :E5, amp: 4, sustain: 4
play :E4, amp: 4, sustain: 4
