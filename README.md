Instructions for setting up, testing, deploying and changing the codebase

Describes dependencies and integrations with other systems

The label defined by Label5.gd always displays the current number of gems collected and the current number of zombies killed - the correctness of both of these numbers depends on proper incrementation of the gem_count and zombie_kills variables in GlobalVars.gd. (These variables are then sent as part of signals gemsignal and zombiesignal to Label5, which then formats the numbers and displays as the game runs.)

The game engine Godot does not explicitly allow for global variables.  As a work-around, GlobalVars.gd must be designated as an autoloaded singleton (which can be done in Godot by clicking Project, Project Settings, then Autoload, and then making sure to enable the script as a singleton) - this allows scripts from all scenes to access it.  Incrementation of variables in GlobalVars.gd depends on the actions of Orb.gd and gem.gd, which increment their respective variables in GlobalVars.gd only when they receive a signal indicating that the player's Area2D has entered the Area2D of their respective sprites (orb and gem).

