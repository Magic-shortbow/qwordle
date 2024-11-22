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


find_possible:{[guesses;results]
  possible: read0`:data/possibleWords.txt;
  possible: {[possible;guess;result]
    :possible where $[`;result]=`$compare[;guess] each possible;
    }/[possible;guesses;results];
    show possible;
    :possible
  };


show find_possible[("canes";"ample");("bobob";"obooo")];


neo_compare:{[w1;w2]
  // group somehow?
  comp'[group w1;group w2];
  };
