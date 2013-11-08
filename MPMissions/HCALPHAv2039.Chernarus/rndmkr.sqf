waituntil {!isnil "bis_fnc_init"};
_type = _this select 0;
_mkrs = _this select 1;
_marker = _mkrs call BIS_fnc_selectRandom;
_ammoCrate =  "GuerillaCacheBox_EP1" createVehicle getMarkerPos _marker;
clearWeaponCargo _ammoCrate;
clearMagazineCargo _ammoCrate;
_ammoCrate addweaponcargo ["ACE_PRC119",1];