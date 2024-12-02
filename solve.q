compare_old: {[w1;w2]
  res: 5#"b";
  res[where w1=w2]: "g";
  d: `leftovers`orange!(w2;res);
  orange_dict: {[x;y]
    show x;
    show y;
    if[y=x`leftovers; :`leftovers`orange!()]
    `leftovers`orange!(x[`leftovers] _ y?x[`leftovers];x[`orange],y in x`leftovers)
    }/[d;w1];
  res: 5#"b";
  show orange_dict;
  res[where match]: "g";
  res[where orange_dict[`orange]]: "o";
  :res
  };


// return Wordle result as string using "gbo"
compare: {[target;guess]
  matches: target=guess;
  res: ?[matches;5#"g";5#"b"];
  left_guess: guess where not matches;
  tg: count each group target where not matches;
  gg: count each group left_guess;
  ou: key[gg]#min each 0^gg,'tg;
  left_o_places: raze {[lg;c;n]n sublist where c=lg}[left_guess]'[key[ou];ou];
  res[where[not matches][left_o_places]]: "o";
  :res
  };


// return reduced list of possible words from given guess and result
restrict_possible: {[possible;guess;result]
  :possible where $[`;result]=`$compare[;guess] each possible
  };


// return highest possible remaining answers given guess
analyse_guess: {[choices;guess]
  :max count each group compare[;guess]each choices
  };


find_best_choice: {[guesses;results]
  possible: read0`:data/possibleWords.txt;
  allowed_guesses: read0`:data/allowedWords.txt;

  // get all possible words
  choices: restrict_possible/[possible;guesses;results];
  if[3>count choices;:first choices];

  // find guess to restrict as much as possible
  guess_restriction: allowed_guesses!analyse_guess[choices] peach allowed_guesses;
  min_restriction: min guess_restriction;
  :$[not ""~choice_res:#[choices;guess_restriction]?min_restriction;
    choice_res;
    guess_restriction?min_restriction
    ]
  };


if[not ()~.z.x;
  in_data: "," vs' read0 `$":",first .z.x;
  show "CALCULATING BEST GUESS";
  show find_best_choice[first in_data; last in_data];
  ];

