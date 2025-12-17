shader_type canvas_item;
uniform float showFrom : hint_range(0.0, 1.0) = 0.20;
uniform float showTo : hint_range(0.0, 1.0) = 0.25;

void fragment() {
	if (UV.x < showFrom){
		discard;
	}
	 if (UV.x > showTo) {
		discard;
	}
	//COLOR = texture(TEXTURE, UV);
}
//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
