shader_type canvas_item;
render_mode unshaded;

uniform float softness : hint_range(0.0, 2.0) = 1.55;
uniform float grain : hint_range(0.0, 0.2) = 0.075;
uniform float saturation : hint_range(0.0, 1.0) = 0.52;
uniform float color_bleed : hint_range(0.0, 1.0) = 0.38;
uniform float scene_time = 0.0;
uniform float unease : hint_range(0.0, 1.0) = 0.0;
uniform bool driving = false;
uniform float road_time = 0.0;
uniform float road_motion = 0.0;
uniform vec2 inspect_at = vec2(0.5);
uniform float inspect_zoom : hint_range(0.0, 0.2) = 0.0;
uniform float inspect_blur : hint_range(0.0, 1.0) = 0.0;
uniform bool transparent_prop = false;
uniform sampler2D ancestor_sticks : source_color, filter_linear;
uniform bool family_incense = false;
uniform bool family_incense_lit = false;
uniform sampler2D ancestor_portrait : source_color, filter_linear;
uniform bool family_portrait = false;
uniform bool close_altar = false;
uniform sampler2D offering_cup : source_color, filter_linear;
uniform sampler2D offering_tea : source_color, filter_linear;
uniform sampler2D offering_wine : source_color, filter_linear;
uniform sampler2D offering_paper : source_color, filter_linear;
uniform bool kitchen = false;
// x: cups, y: tea, z: wine, w: paper.
uniform vec4 kitchen_items = vec4(0.0);
uniform bool family_cups = false;
uniform bool family_tea = false;
uniform bool family_wine = false;
uniform sampler2D late_vessel : source_color, filter_linear;
uniform int vessel_location = 0;
uniform bool burner_paper = false;
uniform float view_level = 1.0;

vec3 add_vessel(vec3 room, vec2 uv) {
	vec2 origin = vessel_location == 1 ? vec2(0.569, 0.314) : vec2(0.231, 0.662);
	vec2 size = vessel_location == 1 ? vec2(0.132, 0.404) : vec2(0.063, 0.204);
	vec2 local = (uv - origin) / size;
	vec2 base = (local - vec2(0.53, 0.99)) / vec2(0.56, 0.085);
	room *= 1.0 - 0.34 * (1.0 - smoothstep(0.2, 1.0, length(base)));
	if (all(greaterThanEqual(local, vec2(0.0))) && all(lessThanEqual(local, vec2(1.0)))) {
		vec4 vessel = texture(late_vessel, local);
		room = mix(room, vessel.rgb * vec3(0.62, 0.52, 0.42), vessel.a);
	}
	return room;
}

vec3 add_burner_paper(vec3 room, vec2 uv) {
	vec2 local = (uv - vec2(0.191, 0.803)) / vec2(0.068, 0.069);
	if (all(greaterThanEqual(local, vec2(0.0))) && all(lessThanEqual(local, vec2(1.0)))) {
		vec4 paper = texture(offering_paper, local);
		room = mix(room, paper.rgb * vec3(0.57, 0.49, 0.42), paper.a);
	}
	return room;
}

vec3 place_kitchen_prop(vec3 room, vec2 uv, vec2 origin, vec2 size, vec3 light, int item) {
	vec2 local = (uv - origin) / size;
	if (all(greaterThanEqual(local, vec2(0.0))) && all(lessThanEqual(local, vec2(1.0)))) {
		vec4 prop;
		if (item == 1) {
			prop = texture(offering_tea, local);
		} else if (item == 2) {
			prop = texture(offering_wine, local);
		} else {
			prop = texture(offering_paper, local);
		}
		room = mix(room, prop.rgb * light, prop.a);
	}
	return room;
}

vec3 place_cup(vec3 room, vec2 uv, vec2 origin, vec2 size, vec3 light, vec3 drink, bool filled) {
	vec2 local = (uv - origin) / size;
	vec2 base = (local - vec2(0.50, 0.96)) / vec2(0.50, 0.13);
	room *= 1.0 - 0.40 * (1.0 - smoothstep(0.1, 1.0, length(base)));
	if (all(greaterThanEqual(local, vec2(0.0))) && all(lessThanEqual(local, vec2(1.0)))) {
		vec4 cup = texture(offering_cup, local);
		if (filled) {
			vec2 surface = (local - vec2(0.50, 0.167)) / vec2(0.36, 0.085);
			float fill = 1.0 - smoothstep(0.84, 1.0, length(surface));
			float glint = exp(-22.0 * length(surface - vec2(-0.35, -0.40)));
			cup.rgb = mix(cup.rgb, drink + vec3(glint * 0.23), fill * 0.92);
		}
		room = mix(room, cup.rgb * light, cup.a);
	}
	return room;
}

