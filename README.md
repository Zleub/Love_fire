#The Phase Module

A phase module for love framework

##External

`main.lua`

Alongside the globals `load`, `update` and `draw`, the love2d's main handle the `kb_events` registered from a specific `phase` [love.keypressed](http://www.love2d.org/wiki/love.keypressed)

##Phases.lua

`Phases` is the module handler for each `phase` you may have in a _Phases_ folder. Starting from a specific `phase`, it provide phase support for the phase format.

##Phase/*.lua

`id` => a unique id<br>
`name` => a phase's name<br>

`images` => an array of map from 1 to x of each image of the phase<br>
&#160;&#160;&#160;&#160;`image` => `love.graphics.newImage( path )`<br>
&#160;&#160;&#160;&#160;`scale` => an image scale<br>
&#160;&#160;&#160;&#160;`x` => x position<br>
&#160;&#160;&#160;&#160;`y` => y position<br>

`shaders` => a map of each [Shader](https://www.love2d.org/wiki/Shader) of the phase<br>
&#160;&#160;&#160;&#160;`effect_name1 = love.graphics.newImage( path ),`<br>
&#160;&#160;&#160;&#160;`effect_name2 = love.graphics.newImage( path ),`<br>

`texts` => an array of map from 1 to x of each text of the phase<br>
&#160;&#160;&#160;&#160;`string` => `'some string'`<br>
&#160;&#160;&#160;&#160;`x` => x position<br>
&#160;&#160;&#160;&#160;`y` => y position<br>

`kb_events` => a map of the mapped functions (related to External handling)<br>
&#160;&#160;&#160;&#160;`key1 = self.function1,`<br>
&#160;&#160;&#160;&#160;`key2 = self.function2`<br>

`bt_position` => a int related to the index of a current button<br>
`bt_position_max` => a int related to the max index of a current button (also the *shapes_nbr*)<br>

`shapes` => an array of map of the shapes from the [HardonCollider](https://github.com/vrld/HardonCollider)<br>
&#160;&#160;&#160;&#160;`shape` => `rectangle` | _`circle`_ | _`point`_<br>
&#160;&#160;&#160;&#160;`x` => x position<br>
&#160;&#160;&#160;&#160;`y` => y position<br>
&#160;&#160;&#160;&#160;`width` => shape width<br>
&#160;&#160;&#160;&#160;`height` => shape height<br>

`bt_events` => an **indexed** array of the callback for each *bt_position* on the _shapes_<br>
&#160;&#160;&#160;&#160;`self.function1,`<br>
&#160;&#160;&#160;&#160;`self.function2`<br>
