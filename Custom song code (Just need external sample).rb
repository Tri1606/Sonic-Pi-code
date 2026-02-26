use_bpm 126
use_synth :piano


#Define to call the function without repeating
define :drum_loop1 do
  sample :bd_tek,  amp: 2, sustain: 0, release: 0.12
  sample :bd_haus, amp: 2, sustain: 0, release: 0.12
  sample :drum_cymbal_closed, amp: 1.1, sustain: 0, release: 0.05
  sleep 0.5
end

define :drum_loop2 do
  sample :drum_cymbal_closed, amp: 2, sustain: 0, release: 0.05
  sleep 0.5
end

define :drum_loop3 do
  sample :sn_dolf, amp: 2
  sample :perc_snap, amp: 0.9
  sample :drum_cymbal_closed, amp: 1, sustain: 0, release: 0.05
  sleep 0.5
end

define :drum_loop4 do
  sample :drum_cymbal_closed, amp: 2, sustain: 0, release: 0.05
  sleep 0.25
end

define :drum_loop5 do
  sample :bd_tek,  amp: 1.2, sustain: 0, release: 0.12
  sample :bd_haus, amp: 0.9, sustain: 0, release: 0.12
  sleep 0.25
end


with_fx :gverb , mix: 0.35 do
  live_loop :intro do
    play :E3, sustain: 0.75, amp: 0.25
    sleep 1
    sample  :drum_bass_soft, amp: 0.25
    sleep 0.55
    play :B3, sustain: 16, amp: 0.15
    play :Ds4, sustain: 14, amp: 0.25, release: 3
    play :Gs4, sustain: 16, amp: 0.25
    sleep 1.45
    sample :drum_bass_soft, amp: 0.35
    sleep 1
    
    
    play :Ds3, sustain: 0.65, amp: 0.25
    sleep 1
    sample :drum_bass_soft, amp: 0.25
    sleep 0.55
    play :Cs4, sustain: 10, amp: 0.15
    play :Ds4, sustain: 10, amp: 0.25, release: 3
    play :G4, sustain: 10, amp: 0.25
    sleep 1.45
    sample :drum_bass_soft, amp: 0.35
    sleep 1
    
    
    play :Gs2, sustain: 0.65, amp: 0.25
    sleep 1
    sample :drum_bass_soft, amp: 0.25
    sleep 0.55
    play :Fs3, sustain: 10, amp: 0.15
    play :B3, sustain: 10, amp: 0.25, release: 3
    play :Ds4, sustain: 10, amp: 0.25
    sleep 1.45
    sample :drum_bass_soft, amp: 0.35
    sleep 1
    
    
    play :E3, sustain: 0.65, amp: 0.25
    sleep 0.5
    play :A3, sustain: 0.65, amp: 0.25
    sleep 0.5
    play :E3, sustain: 0.65, amp: 0.3
    play :A3, sustain: 0.65, amp: 0.4
    play :Cs4, sustain: 0.65, amp: 0.4
    sleep 1
    play :B3, sustain: 0.65, amp: 0.3
    sleep 0.5
    play :Cs4, sustain: 0.65, amp: 0.3
    sleep 0.5
    play :B3, sustain: 0.65, amp: 0.35
    play :Cs4, sustain: 0.65, amp: 0.45
    play :Gs4, sustain: 0.65, amp: 0.45
    sleep 1
    
    
  end
  
end

sleep 16


live_loop :seven_drums do
  
  
  drum_loop1
  
  drum_loop2
  
  
  drum_loop3
  
  drum_loop5
  
  drum_loop4
  
  
  drum_loop2
  
  
  drum_loop1
  
  
  drum_loop3
  
  
  drum_loop1
  
  
end

sleep 32
live_loop :choir_pad, sync: :seven_drums do
  with_fx :reverb, mix: 0.6, room: 0.9 do
    with_fx :hpf, cutoff: 70 do
      use_synth :hollow
      
      play chord(:E3, :minor), sustain: 4, release: 2, amp: 5.8
      sleep 4
      
      play chord(:Ds3, :major), sustain: 4, release: 2, amp: 5.8
      sleep 4
      
      play chord(:Gs2, :minor), sustain: 4, release: 2, amp: 5.8
      sleep 4
      
      play chord(:E3, :major), sustain: 4, release: 2, amp: 5.8
      sleep 4
    end
  end
end


sleep 16

live_loop :robot_layer, sync: :seven_drums do
  with_fx :slicer, phase: 0.25, mix: 0.7 do
    with_fx :echo, phase: 0.375, mix: 0.4 do
      use_synth :prophet
      
      play :B4, sustain: 2, release: 1, amp: 0.05
      sleep 2
      
      play :Cs5, sustain: 2, release: 1, amp: 0.05
      sleep 2
    end
  end
end
