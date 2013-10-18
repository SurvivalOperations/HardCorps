//#define DEBUG_MODE_FULL
#include "script_component.hpp"

#define DECREMENTVAR 0.25

private "_breathing";
PARAMS_2(_unit,_amount);

if (ACE_NoStaminaEffects) exitWith {};

_breathing = ([_unit, QGVAR(breathing), 0] call ACE_fnc_def);

if (_breathing == 0) then {
	_this spawn {
		PARAMS_2(_unit,_amount);
		_breathing = ([_unit, QGVAR(breathing), 0] call ACE_fnc_def);
		ADD(_breathing,_amount);
		_unit setVariable [QGVAR(breathing), _breathing];
		while {([_unit, QGVAR(breathing), 0] call ACE_fnc_def) > 0} do {
			sleep DECREMENTVAR;

			_breathing = ([_unit, QGVAR(breathing), 0] call ACE_fnc_def);
			SUB(_breathing, DECREMENTVAR);
			_unit setVariable [QGVAR(breathing), _breathing];
		};
	};
} else {
	ADD(_breathing,_amount);
	_unit setVariable [QGVAR(breathing), _breathing];
};
