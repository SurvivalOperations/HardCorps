private ["_code", "_inputcode", "_DEFUSED"];
_code = _this select 0;
_inputcode = _this select 1;
// compare arrays to see if code matches
_DEFUSED = [_code, _inputcode] call BIS_fnc_areEqual;

if (_DEFUSED) then {
	titletext ["UNLOCKED", "PLAIN DOWN"];
	terminate BombTimerScript;
	action1 = TARGET addAction ["Enter Bunker",TARGET_MOVE];
	Cheget removeaction defuseaction;
};
if (!_DEFUSED) then {
	titletext ["WRONG CODE, LOCKED", "PLAIN DOWN"];
	//TARGET removeAction ACTION_ID;
	terminate BombTimerScript;
	sleep 5;
};

CODEINPUT = [];