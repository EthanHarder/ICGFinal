Shader "Final/ToonCoinBob"
{
    Properties
    {
         _Color ("Tint", Color) = (1.0,0.6,0.6,1.0)
        _MainTex ("Texture", 2D) = "white" {}
        _scaleUVxSpeed ("rotate speed x", Range(0,10)) = 1
        _scalebobYSpeed ("speed y", Range(1,10)) = 1
        _bobYAmount ("Amount", Range(0,2)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

 
    
        CGPROGRAM
        
        //#pragma surface surf Lambert
        #pragma surface surf Lambert vertex:vert
        sampler2D _MainTex;
        float _bobYAmount;
         float _scaleUVxSpeed;
         float _scalebobYSpeed;
        float4 _Color;
        struct Input
        {
            float2 uv_MainTex;
        };

        struct appdata
        {
            float4 vertex: POSITION;
            float3 normal: NORMAL;
            float4 texcoord: TEXCOORD0;
        };

        void vert (inout appdata v) {
            v.vertex.y += sin(_Time.y * _scalebobYSpeed) * _bobYAmount;


        }
        void surf (Input IN, inout SurfaceOutput o)
        {
            float2 uvModify = IN.uv_MainTex;
            uvModify.x += _scaleUVxSpeed * (_Time.x %1);
            fixed4 c = tex2D (_MainTex, uvModify) * _Color;
            o.Albedo = c.rgb;

        }
        ENDCG
        
    }
}