vec3 add_offerings(vec3 room, vec2 uv) {
	vec3 tea = vec3(0.28, 0.13, 0.044);
	vec3 wine = vec3(0.17, 0.079, 0.052);
	if (family_cups && uv.x > 0.29 && uv.x < 0.44 && uv.y > 0.48 && uv.y < 0.54) {
		vec3 hall_light = vec3(0.58, 0.48, 0.40);
		vec2 cup_size = vec2(0.028, 0.030);
		room = place_cup(room, uv, vec2(0.306, 0.497), cup_size, hall_light, tea, family_tea);
		room = place_cup(room, uv, vec2(0.351, 0.497), cup_size, hall_light, wine, family_wine);
		room = place_cup(room, uv, vec2(0.396, 0.497), cup_size, hall_light, tea, family_tea);
	}
	if (kitchen && uv.x < 0.34) {
		vec3 kitchen_light = vec3(0.60, 0.50, 0.41);
		if (kitchen_items.y > 0.5) {
			room = place_kitchen_prop(room, uv, vec2(0.202, 0.466), vec2(0.066, 0.165), kitchen_light, 1);
		}
		if (kitchen_items.z > 0.5) {
			room = place_kitchen_prop(room, uv, vec2(0.272, 0.431), vec2(0.031, 0.180), kitchen_light * 1.25, 2);
		}
		if (kitchen_items.x > 0.5 && uv.y > 0.59 && uv.y < 0.69) {
			vec2 cup_size = vec2(0.027, 0.042);
			room = place_cup(room, uv, vec2(0.123, 0.626), cup_size, kitchen_light, tea, false);
			room = place_cup(room, uv, vec2(0.150, 0.618), cup_size, kitchen_light, tea, false);
			room = place_cup(room, uv, vec2(0.177, 0.611), cup_size, kitchen_light, tea, false);
		}
		if (kitchen_items.w > 0.5) {
			room = place_kitchen_prop(room, uv, vec2(0.255, 0.297), vec2(0.051, 0.058), kitchen_light, 3);
		}
	}
	return room;
}

vec3 add_ancestor_incense(vec3 room, vec2 uv) {
	// Plate coordinates measured at the ash bowl below the family photos.
	vec2 size = close_altar ? vec2(0.035, 0.144) : vec2(0.019, 0.056);
	vec2 ash = close_altar ? vec2(0.468, 0.470) : vec2(0.257, 0.4785);
	vec2 sticks_uv = (uv - ash + size * vec2(0.50, 1.0)) / size;
	if (all(greaterThanEqual(sticks_uv, vec2(0.0))) && all(lessThanEqual(sticks_uv, vec2(1.0)))) {
		vec4 sticks = texture(ancestor_sticks, sticks_uv);
		room = mix(room, sticks.rgb * 0.82, sticks.a);
	}
	// The glow and smoke only reach the area immediately above the burner.
	if (family_incense_lit && abs(uv.x - ash.x) < 0.043 && uv.y > ash.y - size.y - 0.115 && uv.y < ash.y) {
		vec2 tips = (sticks_uv - vec2(0.49, 0.02)) * vec2(1.0, 2.6);
		float glow = exp(-24.0 * dot(tips, tips));
		float heat = 0.88 + 0.12 * sin(scene_time * 2.7);
		room += vec3(0.68, 0.23, 0.063) * glow * heat;
		float smoke_y = (ash.y - size.y + 0.0065 - uv.y) / 0.115;
		float smoke_x = (uv.x - ash.x) + 0.010 * sin(smoke_y * 8.0 + scene_time * 0.8) * smoke_y;
		float smoke = exp(-abs(smoke_x) / (0.002 + 0.005 * max(smoke_y, 0.0)));
		float veil = smoothstep(0.0, 0.15, smoke_y) * (1.0 - smoothstep(0.2, 0.95, smoke_y));
		room += vec3(0.16, 0.146, 0.13) * smoke * veil;
	}
	return room;
}

// Every sampling tap reads the room with its placed props already composited.
vec3 sample_room(vec3 room, vec2 uv) {
	if (family_portrait) {
		// The vacant spot on the rear shelf beside Ah Ma's portrait.
		vec2 pos = close_altar ? vec2(0.765, 0.158) : vec2(0.346, 0.352);
		vec2 size = close_altar ? vec2(0.105, 0.262) : vec2(0.054, 0.116);
		vec2 portrait_uv = (uv - pos) / size;
		if (all(greaterThanEqual(portrait_uv, vec2(0.0))) && all(lessThanEqual(portrait_uv, vec2(1.0)))) {
			vec4 portrait = texture(ancestor_portrait, portrait_uv);
			room = mix(room, portrait.rgb * vec3(0.43, 0.34, 0.27), portrait.a);
		}
	}
	if (family_incense) {
		room = add_ancestor_incense(room, uv);
	}
	if (family_cups || kitchen) {
		room = add_offerings(room, uv);
	}
	if (vessel_location != 0) {
		room = add_vessel(room, uv);
	}
	if (burner_paper) {
		room = add_burner_paper(room, uv);
	}
	return room;
}

