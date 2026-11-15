shader_type canvas_item;
render_mode unshaded;

uniform float scene_time = 0.0;

void fragment() {
	float frame = floor(scene_time * 10.0);
	vec2 cell = floor(FRAGCOORD.xy * 0.72) + vec2(frame * 13.0, frame * 29.0);
	float grain = fract(52.9829189 * fract(dot(cell, vec2(0.06711056, 0.00583715)))) - 0.5;
	float line = sin(FRAGCOORD.y * 2.094395);
	COLOR.rgb *= 0.96 + 0.12 * grain + 0.025 * line;
}
