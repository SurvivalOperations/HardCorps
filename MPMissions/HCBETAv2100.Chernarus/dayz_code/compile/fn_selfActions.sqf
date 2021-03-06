scriptName "Functions\misc\fn_selfActions.sqf";
/***********************************************************
	ADD ACTIONS FOR SELF
	- Function
	- [] call fnc_usec_selfActions;
************************************************************/
private["_isPZombie","_vehicle","_inVehicle","_bag","_classbag","_isWater","_hasAntiB","_hasFuelE","_hasRawMeat","_hasKnife","_hasToolbox","_hasTent","_onLadder","_nearLight","_canPickLight","_canDo","_text","_isHarvested","_isVehicle","_isVehicletype","_isMan","_traderType","_ownerID","_isAnimal","_isDog","_isZombie","_isDestructable","_isTent","_isFuel","_isAlive","_canmove","_Unlock","_lock","_allFixed","_hitpoints","_damage","_part","_cmpt","_color","_string","_handle","_trader_id","_category","_buy","_buy2","_buy3","_buy1","_buy4","_buy5","_cantrader","_cantrader1","_buy6","_zparts1","_zparts2","_zparts3","_zparts4","_metals1","_metals2","_metals4","_metals3","_metals5","_dogHandle","_lieDown","_warn"];

_vehicle = vehicle player;
_isPZombie = player isKindOf "PZombie_VB";
_inVehicle = (_vehicle != player);
_bag = unitBackpack player;
_classbag = typeOf _bag;
_isWater = 		(surfaceIsWater (position player)) or dayz_isSwimming;
_hasAntiB = 	"ItemAntibiotic" in magazines player;
_hasFuelE = 	"ItemJerrycanEmpty" in magazines player;
//boiled Water
_hasbottleitem = "ItemWaterbottle" in magazines player;
_hastinitem = false;

{
    if (_x in magazines player) then {
        _hastinitem = true;
    };
} forEach boil_tin_cans;

_hasKnife = 	"ItemKnife" in items player;
_hasToolbox = 	"ItemToolbox" in items player;
//_hasTent = 		"ItemTent" in items player;
_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_nearLight = 	nearestObject [player,"LitObject"];
_canPickLight = false;