float noise_at(vec2 cell) {
	vec3 p = fract(vec3(cell.xyx) * 0.1031);
	p += dot(p, p.yzx + 33.33);
	return fract((p.x + p.y) * p.z);
}

void fragment() {
	float opacity = COLOR.a;
	vec2 signal_size = vec2(640.0, 360.0);
	vec2 pixel = softness / vec2(480.0, 270.0);
	vec2 uv = UV;
	uv = mix(uv, inspect_at, inspect_zoom);
	vec2 centered = uv - vec2(0.5);
	float sway = sin(scene_time * 1.05);
	uv += centered * dot(centered, centered) * 0.042;
	if (driving) {
		uv -= centered * (1.0 - exp(-road_time * 0.3)) * 0.085;
		uv.y += (sin(road_time * 4.5) + 0.4 * sin(road_time * 8.3)) * 0.002 * road_motion;
	}
	uv.x += unease * (0.004 * sway + 0.007 * sin(centered.y * 4.0 + scene_time * 0.73));
	uv.y += unease * centered.x * 0.004 * sway;
	uv = (uv - vec2(0.5)) * 0.97 + vec2(0.5);
	uv = clamp(uv, pixel * 2.0, vec2(1.0) - pixel * 2.0);

	vec2 left_uv = uv - vec2(pixel.x, 0.0);
	vec2 right_uv = uv + vec2(pixel.x, 0.0);
	vec2 vertical_uv = uv + vec2(0.0, pixel.y);
	vec3 center = sample_room(texture(TEXTURE, uv).rgb, uv);
	vec3 left = sample_room(texture(TEXTURE, left_uv).rgb, left_uv);
	vec3 right = sample_room(texture(TEXTURE, right_uv).rgb, right_uv);
	vec3 vertical = sample_room(texture(TEXTURE, vertical_uv).rgb, vertical_uv);
	vec3 picture = center * 0.46 + (left + right) * 0.21 + vertical * 0.12;
	picture.rb = mix(picture.rb, vec2(left.r, right.b), color_bleed);
	if (inspect_blur > 0.0) {
		vec2 spread = vec2(0.016, 0.028) * inspect_blur;
		vec2 x = vec2(spread.x, 0.0);
		vec2 y = vec2(0.0, spread.y);
		vec2 alternate = vec2(spread.x, -spread.y);
		vec3 soft = center * 0.20;
		soft += (sample_room(texture(TEXTURE, uv + x).rgb, uv + x)
			+ sample_room(texture(TEXTURE, uv - x).rgb, uv - x)
			+ sample_room(texture(TEXTURE, uv + y).rgb, uv + y)
			+ sample_room(texture(TEXTURE, uv - y).rgb, uv - y)) * 0.13;
		soft += (sample_room(texture(TEXTURE, uv + spread).rgb, uv + spread)
			+ sample_room(texture(TEXTURE, uv - spread).rgb, uv - spread)
			+ sample_room(texture(TEXTURE, uv + alternate).rgb, uv + alternate)
			+ sample_room(texture(TEXTURE, uv - alternate).rgb, uv - alternate)) * 0.07;
		picture = mix(picture, soft * 0.66, inspect_blur);
	}

	float luminance = dot(picture, vec3(0.299, 0.587, 0.114));
	float red_light = smoothstep(0.16, 0.55, picture.r - max(picture.g, picture.b));
	picture = mix(vec3(luminance), picture, mix(saturation, 0.91, red_light));
	picture = (picture - 0.018) * 1.065;
	float dip_time = (scene_time - 2.8) * 1.7;
	float shadow_x = mix(0.18, 0.80, smoothstep(1.9, 3.7, scene_time));
	float shadow = (1.0 - smoothstep(0.035, 0.19, abs(uv.x - shadow_x))) * exp(-dip_time * dip_time);
	picture *= (1.0 - unease * red_light * shadow * 0.72) * view_level;

	float grain_frame = mod(floor(scene_time * 10.0), 256.0);
	float speckle = noise_at(floor(UV * signal_size) + vec2(37.0, 17.0) * grain_frame) - 0.5;
	float grain_weight = smoothstep(0.02, 0.23, luminance) * (1.0 - smoothstep(0.48, 0.91, luminance));
	COLOR.rgb = clamp(picture + speckle * grain * grain_weight, vec3(0.0), vec3(1.0));
	if (transparent_prop) {
		float alpha = texture(TEXTURE, uv).a;
		COLOR.a = alpha * smoothstep(0.015, 0.075, alpha) * opacity;
	}
}
