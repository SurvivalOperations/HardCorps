//  Player breathing sound at specified volume/frequency.

//#define DEBUG_MODE_FULL
#include "script_component.hpp"

if (ACE_NoStaminaEffects) exitWith {};

PARAMS_1(_breathing);

private ["_length","_class","_count","_type","_hasMask","_baseName"];

if (GVAR(breath_fx)) exitWith { TRACE_1("GVAR BT in use",""); };
GVAR(breath_fx) = true;

_hasMask = (([player, "ace_sys_goggles_identity", ""] call ACE_fnc_def) in ["ACE_GlassesGasMask_US","ACE_GlassesGasMask_RU"]);
TRACE_1("",_hasmask);

if (_hasMask && _breathing < 1) then { _breathing = 1 };
if ( _breathing < 1 || !alive player ) exitWith { TRACE_1("Player dead or B < 1",""); GVAR(breath_fx) = false };

_baseName = if !(_hasMask) then {"ACE_Breathing"} else {"ACE_Breathing_Mask"};
TRACE_1("",_baseName);

_length = [];
_class = configFile >> "CfgSounds" >> _baseName + "1_1";
_count = 0;

while { isClass _class } do {
	_length set [count _length, getNumber (_class >> "length")];
	_count = _count + 1;
	_class = configFile >> "CfgSounds" >> format [_baseName + "%1_1",_count + 1];
};

_sleep = 1;
_type = 1 + round(random (_count - 1));
_sleep = _length select (_type - 1);

playSound format [_baseName + "%1_%2",_type,_breathing];

sleep _sleep;
GVAR(breath_fx) = false;