if (!isNull _nearLight) then {
	if (_nearLight distance player < 4) then {
		_canPickLight = isNull (_nearLight getVariable ["owner",objNull]);
	};
};
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);
//##### BASE BUILDING 1.2 Custom Actions (CROSSHAIR IS TARGETING NOTHING) #####
// #### START1 ####
_currentSkin = typeOf(player);
			// Get closest camonet since we cannot target with crosshair Base Building Script, got lazy here, didnt fix with array
			camoNetB_East = nearestObject [player, "Land_CamoNetB_EAST"];
			camoNetVar_East = nearestObject [player, "Land_CamoNetVar_EAST"];
			camoNet_East = nearestObject [player, "Land_CamoNet_EAST"];
			camoNetB_Nato = nearestObject [player, "Land_CamoNetB_NATO"];
			camoNetVar_Nato = nearestObject [player, "Land_CamoNetVar_NATO"];
			camoNet_Nato = nearestObject [player, "Land_CamoNet_NATO"];
	// Check mags in player inventory to show build recipe menu	
	_mags = magazines player;
	if ("ItemTankTrap" in _mags || "ItemSandbag" in _mags || "ItemWire" in _mags || "PartWoodPile" in _mags || "PartGeneric" in _mags) then {
		hasBuildItem = true;
	} else { hasBuildItem = false;};
	//Build Recipe Menu Action
	if((speed player <= 1) && hasBuildItem && _canDo) then {
		if (s_player_recipeMenu < 0) then {
			s_player_recipeMenu = player addaction [("<t color=""#0074E8"">" + ("Build Recipes") +"</t>"),"buildRecipeBook\build_recipe_dialog.sqf","",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_recipeMenu;
		s_player_recipeMenu = -1;
	};

	//Add in custom eventhandlers or whatever on skin change
	if (_currentSkin != globalSkin) then {
		globalSkin = _currentSkin;
		player removeMPEventHandler ["MPHit", 0]; 
		player removeEventHandler ["AnimChanged", 0];
		ehWall = player addEventHandler ["AnimChanged", { player call antiWall; } ];
	};
	// Remove CamoNets, (Not effecient but works)
	if((isNull cursorTarget) && _hasToolbox && _canDo && !remProc && !procBuild && 
		(camoNetB_East distance player < 10 or 
		camoNetVar_East distance player < 10 or 
		camoNet_East distance player < 10 or 
		camoNetB_Nato distance player < 10 or 
		camoNetVar_Nato distance player < 10 or 
		camoNet_Nato distance player < 10)) then {
		if (s_player_deleteCamoNet < 0) then {
			s_player_deleteCamoNet = player addaction [("<t color=""#F01313"">" + ("Remove Netting") +"</t>"),"dayz_code\actions\player_remove.sqf","",1,true,true,"",""];
		};
	} else {
		player removeAction s_player_deleteCamoNet;
		s_player_deleteCamoNet = -1;
	};
	
//##### BASE BUILDING 1.2 Custom Actions (CROSSHAIR IS TARGETING NOTHING) #####
// #### END1 ####
//Grab Flare
if (_canPickLight and !dayz_hasLight and !_isPZombie) then {
	if (s_player_grabflare < 0) then {
		_text = getText (configFile >> "CfgAmmo" >> (typeOf _nearLight) >> "displayName");
		s_player_grabflare = player addAction [format[localize "str_actions_medical_15",_text], "\z\addons\dayz_code\actions\flare_pickup.sqf",_nearLight, 1, false, true, "", ""];
		s_player_removeflare = player addAction [format[localize "str_actions_medical_17",_text], "\z\addons\dayz_code\actions\flare_remove.sqf",_nearLight, 1, false, true, "", ""];
	};
} else {
	player removeAction s_player_grabflare;
	player removeAction s_player_removeflare;
	s_player_grabflare = -1;
	s_player_removeflare = -1;
};

if(DZEdebug) then {
	hint str(typeOf cursorTarget);

	if (s_player_debuglootpos < 0) then {
		s_player_debuglootpos = player addAction ["Save to arma2.rpt", "\z\addons\dayz_code\actions\debug\Make_lootPos.sqf", ["save"], 99, false, true, "",""];
	};
};

if(_isPZombie) then {
	//_state = animationState player;
	//hint str(_state);
	if (s_player_callzombies < 0) then {
		s_player_callzombies = player addAction ["Raise Horde", "\z\addons\dayz_code\actions\call_zombies.sqf",player, 5, true, false, "",""];
	};

	if (s_player_pzombiesattack < 0) then {
		s_player_pzombiesattack = player addAction ["Attack", "\z\addons\dayz_code\actions\pzombie\pz_attack.sqf",cursorTarget, 6, true, false, "",""];
	};
	
	if (!isNull cursorTarget and (player distance cursorTarget < 3)) then {	//Has some kind of target
		_isAnimal = cursorTarget isKindOf "Animal";
		_isZombie = cursorTarget isKindOf "zZombie_base";
		_isHarvested = cursorTarget getVariable["meatHarvested",false];
		_isMan = cursorTarget isKindOf "Man";

		// Pzombie Gut human corpse or animal
		if (!alive cursorTarget and (_isAnimal or _isMan) and !_isZombie and !_isHarvested and _canDo) then {
			if (s_player_pzombiesfeed < 0) then {
				s_player_pzombiesfeed = player addAction ["Feed", "\z\addons\dayz_code\actions\pzombie\pz_feed.sqf",cursorTarget, 3, true, false, "",""];
			};
		} else {
			player removeAction s_player_pzombiesfeed;
			s_player_pzombiesfeed = -1;
		};
	} else {
		player removeAction s_player_pzombiesfeed;
		s_player_pzombiesfeed = -1;
	};
};

// Increase distance only if AIR OR SHIP
_allowedDistance = 4;
_isAir = cursorTarget isKindOf "Air";
_isShip = cursorTarget isKindOf "Ship";
if(_isAir or _isShip) then {
	_allowedDistance = 6;
};

if (!isNull cursorTarget and !_inVehicle and !_isPZombie and (player distance cursorTarget < _allowedDistance)) then {	//Has some kind of target
	_isHarvested = cursorTarget getVariable["meatHarvested",false];
	_isVehicle = cursorTarget isKindOf "AllVehicles";
	_isVehicletype = typeOf cursorTarget in ["ATV_US_EP1","ATV_CZ_EP1"];
	_isMan = cursorTarget isKindOf "Man";
	_traderType = typeOf cursorTarget;
	_ownerID = cursorTarget getVariable ["characterID","0"];
	_isAnimal = cursorTarget isKindOf "Animal";
	_isDog =  (cursorTarget isKindOf "DZ_Pastor" || cursorTarget isKindOf "DZ_Fin");
	_isZombie = cursorTarget isKindOf "zZombie_base";
	_isDestructable = cursorTarget isKindOf "BuiltItems";
	_isTent = cursorTarget isKindOf "TentStorage";
	_isFuel = false;
	_isAlive = alive cursorTarget;
	_canmove = canmove cursorTarget;
	_text = getText (configFile >> "CfgVehicles" >> typeOf cursorTarget >> "displayName");
	
	
	_rawmeat = meatraw;
	_hasRawMeat = false;
	{
		if (_x in magazines player) then {
			_hasRawMeat = true;
		};
	} forEach _rawmeat; 
	
	
	if (_hasFuelE) then {
		_isFuel = (cursorTarget isKindOf "Land_Ind_TankSmall") or (cursorTarget isKindOf "Land_fuel_tank_big") or (cursorTarget isKindOf "Land_fuel_tank_stairs") or (cursorTarget isKindOf "Land_fuel_tank_stairs_ep1") or (cursorTarget isKindOf "Land_wagon_tanker") or (cursorTarget isKindOf "Land_fuelstation") or (cursorTarget isKindOf "Land_fuelstation_army");
	};
	// diag_log ("OWNERID = " + _ownerID + " CHARID = " + dayz_characterID + " " + str(_ownerID == dayz_characterID));
	//##### BASE BUILDING 1.2 Custom Actions (CROSSHAIR HAS A TARGET) #####
// ##### START #####
	// Operate Gates
	if ((dayz_myCursorTarget != cursorTarget) && (cursorTarget isKindOf "Infostand_2_EP1") && keyValid) then {
		_lever = cursorTarget;
		{dayz_myCursorTarget removeAction _x} forEach s_player_gateActions;s_player_gateActions = [];
		dayz_myCursorTarget = _lever;
		_gates = nearestObjects [_lever, ["Concrete_Wall_EP1"], 100];
		if (count _gates > 0) then {
			_handle = dayz_myCursorTarget addAction ["Operate Gate", "dayz_code\external\keypad\fnc_keyPad\operate_gates.sqf", _lever, 1, false, true, "", ""];
			s_player_gateActions set [count s_player_gateActions,_handle];
		};
	};

	// Remove Object Custom removal test
	if((typeOf(cursortarget) in allremovables) && _hasToolbox && _canDo && !remProc && !procBuild && !removeObject) then {
		if (s_player_deleteBuild < 0) then {
			s_player_deleteBuild = player addAction [format[localize "str_actions_delete",_text], "dayz_code\actions\player_remove.sqf",cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_deleteBuild;
		s_player_deleteBuild = -1;
	};
	

	// Enter Code to Operate Gates Action
	if((speed player <= 1) && !keyValid && (typeOf(cursortarget) == "Infostand_2_EP1") && cursorTarget distance player < 5 && _canDo) then {
		if (s_player_enterCode < 0) then {
			s_player_enterCode = player addaction [("<t color=""#4DFF0D"">" + ("Enter Key Code to Operate Gate") +"</t>"),"dayz_code\external\keypad\fnc_keyPad\enterCode.sqf","",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_enterCode;
		s_player_enterCode = -1;
	};
	
	// Enter Code to remove object
	if((speed player <= 1) && !removeObject && (typeOf(cursortarget) in allbuildables_class) && cursorTarget distance player < 5 && _canDo) then {
			if (s_player_codeObject < 0) then {
				s_player_codeObject = player addaction [("<t color=""#8E11F5"">" + ("Enter Code of Object to remove") +"</t>"),"dayz_code\external\keypad\fnc_keyPad\enterCode.sqf","",5,false,true,"",""];
			};
	} else {
		player removeAction s_player_codeObject;
		s_player_codeObject = -1;
	};

	
	// Remove Object from code
	if((typeOf(cursortarget) in allbuildables_class) && _canDo && removeObject && !procBuild && !remProc) then {
		_validObject = cursortarget getVariable ["validObject",false];
		if (_validObject) then {
			if (s_player_codeRemove < 0) then {
				s_player_codeRemove = player addaction [("<t color=""#8E11F5"">" + ("Base Owners Remove Object") +"</t>"),"dayz_code\actions\player_remove.sqf","",5,false,true,"",""];
			};
		} else {
			player removeAction s_player_codeRemove;
			s_player_codeRemove = -1;
		};
	} else {
		player removeAction s_player_codeRemove;
		s_player_codeRemove = -1;
	};
	// Disarm Booby Trap Action
	if(_hasToolbox && _canDo && !remProc && !procBuild && (cursortarget iskindof "Grave" && cursortarget distance player < 2.5 && !(cursortarget iskindof "Body" || cursortarget iskindof "GraveCross1" || cursortarget iskindof "GraveCross2" || cursortarget iskindof "GraveCrossHelmet" || cursortarget iskindof "Land_Church_tomb_1" || cursortarget iskindof "Land_Church_tomb_2" || cursortarget iskindof "Land_Church_tomb_3" || cursortarget iskindof "Mass_grave"))) then {
		if (s_player_disarmBomb < 0) then {
			s_player_disarmBomb = player addaction [("<t color=""#F01313"">" + ("Disarm Bomb") +"</t>"),"dayz_code\actions\player_disarmBomb.sqf","",1,true,true,"", ""];
		};
	} else {
		player removeAction s_player_disarmBomb;
		s_player_disarmBomb = -1;
	};
	
// ------------------------------------------------------------------------kikyou2 Edit Button Start---------------------------------------------------------------------
	if((typeOf(cursortarget) in allbuildables_class) && _canDo && !procBuild && !remProc && (_ownerID == dayz_playerUID)) then {
		if (true) then {
			if (s_player_codeEdit < 0) then {
				s_player_codeEdit = player addaction [("<t color=""#00ffff"">" + ("Edit Code") +"</t>"),"dayz_code\external\keypad\fnc_keyPad\editCode.sqf"];
			};
		} else {
			player removeAction s_player_codeEdit;
			s_player_codeEdit = -1;
		};
	} else {
		player removeAction s_player_codeEdit;
		s_player_codeEdit = -1;
	};
// ------------------------------------------------------------------------kikyou2 Edit Button End-----------------------------------------------------------------------

//##### BASE BUILDING 1.2 Custom Actions (CROSSHAIR HAS A TARGET) #####
// ##### END #####

	// Allow Owner to lock and unlock vehicle  
	if(_isVehicle and !_isMan and _canDo and _ownerID != "0") then {
			
		if (s_player_lockUnlock_crtl < 0) then {

			if(locked cursorTarget) then {
				if(_ownerID == dayz_playerUID) then {
					_Unlock = player addAction [format["Unlock %1",_text], "\z\addons\dayz_code\actions\unlock_veh.sqf",cursorTarget, 2, true, true, "", ""];
					s_player_lockunlock set [count s_player_lockunlock,_Unlock];
					s_player_lockUnlock_crtl = 1;
				} else {
					_Unlock = player addAction ["<t color='#ff0000'>Vehicle Locked</t>", "",cursorTarget, 2, true, true, "", ""];
					s_player_lockunlock set [count s_player_lockunlock,_Unlock];
					s_player_lockUnlock_crtl = 1;
				};
			} else {
				if(_ownerID == dayz_playerUID) then {
					_lock = player addAction [format["Lock %1",_text], "\z\addons\dayz_code\actions\lock_veh.sqf",cursorTarget, 1, true, true, "", ""];
					s_player_lockunlock set [count s_player_lockunlock,_lock];
					s_player_lockUnlock_crtl = 1;
				};
			};
			
		};
		 
	} else {
		{player removeAction _x} forEach s_player_lockunlock;s_player_lockunlock = [];
		s_player_lockUnlock_crtl = -1;
	};


	if((_isVehicle or _isTent or (cursorTarget isKindOf "VaultStorage")) and _isAlive and _canDo and !_isMan) then {
		if (s_player_checkGear < 0) then {
			s_player_checkGear = player addAction ["Cargo Check", "\z\addons\dayz_code\actions\cargocheck.sqf",cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_checkGear;
		s_player_checkGear = -1;
	};

	//flip vehicle
	if ((_isVehicletype) and !_canmove and _isAlive and (player distance cursorTarget >= 2) and (count (crew cursorTarget))== 0 and ((vectorUp cursorTarget) select 2) < 0.5) then {
		if (s_player_flipveh  < 0) then {
			s_player_flipveh = player addAction [format[localize "str_actions_flipveh",_text], "\z\addons\dayz_code\actions\player_flipvehicle.sqf",cursorTarget, 1, true, true, "", ""];		
		};	
	} else {
		player removeAction s_player_flipveh;
		s_player_flipveh = -1;
	};
	
	//Allow player to fill jerrycan
	if(_hasFuelE and _isFuel and _canDo) then {
		if (s_player_fillfuel < 0) then {
			s_player_fillfuel = player addAction [localize "str_actions_self_10", "\z\addons\dayz_code\actions\jerry_fill.sqf",[], 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_fillfuel;
		s_player_fillfuel = -1;
	};
	
	// Human Gut animal or zombie
	if (!alive cursorTarget and (_isAnimal or _isZombie) and _hasKnife and !_isHarvested and _canDo) then {
		if (s_player_butcher < 0) then {
			if(_isZombie) then {
				s_player_butcher = player addAction ["Gut Zombie", "\z\addons\dayz_code\actions\gather_zparts.sqf",cursorTarget, 3, true, true, "", ""];
			} else {
				s_player_butcher = player addAction [localize "str_actions_self_04", "\z\addons\dayz_code\actions\gather_meat.sqf",cursorTarget, 3, true, true, "", ""];
			};
		};
	} else {
		player removeAction s_player_butcher;
		s_player_butcher = -1;
	};
	
	//Fireplace Actions check
	if (inflamed cursorTarget and _hasRawMeat and _canDo) then {
		if (s_player_cook < 0) then {
			s_player_cook = player addAction [localize "str_actions_self_05", "\z\addons\dayz_code\actions\cook.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_cook;
		s_player_cook = -1;
	};
	if (inflamed cursorTarget and (_hasbottleitem and _hastinitem) and _canDo) then {
		if (s_player_boil < 0) then {
			s_player_boil = player addAction [localize "str_actions_boilwater", "\z\addons\dayz_code\actions\boil.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_boil;
		s_player_boil = -1;
	};
	
	if(cursorTarget == dayz_hasFire and _canDo) then {
		if ((s_player_fireout < 0) and !(inflamed cursorTarget) and (player distance cursorTarget < 3)) then {
			s_player_fireout = player addAction [localize "str_actions_self_06", "\z\addons\dayz_code\actions\fire_pack.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_fireout;
		s_player_fireout = -1;
	};
	
	//Packing my tent
	if(cursorTarget isKindOf "TentStorage" and _canDo and _ownerID == dayz_characterID) then {
		if ((s_player_packtent < 0) and (player distance cursorTarget < 3)) then {
			s_player_packtent = player addAction [localize "str_actions_self_07", "\z\addons\dayz_code\actions\tent_pack.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_packtent;
		s_player_packtent = -1;
	};

	//Allow owner to unlock vault
	if(cursorTarget isKindOf "VaultStorageLocked" and _canDo and _ownerID != "0" and _ownerID == dayz_playerUID and !UnlockInprogress) then {
		if (s_player_unlockvault < 0  and (player distance cursorTarget < 3)) then {
			s_player_unlockvault = player addAction ["Unlock Safe", "\z\addons\dayz_code\actions\vault_unlock.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_unlockvault;
		s_player_unlockvault = -1;
	};

	//Allow owner to pack vault
	if(cursorTarget isKindOf "VaultStorage" and _canDo and _ownerID != "0" and _ownerID == dayz_playerUID and (player distance cursorTarget < 3)) then {

		if (s_player_lockvault < 0) then {
			s_player_lockvault = player addAction ["Lock Safe", "\z\addons\dayz_code\actions\vault_lock.sqf",cursorTarget, 0, false, true, "",""];
		};
		if (s_player_packvault < 0) then {
			s_player_packvault = player addAction ["<t color='#ff0000'>Pack Safe</t>", "\z\addons\dayz_code\actions\vault_pack.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_packvault;
		s_player_packvault = -1;
		player removeAction s_player_lockvault;
		s_player_lockvault = -1;
	};

	

    //Player Deaths
	if(cursorTarget isKindOf "Info_Board_EP1" and _canDo) then {
		if ((s_player_information < 0) and (player distance cursorTarget < 3)) then {
			s_player_information = player addAction ["Recent Deaths", "\z\addons\dayz_code\actions\list_playerDeaths.sqf",[], 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_information;
		s_player_information = -1;
	};
	

    //Sleep
	if(cursorTarget isKindOf "TentStorage" and _canDo and _ownerID == dayz_characterID) then {
		if ((s_player_sleep < 0) and (player distance cursorTarget < 3)) then {
			s_player_sleep = player addAction ["Sleep", "custom\player_sleep.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_sleep;
		s_player_sleep = -1;
	};
	





	//Repairing Vehicles
	if ((dayz_myCursorTarget != cursorTarget) and _isVehicle and !_isMan and _hasToolbox and (damage cursorTarget < 1)) then {
		
		if (s_player_repair_crtl < 0) then {
			
			_vehicle = cursorTarget;
			dayz_myCursorTarget = _vehicle;

			_menu = dayz_myCursorTarget addAction ["Repair Vehicle", "\z\addons\dayz_code\actions\repair_vehicle.sqf",_vehicle, 0, true, false, "",""];
			_menu1 = dayz_myCursorTarget addAction ["Salvage Vehicle", "\z\addons\dayz_code\actions\salvage_vehicle.sqf",_vehicle, 0, true, false, "",""];
			
			s_player_repairActions set [count s_player_repairActions,_menu];
			s_player_repairActions set [count s_player_repairActions,_menu1];

			s_player_repair_crtl = 1;

		} else {
			{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
			s_player_repair_crtl = -1;
		};
	};




	
	_humanity = player getVariable ["humanity",0];
	
	


	// All Traders
	if (_isMan and !_isPZombie and _traderType in serverTraders) then {
		
		if (s_player_parts_crtl < 0) then {

			//diag_log ("TRADER = " + str(serverTraders));
			
			_traderMenu = call compile format["menu_%1;",_traderType];

			diag_log ("TRADER = " + str(_traderMenu));
			
			_low_high = "low";

			_humanity_logic = false;
			if((_traderMenu select 2) == "friendly") then {
				//_low_high = "low";
				if (_humanity < -2000) then {
					_humanity_logic = true;
				};
			};
			if((_traderMenu select 2) == "hostile") then {
				_low_high = "high";
				if (_humanity > -2000) then {
					_humanity_logic = true;
				};
			};
			if((_traderMenu select 2) == "hero") then {
				//_low_high = "low";
				if (_humanity < 5000) then {
					_humanity_logic = true;
				};
			};
			if(_humanity_logic) then {
				_cancel = player addAction [format["Your humanity is too %1 this trader refuses to talk to you.",_low_high], "\z\addons\dayz_code\actions\trade_cancel.sqf",["na"], 0, true, false, "",""];
				s_player_parts set [count s_player_parts,_cancel];
			} else {
				
				// Static Menu
				{
					diag_log format["DEBUG TRADER: %1", _x];
					_buy = player addAction [format["Trade %1 %2 for %3 %4",(_x select 3),(_x select 5),(_x select 2),(_x select 6)], "\z\addons\dayz_code\actions\trade_items_wo_db.sqf",[(_x select 0),(_x select 1),(_x select 2),(_x select 3),(_x select 4),(_x select 5),(_x select 6)], (_x select 7), true, true, "",""];
					s_player_parts set [count s_player_parts,_buy];
				
				} forEach (_traderMenu select 1);
				// Database menu 
				{
					_buy = player addAction [(_x select 0), "\z\addons\dayz_code\actions\buy_or_sell.sqf",[(_x select 1),(_x select 0)], 99, true, false, "",""];
					s_player_parts set [count s_player_parts,_buy];
				} forEach (_traderMenu select 0);
				
				// Add static metals trader options under sub menu
				_metals_trader = player addAction ["Trade Metals", "\z\addons\dayz_code\actions\trade_metals.sqf",["na"], 0, true, false, "",""];
				s_player_parts set [count s_player_parts,_metals_trader];

			};



			s_player_parts_crtl = 1;
			
		};
	} else {
		{player removeAction _x} forEach s_player_parts;s_player_parts = [];
		s_player_parts_crtl = -1;
	};





	if (_isMan and !_isAlive and !_isZombie) then {
		if (s_player_studybody < 0) then {
			s_player_studybody = player addAction [localize "str_action_studybody", "study_body.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_studybody;
		s_player_studybody = -1;
	};
	//CLOTHES
    if (_isMan and !_isAlive and !_isZombie and !_isAnimal) then {
    if (s_clothes < 0) then {
            s_clothes = player addAction [("<t color=""#FF0000"">" + ("Take Clothes") + "</t>"), "fixes\clothes.sqf",cursorTarget, 1, false, true, "",""];
        };
    } else {
        player removeAction s_clothes;
        s_clothes = -1;
    };
	
		
	//Dog
	if (_isDog and _isAlive and (_hasRawMeat) and _canDo and _ownerID == "0" and player getVariable ["dogID", 0] == 0) then {
		if (s_player_tamedog < 0) then {
			s_player_tamedog = player addAction [localize "str_actions_tamedog", "\z\addons\dayz_code\actions\tame_dog.sqf", cursorTarget, 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_tamedog;
		s_player_tamedog = -1;
	};
	
	
	if (_isDog and _ownerID == dayz_characterID and _isAlive and _canDo) then {
		_dogHandle = player getVariable ["dogID", 0];
		if (s_player_feeddog < 0 and _hasRawMeat) then {
			s_player_feeddog = player addAction [localize "str_actions_feeddog","\z\addons\dayz_code\actions\dog\feed.sqf",[_dogHandle,0], 0, false, true,"",""];
		};
		if (s_player_waterdog < 0 and "ItemWaterbottle" in magazines player) then {
			s_player_waterdog = player addAction [localize "str_actions_waterdog","\z\addons\dayz_code\actions\dog\feed.sqf",[_dogHandle,1], 0, false, true,"",""];
		};
		if (s_player_staydog < 0) then {
			_lieDown = _dogHandle getFSMVariable "_actionLieDown";
			if (_lieDown) then { _text = "str_actions_liedog"; } else { _text = "str_actions_sitdog"; };
			s_player_staydog = player addAction [localize _text,"\z\addons\dayz_code\actions\dog\stay.sqf", _dogHandle, 5, false, true,"",""];
		};
		if (s_player_trackdog < 0) then {
			s_player_trackdog = player addAction [localize "str_actions_trackdog","\z\addons\dayz_code\actions\dog\track.sqf", _dogHandle, 4, false, true,"",""];
		};
		if (s_player_barkdog < 0) then {
			s_player_barkdog = player addAction [localize "str_actions_barkdog","\z\addons\dayz_code\actions\dog\speak.sqf", cursorTarget, 3, false, true,"",""];
		};
		if (s_player_warndog < 0) then {
			_warn = _dogHandle getFSMVariable "_watchDog";
			if (_warn) then { _text = "Quiet"; _warn = false; } else { _text = "Alert"; _warn = true; };
			s_player_warndog = player addAction [format[localize "str_actions_warndog",_text],"\z\addons\dayz_code\actions\dog\warn.sqf",[_dogHandle, _warn], 2, false, true,"",""];		
		};
		if (s_player_followdog < 0) then {
			s_player_followdog = player addAction [localize "str_actions_followdog","\z\addons\dayz_code\actions\dog\follow.sqf",[_dogHandle,true], 6, false, true,"",""];
		};
	} else {
		player removeAction s_player_feeddog;
		s_player_feeddog = -1;
		player removeAction s_player_waterdog;
		s_player_waterdog = -1;
		player removeAction s_player_staydog;
		s_player_staydog = -1;
		player removeAction s_player_trackdog;
		s_player_trackdog = -1;
		player removeAction s_player_barkdog;
		s_player_barkdog = -1;
		player removeAction s_player_warndog;
		s_player_warndog = -1;
		player removeAction s_player_followdog;
		s_player_followdog = -1;
	};
} else {
	//Engineering
	{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
	s_player_repair_crtl = -1;
		
	dayz_myCursorTarget = objNull;
	// ### BASE BUILDING 1.2 ### For gates: 
// ### START ###
	{dayz_myCursorTarget removeAction _x} forEach s_player_gateActions;s_player_gateActions = [];
	dayz_myCursorTarget = objNull;	
// ### BASE BUILDING 1.2 ### For gates: 
// ### END ###

	//{player removeAction _x} forEach s_player_madsci;s_player_madsci = [];
	{player removeAction _x} forEach s_player_parts;s_player_parts = [];

	//{player removeAction _x} forEach s_player_bank;s_player_bank = [];
	{player removeAction _x} forEach s_player_lockunlock;s_player_lockunlock = [];

	player removeAction s_player_checkGear;
	s_player_checkGear = -1;

	//s_player_madsci_crtl = -1;
	s_player_parts_crtl = -1;

	// lock unlock vehicles
	s_player_lockUnlock_crtl = -1;

	// Bank Vault
	s_player_bankvault_crtl = -1;

	//Others
	player removeAction s_player_forceSave;
	s_player_forceSave = -1;
	player removeAction s_player_flipveh;
	s_player_flipveh = -1;
	player removeAction s_player_sleep;
	s_player_sleep = -1;
	player removeAction s_player_deleteBuild;
	s_player_deleteBuild = -1;
	// ### BASE BUILDING 1.2 ### Add in these: 
// ### START ###
	player removeAction s_player_codeRemove;
	s_player_codeRemove = -1;
	player removeAction s_player_forceSave;
	s_player_forceSave = -1;
	player removeAction s_player_disarmBomb;
	s_player_disarmBomb = -1;
	player removeAction s_player_codeObject;
	s_player_codeObject = -1;
	player removeAction s_player_enterCode;
	s_player_enterCode = -1;
	player removeAction s_player_smeltRecipes;
	s_player_smeltRecipes = -1;
	player removeAction s_player_smeltItems;
	s_player_smeltItems = -1;
// ------------------------------------------------------------------------kikyou2 Edit Button Start---------------------------------------------------------------------
	player removeAction s_player_codeEdit;
	s_player_codeEdit = -1;
// ------------------------------------------------------------------------kikyou2 Edit Button End-----------------------------------------------------------------------
// ### BASE BUILDING 1.2 ### Add in these:
// ### END ###
	player removeAction s_player_butcher;
	s_player_butcher = -1;
	player removeAction s_player_cook;
	s_player_cook = -1;
	player removeAction s_player_boil;
	s_player_boil = -1;
	player removeAction s_player_fireout;
	s_player_fireout = -1;
	player removeAction s_player_packtent;
	s_player_packtent = -1;
	player removeAction s_player_fillfuel;
	s_player_fillfuel = -1;
	player removeAction s_player_studybody;
	s_player_studybody = -1;
	player removeAction s_clothes;
    s_clothes = -1;
	//Dog
	player removeAction s_player_tamedog;
	s_player_tamedog = -1;
	player removeAction s_player_feeddog;
	s_player_feeddog = -1;
	player removeAction s_player_waterdog;
	s_player_waterdog = -1;
	player removeAction s_player_staydog;
	s_player_staydog = -1;
	player removeAction s_player_trackdog;
	s_player_trackdog = -1;
	player removeAction s_player_barkdog;
	s_player_barkdog = -1;
	player removeAction s_player_warndog;
	s_player_warndog = -1;
	player removeAction s_player_followdog;
	s_player_followdog = -1;
    
    	// vault
	player removeAction s_player_unlockvault;
	s_player_unlockvault = -1;
	player removeAction s_player_packvault;
	s_player_packvault = -1;
	player removeAction s_player_lockvault;
	s_player_lockvault = -1;
};



//Dog actions on player self
_dogHandle = player getVariable ["dogID", 0];
if (_dogHandle > 0) then {
	_dog = _dogHandle getFSMVariable "_dog";
	_ownerID = "0";
	if (!isNull cursorTarget) then { _ownerID = cursorTarget getVariable ["characterID","0"]; };
	if (_canDo and !_inVehicle and alive _dog and _ownerID != dayz_characterID) then {
		if (s_player_movedog < 0) then {
			s_player_movedog = player addAction [localize "str_actions_movedog", "\z\addons\dayz_code\actions\dog\move.sqf", player getVariable ["dogID", 0], 1, false, true, "", ""];
		};
		if (s_player_speeddog < 0) then {
			_text = "Walk";
			_speed = 0;
			if (_dog getVariable ["currentSpeed",1] == 0) then { _speed = 1; _text = "Run"; };
			s_player_speeddog = player addAction [format[localize "str_actions_speeddog", _text], "\z\addons\dayz_code\actions\dog\speed.sqf",[player getVariable ["dogID", 0],_speed], 0, false, true, "", ""];
		};
		if (s_player_calldog < 0) then {
			s_player_calldog = player addAction [localize "str_actions_calldog", "\z\addons\dayz_code\actions\dog\follow.sqf", [player getVariable ["dogID", 0], true], 2, false, true, "", ""];
		};
	};
} else {
	player removeAction s_player_movedog;		
	s_player_movedog =		-1;
	player removeAction s_player_speeddog;
	s_player_speeddog =		-1;
	player removeAction s_player_calldog;
	s_player_calldog = 		-1;
};