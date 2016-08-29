- module(solution).
- export([weave/2, bracket/2]).

%% weave insert first into second.
%%
%%       i: [11,12], [0,1,2,3]
%%       o: [0,11,1,12,2,11,3]
%%
weave([], Lb) -> Lb;
weave(La, []) -> La;
weave(_, [Hb|[]]) -> [Hb];
weave([Ha|Ta], [Hb|Tb]) -> [Hb,Ha|weave(Ta ++ [Ha], Tb)].

%% bracket insert first into second.
%% Lb with even length is obligatory.
%%
%%       i: "abc", "()"
%%       o: ["(a)","(b)","(c)"]
%%
%%       i: "+-", "234567"
%%       o: ["2+3", "4-5", "6+7"]
%%
bracket([], Lb) -> Lb;
bracket(La, []) -> La;
bracket(La, Lb) when (length(La) =< length(Lb) div 2) -> cycle_left(La, Lb);
bracket(La, Lb) when (length(La) > length(Lb) div 2) -> cycle_right(La, Lb).

cycle_left([Ha|_], [Hba,Hbb|[]]) -> [[Hba, Ha, Hbb]];
cycle_left([Ha|Ta], [Hba,Hbb|Tb]) ->
        [[Hba, Ha, Hbb]|cycle_left(Ta ++ [Ha], Tb)].

cycle_right([Ha|[]], [Hba,Hbb|_]) -> [[Hba, Ha, Hbb]];
cycle_right([Ha|Ta], [Hba,Hbb|Tb]) ->
        [[Hba, Ha, Hbb]|cycle_right(Ta, Tb ++ [Hba, Hbb])].
