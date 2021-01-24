Shader "NoahTestShader/BumpDiffuse"
{
    Properties
    {
        _myDiffuse ("Diffuse Texture", 2D) = "white" {}
        _myBump ("Normal Texture", 2D) = "bump" {}
        _mySlider("Normal Amount", Range(0,10)) = 1
        _myTexNormalSlider("Texture Normal Amount", Range(0,10)) = 1
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        sampler2D _myDiffuse;
        sampler2D _myBump;
        half _mySlider;
        half _myTexNormalSlider;

        struct Input
        {
            float2 uv_myDiffuse;
            float2 uv_myBump;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse).rgb;
            o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump));
            o.Normal *= float3(_mySlider, _mySlider, 1);
            o.Normal *= float3(_myTexNormalSlider, _myTexNormalSlider, 1);
            o.Albedo *= float3(_myTexNormalSlider, _myTexNormalSlider, 1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
