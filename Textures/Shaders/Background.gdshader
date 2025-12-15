shader_type canvas_item;
uniform sampler2D tex1;
uniform vec2 scroll1 = vec2(0.1,0.1);
uniform vec4 add = vec4(0);
void fragment() {
	vec2 sinUV = vec2(sin(UV.x * 2.0),sin(UV.y));
	vec4 pix1 = texture(tex1,fract(sinUV + (scroll1 * TIME)));
	COLOR = COLOR/2.0 + pix1/2.0;
	COLOR += add;
}
