**Instructions for setting up, testing, deploying and changing the codebase**

SETTING UP<br/>
To set up and test (assuming you already have GoDot Engine downloaded):
1. Downloaad 727-master as a zip.
2. Extract folder.
3. Open GoDot and drag the extracted 727-master folder into the projects area.
4. Press Edit to review and begin editing.

The FileSystem, on the right most side of the window has all the files for the game. Files ending in "".gd" are scripts, aka code. Files ending in "".tscn" are the scenes.
The Scene tab shows the nodes that create the scene.
The Inspector tab is initially empty until you click on a Node. This allows you to edit and change specific parts of the Node. 
The Node tab is where signals can be connected and disconnected.

TESTING AND DEPLOYING<br/>
To test the game, there are two ways.
1. Open the folder and open "projectCI.exe". This runs the game.
2. While editing the project, press the play button at the top right corner. 

If you would like to test a certain scene, right click that scene in FileSystem. Click Set as Main Scene. Then press play.
        
CHANGING THE CODEBASE<br/>
At the top of the the engine, there is a section called "Scripts", this is where you edit the codebase. If you would like to open and view a script, double click it in the FileSystem and it will go to that script.
All scripts automatically save when you press the play buttom or exit GoDot. You can also press Ctrl+S to save manually.
Keep in mind that GoDot files are sensitive to where they originate so moving files out of folders or into folders can greatly affect other files!

**Describes dependencies and integrations with other systems**

The label defined by Label5.gd always displays the current number of gems collected and the current number of zombies killed - the correctness of both of these numbers depends on proper incrementation of the gem_count and zombie_kills variables in GlobalVars.gd. (These variables are then sent as part of signals gemsignal and zombiesignal to Label5, which then formats the numbers and displays as the game runs.)

The game engine Godot does not explicitly allow for global variables.  As a work-around, GlobalVars.gd must be designated as an autoloaded singleton (which can be done in Godot by clicking Project, Project Settings, then Autoload, and then making sure to enable the script as a singleton) - this allows scripts from all scenes to access it.  Incrementation of variables in GlobalVars.gd depends on the actions of Orb.gd and gem.gd, which increment their respective variables in GlobalVars.gd only when they receive a signal indicating that the player's Area2D has entered the Area2D of their respective sprites (orb and gem), as well as Pewpew.gd, which is in charge of incrementing the zombie_kills variable in GlobalVars.gd.

The random aspect of item drops in Monster Dash depends on script Upgrades.gd.  In this script, for every timestep in game, a random number is obtained using a randomized random number generator, set to produce integers within a code-determined range.  This random number determines whether an orb or bubble is dropped.
This random number also determines whether it is an orb or a bubble that is instanced in a given timestep.  Whenever an orb or bubble is instanced, it is made the child of the present script's parent, and another random number generator is randomized and set to yield integers within a code-determined range. The integer produced from this random number generator is added to the current x-position; this sum becomes the position at which the item will spawn in the game.  A second random value from this (or another) random number generator will be added to the current y-position to yield the position at which the item will spawn in the game.
