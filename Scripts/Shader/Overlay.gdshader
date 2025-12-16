shader_type canvas_item;
uniform sampler2D tex;
uniform vec2 scrollSpeed = vec2(0.1,0);
uniform sampler2D screenText : hint_screen_texture;
void fragment() {
	COLOR = texture(screenText,SCREEN_UV);
	vec4 texCol = texture(tex,fract(UV + (scrollSpeed * TIME)));
	COLOR = texCol/2.0 + COLOR/2.0;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
