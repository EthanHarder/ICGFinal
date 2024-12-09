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
            // make fog work
            //#pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                //UNITY_FOG_COORDS(1)
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
                //UNITY_INITIALIZE_OUTPUT(v2f,o)
                //fixed2 scroll = fixed2((_scaleUVxSpeed),(_scaleUVySpeed));
                //scrollX = (scrollX + _scaleUVxSpeed * time < 1? scrollX + _scaleUVxSpeed * time : 0);
                //scrollY = (scrollY + _scaleUVySpeed * time < 1? scrollY + _scaleUVySpeed * time : 0);
                
                //fixed2 scroll = fixed2(scrollX,scrollY);

                //fixed2 scrolled = v.uv + scroll;
                //scrolled %= 1;

                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);

                o.uv.x += _scaleUVxSpeed * (_Time.x %1);
                //o.uv.x %= 1;
                o.uv.y += _scaleUVySpeed * (_Time.x %1);
                //o.uv.y %= 1;

                //o.uv.x = sin(o.uv.x * _scaleUVx * _Time);
                //o.uv.y = sin(o.uv.y * _scaleUVy);
 
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 col = tex2D(_MainTex, i.uv);
                // apply fog
                //UNITY_APPLY_FOG(i.fogCoord, col);
                return col;
            }
            ENDCG

            ZWrite Off

            Blend SrcAlpha OneMinusSrcAlpha

            ColorMask RGB
        }
    }
}
