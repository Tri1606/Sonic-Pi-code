use_bpm 160
use_synth :saw

live_loop :main_theme do
  with_fx :distortion do
    
    notes = [:c2, :e2, :g2, :b2, :c3, :b2, :g2, :e2]
    
    i = 0
    8.times do
      play notes[i]
      sleep 0.5
      i = i + 1
    end
    
  end
end
