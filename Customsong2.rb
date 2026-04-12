# Setting the tempo of the song. I adjusted this by ear so it lines up with my audio samples
use_bpm 56.96

# Using piano as the main synth for my chords
use_synth :piano


# Importing my own audio files from my computer
beat_1="C:/Users/momen/Downloads/G Dragon - Black Recreated  Piano and Beat tutorial Y-one short na 1.wav"
beat_2="C:/Users/momen/Downloads/G Dragon - Black Recreated  Piano and Beat tutorial Y-one short nn 2.wav"
beat_3="C:/Users/momen/Downloads/G Dragon - Black Recreated  Piano and Beat tutorial Y-one short nh 3.wav"

wonky="C:/Users/momen/Downloads/Wonky.wav"
vocal="C:/Users/momen/Downloads/Real vocal.wav"

transition_rain="C:/Users/momen/Downloads/Real rain.wav"
transition_walking="C:/Users/momen/Downloads/Real walking.wav"


# Creating chord arrays so I can reuse them instead of rewriting notes every time
Fmaj7=[:F2, :F3, :A3, :C4, :E4]
Cmaj=[:C2, :C3, :G3, :C3, :E2]
Emin7=[:E2, :E3, :G3, :B3, :D4]
Amaj7=[:A2, :A3, :G3, :B3, :D4]


# Functions for my drum sounds to keep the code cleaner and easier to manage
define :beat1 do
  sample beat_1, sustain_level: 0.4, amp: 16
end

define :beat2 do
  sample beat_2, sustain_level: 0.2, amp: 18
end

define :beat3 do
  sample beat_3, sustain_level: 0.3, amp: 18
end


# Function to play chords with timing so I don’t repeat the same code multiple times
define :play_my_chord do |chord, slp|
  play_chord chord, sustain: 4, release: 4, amp: 6
  sleep slp
end


# Transition intro using rain sound with a fade in and fade out
amp_level = 0

# Fade in
4.times do
  sample transition_rain, amp: amp_level
  sleep 0.05
  amp_level = amp_level + 0.2
end

sleep 0.12  # short pause at full volume

# Fade out
5.times do
  sample transition_rain, amp: amp_level
  sleep 0.2
  amp_level = amp_level - 0.2
end

sleep 1.5


# Second transition using walking sound that fades out over time
amp_level = 4
fade_steps = 8

fade_steps.times do
  sample transition_walking, amp: amp_level
  sleep 0.5
  amp_level = amp_level - 0.5
end

sleep 4


# Main chord layer that repeats the progression
live_loop :chords do
  with_fx :reverb, mix: 0.4, room: 1 do
    
    # Repeating the chord progression multiple times
    12.times do
      
      play_my_chord Fmaj7, 2.53
      play_my_chord Cmaj, 2.53
      play_my_chord Emin7, 2.53
      play_my_chord Amaj7, 0.95
      
      # Adding small notes at the end to act like a simple melody
      play :Cs4, sustain: 3, release: 4, amp: 1.5
      sleep 0.96
      
      play :A3, sustain: 3, release: 4, amp: 1.5
      sleep 0.62
    end
    
    stop  # stops the chord loop after finishing
  end
end


# Drum layer that plays in two sections with a pause in between
live_loop :drum do
  
  # First section of the beat
  24.times do
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
  
  # Pause to create space before the beat comes back
  sleep 20.23
  
  # Second section of the beat
  8.times do
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
  
  stop  # stops the drum loop completely
end


# Adding the vocal after a delay so it lines up with the track
sleep 19.2
sample vocal, amp: 3


# Final layer with a gradual fade-in effect
sleep 9.6

amp_level = 0

live_loop :wonky_sound do
  10.times do
    sample wonky, amp: amp_level, release: 10
    sleep 10
    
    # Increasing volume each time to create a fade-in effect
    amp_level = [amp_level + 0.5, 10].min
  end
  
  stop  # ends the song with this layer
end
