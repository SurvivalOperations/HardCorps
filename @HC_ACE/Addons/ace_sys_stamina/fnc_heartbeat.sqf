//  Player heartbeat sound at specified volume/frequency.

//#define DEBUG_MODE_FULL
#include "script_component.hpp"

if (ACE_NoStaminaEffects) exitWith {};

PARAMS_1(_heartbeat);

//Rearranged for optimisation and readability
if (_heartbeat select 0 < 1) exitWith {TRACE_1("Heartbeat select 0 < 1","")};
if (!alive player) exitWith {TRACE_1("Player Dead","")};

playSound format ["ACE_Heartbeat%1",(_heartbeat select 0)];
TRACE_1("PLAYING HEARTBEAT",(_heartbeat select 0));
