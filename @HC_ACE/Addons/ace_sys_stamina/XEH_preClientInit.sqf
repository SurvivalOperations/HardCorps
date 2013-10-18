#include "script_component.hpp"

ADDON = false;

LOG(MSG_INIT);

PREP(keypressed);

PREP(vision);
PREP(heartbeat);
PREP(breathing);
PREP(killed);

PREP(inc_breathing);
PREP(inc_concussion);
PREP(inc_mass);

FUNC(init) = {
	private ["_eh", "_newPlayer", "_obj"];
	PARAMS_1(_unit);
	DEFAULT_PARAM(1,_force,false);


     _newPlayer = true;
     if !(_force) then {
	     _obj = _unit getVariable QGVAR(obj);
	     if !(isNil "_obj") then { _newPlayer = !(alive _obj); /*isNull _obj */ };
	 };
     if !(_newPlayer) exitWith { TRACE_1("Existing player", _unit); false };

	_unit setVariable [QGVAR(Concussion), 0];
	_unit setVariable [QGVAR(Breathing), 0];
	_unit setVariable [QGVAR(Fatigue), 0];
	_unit setVariable [QGVAR(heartBeat), [0, 1]];
	_unit setVariable [QGVAR(Wounds), 0];
	_unit setVariable [QGVAR(Panic), false];

	_eh = _unit getVariable QGVAR(EH);
	if !(isNil "_eh") then {
		_unit removeEventHandler ["animChanged", _eh];
		_unit setVariable [QGVAR(EH), nil];
		TRACE_1("EH removed",_unit);
	};
	_unit setVariable [QGVAR(EH_added), false];

	_unit setVariable [QGVAR(obj), _unit];

	true;
};

if (isNil "ACE_NoStaminaEffects") then { ACE_NoStaminaEffects = false };
if (isNil QGVAR(debug)) then { GVAR(debug) = false };

ADDON = true;
