Shader "Final/ScrollingTransparent"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _scaleUVxSpeed ("speed x", Range(0,10)) = 1
        _scaleUVySpeed ("speed y", Range(0,10)) = 1
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" }

        CGPROGRAM
        #pragma surface surf Lambert alpha:fade

       

        sampler2D _MainTex;

        float _scaleUVxSpeed;
        float _scaleUVySpeed;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {

            float2 uvModify = IN.uv_MainTex;
            uvModify.x += _scaleUVxSpeed * (_Time.x %1);
            fixed4 c = tex2D(_MainTex, uvModify.x);
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
