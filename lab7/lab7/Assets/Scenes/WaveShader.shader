﻿Shader "Custom/Waves"{
	Properties{

		_Color("Color", Color) = (0,0,0,1)
		_Strength("Strength", Range(0,2)) = 1.0
		_Speed("Speed", Range(-200,200)) = 100
	}
		Subshader{
		Tags{
			"RenderType" = "transparent"
		}
		Pass{

		Cull Off

		CGPROGRAM

		#pragma vertex vertexFunc
		#pragma fragment fragFunc

		float4 _Color;
		float _Strength;
		float _Speed;

		struct vertexInput {
			float4 vertex : POSITION;
		};

		struct vertexOutput {
			float4 pos : SV_POSITION;
		};

		vertexOutput vertexFunc(vertexInput IN) {
			vertexOutput o;

		float4 worldPos = mul(unity_ObjectToWorld, IN.vertex);

		float4 displacement = (cos(worldPos.z) + cos(worldPos.x + (_Speed * _Time)));
		worldPos.y = worldPos.y + (displacement * _Strength);

		o.pos = mul(UNITY_MATRIX_VP, worldPos);

			return o;
		}

		float4 fragFunc(vertexOutput IN) : COLOR{
			return _Color;
		}


		ENDCG
		}
	}

}