SafeObjects = ["Land_Fire_DZ","TentStorage", "Hedgehog_DZ", "Sandbag1_DZ", "TrapBear", "Wire_cat1", "StashSmall", "StashMedium", "Grave", "Concrete_Wall_EP1", "Infostand_2_EP1", "WarfareBDepot", "Base_WarfareBBarrier10xTall", "WarfareBCamp", "Base_WarfareBBarrier10x", "Land_fortified_nest_big", "Land_Fort_Watchtower", "Land_fort_rampart_EP1", "Land_HBarrier_large", "Land_fortified_nest_small", "Land_BagFenceRound", "Land_fort_bagfence_long", "Land_Misc_Cargo2E", "Misc_Cargo1Bo_military", "Ins_WarfareBContructionSite", "Land_pumpa", "Land_CncBlock", "Misc_cargo_cont_small_EP1", "Land_prebehlavka", "Fence_corrugated_plate", "ZavoraAnim", "Land_tent_east", "Land_CamoNetB_EAST", "Land_CamoNetB_NATO", "Land_CamoNetVar_EAST", "Land_CamoNetVar_NATO", "Land_CamoNet_EAST", "Land_CamoNet_NATO", "Fence_Ind_long", "Fort_RazorWire", "Fence_Ind"];
/
/Daimyo Base Building 1.2 Variables
/*
These variables are defined to work globally to ONLY CLIENT scripts and not to the server or other players
They help to communicate to other Client scripts etc.
Example: remProc for example stands for remove process. Meaning if your in the process of removing an object
remProc will == true; This way if you try to begin removing it again, remProc will already be true and exit out
with "Your already trying to remove this";
Not all variables are boolean true or false but hopefully you get the idea
*/

	//Strings
	globalSkin 			= "";
	//Arrays
	allbuildables_class = [];
	allbuildables 		= [];
	allbuild_notowns 	= [];
	allremovables 		= [];
	wallarray 			= [];
	structures			= [];
	CODEINPUT 			= [];
	keyCode 			= [];
	//Booleans
	remProc 			= false;
	hasBuildItem 		= false;
	rem_procPart 		= false;
	repProc 			= false;
	keyValid 			= false;
	procBuild 			= false;
	currentBuildRecipe 	= 0;
	removeObject		= false;
