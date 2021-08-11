if freeRenderer renderer.Free()
if sprite_exists(global.lightingSprite) 
{
	//remove the sprite
	sprite_flush(global.lightingSprite)
	sprite_delete(global.lightingSprite)
}