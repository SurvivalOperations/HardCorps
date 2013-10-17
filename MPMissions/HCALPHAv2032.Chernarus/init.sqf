startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];
 
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
 
#include "\z\addons\dayz_code\system\mission\init.sqf"

/*------------------------------------------------------------------------------
| BELOW THIS LINE IS FOR CUSOTM SCRIPTS, POLICE SCRIPT AND COMMENT ITS PURPOSE |
------------------------------------------------------------------------------*/
  
if (isserver) then {execVM "oldbases.sqf";};
 
[] ExecVM "wind.sqf"; //Handles Client Wind Deflection//Same Readings

if (player distance c2 > 500) then {skipTime -1};
 
_handleLoop = []execVM "Complexes\loop.sqf";

waitUntil {player == player};
 
null=[] execVM "randommilbases.sqf";
 
nul = ["GuerillaCacheBox_EP1",["mkr1", "mkr2", "mkr3", "mkr4", "mkr5", "mkr6"]] execVM "rndmkr.sqf"; 

/*-------
| B T K | - BTK Gas Masks added by OG
-------*/
[] execVM "BTK\Gasmask\Start.sqf";

/*---------
| STAMINA | - Stamina Debug & Modifier scripts added by OG
---------*/
waitUntil {(!isNull player)};
	script = [] execVM "ACE\stamina\stamina.sqf";
Private["_actionIndex"];
if (isNil "ACE_SYS_STAMINA_DEBUG") then {ACE_SYS_STAMINA_DEBUG = True};
_actionIndex = [["Toggle Stamina Debug Display", "ACE\stamina\StaminaDebug.sqf"]] call CBA_fnc_addPlayerAction;

/*--------------
| LIGHT SYSTEM | - Added by Falcon
--------------*/
if (!isDedicated) then {
[] execVM "lights\House_lights.sqf";
};

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



_playerMonitor = [] execVM "player_monitor.sqf";