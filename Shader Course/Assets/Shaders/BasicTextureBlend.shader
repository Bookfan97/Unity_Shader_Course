Shader "Custom/BasicTextureBlend"
{
    Properties
    {
        _MainTex ("Main Texture", 2D) = "white" {}
        _DecalTex ("Decal Texture", 2D) = "white" {}
        [Toggle] _ShowDecal("Show Decal", float) = 0
    }
    SubShader
    {
        Tags { "Queue"="Geometry" }
        
        CGPROGRAM
        #pragma surface surf Lambert

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;
        sampler2D _DecalTex;
        float _ShowDecal;

        struct Input
        {
            float2 uv_MainTex;
        };
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            fixed4 v = tex2D (_DecalTex, IN.uv_MainTex) * _ShowDecal;
            o.Albedo = v.r > 0.9 ? v.rgb: c.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
