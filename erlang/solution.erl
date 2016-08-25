- module(solution).
- export([weave/2, bracket/2]).

% load module into erl with c(weave) and call functions:
%
%       solution:weave
%       solution:bracket

% rotate a list (head to tail):
%
rotate([]) -> [];
rotate([H|T]) -> T ++ [H].

% weave insert first into second:
%
%       i: [11,12], [0,1,2,3]
%       o: [0,11,1,12,2,11,3]
%
weave([], A) -> A;
weave(_, []) -> [];
weave(_, L2 = [_|[]]) -> L2;
weave([A1|B1], [A2|B2]) -> [A2] ++ [A1] ++ weave(rotate([A1] ++ B1), B2).

% bracket entry function; append atoms
% to lists and call actual implementation:
%
bracket(_, []) -> [];
bracket([], _) -> [];
bracket(_, L2 = [_|[]]) -> L2;
bracket(L1, L2) -> inBracket(L1 ++ [tail], L2 ++ [tail,tail]).

% bracket insert first into second,
% until one of both lists exhausts:
%
%       i: "abc", "()"
%       o: ["(a)","(b)","(c)"]
%
%       i: "+-", "234567"
%       o: ["2+3", "4-5", "6+7"]
%
inBracket([tail|L1], L2) -> inBracketL(L1, L2);
inBracket(L1, [tail, tail|L2]) -> inBracketR(L1, L2);
inBracket(L1 = [A1|_], L2 = [A21,A22|_]) ->
        [[A21,A1,A22]] ++ inBracket(rotate(L1), rotate(rotate(L2))).

% bracket aux function; cycle right
% list until left is exhausted:
%
inBracketR([tail|_], _) -> [];
inBracketR([A1|L1], L2 = [A21, A22|_]) ->
        [[A21, A1, A22]] ++ inBracketR(L1, rotate(rotate(L2))).

% bracket aux function; cycle left
% list until right is exhausted:
%
inBracketL(_, [tail, tail| _]) -> [];
inBracketL(L1 = [A1|_], [A21, A22|L2]) ->
        [[A21, A1, A22]] ++ inBracketL(rotate(L1), L2).
