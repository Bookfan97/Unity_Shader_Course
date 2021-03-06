﻿Shader "NoahTestShader/BumpedEnvironement_Challenge"
{
    Properties
    {
        _myBump("Normal Texture", 2D) = "bump" {}
        _myCube("Cube Map", CUBE) = "white"{}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _myBump;
        samplerCUBE _myCube;

        struct Input
        {
            float2 uv_myDiffuse;
            float2 uv_myBump;
            float3 worldRefl; INTERNAL_DATA
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump));
            o.Normal *= 0.3;
            o.Emission = texCUBE(_myCube, WorldReflectionVector (IN, o.Normal)).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
