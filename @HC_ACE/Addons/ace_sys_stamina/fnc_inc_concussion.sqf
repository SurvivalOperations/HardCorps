//#define DEBUG_MODE_FULL
#include "script_component.hpp"

#define DECREMENTVAR 0.25

private "_concussion";
PARAMS_2(_unit,_amount);

if (ACE_NoStaminaEffects) exitWith {};

_concussion = ([_unit, QGVAR(concussion), 0] call ACE_fnc_def);

if ( _concussion == 0 ) then {
	_this spawn {
		PARAMS_2(_unit,_amount);
		_concussion = ([_unit, QGVAR(concussion), 0] call ACE_fnc_def);
		ADD(_concussion,_amount);
		_unit setVariable [QGVAR(concussion), _concussion];
		while {([_unit, QGVAR(concussion), 0] call ACE_fnc_def) > 0} do {
			sleep DECREMENTVAR;

			_concussion = ([_unit, QGVAR(concussion), 0] call ACE_fnc_def);
			SUB(_concussion, DECREMENTVAR);
			_unit setVariable [QGVAR(concussion), _concussion];
		};
	};
} else {
	ADD(_concussion,_amount);
	_unit setVariable [QGVAR(concussion), _concussion];
};
