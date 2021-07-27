//Default grid width and height for grid selection
#macro MODUI_GRID_WIDTH 25
#macro MODUI_GRID_HEIGHT 25

//DONT EDIT THESE
enum MODUI_DRAW_TYPES
{
	NORMAL,
	GUI
}

enum MODUI_EVENTS
{
	UPDATE, //every frames
	SELECTED, //when the element is "selected" via mouse hovering or grid selection
	PRESSED, //when the element is "clicked on" via mouse or grid
	PREDRAW, //draw event before the element draws itself
	POSTDRAW //draw event after the element draws itself
}

enum MODUI_ELEMENT_TYPES
{
	BUTTON,
	SLIDER
}