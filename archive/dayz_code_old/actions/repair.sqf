private["_id","_array","_vehicle","_part","_hitpoint","_type","_hasToolbox","_section","_nameType","_namePart","_damage","_selection","_dis","_sfx","_hitpoints","_allFixed"];

_id = _this select 2;
_array = _this select 3;
_vehicle = _array select 0;
_part = _array select 1;
_hitpoint = _array select 2;
_type = typeOf _vehicle;


{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
dayz_myCursorTarget = objNull;

diag_log(format["%1 %2", __FILE__, _this]);

_hasToolbox = "ItemToolbox" in items player;
_section = _part in magazines player;

//moving this here because we need to know which part needed if we don't have it
_nameType = getText(configFile >> "cfgVehicles" >> _type >> "displayName");
_namePart = getText(configFile >> "cfgMagazines" >> _part >> "displayName");

if (_section and _hasToolbox) then {

	player removeMagazine _part;

	_damage = [_vehicle,_hitpoint] call object_getHit;
	_vehicle removeAction _id;

	//dont waste loot on undamaged parts
	if (_damage > 0) then {

		//Fix the part
		_selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _hitpoint >> "name");

		[_vehicle, _selection, 0, true] call fnc_veh_handleRepair;

		player playActionNow "Medic";
		sleep 1;

		_dis=20;
		_sfx = "repair";
		[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
		[player,_dis,true,(getPosATL player)] call player_alertZombies;


		sleep 5;
		_vehicle setvelocity [0,0,1];

		//Success!
		cutText [format[localize "str_player_04",_namePart,_nameType], "PLAIN DOWN"];
	} else { player addMagazine _part; };

} else {
	cutText [format[localize "str_player_03",_namePart], "PLAIN DOWN"];
};


//check if repaired fully
_hitpoints = _vehicle call vehicle_getHitpoints;
_allFixed = true;
{
	_damage = [_vehicle,_x] call object_getHit;
	if (_damage > 0) exitWith {
		_allFixed = false;
	};
} forEach _hitpoints;

//update if repaired
if (_allFixed) then {
	_vehicle setDamage 0;
	PVDZ_veh_Save = [_vehicle,"repair"];
	if (isServer) then {
		PVDZ_veh_Save call server_updateObject;
	} else {
		publicVariableServer "PVDZ_veh_Save";
	};
};