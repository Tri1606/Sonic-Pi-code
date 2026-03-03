use_bpm 126
use_synth :piano

define :crowd1 do
  sample "C:/Users/nguyen_tran/Downloads/Concert Audience Background  Human Sounds.wav"
  
  sleep 8
end

define :crowd2 do
  sample "C:/Users/nguyen_tran/Downloads/Concert Audience Background  Human Sounds.wav", amp: 4
  
end

crowd1

crowd2

#Define to call the function without repeating
define :vocal do
  sample "C:/Users/nguyen_tran/Desktop/Jungkook- Seven Clean ver. Acapella.wav", amp: 1.5
end

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
  sample   :drum_snare_soft, amp: 2
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

define :melody1 do
  sample :ambi_choir, amp: 0.4
  play_chord [:Eb5, :G5, :Bb5, :D5], release: 2, amp: 0.3
  sleep 4
  
  
  
end

define :melody2 do
  sample :ambi_choir, amp: 0.4
  play_chord [ :D4, :Fs4, :A4, :C4], release: 1, amp: 0.3
  sleep 4
end

define :melody3 do
  sample :ambi_choir, amp: 0.4
  play_chord [:Eb4, :G4, :Bb4, :D4], release: 1, amp: 0.3
  sleep 3.5
end

define :melody4 do
  sample :ambi_choir, amp: 0.4
  play_chord [:Eb5, :G5, :Bb5, :D5], release: 1, amp: 0.3
  sleep 0.75
end

define :melody5 do
  sample :ambi_choir, amp: 0.4
  play_chord [ :D4, :Fs4, :A4, :C4], release: 2, amp: 0.3
  sleep 1.5
end

define :melody6 do
  sample :ambi_choir, amp: 0.4
  play_chord [ :G5, :Bf5, :D5, :F5], release: 1, amp: 0.3
  sleep 2.25
end


with_fx :gverb , mix: 0.35 do
  live_loop :intro do
    5.times do
      play :E3, sustain: 0.75, amp: 0.25
      sleep 1
      sample   :drum_bass_soft, amp: 0.25
      sleep 0.55
      play :B3, sustain: 16, amp: 0.15
      play :Ds4, sustain: 14, amp: 0.25, release: 3
      play :Gs4, sustain: 16, amp: 0.25
      sleep 1.45
      sample   :drum_bass_soft, amp: 0.35
      sleep 1
      
      
      play :Ds3, sustain: 0.65, amp: 0.25
      sleep 1
      sample   :drum_bass_soft, amp: 0.25
      sleep 0.55
      play :Cs4, sustain: 10, amp: 0.15
      play :Ds4, sustain: 10, amp: 0.25, release: 3
      play :G4, sustain: 10, amp: 0.25
      sleep 1.45
      sample   :drum_bass_soft, amp: 0.35
      sleep 1
      
      
      play :Gs2, sustain: 0.65, amp: 0.25
      sleep 1
      sample   :drum_bass_soft, amp: 0.25
      sleep 0.55
      play :Fs3, sustain: 10, amp: 0.15
      play :B3, sustain: 10, amp: 0.25, release: 3
      play :Ds4, sustain: 10, amp: 0.25
      sleep 1.45
      sample   :drum_bass_soft, amp: 0.35
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
    stop
    
  end
  
end

sleep 16

vocal



live_loop :seven_drums do
  
  16.times do
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
  stop
  
end



sleep 32

with_fx :hpf, mix: 0.3 do
  live_loop :three do
    2.times do
      melody1
      melody2
      melody3
      melody4
      melody5
      melody6
    end
    stop
  end
end


sleep 16
live_loop :choir_pad  do
  2.times do
    with_fx :reverb, mix: 0.6, room: 0.9 do
      with_fx :hpf, cutoff: 70 do
        use_synth :hollow
        
        play chord(:E3, :minor), sustain: 4, release: 2, amp: 8
        sleep 4
        
        play chord(:Ds3, :major), sustain: 4, release: 2, amp: 8
        sleep 4
        
        play chord(:Gs2, :minor), sustain: 4, release: 2, amp: 8
        sleep 4
        
        play chord(:E3, :major), sustain: 4, release: 2, amp: 8
        sleep 4
      end
    end
  end
  
  stop
end


