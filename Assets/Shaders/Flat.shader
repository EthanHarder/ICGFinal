Shader "Final/Flat"
{

    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)

        _MainTex ("Texture", 2D) = "white" {}
        [MaterialToggle] _UseTexture ("Use Tex", float) = 0
    }
    SubShader
    {

        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_MainTex;
        };

        
        float4 _Color;

        sampler2D _MainTex;
        float _UseTexture;




        void surf (Input IN, inout SurfaceOutput o)
        {
            if (_UseTexture)
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
            else
            o.Albedo = _Color.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
