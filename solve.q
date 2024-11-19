compare: {[w1;w2]
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



neo_compare:{[w1;w2]
  // group somehow?
  comp'[group w1;group w2];
  };
