-- crt.lua
crtShader = {}

crtShader.crt = love.graphics.newShader([[
        extern number time;
        vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords)
        {
            // Sample the color from the texture
            vec3 sampledColor = Texel(texture, texture_coords).rgb;
            
            // Simple CRT effect using time
            float scanline = 0.9 + 0.1 * sin(pixel_coords.y * 0.5 + time * 10.0); // Lighter scanlines
            sampledColor *= scanline; // Apply scanline effect

            // Optional: Add some noise (simple pseudo-random noise)
            float noise = (sin(pixel_coords.x * 500.0 + time * 20.0) + 
                           sin(pixel_coords.y * 500.0 + time * 20.0)) * 0.02; // Lighter noise
            sampledColor += vec3(noise);

            return vec4(sampledColor, 1.0);
        }
    ]])

return crtShader
