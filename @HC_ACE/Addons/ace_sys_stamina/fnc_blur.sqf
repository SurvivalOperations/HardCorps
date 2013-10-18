//  Controls visual effects of fatigue.

// #define DEBUG_MODE_FULL
#include "script_component.hpp"

if (ACE_NoStaminaEffects) exitWith {};

PARAMS_1(_blur);
private "_blurTime";

if (GVAR(blur_fx)) exitWith { TRACE_1("GVAR VS in use",""); };
GVAR(blur_fx) = true;

if (_blur < 1 || !alive player) exitWith { TRACE_1("Player dead or B < 1",""); GVAR(blur_fx) = false; };

TRACE_1("BLUR FX","");
switch(_blur)do {
	//Pick Blackout.
	case 1: {
		_blurTime = 0.5 + random 0.2;
	};
	case 2: {
		_blurTime = 1.2 + random 0.2;
	};
	case 3: {
		_blurTime = 1.9 + random 0.2;
	};
	case 4: {
		_blurTime = 2.05 + random 0.2;
	};
	case 5: {
		_blurTime = 2.25;
	};
	case 6: {
		_blurTime = 2.65;
	};
};
TRACE_2("",_blurTime,_waitTime);

// Create blur effect

GVAR(blur) ppEffectEnable true;
GVAR(blur) ppEffectAdjust [_blurTime];
GVAR(blur) ppEffectCommit 0;

sleep 1;
GVAR(blur_fx) = false;
