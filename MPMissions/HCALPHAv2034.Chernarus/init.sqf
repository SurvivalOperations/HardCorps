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
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";					//Compile regular functions
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
  
if (isserver) then {execVM "oldbases.sqf";};
 
[] ExecVM "wind.sqf"; //Handles Client Wind Deflection//Same Readings

waitUntil {player == player};
 
null=[] execVM "randommilbases.sqf";
 
nul = ["GuerillaCacheBox_EP1",["mkr1", "mkr2", "mkr3", "mkr4", "mkr5", "mkr6"]] execVM "rndmkr.sqf"; 

/*-------
| B T K | - BTK Gas Masks added by OG
-------*/
//[] execVM "BTK\Gasmask\Start.sqf";
[] execVM "radiationinit.sqf";

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

/*------------------
|Eagle eye wing effect Screen - Additional Effects by OG and Falcon911
--------------------*/
execVM "\custom\screen.sqf";

"colorCorrections" ppEffectAdjust [2, 30, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
"colorCorrections" ppEffectCommit 0;
//"colorCorrections" ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
"colorCorrections" ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];  
"colorCorrections" ppEffectCommit 3;
"colorCorrections" ppEffectEnable true;
"filmGrain" ppEffectEnable true; 
"filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
"filmGrain" ppEffectCommit 5;

//--- Wind & Dust
[] spawn {
    waituntil {isplayer player};
    setwind [0.201112,0.204166,true];
    while {true} do {
        _ran = ceil random 5;
        playsound format ["wind_%1",_ran];
        _obj = vehicle player;
        _pos = position _obj;

        //--- Dust
            setwind [0.201112*2,0.204166*2,false];
        _velocity = [random 10,random 10,-1];
        _color = [1.0, 0.9, 0.8];
        _alpha = 0.02 + random 0.02;
        _ps = "#particlesource" createVehicleLocal _pos;  
        _ps setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 12, 8], "", "Billboard", 1, 3, [0, 0, -6], _velocity, 1, 1.275, 1, 0, [9], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", _obj];
        _ps setParticleRandom [3, [30, 30, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
        _ps setParticleCircle [0.1, [0, 0, 0]];
        _ps setDropInterval 0.01;

        sleep (random 1);
        deletevehicle _ps;
        _delay = 10 + random 20;
        sleep _delay;

    };
};

//--- Ash
[] spawn {
    waituntil {isplayer player};
    _pos = position player;
    _parray = [
    /* 00 */        ["\Ca\Data\ParticleEffects\Universal\Universal", 16, 12, 8, 1],//"\Ca\Data\cl_water",
    /* 01 */        "",
    /* 02 */        "Billboard",
    /* 03 */        1,
    /* 04 */        4,
    /* 05 */        [0,0,0],
    /* 06 */        [0,0,0],
    /* 07 */        1,
    /* 08 */        0.000001,
    /* 09 */        0,
    /* 10 */        1.4,
    /* 11 */        [0.05,0.05],
    /* 12 */        [[0.1,0.1,0.1,1]],
    /* 13 */        [0,1],
    /* 14 */        0.2,
    /* 15 */        1.2,
    /* 16 */        "",
    /* 17 */        "",
    /* 18 */        vehicle player
    ];
    _snow = "#particlesource" createVehicleLocal _pos;  
    _snow setParticleParams _parray;
    _snow setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
    _snow setParticleCircle [0.0, [0, 0, 0]];
    _snow setDropInterval 0.01;

    _oldPlayer = vehicle player;
    while {true} do {
        waituntil {vehicle player != _oldPlayer};
        _parray set [18,vehicle player];
        _snow setParticleParams _parray;
        _oldPlayer = vehicle player;
    };
};


