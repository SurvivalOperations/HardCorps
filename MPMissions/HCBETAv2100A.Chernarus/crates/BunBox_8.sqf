//HardCorps AMMO CRATE filler
//ONLY SPAWNS UPON RESTART
// _refill = [cratename] execVM "ammo.sqf"

_ammo = _this select 0;
while {true} do
{
_ammo setdamage 0;

clearmagazinecargo _ammo;
clearweaponcargo _ammo;

//WEAPONS ONLY
_ammo addweaponcargo ["RH_mk14ebrsp_sd",1];
_ammo addweaponcargo ["ACE_SCAR_H_STD_Spect",1];
_ammo addweaponcargo ["RH_m39emr",1];

//AMMO ONLY
_ammo addmagazinecargo ["RH_20Rnd_762x51_SD_mk14", 3];
_ammo addmagazinecargo ["20Rnd_762x51_DMR", 3];
_ammo addmagazinecargo ["ACE_20Rnd_762x51_S_SCAR", 3];
_ammo addmagazinecargo ["SmokeShell",2];
_ammo addmagazinecargo ["ACE_Flashbang",2];

//ITEMS ONLY
_ammo addweaponcargo ["ItemGPS",1];
_ammo addweaponcargo ["ACE_Kestrel4500", 1];
_ammo addweaponcargo ["ACE_WireCutter", 1];
_ammo addweaponcargo ["ACE_SpottingScope", 1];


//BACKPACKS ONLY
sleep 150000;
};