#version 300 es

// This is a fragment shader. If you've opened this file first, please
// open and read lambert.vert.glsl before reading on.
// Unlike the vertex shader, the fragment shader actually does compute
// the shading of geometry. For every pixel in your program's output
// screen, the fragment shader is run for every bit of geometry that
// particular pixel overlaps. By implicitly interpolating the position
// data passed into the fragment shader by the vertex shader, the fragment shader
// can compute what color to apply to its pixel based on things like vertex
// position, light position, and vertex color.
precision highp float;

uniform int u_fTime;
uniform vec4 u_Color; // The color with which to render this instance of geometry.

// These are the interpolated values out of the rasterizer, so you can't know
// their specific values without knowing the vertices that contributed to them
in vec4 fs_Nor;
in vec4 fs_LightVec;
in vec4 fs_Col;
in vec4 fs_Pos;
out vec4 out_Col; // This is the final output color that you will see on your
                  // screen for the pixel that is currently being processed.

void main()
{
    // Material base color (before shading)
		float corner = (((fs_Nor.x + fs_Nor.y + fs_Nor.z) / 6.0) + 1.0) / 2.0;
		float corner2 = (((fs_Nor.x - fs_Nor.y + fs_Nor.z) / -4.0) + 1.0) / 2.0;
		float corner3 = (((fs_Nor.x + fs_Nor.y - fs_Nor.z) / -6.0) + 1.0) / 2.0;
		vec4 diffuseColor = vec4(cos(float(u_fTime) / 5.0) * corner + 0.5, 
								cos(float(u_fTime) / 20.0) * corner2 + 0.5, 
								cos(float(u_fTime) / 35.0) * corner3 + 0.5, 1);
      
          // Compute final shaded color
        out_Col = diffuseColor;
}
