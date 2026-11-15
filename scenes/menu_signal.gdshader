shader_type canvas_item;
render_mode unshaded, blend_disabled;

uniform sampler2D menu_screen : hint_screen_texture, repeat_disable, filter_linear;
uniform bool reduced_motion = false;

void fragment() {
	vec2 uv = SCREEN_UV;
	float seconds = reduced_motion ? 0.0 : TIME;
	float frame = floor(seconds * 12.0);
	vec2 seed = floor(FRAGCOORD.xy * 0.73) + vec2(frame * 13.0, frame * 29.0);
	float noise = fract(52.9829189 * fract(dot(seed, vec2(0.06711056, 0.00583715)))) - 0.5;
	vec3 signal = texture(menu_screen, uv).rgb;
	float luma = dot(signal, vec3(0.299, 0.587, 0.114));
	float lines = 0.027 * sin(uv.y * 720.0 * 2.094395);
	float roll = smoothstep(0.88, 1.0, cos((uv.y - seconds * 0.07) * 6.283185)) * 0.018;
	signal *= 1.0 + lines - roll;
	signal += noise * (0.024 + 0.054 * luma);
	COLOR = vec4(clamp(signal, 0.0, 1.0), 1.0);
}
