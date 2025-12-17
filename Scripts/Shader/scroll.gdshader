shader_type canvas_item;
uniform vec2 scroll = vec2(0.1,0.5);
void fragment() {
	COLOR = texture(TEXTURE,fract(UV + scroll * TIME));
	
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
