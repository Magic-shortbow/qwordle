pos:read0 `D:/ProgrammingProjects/q_test/wordleSolver/data/possibleWords.txt
allowed:200 # read0 `D:/ProgrammingProjects/q_test/wordleSolver/data/allowedWords.txt

/show where pos~\:"crane"


compare:{[inp;sol] o:?[inp in\: sol; 5? enlist `o; 5? enlist `b]; o:?[inp=sol; 5? enlist `g; o];
    extras:{[inp;sol;x] if[not x in sol; :0]; max 0 , (count where x=inp) - count where x=sol};
    d:(distinct inp)!extras[inp;sol;] each distinct inp;
    while[not (value d)~(count d)?(),0; dkey: first (key d) where 0 < value d;
        o[(-1*d[dkey]) # where (dkey=inp) and not dkey=sol]:`b; d[dkey]:0];
    o}
/TOO SLOW

compare1:{[inp;sol] i:group inp; s:group sol; o:`b`b`b`b`b;
    match:(key i) inter key s;
    og:`o`g; /then can do boolean to get either o or g
    findG:{[i;s;m] gs:i[m] where i[m] in\: s[m]};
    /findO:{[i;s;m] };
    o[findG[i;s;] each match]:`g; o
 }

/ if input has more of one specific letter than the solution:
/ remove `o s from the end until the numbers match



solution:"fault"
input:"crane"

/compare1["toyst";"solut"]

findPossible:{[inp;sol] compare[inp;sol] ~/: compare[inp;] each pos}
findNoPossible:{[inp;sol] sum findPossible[inp;sol]}

bestChoice:{[sol] d:(findNoPossible[;sol] each allowed)!allowed;
    d[min key d]}
/WAY TOO SLOW


findNextPos:{[curPos;d;word] curPos where d[word] ~/: compare[word;] each curPos}
findPos:{[ins;newPos] curPos:pos; curPos inter/ findNextPos[curPos;ins;] each key ins}



/ins: ("canes";"pilot")!(`g`o`b`b`g;`b`b`b`g`b)
ins:("canes";"plant")!(`b`o`o`b`b;`b`b`g`o`o)
newPos:pos

show findPos[ins;newPos]

/show findPos[ins;newPos]

/show bestChoice[solution]

/show where ("t"="tosyt") and not "t"="solut"

/a:( 001b;101b)
/b: (011b;100b)
/show 001b and/: b