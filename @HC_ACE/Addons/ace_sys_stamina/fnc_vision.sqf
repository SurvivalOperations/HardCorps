//  Controls visual effects of fatigue.

//#define DEBUG_MODE_FULL
#include "script_component.hpp"

if (ACE_NoStaminaEffects) exitWith {};

PARAMS_1(_vision);

private["_blackoutTime", "_waitTime","_timeIn","_timeOut"];

if (GVAR(vision_fx)) exitWith { TRACE_1("GVAR VS in use",""); };
GVAR(vision_fx) = true;

if (_vision < 0.25 || !alive player) exitWith { TRACE_1("Player dead or B < 0.25",""); GVAR(vision_fx) = false; };

TRACE_1("VISION FX","");
switch(_vision)do {
	//Pick Blackout.
	case 0.25: {
		_blackoutTime = 0.15 + random 0.2;
		_waitTime = 6 + random 3;
	};
	case 0.5: {
		_blackoutTime = 0.25 + random 0.2;
		_waitTime = 5.5 + random 2;
	};
	case 0.75: {
		_blackoutTime = 0.35 + random 0.1;
		_waitTime = 4.5 + random 2;
	};
	case 1: {
		_blackoutTime = 0.5 + random 0.2;
		_waitTime = 3.5 + random 1;
	};
	case 2: {
		_blackoutTime = 1.2 + random 0.2;
		_waitTime = 3 + random 0.5;
	};
	case 3: {
		_blackoutTime = 1.9 + random 0.2;
		_waitTime = 2.75;
	};
	case 4: {
		_blackoutTime = 2.05 + random 0.2;
		_waitTime = 2.5;
	};
	case 5: {
		_blackoutTime = 2.25;
		_waitTime = 2.25;
	};
	case 6: {
		_blackoutTime = 2.65;
		_waitTime = 1.65;
	};
};
TRACE_2("",_blackoutTime,_waitTime);

if (_blackoutTime > 0) then {
	//Perform Blackout.
	_timeIn = _blackoutTime * 0.8;
	_timeOut = _blackoutTime * 0.2;
	13522 cutText["","BLACK OUT",_timeOut];
	_timeOut fadeSound 0;
	sleep _timeOut;
	13522 cutText["","BLACK IN",_timeIn];
	_timeIn fadeSound 1;
	sleep (_waitTime - _timeOut);
	_blackoutTime = 0;
};

sleep 1;
GVAR(vision_fx) = false;
