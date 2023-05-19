# GBCAdvancedParallax
----------------
This is a pretty fast engine that allows for multiple layers to be scrolled independently. It cannot be run on the gameboy since it uses DMA
for both the graphics and tilemap.

GUIDE:
----------------
The code switches between 8 frames of animation for the background on the horizontal axis and shifts the graphics up and down for the Y axis.
If you want to create a background then you need to account for this: leave 1 tile above and below any vertically scrolling tile region,
store the tile regions in column order, and make sure not to break limitations in your tilemaps.

BUG
----------------
Yes, there is one small caveat. The 1st row of pixels on the screen is glitched. This is actually caused by the DMA transfers but i'm actually not sure how to fix it.
