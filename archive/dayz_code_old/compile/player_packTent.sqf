/*
[_obj] call player_packTent;
*/
private ["_objectID","_objectUID","_obj","_ownerID","_dir","_pos","_bag","_holder","_weapons","_magazines","_backpacks","_objWpnTypes","_objWpnQty","_countr","_alreadyPacking","_dis","_sfx"];
_obj = _this;
_ownerID = _obj getVariable["CharacterID","0"];
_objectID = _obj getVariable["ObjectID","0"];
_objectUID = _obj getVariable["ObjectUID","0"];
player playActionNow "Medic";

player removeAction s_player_packtent;
s_player_packtent = -1;

if(_ownerID == dayz_characterID) then {
	_alreadyPacking = _obj getVariable["packing",0];

	if (_alreadyPacking == 1) exitWith {cutText [format[(localize "str_player_beingpacked")] , "PLAIN DOWN"]};

	_obj setVariable["packing",1];

	_dir = direction _obj;
	_pos = getposATL _obj;

	_dis=20;
	_sfx = "tentpack";
	[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
	[player,_dis,true,(getPosATL player)] call player_alertZombies;

	sleep 3;

	//place tent (local)
	_bag = createVehicle ["WeaponHolder_ItemTent",_pos,[], 0, "CAN_COLLIDE"];
	_bag setdir _dir;
	player reveal _bag;

	_holder = createVehicle ["WeaponHolder", _pos, [], 0, "CAN_COLLIDE"];

	_weapons = getWeaponCargo _obj;
	_magazines = getMagazineCargo _obj;
	_backpacks = getBackpackCargo _obj;

	//["PVDZ_obj_Delete",[_objectID,_objectUID]] call callRpcProcedure;
	PVDZ_obj_Delete = [_objectID,_objectUID];
	publicVariableServer "PVDZ_obj_Delete";
	if (isServer) then {
		PVDZ_obj_Delete call server_deleteObj;
	};
	deleteVehicle _obj;

	//Add weapons
	_objWpnTypes = _weapons select 0;
	_objWpnQty = _weapons select 1;
	_countr = 0;
	{
		_holder addweaponcargoGlobal [_x,(_objWpnQty select _countr)];
		_countr = _countr + 1;
	} forEach _objWpnTypes;

	//Add Magazines
	_objWpnTypes = _magazines select 0;
	_objWpnQty = _magazines select 1;
	_countr = 0;
	{
		_holder addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];
		_countr = _countr + 1;
	} forEach _objWpnTypes;

	//Add Backpacks
	_objWpnTypes = _backpacks select 0;
	_objWpnQty = _backpacks select 1;
	_countr = 0;
	{
		_holder addbackpackcargoGlobal [_x,(_objWpnQty select _countr)];
		_countr = _countr + 1;
	} forEach _objWpnTypes;

	cutText [localize "str_success_tent_pack", "PLAIN DOWN"];
} else {
	cutText [localize "str_fail_tent_pack", "PLAIN DOWN"];
};