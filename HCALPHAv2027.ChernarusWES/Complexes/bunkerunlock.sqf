/* 	
	Bunker Unlock script.
	Written by Wesley - SurvivalOperations.net
	Only for HardCorps2.0
	
	There are 2 invisible objects placed in front of the bunker named:
	* hDoorCheck 	// Will check if a player has a PRC119, if true then unlock, if false then keep locked.
	* hEnterBunker  // Will have the teleport action added to it when the bunker gets unlocked.
	
	This script is called upon via the following line in hDoorCheck's Initfield: 
		checkdoor = hDoorCheck addAction ["Unlock Bunker", "Complexes\bunkerdoorcheck.sqf"];
*/

_gen = _this select 0
_caller = _this select 1
_id = _this select 2

//If player has the item ACE_PRC119 -
if (player hasWeapon "ACE_PRC119") 

// - the following gets executed -
then
{
	_gen removeAction _id; //removes the "Unlock Bunker" action in order to prevent duplicates from popping up.
	_openDoor = hEnterBunker addAction ["Enter Bunker", "Complexes\movepos1.sqf"]; //Adds the teleport action to hEnterBunker
	_lockdoor = hDoorCheck addAction ["Lock Bunker", "Complexes\bunkerlock.sqf"]; //adds the "Lock Bunker" action which will be handled in another SQF.
	hint "Door unlocked, Access Granted!"; // Hint shown when door gets unlocked by player with a PRC119.
	playSound "outdoor"; //Adds door unlock sound.
}
// - else execture this.
else
{
	hint "Access Denied."; // Hint shown when player without PRC119 tries to unlock the door.
};
