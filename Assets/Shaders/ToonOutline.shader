Shader "Final/ToonOutlineShader"
{
    Properties
    {
    
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RampTex ("Ramp Texture", 2D) = "white" {}
        _OutlineColor1 ("Outline Color1", Color) = (0,0,0,1)
        _OutlineColor2 ("Outline Color2", Color) = (0,0,0,1)
        _OutlineColor3 ("Outline Color3", Color) = (0,0,0,1)
        _Outline ("Outline Width", Range(0, 0.3)) = 0.005


        
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" }
        ZWrite off
        CGPROGRAM
        #pragma surface surf Lambert vertex:vert

        

        struct Input
        {
            float2 uv_MainTex;
        };
        sampler2D _MainTex;
        
   
        float _Outline;
        float4 _OutlineColor1;
        float4 _OutlineColor2;
        float4 _OutlineColor3;


        void vert (inout appdata_full v) {
            v.vertex.xyz += v.normal * _Outline / 5;
        }




        

        void surf (Input IN, inout SurfaceOutput o)
        {
            if (_Outline == 0.3f)
            o.Emission = _OutlineColor1.rgb;
            else if (_Outline == 0.2f)
            o.Emission = _OutlineColor2.rgb;
            else
            o.Emission = _OutlineColor3.rgb;
        }
        ENDCG

        ZWrite on

        CGPROGRAM
            #pragma surface surf ToonRamp
            struct Input{
                float2 uv_MainTex;
            };

            sampler2D _MainTex;
            sampler2D _RampTex;

            float4 LightingToonRamp (SurfaceOutput s, fixed3 lightDir, fixed atten)
        {
            float diff = dot (s.Normal, lightDir);
            float h = diff * 0.5 + 0.5;
            float2 rh = h;
            float3 ramp = tex2D(_RampTex, rh).rgb;

            float4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * (ramp);
            c.a = s.Alpha;
            return c;
        }

            void surf (Input IN, inout SurfaceOutput o)
            {
                o.Albedo = (tex2D (_MainTex, IN.uv_MainTex)).rgb;
            }
            ENDCG
    }
    FallBack "Diffuse"
}
