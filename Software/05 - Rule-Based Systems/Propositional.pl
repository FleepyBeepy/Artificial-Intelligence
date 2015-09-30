% If (not(No_Beer) and not(No_TV)) then Homer_Sane.
% If (No_Beer and No_TV) then Homer_Crazy.
% No_Beer = true.
% No_TV = true.

'Homer_Sane' :- not('No_Beer'), not('No_TV').
'Homer_Crazy' :- 'No_Beer', 'No_TV'.
'No_Beer'.
'No_TV'.
