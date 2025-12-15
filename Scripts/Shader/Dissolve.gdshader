shader_type canvas_item;
uniform sampler2D gradient;
uniform sampler2D textureDissolve;
uniform sampler2D textureOverlay;
uniform vec2 scroll1;
uniform vec2 scroll2;
uniform float dissovleState : hint_range(0.0, 1.0);
void fragment() {
	if (COLOR.a <= 0.001){
		discard;
	}
	vec4 samp1 = texture(textureDissolve,fract(UV + scroll1 * TIME));
	vec4 samp2 = texture(textureDissolve,fract(UV + scroll2 * TIME));
	float energy = (samp1.r + samp2.r)/2.0;
	energy -= dissovleState;
	vec4 gradSmap = texture(gradient,vec2(energy));
	if (gradSmap.r == gradSmap.b){
		COLOR.a = gradSmap.a;
	} else{
		COLOR = gradSmap;
	}
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
