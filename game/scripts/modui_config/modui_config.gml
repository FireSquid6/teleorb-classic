//you can change this at runtime!
global.modui_debug=false

//Default grid width and height for grid selection
#macro MODUI_GRID_WIDTH 25
#macro MODUI_GRID_HEIGHT 25

enum MODUI_EVENTS
{
	UPDATE, //every frames
	SELECTED, //when the element is "selected" via mouse hovering or grid selection
	PRESSED, //when the element is "clicked on" via mouse or grid
	PREDRAW, //draw event before the element draws itself
	POSTDRAW, //draw event after the element draws itself
	INIT, //when the element is created
	DESTROY //when the element or canvas is destroyed
}

enum MODUI_ELEMENT_TYPES
{
	BUTTON,
	SLIDER
}