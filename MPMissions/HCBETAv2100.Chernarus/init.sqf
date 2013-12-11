startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];
enableRadio false;
player setVariable ["BIS_noCoreConversations", true];
initialized = false;
0 fadeSound 0;
dayz_previousID = 0;
 
//Server Settings
dayZ_instance = 1; // The instance
dayZ_serverName = "SO"; // Servername (country code + server number)
dayz_antihack = 0; // DayZ Antihack / 1 = enabled // 0 = disabled
dayz_REsec = 0; // DayZ RE Security / 1 = enabled // 0 = disabled
dayzHiveRequest = [];
 
//Game Settings
dayz_spawnselection = 0; // DayZ Spawnselection / 1 = enabled // 0 = disabled, No current spawn limits.
dayz_spawnCrashSite_clutterCutter = 0;  // Helicrash Settings / 0 =  loot hidden in grass // 1 = loot lifted // 2 = no grass around the Helicrash
dayz_spawnInfectedSite_clutterCutter = 0; // Infected Base Settings / 0 =  loot hidden in grass // 1 = loot lifted // 2 = no grass around the infected base
 
//#include "\z\addons\dayz_code\system\mission\init.sqf"


//Load in compiled functions
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";					//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "randomloot.sqf";
call compile preprocessFileLineNumbers "randommilbases.sqf";	
call compile preprocessFileLineNumbers "compiles.sqf";					//Compile regular functions
call compile preprocessFileLineNumbers "dayz_code\init\variables.sqf"; //Initializes custom variables
call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf"; //Compile custom compiles
call compile preprocessFileLineNumbers "dayz_code\init\settings.sqf"; //Initialize custom clientside settings
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

[] spawn {
	while {true} do {
		waitUntil {((isNil "BIS_Effects_Rifle") OR {(count(toArray(str(BIS_Effects_Rifle)))!=7)})};
		diag_log "Res3tting B!S effects...";
		/* BIS_Effects_* fixes from Dwarden */
		BIS_Effects_EH_Killed = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\killed.sqf";
		BIS_Effects_AirDestruction = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\AirDestruction.sqf";
		BIS_Effects_AirDestructionStage2 = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\AirDestructionStage2.sqf";

		BIS_Effects_globalEvent = {
			BIS_effects_gepv = _this;
			publicVariable "BIS_effects_gepv";
			_this call BIS_Effects_startEvent;
		};

		BIS_Effects_startEvent = {
			switch (_this select 0) do {
				case "AirDestruction": {
						[_this select 1] spawn BIS_Effects_AirDestruction;
				};
				case "AirDestructionStage2": {
						[_this select 1, _this select 2, _this select 3] spawn BIS_Effects_AirDestructionStage2;
				};
				case "Burn": {
						[_this select 1, _this select 2, _this select 3, false, true] spawn BIS_Effects_Burn;
				};
			};
		};

		"BIS_effects_gepv" addPublicVariableEventHandler {
			(_this select 1) call BIS_Effects_startEvent;
		};

		BIS_Effects_EH_Fired = {false};
		BIS_Effects_Rifle = {false};
		sleep 1;
	};
};

if (isDedicated) then
{
lootSpawn = [] execVM "hideout\loot\randomloot.sqf";
};

if ((!isServer) && (isNull player) ) then
{
	waitUntil {!isNull player};
	waitUntil {time > 3};
};

if ((!isServer) && (player != player)) then
{
	waitUntil {player == player};
	waitUntil {time > 3};
};

//-----Is the below the Combat timer???----------
if (isServer) then {
	_serverMonitor = [] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
	"PVDZ_sec_atp" addPublicVariableEventHandler { 
		_x = _this select 1;
		if (typeName _x == "STRING") then {
			diag_log _x;
		}
		else {
			_unit = _x select 0;
			_source = _x select 1;
			if (((!(isNil {_source})) AND {(!(isNull _source))}) AND {((_source isKindOf "CAManBase") AND {(owner _unit != owner _source)})}) then {
				diag_log format ["P1ayer %1 hit by %2 %3 from %4 meters",
					_unit call fa_plr2Str,  _source call fa_plr2Str, _x select 2, _x select 3];
				if (_unit getVariable["processedDeath", 0] == 0) then {
					_unit setVariable [ "attacker", name _source ];
					_unit setVariable [ "noatlf4", diag_ticktime ]; // server-side "not in combat" test, if player is not already dead
				};
			};
		};
	};
};

