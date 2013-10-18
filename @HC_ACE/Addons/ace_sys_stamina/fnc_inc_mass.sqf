#include "script_component.hpp"

PARAMS_2(_unit,_mass);
if (!isPlayer _unit) exitWith {};
_unit setVariable [QGVAR(mass),_mass,false];
