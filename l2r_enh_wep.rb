RATES = {
   0 => 1.00,  1 => 1.00,  2 => 1.00,
   3 => 0.90,  4 => 0.80,  5 => 0.70,  6 => 0.60,  7 => 0.50,
   8 => 0.45,  9 => 0.45, 10 => 0.45, 11 => 0.45, 12 => 0.45,
  13 => 0.40, 14 => 0.40, 15 => 0.40, 16 => 0.40, 17 => 0.40,
  18 => 0.35, 19 => 0.35, 20 => 0.35, 21 => 0.35, 22 => 0.35,
  23 => 0.30, 24 => 0.30, 25 => 0.30, 26 => 0.30, 27 => 0.30,
  28 => 0.25, 29 => 0.25
}

ADENA = {
   0 =>  3400,  1 =>  3400,  2 =>  3400,  3 =>  3400,  4 => 3400,
   5 => 16700,  6 => 16700,  7 => 16700,  8 => 16700,  9 => 16700,
  10 => 33400, 11 => 33400, 12 => 33400, 13 => 33400, 14 => 33400, 15 => 33400,
  16 => 66700, 17 => 66700, 18 => 66700, 19 => 66700, 20 => 66700, 21 => 66700, 22 => 66700, 23 => 66700, 24 => 66700, 25 => 66700,
  26 => 100000, 27 => 100000, 28 => 100000, 29 => 100000
}

SCROLLS = {
   0 => 1,  1 => 1,  2 => 1,  3 => 1,  4 => 1,
   5 => 2,  6 => 2,  7 => 2,  8 => 2,  9 => 2,
  10 => 3, 11 => 3, 12 => 3, 13 => 3, 14 => 3,
  15 => 4, 16 => 4, 17 => 4, 18 => 4, 19 => 4,
  20 => 5, 21 => 5, 22 => 5, 23 => 5, 24 => 5,
  25 => 6, 26 => 6, 27 => 6, 28 => 6, 29 => 6
}

MAPHR = {
   0 =>  0,  1 =>  0,  2 =>  0,
   3 =>  1,  4 =>  1,
   5 =>  2,  6 =>  2,  7 =>  2,
   8 =>  3,
   9 =>  4, 10 =>  4,
  11 =>  5, 12 =>  5,
  13 =>  6, 14 =>  6,
  15 =>  7, 16 =>  7,
  17 =>  8, 18 =>  8,
  19 =>  9, 20 =>  9,
  21 => 10, 22 => 10,
  23 => 11, 24 => 11,
  25 => 12, 26 => 12,
  27 => 13, 28 => 13,
  29 => 14
}

(0..29).each do |n|
  print "#{n} => #{n+1},"

  results_attempts = []
  results_adena = []
  results_scrolls = []

  (1..100000).each do |i|
    current_enh = n

    attempts = 0
    adena = 0
    scrolls = 0

    while current_enh < n + 1
      attempts += 1
      adena += ADENA[current_enh]
      scrolls += SCROLLS[current_enh]
      if Random.rand(1.00) < RATES[current_enh]
        current_enh += 1
      elsif [7, 10, 20].include?(current_enh)
        # won't downrate
      else
        current_enh -= 1
      end
    end

    results_attempts << attempts
    results_adena << adena
    results_scrolls << scrolls
  end

  puts "#{results_attempts.sum.to_f / results_attempts.length},#{results_attempts.min},#{results_attempts.max}," +
       "#{results_adena.sum.to_f / results_adena.length},#{results_adena.min},#{results_adena.max}," +
       "#{results_scrolls.sum.to_f / results_scrolls.length},#{results_scrolls.min},#{results_scrolls.max}"
end