if (!isDedicated) then {
	//Conduct map operations
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");

	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = [] execVM "player_monitor.sqf";
	if (dayz_antihack == 1) then {
	[] execVM "\z\addons\dayz_code\system\antihack.sqf";
	};
};

// Logo watermark: adding a logo in the bottom left corner of the screen with the server name in it
if (!isNil "dayZ_serverName") then {
	[] spawn {
		waitUntil {(!isNull Player) and (alive Player) and (player == player)};
		waituntil {!(isNull (findDisplay 46))};
		5 cutRsc ["wm_disp","PLAIN"];
		((uiNamespace getVariable "wm_disp") displayCtrl 1) ctrlSetText dayZ_serverName;
	};
};

if (dayz_REsec == 1) then {
#include "\z\addons\dayz_code\system\REsec.sqf"
};

/*------------------------------------------------------------------------------
| BELOW THIS LINE IS FOR CUSOTM SCRIPTS, POLICE SCRIPT AND COMMENT ITS PURPOSE |
------------------------------------------------------------------------------*/
  
[] ExecVM "wind.sqf"; //Handles Client Wind Deflection//Same Readings
waitUntil {player == player};

null = [] execVM "randommilbases.sqf";

/*---------
| STAMINA | - Stamina Debug & Modifier scripts added by OG
---------*/
/*
waitUntil {(!isNull player)};
	script = [] execVM "ACE\stamina\stamina.sqf";
Private["_actionIndex"];
if (isNil "ACE_SYS_STAMINA_DEBUG") then {ACE_SYS_STAMINA_DEBUG = True};
_actionIndex = [["Toggle Stamina Debug Display", "ACE\stamina\StaminaDebug.sqf"]] call CBA_fnc_addPlayerAction;
*/

/*----------------------
| ACE FUNCTION DISABLE | - Disable names and weapon storing for aircraft -- MaC
----------------------*/

if (isServer) then {
ace_sys_tracking_markers_enabled = false;
publicVariable "ace_sys_tracking_markers_enabled"
}; 

if (isServer) then {
ace_sys_eject_fnc_weaponcheck = false;
publicVariable "ace_sys_eject_fnc_weaponcheck"
}; 

if (isServer) then {
ACE_NO_RECOGNIZE = true; 
publicVariable "ACE_NO_RECOGNIZE"
};

if (isServer) then {
ace_sys_wind_deflection_force_drift_on = true;
publicVariable "ace_sys_wind_deflection_force_drift_on"
};
   /////////////////////////////
   // CCTV Custom self actions -added by Falcon
if (isServer) then {
        _nil = [] execVM "custom\neafcctv.sqf";
        /////////////////////////////
};
/*--------------
| LIGHT SYSTEM | - Added by Falcon
--------------*/
if (!isDedicated) then {
[] execVM "lights\House_lights.sqf";
};

/* New Debug --added by Falcon911-----------*/
if (!isDedicated) then {[] execVM "\z\addons\dayz_code\actions\playerstats\j0k3r5_stats.sqf"};
/*------------------
| BUIDLINGS SYSTEM | - Additional Buildings by Falcon
------------------*/
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\villages.sqf";
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\buildings.sqf";
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\raceday.sqf";   
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\fightyard.sqf";  
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\Barrage_Dan_BBC.sqf"; 
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\BlackLac_Dan_BBC.sqf";
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\bois1_Dan_BBC.sqf"; 
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\LieuxditPenduAto.sqf";
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\castle.sqf";
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\bridge.sqf"; 
