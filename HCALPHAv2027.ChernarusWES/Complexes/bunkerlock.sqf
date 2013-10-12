/* 	
	Bunker Lock script.
	Written by Wesley - SurvivalOperations.net
	Only for HardCorps2.0
*/

_gen = _this select 0
_caller = _this select 1
_id = _this select 2

//If player has the item ACE_PRC119 -
if (player hasWeapon "ACE_PRC119") 

// - the following gets executed -
then
{
	_gen removeAction _id; //removes the "Lock Bunker" action in order to prevent duplicates from popping up.
	hEnterBunker removeAllActions 0;  //Removes the teleport script.
	_lockdoor = hDoorCheck addAction ["Unlock Bunker", "Complexes\bunkerunlock.sqf"]; //adds the "Lock Bunker" action which will be handled in the first SQF.
	hint "Door locked, Access Denied."; // Hint shown when door gets locked by player with a PRC119.
	playSound "outdoor"; //Adds door lock sound.
}
// - else execture this.
else
{
	hint "Access Denied."; // Hint shown when player without PRC119 tries to lock the door.
};
