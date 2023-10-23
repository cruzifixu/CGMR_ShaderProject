Shader "MyShader/MyBase"
{
    Properties
    {
        _Diffuse("Texture", 2D) = "white" {}
        _Bump("Bump Texture", 2D) = "bump" {}
        _BumpAmount("Bump Amount", Range(0, 10)) = 1
    }
    SubShader
    {
        Tags 
        { 
            "RenderType" = "Opaque"
        }

        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_Diffuse;
            float2 uv_Bump;
        };

        sampler2D _Diffuse;
        sampler2D _Bump;
        half _BumpAmount;

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_Diffuse, IN.uv_Diffuse).rgb;            
            o.Normal = UnpackNormal(tex2D(_Bump, IN.uv_Bump));
            o.Normal *= float3(_BumpAmount, _BumpAmount, 1);
        }
        ENDCG
    }
        FallBack "Diffuse"
}
