use_synth :piano

note = 21

88.times do
  play note
  sleep 0.08
  note = note + 1
end
