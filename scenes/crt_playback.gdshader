shader_type canvas_item;
render_mode unshaded;

uniform float scene_time = 0.0;
uniform float signal_strength : hint_range(0.0, 1.0) = 0.0;
uniform bool paused = false;
uniform bool reduced_motion = false;

float noise_at(vec2 cell) {
	return fract(52.9829189 * fract(dot(cell, vec2(0.06711056, 0.00583715))));
}

void fragment() {
	float opacity = COLOR.a;
	vec2 p = UV * 2.0 - 1.0;
	vec2 glass = abs(p) - vec2(0.88, 0.84);
	float edge = length(max(glass, vec2(0.0))) + min(max(glass.x, glass.y), 0.0) - 0.12;
	vec2 uv = UV + p * dot(p, p) * 0.027;
	float band_distance = (UV.y - fract(scene_time * 0.13)) * 42.0;
	float band = exp(-band_distance * band_distance);
	float glitch = band * (0.004 + 0.018 * band) * sin(UV.y * 760.0 + scene_time * 29.0);
	float lock = (1.0 - signal_strength) * 0.03;
	if (!reduced_motion) {
		uv.x += glitch * (paused ? 1.7 : 1.0) + lock * sin(UV.y * 180.0 + scene_time * 21.0);
	}
	uv = clamp(uv, vec2(0.002), vec2(0.998));
	vec2 horizontal = vec2(0.004, 0.0);
	vec3 center = texture(TEXTURE, uv).rgb;
	vec3 left = texture(TEXTURE, uv - horizontal).rgb;
	vec3 right = texture(TEXTURE, uv + horizontal).rgb;
	vec3 signal = 0.50 * center + 0.25 * (left + right);
	signal.rb = mix(signal.rb, vec2(left.r, right.b), 0.45);
	float luminance = dot(signal, vec3(0.299, 0.587, 0.114));
	signal = mix(vec3(luminance), signal, 0.42) * vec3(0.97, 1.02, 0.96);
	float scanlines = 0.86 + 0.14 * cos(UV.y * 578.053);
	float noise = noise_at(floor(UV * vec2(456.0, 336.0)) + floor(scene_time * 14.0) * vec2(23.0, 37.0)) - 0.5;
	float vignette = 1.0 - 0.24 * clamp(dot(p, p), 0.0, 1.0);
	vec3 dark_glass = vec3(0.032, 0.038, 0.031) * vignette;
	float tracking = reduced_motion ? 0.0 : band * (0.024 + 0.12 * noise);
	vec3 displayed = (signal * 1.06 * scanlines + noise * 0.17 + tracking) * vignette;
	COLOR = vec4(clamp(mix(dark_glass, displayed, signal_strength), 0.0, 1.0),
		opacity * (1.0 - smoothstep(-0.028, 0.005, edge)));
}
