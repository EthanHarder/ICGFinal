Shader "Final/Scroll Texture With Transparency"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _scaleUVxSpeed ("speed x", Range(0,10)) = 1
        _scaleUVySpeed ("speed y", Range(0,10)) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Transparency" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
               
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _scaleUVxSpeed;
            float _scaleUVySpeed;


            fixed scrollX = 0;
            fixed scrollY = 0;
            v2f vert (appdata v)
            {
                v2f o;

                fixed time = unity_DeltaTime;
                

                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);

                o.uv.x += _scaleUVxSpeed * (_Time.x %1);
                
                o.uv.y += _scaleUVySpeed * (_Time.x %1);
                

                
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                
                fixed4 col = tex2D(_MainTex, i.uv);
                
                return col;
            }
            ENDCG

            ZWrite Off

            Blend SrcAlpha OneMinusSrcAlpha

            ColorMask RGB
        }
    }
}
