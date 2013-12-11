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
_ammo addweaponcargo ["ACE_AEK_971_1p78",2];
_ammo addweaponcargo ["SCAR_H_CQC_CCO_SD",1];
_ammo addweaponcargo ["ACE_USPSD",2];

//AMMO ONLY
_ammo addmagazinecargo ["30Rnd_545x39_AK", 10];
_ammo addmagazinecargo ["20Rnd_762x51_SB_SCAR", 4];
_ammo addmagazinecargo ["30Rnd_556x45_G36", 3];
_ammo addmagazinecargo ["ACE_12Rnd_45ACP_USPSD", 4];
_ammo addmagazinecargo ["SmokeShell",4];
_ammo addmagazinecargo ["HandGrenade_West",2];

//ITEMS ONLY
_ammo addweaponcargo ["ACE_GlassesBalaklava", 2];
sleep 150000;
};