shader_type canvas_item;
render_mode unshaded;

void fragment() {
	vec3 picture = texture(TEXTURE, UV).rgb;
	vec2 bleed = vec2(TEXTURE_PIXEL_SIZE.x * 2.0, 0.0);
	float red = texture(TEXTURE, UV - bleed).r;
	float blue = texture(TEXTURE, UV + bleed).b;
	picture.rb = mix(picture.rb, vec2(red, blue), 0.35);
	COLOR.rgb = picture;
}
