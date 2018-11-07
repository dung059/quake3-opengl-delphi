unit qsortunit;

interface

// The Unofficial Newsletter of Delphi Users - Issue #8 - October 10th, 1995
// Delphi QSort Source Code

type
  { callback routine types - make sure you declare them as FAR }
  { expected result:  <0 if elem[e1] < elem[e2];
                       0 if elem[e1] = elem[e2];
                      >0 if elem[e1] > elem[e2] }
  TCompNdxFunc = function(e1, e2: word): integer;
  TSwapNdxFunc = procedure(e1, e2: word);
procedure QSort(uNElem: word; FCmp: TCompNdxFunc; FSwap: TSwapNdxFunc);

implementation

{ This is the main sorting routine. It is passed the number of elements and the
  two callback routines. The first routine is the function that will perform
  the comparison between two elements. The second routine is the procedure that
  will swap two elements if necessary }
procedure QSort(uNElem: word; FCmp: TCompNdxFunc; FSwap: TSwapNdxFunc);
{ uNElem - number of elements to sort }
  procedure qSortHelp(pivotP: word; nElem: word);
  label TailRecursion, qBreak;
  var leftP, rightP, pivotEnd, pivotTemp, leftTemp: word;
      lNum: word;
       retval: integer;
  begin
  TailRecursion:
    if (nElem <= 2) then begin
      if (nElem = 2) then begin
        rightP := pivotP +1;
        if (Fcmp(pivotP, rightP) > 0) then Fswap(pivotP, rightP);
      end;
      exit;
    end;
    rightP := (nElem -1) + pivotP;
    leftP :=  (nElem shr 1) + pivotP;
    { sort pivot, left, and right elements for &quotmedian of 3" }
    if (Fcmp(leftP, rightP) > 0) then Fswap(leftP, rightP);
    if (Fcmp(leftP, pivotP) > 0) then Fswap(leftP, pivotP)
    else if (Fcmp(pivotP, rightP) > 0) then Fswap(pivotP, rightP);
    if (nElem = 3) then begin
      Fswap(pivotP, leftP);
      exit;
    end;
    { now for the classic Horae algorithm }
    pivotEnd := pivotP + 1;
    leftP := pivotEnd;
    repeat
      retval := Fcmp(leftP, pivotP);
      while (retval <= 0) do begin
        if (retval = 0) then begin
          Fswap(leftP, pivotEnd);
          Inc(pivotEnd);
        end;
        if (leftP < rightP) then
          Inc(leftP)
        else
          goto qBreak;
        retval := Fcmp(leftP, pivotP);
      end; {while}
      while (leftP < rightP) do begin
        retval := Fcmp(pivotP, rightP);
        if (retval < 0) then
          Dec(rightP)
        else begin
          FSwap(leftP, rightP);
          if (retval <> 0) then begin
            Inc(leftP);
            Dec(rightP);
          end;
          break;
        end;
      end; {while}
    until (leftP >= rightP);
    qBreak:
      if (Fcmp(leftP, pivotP) <= 0) then Inc(leftP);
      leftTemp := leftP -1;
      pivotTemp := pivotP;
      while ((pivotTemp < pivotEnd) and (leftTemp >= pivotEnd)) do begin
        Fswap(pivotTemp, leftTemp);
        Inc(pivotTemp);
        Dec(leftTemp);
      end; {while}
      lNum := (leftP - pivotEnd);
      nElem := ((nElem + pivotP) -leftP);
      if (nElem < lNum) then begin
        qSortHelp(leftP, nElem);
        nElem := lNum;
      end
      else begin
        qSortHelp(pivotP, lNum);
        pivotP := leftP;
      end;
      goto TailRecursion;
    end; {qSortHelp }
begin
  if (uNElem < 1) then  exit; { nothing to sort }
  qSortHelp(0, uNElem);
end; { QSort }

end.
 