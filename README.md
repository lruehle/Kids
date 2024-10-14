# Project how to Godot   
## Intro
Project to get to know the Godot Engine   
edited by me and my nieces - so far we have a basis 2d Jumpn&run Game with multiple levels
Levels and general logic are a work in Progress   

## Doku
### Components
1. Persistent Data
Persistent Data is handled via the Game Manager as [Autoload] (https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html). Scene changes, Highscore, HUD etc. are handled here.
The Signal Manager acts as an Interface between Game Manager and all Game Scenes & emitted Signals. 

2. Base Level
Currently each Level consists of a standart game.tscn and added functionality.
The base scene includes nodes for Hud, Player Character, Tilemap, Killzone (Death by Falling) and Level Transition.
Enemies, Collectibles, Traps, Checkpoints etc are added separately for each Level.

3. Player Character
* movement might be reworked into a bette SM. As of right now Player cann Fall, Jump, Run, Climb and swim. Swimming is restricted to one level and to be updated.


### etc

* Base Enemy State Machine is adopted and in the process of getting improved (if needed)
* Currently three different types of platform-movement are being used: tween, animation and auto move via raycast


