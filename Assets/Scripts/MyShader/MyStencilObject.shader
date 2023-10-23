Shader "MyShader/MyStencilObject"
{
    Properties
    {
        _Diffuse("Texture", 2D) = "white" {}
        _Bump("Bump Texture", 2D) = "bump" {}
        _BumpAmount("Bump Amount", Range(0, 10)) = 1

        [IntRange]
        _SRef("Stencil Reference", Range(0, 255)) = 1

        [Enum(UnityEngine.Rendering.CompareFunction)]
        _SComp("Stencil Compare", Float) = 8

        [Enum(UnityEngine.Rendering.StencilOp)]
        _SOp("Stencil Operation", Float) = 2
    }
    SubShader
    {
        Tags 
        { 
            "RenderType" = "Opaque"
            "Queue" = "Geometry"

        }
        Stencil
        {
            Ref[_SRef]
            Comp[_SComp]
            Pass[_SOp]
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
