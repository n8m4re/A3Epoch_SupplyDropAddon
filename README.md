# A3Epoch_SupplyDropAddon

# Install
1. add  "a3_sdrop.bpo"  to  "@epochhive/addons"

2. add "sdropClient.sqf" to "mpmissions/epoch.mapname", if you have there a *.pbo instead of a folder, please google for "how to extract .pbo", pbo is an archive like "zip" you need a tool for that.

3. open the "init.sqf" inside of the "mpmissions/epoch.mapname" folder, if not exist then create an new file with an editor like "notepad++" and name it to "init.sqf"

example for the "init.sqf"
```
// stop server loading the client script
// tutorial: http://killzonekid.com/arma-scripting-tutorials-basic-multiplayer-coding-summary/  
if (isDedicated) exitWith {}; 

// compile the script on mission load
// https://community.bistudio.com/wiki/compileFinal
sdropClient=compileFinal preprocessFileLineNumbers "sdropClient.sqf";

// wait client is ready 
// https://community.bistudio.com/wiki/waitUntil
// https://community.bistudio.com/wiki/isPlayer
// https://community.bistudio.com/wiki/alive
waitUntil{(isPlayer player) && (alive player) && !isNil "EPOCH_loadingScreenDone"};

// Starts running the script
// https://community.bistudio.com/wiki/spawn
[] spawn sdropClient;
```



# Original Author

the original script is created by "tdavison" 

https://github.com/tdavison70/Helicopter-Supply-Drop

http://epochmod.com/forum/index.php?/topic/32485-helicopter-parachute-supply-drop/


# License

All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

http://creativecommons.org/licenses/by-nc-sa/4.0/
