Originally created by Brightlord here: https://ftlmultiverse.boards.net/thread/109/library-brightness-particles?page=1


This Lua dependency library allows you to render custom animations ("particles") at any point in your Lua script.


Includes create_particle(), destroy_particle(), and a few supplemental positioning functions for common use cases.
Also includes send_to_back() and send_to_front() for ordering your particles within a layer.


The frames for a particle are stored sequentially as individual png's in a folder (located in "img"). Name them "0", "1", "2", etc. Most spritesheet-related software can export frames as sequential png's :)


Particles have editable: lifetimes, positioning, movement, rotation, and spin.
They can also be toggled to "persist" by looping instead of expiring.
You can give a particle "countdown" to delay its creation for any number of seconds.
You can pause/un-pause a particle, as well as tell it to pause on a specific frame.
Particle animations can be looped multiple times with "loops."
Can also be individually hidden with the "visible" attribute.


Co-created with Lizzard with generous assistance from:
arc
Chrono Vortex
julk
Gabriel Cooper
choosechee
pepson
alder
Mr. Doom
The Dumb Dino
