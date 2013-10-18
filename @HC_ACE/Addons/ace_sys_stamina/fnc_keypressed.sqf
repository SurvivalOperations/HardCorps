/* ace_sys_stamina | Panic key | (c) 2008, 2009 by rocko, edited by rommel */
// Panic Movement to gain more stamina in dangerous situations once exhausted

//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private ["_anim","_panic"];

// "amovppnemstpsraswrfldnon_amovpercmsprslowwrfldf"

_anim = toLower(_this select 1);

// Evasive modes, for prone you have to assign a key to "Evade forward"
if !(_anim in [
		"amovpercmevasraswrfldf",	// Evasive FFW standing with rifle
		"amovpknlmevasraswrfldf"	// Evasive FFW kneeling with rifle
		//"amovpercmevasnonwnondf",	// Evasive FFW standing without weapon
		//"amovpercmevasraswpstdf"	// Evasive FFW standing with pistol
		//"amovppnemrunslowwpstdf",	// FFW prone with pistol
		//"amovppnemrunsnonwnondf"	// FFW prone without weapon
]) exitWith { false };

_unit = player;
_panic = _unit getVariable [QGVAR(panic), false];
if (_panic) exitWith { false };
_unit setVariable [QGVAR(panic), true];

_unit spawn {
	private ["_unit", "_t", "_old_FV", "_curFV", "_eh_added", "_eh"];
	_unit = _this;
	_t = time + 30;

	_old_FV = ([_unit, QGVAR(Fatigue), 0] call ACE_fnc_def);

	_unit setVariable [QGVAR(Fatigue), 0];
	_unit setVariable [QGVAR(Panic), true];

	TRACE_1("Player entered PANIC Mode",_unit);
	while { _t > time && ([_unit, QGVAR(Panic), false] call ACE_fnc_def)} do {
		_curFV = ([_unit, QGVAR(Fatigue), 0] call ACE_fnc_def);
		TRACE_2("In Panic",_unit,(_curFV * .75));
		// Monitor fatigue level
		if (_curFV > (_old_FV * .75)) then { _unit setVariable [QGVAR(panic), false]; TRACE_1("Panic FATIGUE too high",""); };
		sleep 2;
	};
	TRACE_1("Panic time expired","");
	_unit setVariable [QGVAR(panic), false];
	_curFV = ([_unit, QGVAR(Fatigue), 0] call ACE_fnc_def);
	_unit setVariable [QGVAR(Fatigue), _curFV + _old_FV];
	
	_eh_added = ([_unit, QGVAR(eh_added), false] call ACE_fnc_def);

	if (_eh_added) then {
		_eh = _unit getVariable QGVAR(eh);
		if !(isNil "_eh") then {
			_unit removeEventhandler ["animChanged", _eh];
			_unit setVariable [QGVAR(eh), nil];
			TRACE_1("EH removed",_unit);
		};
	};
	
	_t1 = time + 600;
	while { _t1 > time && alive _unit} do {
		sleep 20;
		TRACE_1("Running cooldown",_unit);
	};
	TRACE_1("Player exited PANIC Mode fully",_unit);
	_unit setVariable [QGVAR(panic), false];
	_unit setVariable [QGVAR(eh_added), false];
};

false;
