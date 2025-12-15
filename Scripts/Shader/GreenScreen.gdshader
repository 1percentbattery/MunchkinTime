shader_type canvas_item;

uniform float chromaKey = 188;
const float soft = 35.0;
void fragment() {
	if (COLOR.g <= chromaKey + soft){
		if (COLOR.g >= chromaKey - soft){
			COLOR = vec4(1,1,1,1);
		}
	}
	
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
