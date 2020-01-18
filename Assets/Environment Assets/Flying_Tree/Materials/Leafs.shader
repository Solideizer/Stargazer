// Compiled shader for Web Player, uncompressed size: 488.3KB

Shader "Nuke Energy Games/Leafs" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _Shininess ("Shininess", Range(0.01,1)) = 0.078125
 _MainTex ("Base (RGB) Alpha (A)", 2D) = "white" {}
 _BumpMap ("Normalmap", 2D) = "bump" {}
 _GlossMap ("Gloss (A)", 2D) = "black" {}
 _TranslucencyMap ("Translucency (A)", 2D) = "white" {}
 _ShadowOffset ("Shadow Offset (A)", 2D) = "black" {}
 _Cutoff ("Alpha cutoff", Range(0,1)) = 0.3
 _Scale ("Scale", Vector) = (1,1,1,1)
 _SquashAmount ("Squash", Float) = 1
}
SubShader { 
 LOD 200
 Cull off
 Tags { "IGNOREPROJECTOR"="true" "RenderType"="TreeLeaf" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "IGNOREPROJECTOR"="true" "RenderType"="TreeLeaf" }
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_Time]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_SHAr]
Vector 21 [unity_SHAg]
Vector 22 [unity_SHAb]
Vector 23 [unity_SHBr]
Vector 24 [unity_SHBg]
Vector 25 [unity_SHBb]
Vector 26 [unity_SHC]
Vector 27 [unity_Scale]
Vector 28 [_Scale]
Vector 29 [_SquashPlaneNormal]
Float 30 [_SquashAmount]
Vector 31 [_Wind]
Vector 32 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[35] = { { 0, 1, 2, -0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..32],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1, -1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
MUL R0, vertex.normal.y, c[6];
MAD R2, vertex.normal.x, c[5], R0;
ADD R0.xyz, R2, c[0].x;
MAD R2, vertex.normal.z, c[7], R2;
ADD R3, R2, c[0].x;
DP4 R3.w, R3, R3;
ABS R0.w, vertex.attrib[14];
ADD R0.w, -R0, c[0].y;
MAD R0.xyz, R0, R0.w, vertex.position;
MOV R1.x, c[0].y;
DP3 R1.x, R1.x, c[12];
ADD R1.x, vertex.color, R1;
ADD R1.z, vertex.color.y, R1.x;
MUL R0.xyz, R0, c[28];
MOV R1.y, R1.x;
DP3 R1.x, R0, R1.z;
ADD R1.xy, R1, c[17].y;
MUL R1, R1.xxyy, c[33];
FRC R1, R1;
MAD R1, R1, c[0].z, c[0].w;
FRC R1, R1;
MAD R1, R1, c[0].z, -c[0].y;
ABS R1, R1;
MUL R2, -R1, c[0].z;
ADD R2, R2, c[34].x;
MUL R1, R1, R1;
MUL R1, R1, R2;
RSQ R3.w, R3.w;
ADD R5.xy, R1.xzzw, R1.ywzw;
MAD R2.xyz, R3.w, R3, -vertex.normal;
MAD R1.xyz, R0.w, R2, vertex.normal;
MUL R2.xyz, R5.y, c[31];
MUL R3.xy, vertex.color.y, R1.xzzw;
MUL R4.xyz, vertex.texcoord[1].y, R2;
MUL R3.xz, R3.xyyw, c[34].z;
MUL R2, vertex.attrib[14].y, c[6];
MUL R3.y, vertex.texcoord[1], c[34];
MAD R3.xyz, R5.xyxw, R3, R4;
MAD R0.xyz, R3, c[31].w, R0;
MAD R3.xyz, vertex.texcoord[1].x, c[31], R0;
DP3 R0.x, R3, c[29];
MAD R2, vertex.attrib[14].x, c[5], R2;
MAD R2, vertex.attrib[14].z, c[7], R2;
ADD R2, R2, c[0].x;
DP4 R0.y, R2, R2;
RSQ R0.y, R0.y;
MUL R2.xyz, R0.y, R2;
ADD R0.x, R0, c[29].w;
MUL R0.xyz, R0.x, c[29];
ADD R4.xyz, -R0, R3;
MOV R2.w, c[34];
ADD R2, -vertex.attrib[14], R2;
MAD R2, R0.w, R2, vertex.attrib[14];
DP3 R1.w, R2, R2;
DP3 R0.w, R1, R1;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R2;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
MAD R0.xyz, R0, c[30].x, R4;
MOV R0.w, c[0].y;
MUL R1.xyz, R2.zxyw, R3.yzxw;
MAD R4.xyz, R2.yzxw, R3.zxyw, -R1;
MOV R1.w, c[0].y;
MOV R1.xyz, c[18];
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
MOV R0.w, c[0].y;
DP4 R5.z, R1, c[15];
DP4 R5.y, R1, c[14];
DP4 R5.x, R1, c[13];
MAD R5.xyz, R5, c[27].w, -R0;
MUL R1.xyz, R2, c[27].w;
MUL R4.xyz, R4, R2.w;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R6.z, R0, c[22];
DP4 R6.y, R0, c[21];
DP4 R6.x, R0, c[20];
MUL R0.w, R2, R2;
MAD R0.w, R0.x, R0.x, -R0;
DP4 R0.z, R1, c[25];
DP4 R0.y, R1, c[24];
DP4 R0.x, R1, c[23];
MUL R1.xyz, R0.w, c[26];
ADD R0.xyz, R6, R0;
ADD result.texcoord[2].xyz, R0, R1;
MOV R0, c[19];
DP4 R1.z, R0, c[15];
DP4 R1.x, R0, c[13];
DP4 R1.y, R0, c[14];
DP3 result.texcoord[3].y, R4, R5;
DP3 result.texcoord[3].z, R2, R5;
DP3 result.texcoord[3].x, R3, R5;
DP3 result.texcoord[1].y, R1, R4;
DP3 result.texcoord[1].z, R2, R1;
DP3 result.texcoord[1].x, R1, R3;
MOV result.color.xyz, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[32], c[32].zwzw;
MOV result.color.w, vertex.color;
END
# 105 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_Time]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_SHAr]
Vector 20 [unity_SHAg]
Vector 21 [unity_SHAb]
Vector 22 [unity_SHBr]
Vector 23 [unity_SHBg]
Vector 24 [unity_SHBb]
Vector 25 [unity_SHC]
Vector 26 [unity_Scale]
Vector 27 [_Scale]
Vector 28 [_SquashPlaneNormal]
Float 29 [_SquashAmount]
Vector 30 [_Wind]
Vector 31 [_MainTex_ST]
"vs_2_0
def c32, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c33, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c34, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c35, 0.10000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0, v2.y, c5
mad r2, v2.x, c4, r0
mov r1.xyz, c11
dp3 r1.x, c32.y, r1
add r1.x, v5, r1
add r0.xyz, r2, c32.x
mad r2, v2.z, c6, r2
add r3, r2, c32.x
dp4 r3.w, r3, r3
abs r0.w, v1
add r0.w, -r0, c32.y
mad r0.xyz, r0, r0.w, v0
add r1.z, v5.y, r1.x
mul r0.xyz, r0, c27
mov r1.y, r1.x
dp3 r1.x, r0, r1.z
add r1.xy, r1, c16.y
mul r1, r1.xxyy, c33
frc r1, r1
mad r1, r1, c32.z, c32.w
frc r1, r1
mad r1, r1, c34.x, c34.y
abs r1, r1
mul r2, r1, r1
mad r1, -r1, c34.x, c34.z
mul r1, r2, r1
rsq r3.w, r3.w
add r5.xy, r1.xzzw, r1.ywzw
mad r2.xyz, r3.w, r3, -v2
mad r1.xyz, r0.w, r2, v2
mul r2.xyz, r5.y, c30
mul r3.xy, v5.y, r1.xzzw
mul r4.xyz, v4.y, r2
mul r3.xz, r3.xyyw, c35.x
mul r2, v1.y, c5
mul r3.y, v4, c34.w
mad r3.xyz, r5.xyxw, r3, r4
mad r0.xyz, r3, c30.w, r0
mad r3.xyz, v4.x, c30, r0
dp3 r0.x, r3, c28
mad r2, v1.x, c4, r2
mad r2, v1.z, c6, r2
add r2, r2, c32.x
dp4 r0.y, r2, r2
rsq r0.y, r0.y
mul r2.xyz, r0.y, r2
add r0.x, r0, c28.w
mul r0.xyz, r0.x, c28
add r4.xyz, -r0, r3
mov r2.w, c34.y
add r2, -v1, r2
mad r2, r0.w, r2, v1
dp3 r1.w, r2, r2
dp3 r0.w, r1, r1
rsq r1.w, r1.w
mul r3.xyz, r1.w, r2
rsq r0.w, r0.w
mul r2.xyz, r0.w, r1
mad r0.xyz, r0, c29.x, r4
mov r0.w, c32.y
mul r1.xyz, r2.zxyw, r3.yzxw
mad r4.xyz, r2.yzxw, r3.zxyw, -r1
mov r1.w, c32.y
mov r1.xyz, c17
dp4 r5.z, r1, c14
dp4 r5.y, r1, c13
dp4 r5.x, r1, c12
mad r1.xyz, r5, c26.w, -r0
mul r4.xyz, r4, r2.w
mul r5.xyz, r2, c26.w
dp3 r2.w, r5, c9
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mov r0.y, r2.w
dp3 r0.x, r5, c8
dp3 r0.z, r5, c10
mov r0.w, c32.y
dp4 r5.z, r0, c21
dp4 r5.y, r0, c20
dp4 r5.x, r0, c19
dp3 oT3.y, r4, r1
dp3 oT3.z, r2, r1
dp3 oT3.x, r3, r1
mul r1, r0.xyzz, r0.yzzx
mul r2.w, r2, r2
dp4 r0.w, r1, c24
dp4 r0.z, r1, c23
dp4 r0.y, r1, c22
add r1.xyz, r5, r0.yzww
mad r0.x, r0, r0, -r2.w
mul r5.xyz, r0.x, c25
add oT2.xyz, r1, r5
mov r0, c14
dp4 r5.z, c18, r0
mov r1, c12
mov r0, c13
dp4 r5.x, c18, r1
dp4 r5.y, c18, r0
dp3 oT1.y, r5, r4
dp3 oT1.z, r2, r5
dp3 oT1.x, r5, r3
mov oD0.xyz, c32.y
mad oT0.xy, v3, c31, c31.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedgfiadbbhokbhoglcponndjhlakmpjeaaabaaaaaalaapaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcpianaaaaeaaaabaahoadaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacaiaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaaapaaaaaibcaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaaaaaaaaaiicaabaaaaaaaaaaa
dkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaa
agafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaa
dcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaa
dcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaa
bkaabaaaaaaaaaaabkbabaaaaeaaaaaabaaaaaaiicaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaa
aeaaaaaaegaobaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaaaaaaaaaegbcbaia
ebaaaaaaacaaaaaadcaaaaajhcaabaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaa
aeaaaaaaegbcbaaaacaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaaagacbaaaaeaaaaaafgafbaaa
aaaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
adaaaaaaegacbaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaaagaabaiaebaaaaaa
abaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaai
hccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaf
iccabaaaacaaaaaadkbabaaaafaaaaaabaaaaaaiicaabaaaabaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaabaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaabaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaabaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahicaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadgaaaaaf
icaabaaaabaaaaaaabeaaaaaaaaaialpaaaaaaaipcaabaaaabaaaaaaegaobaaa
abaaaaaaegbobaiaebaaaaaaabaaaaaadcaaaaajpcaabaaaabaaaaaapgapbaaa
aaaaaaaaegaobaaaabaaaaaaegbobaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
aaaaaaaaegacbaaaaeaaaaaadiaaaaahhcaabaaaadaaaaaajgaebaaaabaaaaaa
cgajbaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaaacaaaaaacgajbaaa
abaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
abaaaaaaegacbaaaadaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaal
hcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaahcccabaaaadaaaaaa
egacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaa
abaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaaacaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaacaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaaihcaabaaaafaaaaaafgafbaaaaeaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaaeaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaaeaaaaaaegaibaaaafaaaaaadcaaaaakhcaabaaaaeaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaaeaaaaaaegadbaaaaeaaaaaadgaaaaaficaabaaa
aeaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaafaaaaaaegiocaaaacaaaaaa
cgaaaaaaegaobaaaaeaaaaaabbaaaaaiccaabaaaafaaaaaaegiocaaaacaaaaaa
chaaaaaaegaobaaaaeaaaaaabbaaaaaiecaabaaaafaaaaaaegiocaaaacaaaaaa
ciaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaaagaaaaaajgacbaaaaeaaaaaa
egakbaaaaeaaaaaabbaaaaaibcaabaaaahaaaaaaegiocaaaacaaaaaacjaaaaaa
egaobaaaagaaaaaabbaaaaaiccaabaaaahaaaaaaegiocaaaacaaaaaackaaaaaa
egaobaaaagaaaaaabbaaaaaiecaabaaaahaaaaaaegiocaaaacaaaaaaclaaaaaa
egaobaaaagaaaaaaaaaaaaahhcaabaaaafaaaaaaegacbaaaafaaaaaaegacbaaa
ahaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaeaaaaaabkaabaaaaeaaaaaa
dcaaaaakicaabaaaaaaaaaaaakaabaaaaeaaaaaaakaabaaaaeaaaaaadkaabaia
ebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaa
pgapbaaaaaaaaaaaegacbaaaafaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaa
dcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaeaaaaaaaaaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaeaaaaaa
pgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaa
afaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaa
adaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedodmcfidbbcdnmacapfoeccmmcboefecgabaaaaaamebhaaaaaeaaaaaa
daaaaaaaeaaiaaaaeabgaaaaaibhaaaaebgpgodjaiaiaaaaaiaiaaaaaaacpopp
fmahaaaakmaaaaaaalaaceaaaaaakiaaaaaakiaaaaaaceaaabaakiaaaaaaadaa
abaaabaaaaaaaaaaaaaaahaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
abaaaeaaabaaaeaaaaaaaaaaacaaaaaaabaaafaaaaaaaaaaacaacgaaahaaagaa
aaaaaaaaadaaaaaaaeaaanaaaaaaaaaaadaaaiaaahaabbaaaaaaaaaaadaabaaa
afaabiaaaaaaaaaaaeaaafaaabaabnaaaaaaaaaaaeaaakaaacaaboaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafcaaaapkamnmmpmdpamaceldpaaaamadomlkbefdo
fbaaaaafcbaaapkaaaaaiadpaaaaialpaaaaaaeaaaaaaalpfbaaaaafccaaapka
aaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafcdaaapkaaaaaaaaaaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaaiaaaaadaaaaaiiaabaaoejabeaaoekaaiaaaaadaaaaabiaabaaoeja
bbaaoekaaiaaaaadaaaaaciaabaaoejabcaaoekaaiaaaaadaaaaaeiaabaaoeja
bdaaoekaajaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappia
afaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaacaaaaaiiacbaaffkacdaaaaac
abaaabiaabaappjaacaaaaadabaaabiaabaaaaibcbaaaakabcaaaaaeacaaapia
abaaaaiaaaaaoeiaabaaoejaceaaaaacaaaaahiaacaaoeiaabaaaaacadaaapia
afaaoekaafaaaaadabaaaoiaadaaffiabjaajakaaeaaaaaeabaaaoiabiaajaka
adaaaaiaabaaoeiaaeaaaaaeabaaaoiabkaajakaadaakkiaabaaoeiaaeaaaaae
abaaaoiablaajakaadaappiaabaaoeiaaiaaaaadacaaaboaaaaaoeiaabaapjia
aiaaaaadadaaaiiaacaaoejabeaaoekaaiaaaaadadaaabiaacaaoejabbaaoeka
aiaaaaadadaaaciaacaaoejabcaaoekaaiaaaaadadaaaeiaacaaoejabdaaoeka
ajaaaaadaaaaaiiaadaaoeiaadaaoeiaahaaaaacaaaaaiiaaaaappiaaeaaaaae
acaaahiaadaaoeiaaaaappiaacaaoejbaeaaaaaeacaaahiaabaaaaiaacaaoeia
acaaoejaceaaaaacadaaahiaacaaoeiaafaaaaadaeaaahiaaaaamjiaadaancia
aeaaaaaeaeaaahiaadaamjiaaaaanciaaeaaoeibafaaaaadaeaaahiaacaappia
aeaaoeiaaiaaaaadacaaacoaaeaaoeiaabaapjiaaiaaaaadacaaaeoaadaaoeia
abaapjiaafaaaaadaaaaaiiaafaaffjaccaakkkaafaaaaadacaaafiaacaaoeia
aaaappiaafaaaaadabaaagiaacaanajabbaanakaacaaaaadafaaabiaabaakkia
abaaffiaafaaaaadabaaagiaacaanajabcaanakaacaaaaadafaaaciaabaakkia
abaaffiaafaaaaadabaaagiaacaanajabdaanakaacaaaaadafaaaeiaabaakkia
abaaffiaaeaaaaaeabaaahiaafaaoeiaabaaaaiaaaaaoejaafaaaaadabaaahia
abaaoeiabnaaoekaabaaaaacafaaabiabfaappkaabaaaaacafaaaciabgaappka
abaaaaacafaaaeiabhaappkaaiaaaaadaaaaaiiaafaaoeiacbaaaakaacaaaaad
afaaaciaaaaappiaafaaaajaacaaaaadaaaaaiiaafaaffiaafaaffjaaiaaaaad
afaaabiaabaaoeiaaaaappiaacaaaaadafaaapiaafaafaiaadaaffkaafaaaaad
afaaapiaafaaoeiacaaaoekabdaaaaacafaaapiaafaaoeiaaeaaaaaeafaaapia
afaaoeiacbaakkkacbaappkabdaaaaacafaaapiaafaaoeiaaeaaaaaeafaaapia
afaaoeiacbaakkkacbaaffkacdaaaaacafaaapiaafaaoeiaafaaaaadagaaapia
afaaoeiaafaaoeiaaeaaaaaeafaaapiaafaaoeiaccaaaakbccaaffkaafaaaaad
afaaapiaafaaoeiaagaaoeiaacaaaaadafaaadiaafaaoniaafaaoiiaafaaaaad
agaaahiaafaaffiaabaaoekaafaaaaadagaaahiaagaaoeiaaeaaffjaafaaaaad
acaaaciaafaaffiaaeaaffjaabaaaaacafaaaeiaccaappkaaeaaaaaeacaaahia
afaamiiaacaaoeiaagaaoeiaaeaaaaaeabaaahiaacaaoeiaabaappkaabaaoeia
aeaaaaaeabaaahiaaeaaaajaabaaoekaabaaoeiaaiaaaaadaaaaaiiaboaaoeka
abaaoeiaacaaaaadaaaaaiiaaaaappiaboaappkaaeaaaaaeacaaahiaaaaappia
boaaoekbabaaoeiabcaaaaaeafaaahiabpaaaakaabaaoeiaacaaoeiaabaaaaac
abaaahiaaeaaoekaafaaaaadacaaahiaabaaffiabjaaoekaaeaaaaaeabaaalia
biaakekaabaaaaiaacaakeiaaeaaaaaeabaaahiabkaaoekaabaakkiaabaapeia
acaaaaadabaaahiaabaaoeiablaaoekaaeaaaaaeabaaahiaabaaoeiabmaappka
afaaoeibaiaaaaadaeaaaboaaaaaoeiaabaaoeiaaiaaaaadaeaaacoaaeaaoeia
abaaoeiaaiaaaaadaeaaaeoaadaaoeiaabaaoeiaafaaaaadaaaaahiaadaaoeia
bmaappkaafaaaaadabaaahiaaaaaffiabgaaoekaaeaaaaaeaaaaaliabfaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabhaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiacbaaaakaajaaaaadabaaabiaagaaoekaaaaaoeiaajaaaaadabaaacia
ahaaoekaaaaaoeiaajaaaaadabaaaeiaaiaaoekaaaaaoeiaafaaaaadacaaapia
aaaacjiaaaaakeiaajaaaaadadaaabiaajaaoekaacaaoeiaajaaaaadadaaacia
akaaoekaacaaoeiaajaaaaadadaaaeiaalaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffiaaeaaaaaeaaaaabia
aaaaaaiaaaaaaaiaaaaaffibaeaaaaaeadaaahoaamaaoekaaaaaaaiaabaaoeia
afaaaaadaaaaapiaafaaffiaaoaaoekaaeaaaaaeaaaaapiaanaaoekaafaaaaia
aaaaoeiaaeaaaaaeaaaaapiaapaaoekaafaakkiaaaaaoeiaacaaaaadaaaaapia
aaaaoeiabaaaoekaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaaeaaaaaeabaaapoaafaappjacdaaeakacdaabfkappppaaaa
fdeieefcpianaaaaeaaaabaahoadaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaa
fpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
lcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacaiaaaaaadgaaaaag
bcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaa
dkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaa
aoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaa
akbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaa
afaaaaaaapaaaaaibcaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaa
aiaaaaaaapaaaaaiccaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaa
ajaaaaaaapaaaaaiecaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaa
akaaaaaaaaaaaaaiicaabaaaaaaaaaaadkbabaiambaaaaaaabaaaaaaabeaaaaa
aaaaiadpdcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egbcbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
aeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaa
aaaaaaaaaaaaaaaipcaabaaaacaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaa
aaaaaaaadiaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaamnmmpmdp
amaceldpaaaamadomlkbefdobkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaa
dcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaaf
pcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialp
aaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaadaaaaaaegaobaiaibaaaaaa
acaaaaaaegaobaiaibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaaegaobaia
mbaaaaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaacaaaaaa
igaabaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaadaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaa
aeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaa
baaaaaaiicaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaalaaaaaa
baaaaaaibcaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaaiaaaaaa
baaaaaaiccaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaajaaaaaa
baaaaaaiecaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaakaaaaaa
bbaaaaahccaabaaaaaaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaeeaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgafbaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaadcaaaaajhcaabaaa
aeaaaaaapgapbaaaaaaaaaaaegacbaaaaeaaaaaaegbcbaaaacaaaaaadiaaaaah
ccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaa
adaaaaaaagacbaaaaeaaaaaafgafbaaaaaaaaaaadgaaaaafecaabaaaaaaaaaaa
abeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaaaaaaaaaadaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
agbabaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaai
bcaabaaaabaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
bcaabaaaabaaaaaaakaabaaaabaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaal
hcaabaaaabaaaaaaagaabaiaebaaaaaaabaaaaaaegiccaaaaeaaaaaaakaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaia
ebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaa
ogikcaaaaaaaaaaaahaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaaafaaaaaa
baaaaaaiicaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaalaaaaaa
baaaaaaibcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaaiaaaaaa
baaaaaaiccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaajaaaaaa
baaaaaaiecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaakaaaaaa
bbaaaaahicaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaialp
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaegbobaiaebaaaaaaabaaaaaa
dcaaaaajpcaabaaaabaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaaegbobaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aeaaaaaaegacbaaaaeaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaaeaaaaaadiaaaaah
hcaabaaaadaaaaaajgaebaaaabaaaaaacgajbaaaacaaaaaadcaaaaakhcaabaaa
adaaaaaajgaebaaaacaaaaaacgajbaaaabaaaaaaegacbaiaebaaaaaaadaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadiaaaaaj
hcaabaaaaeaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaa
aaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaa
aeaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaa
aeaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaa
baaaaaahbccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaah
eccabaaaadaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaa
aeaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
afaaaaaafgafbaaaaeaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aeaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaeaaaaaaegaibaaaafaaaaaa
dcaaaaakhcaabaaaaeaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaeaaaaaa
egadbaaaaeaaaaaadgaaaaaficaabaaaaeaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaafaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaeaaaaaabbaaaaai
ccaabaaaafaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaeaaaaaabbaaaaai
ecaabaaaafaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaeaaaaaadiaaaaah
pcaabaaaagaaaaaajgacbaaaaeaaaaaaegakbaaaaeaaaaaabbaaaaaibcaabaaa
ahaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaagaaaaaabbaaaaaiccaabaaa
ahaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaagaaaaaabbaaaaaiecaabaaa
ahaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaagaaaaaaaaaaaaahhcaabaaa
afaaaaaaegacbaaaafaaaaaaegacbaaaahaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaaeaaaaaabkaabaaaaeaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaa
aeaaaaaaakaabaaaaeaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaafaaaaaa
diaaaaajhcaabaaaaeaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaai
hcaabaaaaeaaaaaaegacbaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaeaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaia
ebaaaaaaaaaaaaaabaaaaaahbccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaaheccabaaaafaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
baaaaaahcccabaaaafaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_Time]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_ProjectionParams]
Vector 20 [_WorldSpaceLightPos0]
Vector 21 [unity_SHAr]
Vector 22 [unity_SHAg]
Vector 23 [unity_SHAb]
Vector 24 [unity_SHBr]
Vector 25 [unity_SHBg]
Vector 26 [unity_SHBb]
Vector 27 [unity_SHC]
Vector 28 [unity_Scale]
Vector 29 [_Scale]
Vector 30 [_SquashPlaneNormal]
Float 31 [_SquashAmount]
Vector 32 [_Wind]
Vector 33 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[37] = { { 0, 1, 2, -0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..33],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1, -1 },
		{ 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
MUL R0, vertex.normal.y, c[6];
MAD R3, vertex.normal.x, c[5], R0;
ADD R0.xyz, R3, c[0].x;
ABS R1.x, vertex.attrib[14].w;
ADD R2.w, -R1.x, c[0].y;
MAD R0.xyz, R0, R2.w, vertex.position;
MAD R3, vertex.normal.z, c[7], R3;
MOV R0.w, c[0].y;
DP3 R0.w, R0.w, c[12];
ADD R0.w, vertex.color.x, R0;
ADD R4, R3, c[0].x;
MUL R0.xyz, R0, c[29];
ADD R1.x, vertex.color.y, R0.w;
MOV R1.y, R0.w;
DP4 R0.w, R4, R4;
DP3 R1.x, R0, R1.x;
RSQ R0.w, R0.w;
MAD R2.xyz, R0.w, R4, -vertex.normal;
MAD R2.xyz, R2.w, R2, vertex.normal;
ADD R1.xy, R1, c[17].y;
MUL R1, R1.xxyy, c[34];
FRC R1, R1;
MAD R1, R1, c[0].z, c[0].w;
FRC R1, R1;
MAD R1, R1, c[0].z, -c[0].y;
ABS R1, R1;
MUL R3, -R1, c[0].z;
MOV R0.w, c[0].y;
ADD R3, R3, c[35].x;
MUL R1, R1, R1;
MUL R1, R1, R3;
ADD R4.xy, R1.xzzw, R1.ywzw;
MUL R1.xyz, R4.y, c[32];
MUL R3.xyz, vertex.texcoord[1].y, R1;
MUL R4.zw, vertex.color.y, R2.xyxz;
MUL R1.xz, R4.zyww, c[35].z;
MUL R1.y, vertex.texcoord[1], c[35];
MAD R1.xyz, R4.xyxw, R1, R3;
MAD R0.xyz, R1, c[32].w, R0;
MAD R1.xyz, vertex.texcoord[1].x, c[32], R0;
DP3 R0.x, R1, c[30];
ADD R0.x, R0, c[30].w;
MUL R0.xyz, R0.x, c[30];
ADD R1.xyz, -R0, R1;
MAD R0.xyz, R0, c[31].x, R1;
MUL R3, vertex.attrib[14].y, c[6];
MAD R3, vertex.attrib[14].x, c[5], R3;
MAD R3, vertex.attrib[14].z, c[7], R3;
ADD R3, R3, c[0].x;
DP4 R1.z, R3, R3;
RSQ R1.z, R1.z;
MUL R3.xyz, R1.z, R3;
MOV R3.w, c[35];
ADD R3, -vertex.attrib[14], R3;
DP4 R1.w, R0, c[4];
DP4 R1.z, R0, c[3];
DP4 R1.y, R0, c[2];
DP4 R1.x, R0, c[1];
MUL R4.xyz, R1.xyww, c[36].x;
MUL R4.y, R4, c[19].x;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R2;
MAD R3, R2.w, R3, vertex.attrib[14];
MOV result.position, R1;
DP3 R1.x, R3, R3;
RSQ R1.x, R1.x;
MOV result.texcoord[4].zw, R1;
MUL R3.xyz, R1.x, R3;
ADD result.texcoord[4].xy, R4, R4.z;
MUL R4.xyz, R2.zxyw, R3.yzxw;
MAD R4.xyz, R2.yzxw, R3.zxyw, -R4;
MOV R1.w, c[0].y;
MOV R1.xyz, c[18];
MOV R0.w, c[0].y;
DP4 R5.z, R1, c[15];
DP4 R5.x, R1, c[13];
DP4 R5.y, R1, c[14];
MAD R5.xyz, R5, c[28].w, -R0;
MUL R1.xyz, R2, c[28].w;
DP3 R2.w, R1, c[10];
MUL R4.xyz, R4, R3.w;
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R6.z, R0, c[23];
DP4 R6.y, R0, c[22];
DP4 R6.x, R0, c[21];
MUL R0.w, R2, R2;
MAD R0.w, R0.x, R0.x, -R0;
DP4 R0.z, R1, c[26];
DP4 R0.y, R1, c[25];
DP4 R0.x, R1, c[24];
MUL R1.xyz, R0.w, c[27];
ADD R0.xyz, R6, R0;
ADD result.texcoord[2].xyz, R0, R1;
MOV R0, c[20];
DP4 R1.z, R0, c[15];
DP4 R1.x, R0, c[13];
DP4 R1.y, R0, c[14];
DP3 result.texcoord[3].y, R4, R5;
DP3 result.texcoord[3].z, R2, R5;
DP3 result.texcoord[3].x, R3, R5;
DP3 result.texcoord[1].y, R1, R4;
DP3 result.texcoord[1].z, R2, R1;
DP3 result.texcoord[1].x, R1, R3;
MOV result.color.xyz, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[33], c[33].zwzw;
MOV result.color.w, vertex.color;
END
# 110 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_Time]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_ProjectionParams]
Vector 19 [_ScreenParams]
Vector 20 [_WorldSpaceLightPos0]
Vector 21 [unity_SHAr]
Vector 22 [unity_SHAg]
Vector 23 [unity_SHAb]
Vector 24 [unity_SHBr]
Vector 25 [unity_SHBg]
Vector 26 [unity_SHBb]
Vector 27 [unity_SHC]
Vector 28 [unity_Scale]
Vector 29 [_Scale]
Vector 30 [_SquashPlaneNormal]
Float 31 [_SquashAmount]
Vector 32 [_Wind]
Vector 33 [_MainTex_ST]
"vs_2_0
def c34, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c35, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c36, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c37, 0.10000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0, v2.y, c5
mad r2, v2.x, c4, r0
add r0.xyz, r2, c34.x
abs r0.w, v1
add r4.w, -r0, c34.y
mov r1.xyz, c11
dp3 r0.w, c34.y, r1
add r0.w, v5.x, r0
mad r2, v2.z, c6, r2
mad r0.xyz, r0, r4.w, v0
add r3, r2, c34.x
mul r0.xyz, r0, c29
add r1.x, v5.y, r0.w
mov r1.y, r0.w
dp3 r1.x, r0, r1.x
dp4 r0.w, r3, r3
add r1.xy, r1, c16.y
mul r1, r1.xxyy, c35
frc r1, r1
mad r1, r1, c34.z, c34.w
frc r1, r1
mad r1, r1, c36.x, c36.y
abs r1, r1
mul r2, r1, r1
mad r1, -r1, c36.x, c36.z
mul r1, r2, r1
add r4.xy, r1.xzzw, r1.ywzw
rsq r0.w, r0.w
mad r2.xyz, r0.w, r3, -v2
mad r3.xyz, r4.w, r2, v2
mul r1.xyz, r4.y, c32
mul r2.xyz, v4.y, r1
mul r5.xy, v5.y, r3.xzzw
mov r0.w, c34.y
mul r1.xz, r5.xyyw, c37.x
mul r1.y, v4, c36.w
mad r1.xyz, r4.xyxw, r1, r2
mad r0.xyz, r1, c32.w, r0
mad r1.xyz, v4.x, c32, r0
dp3 r0.x, r1, c30
add r0.x, r0, c30.w
mul r0.xyz, r0.x, c30
add r1.xyz, -r0, r1
mad r0.xyz, r0, c31.x, r1
mul r1, v1.y, c5
mad r1, v1.x, c4, r1
mad r1, v1.z, c6, r1
add r1, r1, c34.x
dp4 r1.w, r1, r1
rsq r2.z, r1.w
mul r1.xyz, r2.z, r1
mov r1.w, c36.y
add r1, -v1, r1
dp4 r2.w, r0, c3
dp4 r2.z, r0, c2
mad r1, r4.w, r1, v1
dp4 r2.y, r0, c1
dp4 r2.x, r0, c0
mul r4.xyz, r2.xyww, c37.y
mov oPos, r2
mul r4.y, r4, c18.x
dp3 r2.x, r1, r1
dp3 r0.w, r3, r3
rsq r2.x, r2.x
rsq r0.w, r0.w
mul r3.xyz, r0.w, r3
mov oT4.zw, r2
mul r1.xyz, r2.x, r1
mad oT4.xy, r4.z, c19.zwzw, r4
mul r4.xyz, r3.zxyw, r1.yzxw
mad r4.xyz, r3.yzxw, r1.zxyw, -r4
mov r2.w, c34.y
mov r2.xyz, c17
dp4 r5.z, r2, c14
dp4 r5.x, r2, c12
dp4 r5.y, r2, c13
mad r0.xyz, r5, c28.w, -r0
mul r4.xyz, r4, r1.w
mul r2.xyz, r3, c28.w
mov r0.w, c34.y
dp3 oT3.y, r4, r0
dp3 oT3.z, r3, r0
dp3 oT3.x, r1, r0
dp3 r1.w, r2, c9
mov r0.y, r1.w
dp3 r0.x, r2, c8
dp3 r0.z, r2, c10
mul r2, r0.xyzz, r0.yzzx
dp4 r5.z, r0, c23
dp4 r5.y, r0, c22
dp4 r5.x, r0, c21
mul r1.w, r1, r1
dp4 r0.w, r2, c26
dp4 r0.z, r2, c25
dp4 r0.y, r2, c24
add r2.xyz, r5, r0.yzww
mad r0.x, r0, r0, -r1.w
mul r5.xyz, r0.x, c27
add oT2.xyz, r2, r5
mov r0, c14
dp4 r5.z, c20, r0
mov r2, c12
mov r0, c13
dp4 r5.x, c20, r2
dp4 r5.y, c20, r0
dp3 oT1.y, r5, r4
dp3 oT1.z, r3, r5
dp3 oT1.x, r5, r1
mov oD0.xyz, c34.y
mad oT0.xy, v3, c33, c33.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 208
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedganjgmbbnccaakofcjdohlpdlllmjmpbabaaaaaahmbaaaaaadaaaaaa
cmaaaaaapeaaaaaamiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheommaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaamfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklfdeieefckmaoaaaaeaaaabaakladaaaafjaaaaaeegiocaaa
aaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaa
aeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
pccabaaaagaaaaaagiaaaaacajaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaah
ecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaaapaaaaaibcaabaaa
abaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaa
abaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaa
abaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaaaaaaaaaiicaabaaa
aaaaaaaadkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaa
acaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdo
bkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaa
acaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialp
diaaaaajpcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaa
acaaaaaadcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaea
aaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
aaaaaaahdcaabaaaaaaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaa
adaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaabaaaaaaiicaabaaaaeaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaeaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaaeaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaaeaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaa
egaobaaaaeaaaaaaegaobaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaadcaaaaajhcaabaaaaeaaaaaapgapbaaaaaaaaaaa
egacbaaaaeaaaaaaegbcbaaaacaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaa
afaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaaagacbaaaaeaaaaaa
fgafbaaaaaaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaaj
hcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaa
aaaaaaaaahaaaaaaegacbaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegiccaaa
aeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaaa
abaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaaagaabaia
ebaaaaaaabaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaa
egaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaaihccabaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaa
dkbabaaaafaaaaaabaaaaaaiicaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaa
adaaaaaaalaaaaaabaaaaaaibcaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaa
adaaaaaaaiaaaaaabaaaaaaiccaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaa
adaaaaaaajaaaaaabaaaaaaiecaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaa
adaaaaaaakaaaaaabbaaaaahicaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaa
acaaaaaaeeaaaaaficaabaaaacaaaaaadkaabaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaacaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaacaaaaaa
abeaaaaaaaaaialpaaaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaaegbobaia
ebaaaaaaabaaaaaadcaaaaajpcaabaaaacaaaaaapgapbaaaaaaaaaaaegaobaaa
acaaaaaaegbobaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaaegacbaaa
aeaaaaaadiaaaaahhcaabaaaaeaaaaaajgaebaaaacaaaaaacgajbaaaadaaaaaa
dcaaaaakhcaabaaaaeaaaaaajgaebaaaadaaaaaacgajbaaaacaaaaaaegacbaia
ebaaaaaaaeaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaajhcaabaaaafaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaafaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaaegacbaaaafaaaaaadcaaaaalhcaabaaaafaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaafaaaaaa
dcaaaaalhcaabaaaafaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaaegacbaaaafaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaeaaaaaa
egacbaaaafaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaacaaaaaaegacbaaa
afaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaafaaaaaa
diaaaaaihcaabaaaafaaaaaaegacbaaaadaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaagaaaaaafgafbaaaafaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaafaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaafaaaaaa
egaibaaaagaaaaaadcaaaaakhcaabaaaafaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaafaaaaaaegadbaaaafaaaaaadgaaaaaficaabaaaafaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaagaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaa
afaaaaaabbaaaaaiccaabaaaagaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaa
afaaaaaabbaaaaaiecaabaaaagaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaa
afaaaaaadiaaaaahpcaabaaaahaaaaaajgacbaaaafaaaaaaegakbaaaafaaaaaa
bbaaaaaibcaabaaaaiaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaahaaaaaa
bbaaaaaiccaabaaaaiaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaahaaaaaa
bbaaaaaiecaabaaaaiaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaahaaaaaa
aaaaaaahhcaabaaaagaaaaaaegacbaaaagaaaaaaegacbaaaaiaaaaaadiaaaaah
icaabaaaaaaaaaaabkaabaaaafaaaaaabkaabaaaafaaaaaadcaaaaakicaabaaa
aaaaaaaaakaabaaaafaaaaaaakaabaaaafaaaaaadkaabaiaebaaaaaaaaaaaaaa
dcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaa
egacbaaaagaaaaaadiaaaaajhcaabaaaafaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaafaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaafaaaaaadcaaaaalhcaabaaa
afaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
afaaaaaaaaaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaafaaaaaapgipcaaaadaaaaaa
beaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaafaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegacbaaaadaaaaaa
egacbaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaaeaaaaaaegacbaaa
aaaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadp
diaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaaaadgaaaaafmccabaaaagaaaaaakgaobaaaabaaaaaaaaaaaaah
dccabaaaagaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 208
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedjkgkcmjmagkbaajncidjmhfnfpbenccdabaaaaaanmbiaaaaaeaaaaaa
daaaaaaaimaiaaaaeabhaaaaaibiaaaaebgpgodjfeaiaaaafeaiaaaaaaacpopp
kiahaaaakmaaaaaaalaaceaaaaaakiaaaaaakiaaaaaaceaaabaakiaaaaaaahaa
abaaabaaaaaaaaaaaaaaalaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
abaaaeaaacaaaeaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaaacaacgaaahaaahaa
aaaaaaaaadaaaaaaaeaaaoaaaaaaaaaaadaaaiaaahaabcaaaaaaaaaaadaabaaa
afaabjaaaaaaaaaaaeaaafaaabaaboaaaaaaaaaaaeaaakaaacaabpaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafcbaaapkamnmmpmdpamaceldpaaaamadomlkbefdo
fbaaaaafccaaapkaaaaaiadpaaaaialpaaaaaaeaaaaaaalpfbaaaaafcdaaapka
aaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafceaaapkaaaaaaaaaaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaaiaaaaadaaaaaiiaabaaoejabfaaoekaaiaaaaadaaaaabiaabaaoeja
bcaaoekaaiaaaaadaaaaaciaabaaoejabdaaoekaaiaaaaadaaaaaeiaabaaoeja
beaaoekaajaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappia
afaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaacaaaaaiiaccaaffkacdaaaaac
abaaabiaabaappjaacaaaaadabaaabiaabaaaaibccaaaakabcaaaaaeacaaapia
abaaaaiaaaaaoeiaabaaoejaceaaaaacaaaaahiaacaaoeiaabaaaaacadaaapia
agaaoekaafaaaaadabaaaoiaadaaffiabkaajakaaeaaaaaeabaaaoiabjaajaka
adaaaaiaabaaoeiaaeaaaaaeabaaaoiablaajakaadaakkiaabaaoeiaaeaaaaae
abaaaoiabmaajakaadaappiaabaaoeiaaiaaaaadacaaaboaaaaaoeiaabaapjia
aiaaaaadadaaaiiaacaaoejabfaaoekaaiaaaaadadaaabiaacaaoejabcaaoeka
aiaaaaadadaaaciaacaaoejabdaaoekaaiaaaaadadaaaeiaacaaoejabeaaoeka
ajaaaaadaaaaaiiaadaaoeiaadaaoeiaahaaaaacaaaaaiiaaaaappiaaeaaaaae
acaaahiaadaaoeiaaaaappiaacaaoejbaeaaaaaeacaaahiaabaaaaiaacaaoeia
acaaoejaceaaaaacadaaahiaacaaoeiaafaaaaadaeaaahiaaaaamjiaadaancia
aeaaaaaeaeaaahiaadaamjiaaaaanciaaeaaoeibafaaaaadaeaaahiaacaappia
aeaaoeiaaiaaaaadacaaacoaaeaaoeiaabaapjiaaiaaaaadacaaaeoaadaaoeia
abaapjiaafaaaaadaaaaaiiaafaaffjacdaakkkaafaaaaadacaaafiaacaaoeia
aaaappiaafaaaaadabaaagiaacaanajabcaanakaacaaaaadafaaabiaabaakkia
abaaffiaafaaaaadabaaagiaacaanajabdaanakaacaaaaadafaaaciaabaakkia
abaaffiaafaaaaadabaaagiaacaanajabeaanakaacaaaaadafaaaeiaabaakkia
abaaffiaaeaaaaaeabaaahiaafaaoeiaabaaaaiaaaaaoejaafaaaaadabaaahia
abaaoeiaboaaoekaabaaaaacafaaabiabgaappkaabaaaaacafaaaciabhaappka
abaaaaacafaaaeiabiaappkaaiaaaaadaaaaaiiaafaaoeiaccaaaakaacaaaaad
afaaaciaaaaappiaafaaaajaacaaaaadaaaaaiiaafaaffiaafaaffjaaiaaaaad
afaaabiaabaaoeiaaaaappiaacaaaaadafaaapiaafaafaiaadaaffkaafaaaaad
afaaapiaafaaoeiacbaaoekabdaaaaacafaaapiaafaaoeiaaeaaaaaeafaaapia
afaaoeiaccaakkkaccaappkabdaaaaacafaaapiaafaaoeiaaeaaaaaeafaaapia
afaaoeiaccaakkkaccaaffkacdaaaaacafaaapiaafaaoeiaafaaaaadagaaapia
afaaoeiaafaaoeiaaeaaaaaeafaaapiaafaaoeiacdaaaakbcdaaffkaafaaaaad
afaaapiaafaaoeiaagaaoeiaacaaaaadafaaadiaafaaoniaafaaoiiaafaaaaad
agaaahiaafaaffiaabaaoekaafaaaaadagaaahiaagaaoeiaaeaaffjaafaaaaad
acaaaciaafaaffiaaeaaffjaabaaaaacafaaaeiacdaappkaaeaaaaaeacaaahia
afaamiiaacaaoeiaagaaoeiaaeaaaaaeabaaahiaacaaoeiaabaappkaabaaoeia
aeaaaaaeabaaahiaaeaaaajaabaaoekaabaaoeiaaiaaaaadaaaaaiiabpaaoeka
abaaoeiaacaaaaadaaaaaiiaaaaappiabpaappkaaeaaaaaeacaaahiaaaaappia
bpaaoekbabaaoeiabcaaaaaeafaaahiacaaaaakaabaaoeiaacaaoeiaabaaaaac
abaaahiaaeaaoekaafaaaaadacaaahiaabaaffiabkaaoekaaeaaaaaeabaaalia
bjaakekaabaaaaiaacaakeiaaeaaaaaeabaaahiablaaoekaabaakkiaabaapeia
acaaaaadabaaahiaabaaoeiabmaaoekaaeaaaaaeabaaahiaabaaoeiabnaappka
afaaoeibaiaaaaadaeaaaboaaaaaoeiaabaaoeiaaiaaaaadaeaaacoaaeaaoeia
abaaoeiaaiaaaaadaeaaaeoaadaaoeiaabaaoeiaafaaaaadaaaaahiaadaaoeia
bnaappkaafaaaaadabaaahiaaaaaffiabhaaoekaaeaaaaaeaaaaaliabgaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabiaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiaccaaaakaajaaaaadabaaabiaahaaoekaaaaaoeiaajaaaaadabaaacia
aiaaoekaaaaaoeiaajaaaaadabaaaeiaajaaoekaaaaaoeiaafaaaaadacaaapia
aaaacjiaaaaakeiaajaaaaadadaaabiaakaaoekaacaaoeiaajaaaaadadaaacia
alaaoekaacaaoeiaajaaaaadadaaaeiaamaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffiaaeaaaaaeaaaaabia
aaaaaaiaaaaaaaiaaaaaffibaeaaaaaeadaaahoaanaaoekaaaaaaaiaabaaoeia
afaaaaadaaaaapiaafaaffiaapaaoekaaeaaaaaeaaaaapiaaoaaoekaafaaaaia
aaaaoeiaaeaaaaaeaaaaapiabaaaoekaafaakkiaaaaaoeiaacaaaaadaaaaapia
aaaaoeiabbaaoekaafaaaaadabaaabiaaaaaffiaafaaaakaafaaaaadabaaaiia
abaaaaiaccaappkbafaaaaadabaaafiaaaaapeiaccaappkbacaaaaadafaaadoa
abaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacafaaamoaaaaaoeiaaeaaaaaeabaaapoaafaappja
ceaaeakaceaabfkappppaaaafdeieefckmaoaaaaeaaaabaakladaaaafjaaaaae
egiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaae
egiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
gfaaaaadpccabaaaagaaaaaagiaaaaacajaaaaaadgaaaaagbcaabaaaaaaaaaaa
dkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaak
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaa
aaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaaapaaaaai
bcaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaai
ccaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaai
ecaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaaaaaaaaai
icaabaaaaaaaaaaadkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaaafaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaai
pcaabaaaacaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaak
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamado
mlkbefdobkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaa
egaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialp
aaaaialpdiaaaaajpcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaia
ibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaea
aaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaa
adaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaah
ccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaabaaaaaaiicaabaaa
aeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaa
aeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaa
aeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaa
aeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaa
aaaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaa
aaaaaaaaegbcbaiaebaaaaaaacaaaaaadcaaaaajhcaabaaaaeaaaaaapgapbaaa
aaaaaaaaegacbaaaaeaaaaaaegbcbaaaacaaaaaadiaaaaahccaabaaaaaaaaaaa
bkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaaagacbaaa
aeaaaaaafgafbaaaaaaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdo
dcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaa
ahaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaa
egiccaaaaaaaaaaaahaaaaaaegacbaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaa
egiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaa
akaabaaaabaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaa
agaabaiaebaaaaaaabaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaa
abaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaaihccabaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaa
acaaaaaadkbabaaaafaaaaaabaaaaaaiicaabaaaacaaaaaaegbcbaaaabaaaaaa
egiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaacaaaaaaegbcbaaaabaaaaaa
egiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaacaaaaaaegbcbaaaabaaaaaa
egiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaacaaaaaaegbcbaaaabaaaaaa
egiccaaaadaaaaaaakaaaaaabbaaaaahicaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaacaaaaaaeeaaaaaficaabaaaacaaaaaadkaabaaaacaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaacaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaa
acaaaaaaabeaaaaaaaaaialpaaaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaa
egbobaiaebaaaaaaabaaaaaadcaaaaajpcaabaaaacaaaaaapgapbaaaaaaaaaaa
egaobaaaacaaaaaaegbobaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaa
egacbaaaaeaaaaaadiaaaaahhcaabaaaaeaaaaaajgaebaaaacaaaaaacgajbaaa
adaaaaaadcaaaaakhcaabaaaaeaaaaaajgaebaaaadaaaaaacgajbaaaacaaaaaa
egacbaiaebaaaaaaaeaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaacaaaaaa
egacbaaaaeaaaaaadiaaaaajhcaabaaaafaaaaaafgifcaaaacaaaaaaaaaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaafaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaafaaaaaadcaaaaalhcaabaaa
afaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaa
afaaaaaadcaaaaalhcaabaaaafaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaaegacbaaaafaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaa
aeaaaaaaegacbaaaafaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaacaaaaaa
egacbaaaafaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaa
afaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaaadaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaagaaaaaafgafbaaaafaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaafaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
afaaaaaaegaibaaaagaaaaaadcaaaaakhcaabaaaafaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaafaaaaaaegadbaaaafaaaaaadgaaaaaficaabaaaafaaaaaa
abeaaaaaaaaaiadpbbaaaaaibcaabaaaagaaaaaaegiocaaaacaaaaaacgaaaaaa
egaobaaaafaaaaaabbaaaaaiccaabaaaagaaaaaaegiocaaaacaaaaaachaaaaaa
egaobaaaafaaaaaabbaaaaaiecaabaaaagaaaaaaegiocaaaacaaaaaaciaaaaaa
egaobaaaafaaaaaadiaaaaahpcaabaaaahaaaaaajgacbaaaafaaaaaaegakbaaa
afaaaaaabbaaaaaibcaabaaaaiaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaa
ahaaaaaabbaaaaaiccaabaaaaiaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaa
ahaaaaaabbaaaaaiecaabaaaaiaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaa
ahaaaaaaaaaaaaahhcaabaaaagaaaaaaegacbaaaagaaaaaaegacbaaaaiaaaaaa
diaaaaahicaabaaaaaaaaaaabkaabaaaafaaaaaabkaabaaaafaaaaaadcaaaaak
icaabaaaaaaaaaaaakaabaaaafaaaaaaakaabaaaafaaaaaadkaabaiaebaaaaaa
aaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaa
aaaaaaaaegacbaaaagaaaaaadiaaaaajhcaabaaaafaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaafaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaafaaaaaadcaaaaal
hcaabaaaafaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaafaaaaaaaaaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaafaaaaaapgipcaaa
adaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaafaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegacbaaa
adaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaaeaaaaaa
egacbaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaagaaaaaakgaobaaaabaaaaaa
aaaaaaahdccabaaaagaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheommaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaamfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_Time]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_4LightPosX0]
Vector 21 [unity_4LightPosY0]
Vector 22 [unity_4LightPosZ0]
Vector 23 [unity_4LightAtten0]
Vector 24 [unity_LightColor0]
Vector 25 [unity_LightColor1]
Vector 26 [unity_LightColor2]
Vector 27 [unity_LightColor3]
Vector 28 [unity_SHAr]
Vector 29 [unity_SHAg]
Vector 30 [unity_SHAb]
Vector 31 [unity_SHBr]
Vector 32 [unity_SHBg]
Vector 33 [unity_SHBb]
Vector 34 [unity_SHC]
Vector 35 [unity_Scale]
Vector 36 [_Scale]
Vector 37 [_SquashPlaneNormal]
Float 38 [_SquashAmount]
Vector 39 [_Wind]
Vector 40 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[43] = { { 0, 1, 2, -0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..40],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1, -1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEMP R8;
MUL R0, vertex.normal.y, c[6];
MAD R2, vertex.normal.x, c[5], R0;
ADD R0.xyz, R2, c[0].x;
ABS R0.w, vertex.attrib[14];
ADD R6.w, -R0, c[0].y;
MOV R1.x, c[0].y;
DP3 R0.w, R1.x, c[12];
ADD R0.w, vertex.color.x, R0;
MAD R2, vertex.normal.z, c[7], R2;
MAD R0.xyz, R0, R6.w, vertex.position;
ADD R3, R2, c[0].x;
MOV R8.w, c[0].y;
MUL R0.xyz, R0, c[36];
ADD R1.x, vertex.color.y, R0.w;
MOV R1.y, R0.w;
DP4 R0.w, R3, R3;
DP3 R1.x, R0, R1.x;
ADD R1.xy, R1, c[17].y;
MUL R1, R1.xxyy, c[41];
FRC R1, R1;
MAD R1, R1, c[0].z, c[0].w;
FRC R1, R1;
MAD R1, R1, c[0].z, -c[0].y;
ABS R2, R1;
MUL R1, -R2, c[0].z;
MUL R2, R2, R2;
ADD R1, R1, c[42].x;
MUL R1, R2, R1;
RSQ R0.w, R0.w;
MAD R2.xyz, R0.w, R3, -vertex.normal;
MAD R5.xyz, R6.w, R2, vertex.normal;
ADD R3.xy, R1.xzzw, R1.ywzw;
MUL R1.xy, vertex.color.y, R5.xzzw;
MUL R2.xyz, R3.y, c[39];
MUL R1.xz, R1.xyyw, c[42].z;
MOV R2.w, c[0].y;
MUL R2.xyz, vertex.texcoord[1].y, R2;
MUL R1.y, vertex.texcoord[1], c[42];
MAD R1.xyz, R3.xyxw, R1, R2;
MAD R0.xyz, R1, c[39].w, R0;
MAD R0.xyz, vertex.texcoord[1].x, c[39], R0;
DP3 R0.w, R0, c[37];
ADD R0.w, R0, c[37];
MUL R1.xyz, R0.w, c[37];
ADD R0.xyz, -R1, R0;
MAD R2.xyz, R1, c[38].x, R0;
DP4 R0.y, R2, c[10];
DP4 R0.x, R2, c[9];
ADD R3, -R0.y, c[21];
ADD R1, -R0.x, c[20];
MUL R0, R3, R3;
MAD R4, R1, R1, R0;
DP3 R5.w, R5, R5;
RSQ R0.x, R5.w;
MUL R6.xyz, R0.x, R5;
MUL R7.xyz, R6, c[35].w;
DP3 R7.w, R7, c[10];
DP4 R0.y, R2, c[11];
ADD R0, -R0.y, c[22];
MAD R4, R0, R0, R4;
MUL R5, R4, c[23];
DP3 R8.x, R7, c[9];
MUL R3, R7.w, R3;
MAD R1, R8.x, R1, R3;
DP3 R3.w, R7, c[11];
MAD R0, R3.w, R0, R1;
MOV R8.z, R3.w;
MUL R3.w, R7, R7;
MOV R8.y, R7.w;
RSQ R1.x, R4.x;
RSQ R1.y, R4.y;
RSQ R1.z, R4.z;
RSQ R1.w, R4.w;
MUL R0, R0, R1;
ADD R1, R5, c[0].y;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].x;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[25];
MAD R1.xyz, R0.x, c[24], R1;
MAD R0.xyz, R0.z, c[26], R1;
MUL R1, R8.xyzz, R8.yzzx;
MAD R3.xyz, R0.w, c[27], R0;
MUL R0, vertex.attrib[14].y, c[6];
MAD R0, vertex.attrib[14].x, c[5], R0;
MAD R0, vertex.attrib[14].z, c[7], R0;
ADD R0, R0, c[0].x;
DP4 R0.w, R0, R0;
DP4 R5.z, R1, c[33];
DP4 R5.y, R1, c[32];
DP4 R5.x, R1, c[31];
RSQ R1.x, R0.w;
DP4 R4.z, R8, c[30];
DP4 R4.y, R8, c[29];
DP4 R4.x, R8, c[28];
MUL R0.xyz, R1.x, R0;
MOV R0.w, c[42];
ADD R0, -vertex.attrib[14], R0;
MAD R0, R6.w, R0, vertex.attrib[14];
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
MUL R0.xyz, R1.w, R0;
ADD R1.xyz, R4, R5;
MAD R3.w, R8.x, R8.x, -R3;
MUL R4.xyz, R3.w, c[34];
ADD R4.xyz, R1, R4;
ADD result.texcoord[2].xyz, R4, R3;
MUL R1.xyz, R6.zxyw, R0.yzxw;
MAD R3.xyz, R6.yzxw, R0.zxyw, -R1;
MOV R1.xyz, c[18];
MOV R1.w, c[0].y;
MUL R3.xyz, R3, R0.w;
DP4 R4.z, R1, c[15];
DP4 R4.x, R1, c[13];
DP4 R4.y, R1, c[14];
MAD R1.xyz, R4, c[35].w, -R2;
DP3 result.texcoord[3].y, R3, R1;
DP3 result.texcoord[3].z, R6, R1;
DP3 result.texcoord[3].x, R0, R1;
DP4 result.position.w, R2, c[4];
DP4 result.position.z, R2, c[3];
DP4 result.position.y, R2, c[2];
DP4 result.position.x, R2, c[1];
MOV R2, c[19];
DP4 R1.z, R2, c[15];
DP4 R1.x, R2, c[13];
DP4 R1.y, R2, c[14];
DP3 result.texcoord[1].y, R1, R3;
DP3 result.texcoord[1].z, R6, R1;
DP3 result.texcoord[1].x, R1, R0;
MOV result.color.xyz, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[40], c[40].zwzw;
MOV result.color.w, vertex.color;
END
# 136 instructions, 9 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_Time]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_4LightPosX0]
Vector 20 [unity_4LightPosY0]
Vector 21 [unity_4LightPosZ0]
Vector 22 [unity_4LightAtten0]
Vector 23 [unity_LightColor0]
Vector 24 [unity_LightColor1]
Vector 25 [unity_LightColor2]
Vector 26 [unity_LightColor3]
Vector 27 [unity_SHAr]
Vector 28 [unity_SHAg]
Vector 29 [unity_SHAb]
Vector 30 [unity_SHBr]
Vector 31 [unity_SHBg]
Vector 32 [unity_SHBb]
Vector 33 [unity_SHC]
Vector 34 [unity_Scale]
Vector 35 [_Scale]
Vector 36 [_SquashPlaneNormal]
Float 37 [_SquashAmount]
Vector 38 [_Wind]
Vector 39 [_MainTex_ST]
"vs_2_0
def c40, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c41, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c42, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c43, 0.10000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0, v2.y, c5
mad r1, v2.x, c4, r0
add r0.xyz, r1, c40.x
abs r0.w, v1
add r6.w, -r0, c40.y
mov r2.xyz, c11
dp3 r0.w, c40.y, r2
add r0.w, v5.x, r0
mad r1, v2.z, c6, r1
mad r0.xyz, r0, r6.w, v0
add r3, r1, c40.x
mov r8.w, c40.y
mul r0.xyz, r0, c35
add r2.x, v5.y, r0.w
mov r2.y, r0.w
dp4 r0.w, r3, r3
dp3 r2.x, r0, r2.x
add r2.xy, r2, c16.y
mul r2, r2.xxyy, c41
frc r2, r2
mad r2, r2, c40.z, c40.w
frc r2, r2
mad r2, r2, c42.x, c42.y
abs r2, r2
mul r1, r2, r2
mad r2, -r2, c42.x, c42.z
mul r1, r1, r2
rsq r0.w, r0.w
mad r2.xyz, r0.w, r3, -v2
mad r5.xyz, r6.w, r2, v2
add r3.xy, r1.xzzw, r1.ywzw
mul r1.xy, v5.y, r5.xzzw
mul r2.xyz, r3.y, c38
mul r1.xz, r1.xyyw, c43.x
mov r2.w, c40.y
mul r2.xyz, v4.y, r2
mul r1.y, v4, c42.w
mad r1.xyz, r3.xyxw, r1, r2
mad r0.xyz, r1, c38.w, r0
mad r0.xyz, v4.x, c38, r0
dp3 r0.w, r0, c36
add r0.w, r0, c36
mul r1.xyz, r0.w, c36
add r0.xyz, -r1, r0
mad r2.xyz, r1, c37.x, r0
dp4 r0.y, r2, c9
dp4 r0.x, r2, c8
add r3, -r0.y, c20
add r1, -r0.x, c19
mul r0, r3, r3
mad r4, r1, r1, r0
dp3 r5.w, r5, r5
rsq r0.x, r5.w
mul r6.xyz, r0.x, r5
mul r7.xyz, r6, c34.w
dp3 r7.w, r7, c9
dp4 r0.y, r2, c10
add r0, -r0.y, c21
mad r4, r0, r0, r4
mul r5, r4, c22
dp3 r8.x, r7, c8
mul r3, r7.w, r3
mad r1, r8.x, r1, r3
dp3 r3.w, r7, c10
mad r0, r3.w, r0, r1
mov r8.z, r3.w
mul r3.w, r7, r7
mov r8.y, r7.w
rsq r1.x, r4.x
rsq r1.y, r4.y
rsq r1.z, r4.z
rsq r1.w, r4.w
mul r0, r0, r1
add r1, r5, c40.y
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c40.x
mul r0, r0, r1
mul r1.xyz, r0.y, c24
mad r1.xyz, r0.x, c23, r1
mad r0.xyz, r0.z, c25, r1
mul r1, r8.xyzz, r8.yzzx
mad r3.xyz, r0.w, c26, r0
mul r0, v1.y, c5
mad r0, v1.x, c4, r0
mad r0, v1.z, c6, r0
add r0, r0, c40.x
dp4 r0.w, r0, r0
dp4 r5.z, r1, c32
dp4 r5.y, r1, c31
dp4 r5.x, r1, c30
rsq r1.x, r0.w
dp4 r4.z, r8, c29
dp4 r4.y, r8, c28
dp4 r4.x, r8, c27
mul r0.xyz, r1.x, r0
mov r0.w, c42.y
add r0, -v1, r0
mad r0, r6.w, r0, v1
dp3 r1.w, r0, r0
rsq r1.w, r1.w
mul r0.xyz, r1.w, r0
add r1.xyz, r4, r5
mad r3.w, r8.x, r8.x, -r3
mul r4.xyz, r3.w, c33
add r4.xyz, r1, r4
add oT2.xyz, r4, r3
mul r1.xyz, r6.zxyw, r0.yzxw
mad r3.xyz, r6.yzxw, r0.zxyw, -r1
mov r1.xyz, c17
mov r1.w, c40.y
dp4 r4.z, r1, c14
dp4 r4.x, r1, c12
dp4 r4.y, r1, c13
mad r4.xyz, r4, c34.w, -r2
mul r1.xyz, r3, r0.w
dp3 oT3.y, r1, r4
dp3 oT3.z, r6, r4
dp3 oT3.x, r0, r4
mov r3, c12
dp4 r4.x, c18, r3
dp4 oPos.w, r2, c3
dp4 oPos.z, r2, c2
dp4 oPos.y, r2, c1
dp4 oPos.x, r2, c0
mov r2, c14
dp4 r4.z, c18, r2
mov r2, c13
dp4 r4.y, c18, r2
dp3 oT1.y, r4, r1
dp3 oT1.z, r6, r4
dp3 oT1.x, r4, r0
mov oD0.xyz, c40.y
mad oT0.xy, v3, c39, c39.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecednkjbpbbocjachdfbmpdeckccljpohdkgabaaaaaapibcaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefceabbaaaaeaaaabaafaaeaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacalaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaaapaaaaaibcaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaaaaaaaaaiicaabaaaaaaaaaaa
dkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaa
agafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaa
dcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaa
dcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaa
bkaabaaaaaaaaaaabkbabaaaaeaaaaaabaaaaaaiicaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaa
aeaaaaaaegaobaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaaaaaaaaaegbcbaia
ebaaaaaaacaaaaaadcaaaaajhcaabaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaa
aeaaaaaaegbcbaaaacaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaaagacbaaaaeaaaaaafgafbaaa
aaaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
adaaaaaaegacbaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaaagaabaiaebaaaaaa
abaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaai
hccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaf
iccabaaaacaaaaaadkbabaaaafaaaaaabaaaaaaiicaabaaaabaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaabaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaabaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaabaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahicaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadgaaaaaf
icaabaaaabaaaaaaabeaaaaaaaaaialpaaaaaaaipcaabaaaabaaaaaaegaobaaa
abaaaaaaegbobaiaebaaaaaaabaaaaaadcaaaaajpcaabaaaabaaaaaapgapbaaa
aaaaaaaaegaobaaaabaaaaaaegbobaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
aaaaaaaaegacbaaaaeaaaaaadiaaaaahhcaabaaaadaaaaaajgaebaaaabaaaaaa
cgajbaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaaacaaaaaacgajbaaa
abaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
abaaaaaaegacbaaaadaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaal
hcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaahcccabaaaadaaaaaa
egacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaa
abaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaaacaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaaeaaaaaaegiccaaaadaaaaaaamaaaaaa
agaabaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaaeaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaaaaaaaaihcaabaaa
aeaaaaaaegacbaaaaeaaaaaaegiccaaaadaaaaaaapaaaaaaaaaaaaajpcaabaaa
afaaaaaafgafbaiaebaaaaaaaeaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaah
pcaabaaaagaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaaaaaaaajpcaabaaa
ahaaaaaaagaabaiaebaaaaaaaeaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaaj
pcaabaaaaeaaaaaakgakbaiaebaaaaaaaeaaaaaaegiocaaaacaaaaaaaeaaaaaa
dcaaaaajpcaabaaaagaaaaaaegaobaaaahaaaaaaegaobaaaahaaaaaaegaobaaa
agaaaaaadcaaaaajpcaabaaaagaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaa
egaobaaaagaaaaaadcaaaaanpcaabaaaaiaaaaaaegaobaaaagaaaaaaegiocaaa
acaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpeeaaaaaf
pcaabaaaagaaaaaaegaobaaaagaaaaaaaoaaaaakpcaabaaaaiaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaaiaaaaaadiaaaaaihcaabaaa
ajaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
akaaaaaafgafbaaaajaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
ajaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaajaaaaaaegaibaaaakaaaaaa
dcaaaaakhcaabaaaajaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaajaaaaaa
egadbaaaajaaaaaadiaaaaahpcaabaaaafaaaaaaegaobaaaafaaaaaafgafbaaa
ajaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaahaaaaaaagaabaaaajaaaaaa
egaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaaeaaaaaakgakbaaa
ajaaaaaaegaobaaaafaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaaagaaaaaa
egaobaaaaeaaaaaadeaaaaakpcaabaaaaeaaaaaaegaobaaaaeaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaa
aiaaaaaaegaobaaaaeaaaaaadiaaaaaihcaabaaaafaaaaaafgafbaaaaeaaaaaa
egiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaafaaaaaaegiccaaaacaaaaaa
agaaaaaaagaabaaaaeaaaaaaegacbaaaafaaaaaadcaaaaakhcaabaaaaeaaaaaa
egiccaaaacaaaaaaaiaaaaaakgakbaaaaeaaaaaaegacbaaaafaaaaaadcaaaaak
hcaabaaaaeaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaaeaaaaaaegacbaaa
aeaaaaaadgaaaaaficaabaaaajaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
afaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaajaaaaaabbaaaaaiccaabaaa
afaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaajaaaaaabbaaaaaiecaabaaa
afaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaajaaaaaadiaaaaahpcaabaaa
agaaaaaajgacbaaaajaaaaaaegakbaaaajaaaaaabbaaaaaibcaabaaaahaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaagaaaaaabbaaaaaiccaabaaaahaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaagaaaaaabbaaaaaiecaabaaaahaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaagaaaaaaaaaaaaahhcaabaaaafaaaaaa
egacbaaaafaaaaaaegacbaaaahaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaa
ajaaaaaabkaabaaaajaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaajaaaaaa
akaabaaaajaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaafaaaaaa
egiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaafaaaaaaaaaaaaah
hccabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaaaafaaaaaadiaaaaajhcaabaaa
aeaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaaeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaeaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaa
baaaaaahbccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
eccabaaaafaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaa
afaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecednegacidicfgapijjdpgdninoalpghijjabaaaaaaaabnaaaaaeaaaaaa
daaaaaaadeakaaaahmblaaaaeebmaaaaebgpgodjpmajaaaapmajaaaaaaacpopp
faajaaaakmaaaaaaalaaceaaaaaakiaaaaaakiaaaaaaceaaabaakiaaaaaaadaa
abaaabaaaaaaaaaaaaaaahaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
abaaaeaaabaaaeaaaaaaaaaaacaaaaaaabaaafaaaaaaaaaaacaaacaaaiaaagaa
aaaaaaaaacaacgaaahaaaoaaaaaaaaaaadaaaaaaaeaabfaaaaaaaaaaadaaaiaa
anaabjaaaaaaaaaaaeaaafaaabaacgaaaaaaaaaaaeaaakaaacaachaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafcjaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaa
fbaaaaafckaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafclaaapka
aaaaiadpaaaaialpaaaaaaeaaaaaaalpfbaaaaafcmaaapkaaaaaaaeaaaaaeaea
mnmmmmdnjkjjjjdobpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaaiaaaaadaaaaaiiaabaaoejabmaaoekaaiaaaaadaaaaabiaabaaoeja
bjaaoekaaiaaaaadaaaaaciaabaaoejabkaaoekaaiaaaaadaaaaaeiaabaaoeja
blaaoekaajaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappia
afaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaacaaaaaiiaclaaffkacdaaaaac
abaaabiaabaappjaacaaaaadabaaabiaabaaaaibclaaaakabcaaaaaeacaaapia
abaaaaiaaaaaoeiaabaaoejaceaaaaacaaaaahiaacaaoeiaabaaaaacadaaapia
afaaoekaafaaaaadabaaaoiaadaaffiaccaajakaaeaaaaaeabaaaoiacbaajaka
adaaaaiaabaaoeiaaeaaaaaeabaaaoiacdaajakaadaakkiaabaaoeiaaeaaaaae
abaaaoiaceaajakaadaappiaabaaoeiaaiaaaaadacaaaboaaaaaoeiaabaapjia
aiaaaaadadaaaiiaacaaoejabmaaoekaaiaaaaadadaaabiaacaaoejabjaaoeka
aiaaaaadadaaaciaacaaoejabkaaoekaaiaaaaadadaaaeiaacaaoejablaaoeka
ajaaaaadaaaaaiiaadaaoeiaadaaoeiaahaaaaacaaaaaiiaaaaappiaaeaaaaae
acaaahiaadaaoeiaaaaappiaacaaoejbaeaaaaaeacaaahiaabaaaaiaacaaoeia
acaaoejaceaaaaacadaaahiaacaaoeiaafaaaaadaeaaahiaaaaamjiaadaancia
aeaaaaaeaeaaahiaadaamjiaaaaanciaaeaaoeibafaaaaadaeaaahiaacaappia
aeaaoeiaaiaaaaadacaaacoaaeaaoeiaabaapjiaaiaaaaadacaaaeoaadaaoeia
abaapjiaafaaaaadaaaaaiiaafaaffjacmaakkkaafaaaaadacaaafiaacaaoeia
aaaappiaafaaaaadabaaagiaacaanajabjaanakaacaaaaadafaaabiaabaakkia
abaaffiaafaaaaadabaaagiaacaanajabkaanakaacaaaaadafaaaciaabaakkia
abaaffiaafaaaaadabaaagiaacaanajablaanakaacaaaaadafaaaeiaabaakkia
abaaffiaaeaaaaaeabaaahiaafaaoeiaabaaaaiaaaaaoejaafaaaaadabaaahia
abaaoeiacgaaoekaabaaaaacafaaabiabnaappkaabaaaaacafaaaciaboaappka
abaaaaacafaaaeiabpaappkaaiaaaaadaaaaaiiaafaaoeiaclaaaakaacaaaaad
afaaaciaaaaappiaafaaaajaacaaaaadaaaaaiiaafaaffiaafaaffjaaiaaaaad
afaaabiaabaaoeiaaaaappiaacaaaaadafaaapiaafaafaiaadaaffkaafaaaaad
afaaapiaafaaoeiackaaoekabdaaaaacafaaapiaafaaoeiaaeaaaaaeafaaapia
afaaoeiaclaakkkaclaappkabdaaaaacafaaapiaafaaoeiaaeaaaaaeafaaapia
afaaoeiaclaakkkaclaaffkacdaaaaacafaaapiaafaaoeiaafaaaaadagaaapia
afaaoeiaafaaoeiaaeaaaaaeafaaapiaafaaoeiacmaaaakbcmaaffkaafaaaaad
afaaapiaafaaoeiaagaaoeiaacaaaaadafaaadiaafaaoniaafaaoiiaafaaaaad
agaaahiaafaaffiaabaaoekaafaaaaadagaaahiaagaaoeiaaeaaffjaafaaaaad
acaaaciaafaaffiaaeaaffjaabaaaaacafaaaeiacmaappkaaeaaaaaeacaaahia
afaamiiaacaaoeiaagaaoeiaaeaaaaaeabaaahiaacaaoeiaabaappkaabaaoeia
aeaaaaaeabaaahiaaeaaaajaabaaoekaabaaoeiaaiaaaaadaaaaaiiachaaoeka
abaaoeiaacaaaaadaaaaaiiaaaaappiachaappkaaeaaaaaeacaaahiaaaaappia
chaaoekbabaaoeiabcaaaaaeafaaahiaciaaaakaabaaoeiaacaaoeiaabaaaaac
abaaahiaaeaaoekaafaaaaadacaaahiaabaaffiaccaaoekaaeaaaaaeabaaalia
cbaakekaabaaaaiaacaakeiaaeaaaaaeabaaahiacdaaoekaabaakkiaabaapeia
acaaaaadabaaahiaabaaoeiaceaaoekaaeaaaaaeabaaahiaabaaoeiacfaappka
afaaoeibaiaaaaadaeaaaboaaaaaoeiaabaaoeiaaiaaaaadaeaaacoaaeaaoeia
abaaoeiaaiaaaaadaeaaaeoaadaaoeiaabaaoeiaafaaaaadaaaaahiaadaaoeia
cfaappkaafaaaaadabaaahiaaaaaffiaboaaoekaaeaaaaaeaaaaaliabnaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabpaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiaclaaaakaajaaaaadabaaabiaaoaaoekaaaaaoeiaajaaaaadabaaacia
apaaoekaaaaaoeiaajaaaaadabaaaeiabaaaoekaaaaaoeiaafaaaaadacaaapia
aaaacjiaaaaakeiaajaaaaadadaaabiabbaaoekaacaaoeiaajaaaaadadaaacia
bcaaoekaacaaoeiaajaaaaadadaaaeiabdaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiia
aaaaaaiaaaaaaaiaaaaappibaeaaaaaeabaaahiabeaaoekaaaaappiaabaaoeia
afaaaaadacaaahiaafaaffiaboaaoekaaeaaaaaeacaaahiabnaaoekaafaaaaia
acaaoeiaaeaaaaaeacaaahiabpaaoekaafaakkiaacaaoeiaacaaaaadacaaahia
acaaoeiacaaaoekaacaaaaadadaaapiaacaaaaibagaaoekaacaaaaadaeaaapia
acaaffibahaaoekaacaaaaadacaaapiaacaakkibaiaaoekaafaaaaadagaaapia
aaaaffiaaeaaoeiaafaaaaadaeaaapiaaeaaoeiaaeaaoeiaaeaaaaaeaeaaapia
adaaoeiaadaaoeiaaeaaoeiaaeaaaaaeadaaapiaadaaoeiaaaaaaaiaagaaoeia
aeaaaaaeaaaaapiaacaaoeiaaaaakkiaadaaoeiaaeaaaaaeacaaapiaacaaoeia
acaaoeiaaeaaoeiaahaaaaacadaaabiaacaaaaiaahaaaaacadaaaciaacaaffia
ahaaaaacadaaaeiaacaakkiaahaaaaacadaaaiiaacaappiaabaaaaacaeaaabia
claaaakaaeaaaaaeacaaapiaacaaoeiaajaaoekaaeaaaaiaafaaaaadaaaaapia
aaaaoeiaadaaoeiaalaaaaadaaaaapiaaaaaoeiacjaaaakaagaaaaacadaaabia
acaaaaiaagaaaaacadaaaciaacaaffiaagaaaaacadaaaeiaacaakkiaagaaaaac
adaaaiiaacaappiaafaaaaadaaaaapiaaaaaoeiaadaaoeiaafaaaaadacaaahia
aaaaffiaalaaoekaaeaaaaaeacaaahiaakaaoekaaaaaaaiaacaaoeiaaeaaaaae
aaaaahiaamaaoekaaaaakkiaacaaoeiaaeaaaaaeaaaaahiaanaaoekaaaaappia
aaaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapiaafaaffia
bgaaoekaaeaaaaaeaaaaapiabfaaoekaafaaaaiaaaaaoeiaaeaaaaaeaaaaapia
bhaaoekaafaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiabiaaoekaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaaeaaaaae
abaaapoaafaappjacjaaeakacjaabfkappppaaaafdeieefceabbaaaaeaaaabaa
faaeaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacalaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaah
ecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaaapaaaaaibcaabaaa
abaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaa
abaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaa
abaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaaaaaaaaaiicaabaaa
aaaaaaaadkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaa
acaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdo
bkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaa
acaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialp
diaaaaajpcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaa
acaaaaaadcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaea
aaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
aaaaaaahdcaabaaaaaaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaa
adaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaabaaaaaaiicaabaaaaeaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaeaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaaeaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaaeaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaa
egaobaaaaeaaaaaaegaobaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaadcaaaaajhcaabaaaaeaaaaaapgapbaaaaaaaaaaa
egacbaaaaeaaaaaaegbcbaaaacaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaa
afaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaaagacbaaaaeaaaaaa
fgafbaaaaaaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaaj
hcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaa
aaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegiccaaa
aeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaaa
abaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaaagaabaia
ebaaaaaaabaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaa
egaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaa
dgaaaaaihccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
dgaaaaaficcabaaaacaaaaaadkbabaaaafaaaaaabaaaaaaiicaabaaaabaaaaaa
egbcbaaaabaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaabaaaaaa
egbcbaaaabaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaabaaaaaa
egbcbaaaabaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaabaaaaaa
egbcbaaaabaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahicaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
dgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaialpaaaaaaaipcaabaaaabaaaaaa
egaobaaaabaaaaaaegbobaiaebaaaaaaabaaaaaadcaaaaajpcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegaobaaaabaaaaaaegbobaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaaaaaaaaaegacbaaaaeaaaaaadiaaaaahhcaabaaaadaaaaaajgaebaaa
abaaaaaacgajbaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaaacaaaaaa
cgajbaaaabaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaa
pgapbaaaabaaaaaaegacbaaaadaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaa
acaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaa
dcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaahcccabaaa
adaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaaadaaaaaa
egacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaeaaaaaaegiccaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaaeaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaaaaaaaai
hcaabaaaaeaaaaaaegacbaaaaeaaaaaaegiccaaaadaaaaaaapaaaaaaaaaaaaaj
pcaabaaaafaaaaaafgafbaiaebaaaaaaaeaaaaaaegiocaaaacaaaaaaadaaaaaa
diaaaaahpcaabaaaagaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaaaaaaaaj
pcaabaaaahaaaaaaagaabaiaebaaaaaaaeaaaaaaegiocaaaacaaaaaaacaaaaaa
aaaaaaajpcaabaaaaeaaaaaakgakbaiaebaaaaaaaeaaaaaaegiocaaaacaaaaaa
aeaaaaaadcaaaaajpcaabaaaagaaaaaaegaobaaaahaaaaaaegaobaaaahaaaaaa
egaobaaaagaaaaaadcaaaaajpcaabaaaagaaaaaaegaobaaaaeaaaaaaegaobaaa
aeaaaaaaegaobaaaagaaaaaadcaaaaanpcaabaaaaiaaaaaaegaobaaaagaaaaaa
egiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
eeaaaaafpcaabaaaagaaaaaaegaobaaaagaaaaaaaoaaaaakpcaabaaaaiaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaaiaaaaaadiaaaaai
hcaabaaaajaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaai
hcaabaaaakaaaaaafgafbaaaajaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaajaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaajaaaaaaegaibaaa
akaaaaaadcaaaaakhcaabaaaajaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
ajaaaaaaegadbaaaajaaaaaadiaaaaahpcaabaaaafaaaaaaegaobaaaafaaaaaa
fgafbaaaajaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaahaaaaaaagaabaaa
ajaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaaeaaaaaa
kgakbaaaajaaaaaaegaobaaaafaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaa
agaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaaaeaaaaaaegaobaaaaeaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaeaaaaaa
egaobaaaaiaaaaaaegaobaaaaeaaaaaadiaaaaaihcaabaaaafaaaaaafgafbaaa
aeaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaafaaaaaaegiccaaa
acaaaaaaagaaaaaaagaabaaaaeaaaaaaegacbaaaafaaaaaadcaaaaakhcaabaaa
aeaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaaeaaaaaaegacbaaaafaaaaaa
dcaaaaakhcaabaaaaeaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaaeaaaaaa
egacbaaaaeaaaaaadgaaaaaficaabaaaajaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaafaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaajaaaaaabbaaaaai
ccaabaaaafaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaajaaaaaabbaaaaai
ecaabaaaafaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaajaaaaaadiaaaaah
pcaabaaaagaaaaaajgacbaaaajaaaaaaegakbaaaajaaaaaabbaaaaaibcaabaaa
ahaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaagaaaaaabbaaaaaiccaabaaa
ahaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaagaaaaaabbaaaaaiecaabaaa
ahaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaagaaaaaaaaaaaaahhcaabaaa
afaaaaaaegacbaaaafaaaaaaegacbaaaahaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaajaaaaaabkaabaaaajaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaa
ajaaaaaaakaabaaaajaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaa
afaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaafaaaaaa
aaaaaaahhccabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaaaafaaaaaadiaaaaaj
hcaabaaaaeaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaaihcaabaaa
aeaaaaaaegacbaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaeaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaa
aaaaaaaabaaaaaahbccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaaheccabaaaafaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
cccabaaaafaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apahaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_Time]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_ProjectionParams]
Vector 20 [_WorldSpaceLightPos0]
Vector 21 [unity_4LightPosX0]
Vector 22 [unity_4LightPosY0]
Vector 23 [unity_4LightPosZ0]
Vector 24 [unity_4LightAtten0]
Vector 25 [unity_LightColor0]
Vector 26 [unity_LightColor1]
Vector 27 [unity_LightColor2]
Vector 28 [unity_LightColor3]
Vector 29 [unity_SHAr]
Vector 30 [unity_SHAg]
Vector 31 [unity_SHAb]
Vector 32 [unity_SHBr]
Vector 33 [unity_SHBg]
Vector 34 [unity_SHBb]
Vector 35 [unity_SHC]
Vector 36 [unity_Scale]
Vector 37 [_Scale]
Vector 38 [_SquashPlaneNormal]
Float 39 [_SquashAmount]
Vector 40 [_Wind]
Vector 41 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[45] = { { 0, 1, 2, -0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..41],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1, -1 },
		{ 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEMP R8;
MUL R0, vertex.normal.y, c[6];
MAD R2, vertex.normal.x, c[5], R0;
ADD R0.xyz, R2, c[0].x;
ABS R0.w, vertex.attrib[14];
ADD R6.w, -R0, c[0].y;
MOV R1.x, c[0].y;
DP3 R0.w, R1.x, c[12];
MAD R0.xyz, R0, R6.w, vertex.position;
MAD R2, vertex.normal.z, c[7], R2;
ADD R3, R2, c[0].x;
DP4 R1.w, R3, R3;
MUL R1.xyz, R0, c[37];
ADD R0.w, vertex.color.x, R0;
ADD R0.x, vertex.color.y, R0.w;
MOV R8.w, c[0].y;
MOV R0.y, R0.w;
DP3 R0.x, R1, R0.x;
ADD R0.xy, R0, c[17].y;
MUL R0, R0.xxyy, c[42];
FRC R0, R0;
MAD R0, R0, c[0].z, c[0].w;
FRC R0, R0;
MAD R0, R0, c[0].z, -c[0].y;
ABS R2, R0;
MUL R0, -R2, c[0].z;
MUL R2, R2, R2;
ADD R0, R0, c[43].x;
MUL R0, R2, R0;
RSQ R1.w, R1.w;
MOV R2.w, c[0].y;
ADD R4.xy, R0.xzzw, R0.ywzw;
MAD R2.xyz, R1.w, R3, -vertex.normal;
MAD R0.xyz, R6.w, R2, vertex.normal;
MUL R2.xy, vertex.color.y, R0.xzzw;
MUL R3.xyz, R4.y, c[40];
MUL R2.xz, R2.xyyw, c[43].z;
MUL R3.xyz, vertex.texcoord[1].y, R3;
MUL R2.y, vertex.texcoord[1], c[43];
MAD R2.xyz, R4.xyxw, R2, R3;
MAD R1.xyz, R2, c[40].w, R1;
MAD R1.xyz, vertex.texcoord[1].x, c[40], R1;
DP3 R0.w, R1, c[38];
ADD R0.w, R0, c[38];
MUL R2.xyz, R0.w, c[38];
ADD R1.xyz, -R2, R1;
MAD R2.xyz, R2, c[39].x, R1;
DP4 R1.x, R2, c[10];
ADD R3, -R1.x, c[22];
DP4 R0.w, R2, c[9];
ADD R1, -R0.w, c[21];
MUL R4, R3, R3;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R6.xyz, R0.w, R0;
MUL R7.xyz, R6, c[36].w;
DP3 R7.w, R7, c[10];
DP4 R5.x, R2, c[11];
MUL R3, R7.w, R3;
DP3 R8.x, R7, c[9];
MAD R4, R1, R1, R4;
MAD R1, R8.x, R1, R3;
ADD R0, -R5.x, c[23];
MAD R4, R0, R0, R4;
DP3 R3.x, R7, c[11];
MAD R0, R3.x, R0, R1;
MUL R5, R4, c[24];
MOV R8.y, R7.w;
MOV R8.z, R3.x;
RSQ R1.x, R4.x;
RSQ R1.y, R4.y;
RSQ R1.z, R4.z;
RSQ R1.w, R4.w;
MUL R0, R0, R1;
ADD R1, R5, c[0].y;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].x;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[26];
MAD R1.xyz, R0.x, c[25], R1;
MAD R0.xyz, R0.z, c[27], R1;
MAD R1.xyz, R0.w, c[28], R0;
MUL R0, R8.xyzz, R8.yzzx;
MUL R1.w, R7, R7;
DP4 R4.z, R0, c[34];
DP4 R4.y, R0, c[33];
DP4 R4.x, R0, c[32];
MAD R1.w, R8.x, R8.x, -R1;
MUL R0.xyz, R1.w, c[35];
DP4 R1.w, R2, c[4];
DP4 R3.z, R8, c[31];
DP4 R3.y, R8, c[30];
DP4 R3.x, R8, c[29];
ADD R3.xyz, R3, R4;
ADD R3.xyz, R3, R0;
ADD result.texcoord[2].xyz, R3, R1;
MUL R0, vertex.attrib[14].y, c[6];
MAD R0, vertex.attrib[14].x, c[5], R0;
MAD R0, vertex.attrib[14].z, c[7], R0;
ADD R0, R0, c[0].x;
DP4 R0.w, R0, R0;
RSQ R1.z, R0.w;
DP4 R1.y, R2, c[2];
DP4 R1.x, R2, c[1];
MUL R3.xyz, R1.xyww, c[44].x;
MUL R3.y, R3, c[19].x;
MUL R0.xyz, R1.z, R0;
MOV R0.w, c[43];
ADD R0, -vertex.attrib[14], R0;
MAD R0, R6.w, R0, vertex.attrib[14];
DP3 R1.z, R0, R0;
ADD result.texcoord[4].xy, R3, R3.z;
RSQ R3.x, R1.z;
DP4 R1.z, R2, c[3];
MUL R0.xyz, R3.x, R0;
MUL R3.xyz, R6.zxyw, R0.yzxw;
MAD R3.xyz, R6.yzxw, R0.zxyw, -R3;
MOV result.position, R1;
MOV result.texcoord[4].zw, R1;
MOV R1.xyz, c[18];
MOV R1.w, c[0].y;
MUL R3.xyz, R3, R0.w;
DP4 R4.z, R1, c[15];
DP4 R4.x, R1, c[13];
DP4 R4.y, R1, c[14];
MAD R1.xyz, R4, c[36].w, -R2;
DP3 result.texcoord[3].y, R3, R1;
DP3 result.texcoord[3].z, R6, R1;
MOV R2, c[20];
DP3 result.texcoord[3].x, R0, R1;
DP4 R1.z, R2, c[15];
DP4 R1.x, R2, c[13];
DP4 R1.y, R2, c[14];
DP3 result.texcoord[1].y, R1, R3;
DP3 result.texcoord[1].z, R6, R1;
DP3 result.texcoord[1].x, R1, R0;
MOV result.color.xyz, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[41], c[41].zwzw;
MOV result.color.w, vertex.color;
END
# 141 instructions, 9 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_Time]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_ProjectionParams]
Vector 19 [_ScreenParams]
Vector 20 [_WorldSpaceLightPos0]
Vector 21 [unity_4LightPosX0]
Vector 22 [unity_4LightPosY0]
Vector 23 [unity_4LightPosZ0]
Vector 24 [unity_4LightAtten0]
Vector 25 [unity_LightColor0]
Vector 26 [unity_LightColor1]
Vector 27 [unity_LightColor2]
Vector 28 [unity_LightColor3]
Vector 29 [unity_SHAr]
Vector 30 [unity_SHAg]
Vector 31 [unity_SHAb]
Vector 32 [unity_SHBr]
Vector 33 [unity_SHBg]
Vector 34 [unity_SHBb]
Vector 35 [unity_SHC]
Vector 36 [unity_Scale]
Vector 37 [_Scale]
Vector 38 [_SquashPlaneNormal]
Float 39 [_SquashAmount]
Vector 40 [_Wind]
Vector 41 [_MainTex_ST]
"vs_2_0
def c42, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c43, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c44, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c45, 0.10000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
abs r1.w, v1
mul r0, v2.y, c5
mad r0, v2.x, c4, r0
add r1.xyz, r0, c42.x
add r6.w, -r1, c42.y
mov r2.xyz, c11
dp3 r1.w, c42.y, r2
add r1.w, v5.x, r1
mad r0, v2.z, c6, r0
mad r1.xyz, r1, r6.w, v0
add r3, r0, c42.x
mov r8.w, c42.y
mul r1.xyz, r1, c37
add r2.x, v5.y, r1.w
mov r2.y, r1.w
dp4 r1.w, r3, r3
dp3 r2.x, r1, r2.x
add r2.xy, r2, c16.y
mul r2, r2.xxyy, c43
frc r2, r2
mad r2, r2, c42.z, c42.w
frc r2, r2
mad r2, r2, c44.x, c44.y
abs r2, r2
mul r0, r2, r2
mad r2, -r2, c44.x, c44.z
mul r0, r0, r2
rsq r1.w, r1.w
mov r2.w, c42.y
add r4.xy, r0.xzzw, r0.ywzw
mad r2.xyz, r1.w, r3, -v2
mad r0.xyz, r6.w, r2, v2
mul r2.xy, v5.y, r0.xzzw
mul r3.xyz, r4.y, c40
mul r2.xz, r2.xyyw, c45.x
mul r3.xyz, v4.y, r3
mul r2.y, v4, c44.w
mad r2.xyz, r4.xyxw, r2, r3
mad r1.xyz, r2, c40.w, r1
mad r1.xyz, v4.x, c40, r1
dp3 r0.w, r1, c38
add r0.w, r0, c38
mul r2.xyz, r0.w, c38
add r1.xyz, -r2, r1
mad r2.xyz, r2, c39.x, r1
dp4 r1.x, r2, c9
add r3, -r1.x, c22
dp4 r0.w, r2, c8
add r1, -r0.w, c21
mul r4, r3, r3
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r6.xyz, r0.w, r0
mul r7.xyz, r6, c36.w
dp3 r7.w, r7, c9
dp4 r5.x, r2, c10
mul r3, r7.w, r3
dp3 r8.x, r7, c8
mad r4, r1, r1, r4
mad r1, r8.x, r1, r3
add r0, -r5.x, c23
mad r4, r0, r0, r4
dp3 r3.x, r7, c10
mad r0, r3.x, r0, r1
mul r5, r4, c24
mov r8.y, r7.w
mov r8.z, r3.x
rsq r1.x, r4.x
rsq r1.y, r4.y
rsq r1.z, r4.z
rsq r1.w, r4.w
mul r0, r0, r1
add r1, r5, c42.y
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c42.x
mul r0, r0, r1
mul r1.xyz, r0.y, c26
mad r1.xyz, r0.x, c25, r1
mad r0.xyz, r0.z, c27, r1
mad r1.xyz, r0.w, c28, r0
mul r0, r8.xyzz, r8.yzzx
mul r1.w, r7, r7
dp4 r4.z, r0, c34
dp4 r4.y, r0, c33
dp4 r4.x, r0, c32
mad r1.w, r8.x, r8.x, -r1
mul r0.xyz, r1.w, c35
dp4 r1.w, r2, c3
dp4 r3.z, r8, c31
dp4 r3.y, r8, c30
dp4 r3.x, r8, c29
add r3.xyz, r3, r4
add r3.xyz, r3, r0
add oT2.xyz, r3, r1
mul r0, v1.y, c5
mad r0, v1.x, c4, r0
mad r0, v1.z, c6, r0
add r0, r0, c42.x
dp4 r0.w, r0, r0
rsq r1.z, r0.w
dp4 r1.y, r2, c1
dp4 r1.x, r2, c0
mul r3.xyz, r1.xyww, c45.y
mul r3.y, r3, c18.x
mad oT4.xy, r3.z, c19.zwzw, r3
mul r0.xyz, r1.z, r0
mov r0.w, c44.y
add r0, -v1, r0
mad r0, r6.w, r0, v1
dp3 r1.z, r0, r0
rsq r3.x, r1.z
dp4 r1.z, r2, c2
mul r0.xyz, r3.x, r0
mul r3.xyz, r6.zxyw, r0.yzxw
mad r3.xyz, r6.yzxw, r0.zxyw, -r3
mov oPos, r1
mov oT4.zw, r1
mov r1.w, c42.y
mov r1.xyz, c17
dp4 r4.z, r1, c14
dp4 r4.x, r1, c12
dp4 r4.y, r1, c13
mad r1.xyz, r4, c36.w, -r2
mul r3.xyz, r3, r0.w
mov r2, c14
dp4 r4.z, c20, r2
mov r2, c12
dp4 r4.x, c20, r2
dp3 oT3.y, r3, r1
dp3 oT3.z, r6, r1
dp3 oT3.x, r0, r1
mov r1, c13
dp4 r4.y, c20, r1
dp3 oT1.y, r4, r3
dp3 oT1.z, r6, r4
dp3 oT1.x, r4, r0
mov oD0.xyz, c42.y
mad oT0.xy, v3, c41, c41.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 208
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedaefkcfojepeedcpdajnibnmggnlnckfpabaaaaaamebdaaaaadaaaaaa
cmaaaaaapeaaaaaamiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheommaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaamfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklfdeieefcpebbaaaaeaaaabaahnaeaaaafjaaaaaeegiocaaa
aaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaa
aeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
pccabaaaagaaaaaagiaaaaacamaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaah
ecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaaapaaaaaibcaabaaa
abaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaa
abaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaa
abaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaaaaaaaaaiicaabaaa
aaaaaaaadkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaa
acaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdo
bkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaa
acaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialp
diaaaaajpcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaa
acaaaaaadcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaea
aaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
aaaaaaahdcaabaaaaaaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaa
adaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaabaaaaaaiicaabaaaaeaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaeaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaaeaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaaeaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaa
egaobaaaaeaaaaaaegaobaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaadcaaaaajhcaabaaaaeaaaaaapgapbaaaaaaaaaaa
egacbaaaaeaaaaaaegbcbaaaacaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaa
afaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaaagacbaaaaeaaaaaa
fgafbaaaaaaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaaj
hcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaa
aaaaaaaaahaaaaaaegacbaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegiccaaa
aeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaaa
abaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaaagaabaia
ebaaaaaaabaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaa
egaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaaihccabaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaa
dkbabaaaafaaaaaabaaaaaaiicaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaa
adaaaaaaalaaaaaabaaaaaaibcaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaa
adaaaaaaaiaaaaaabaaaaaaiccaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaa
adaaaaaaajaaaaaabaaaaaaiecaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaa
adaaaaaaakaaaaaabbaaaaahicaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaa
acaaaaaaeeaaaaaficaabaaaacaaaaaadkaabaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaacaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaacaaaaaa
abeaaaaaaaaaialpaaaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaaegbobaia
ebaaaaaaabaaaaaadcaaaaajpcaabaaaacaaaaaapgapbaaaaaaaaaaaegaobaaa
acaaaaaaegbobaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaaegacbaaa
aeaaaaaadiaaaaahhcaabaaaaeaaaaaajgaebaaaacaaaaaacgajbaaaadaaaaaa
dcaaaaakhcaabaaaaeaaaaaajgaebaaaadaaaaaacgajbaaaacaaaaaaegacbaia
ebaaaaaaaeaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaajhcaabaaaafaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaafaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaaegacbaaaafaaaaaadcaaaaalhcaabaaaafaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaafaaaaaa
dcaaaaalhcaabaaaafaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaaegacbaaaafaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaeaaaaaa
egacbaaaafaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaacaaaaaaegacbaaa
afaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaafaaaaaa
diaaaaaihcaabaaaafaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaakhcaabaaaafaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egacbaaaafaaaaaadcaaaaakhcaabaaaafaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegacbaaaafaaaaaaaaaaaaaihcaabaaaafaaaaaaegacbaaa
afaaaaaaegiccaaaadaaaaaaapaaaaaaaaaaaaajpcaabaaaagaaaaaafgafbaia
ebaaaaaaafaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaaahaaaaaa
egaobaaaagaaaaaaegaobaaaagaaaaaaaaaaaaajpcaabaaaaiaaaaaaagaabaia
ebaaaaaaafaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaafaaaaaa
kgakbaiaebaaaaaaafaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaa
ahaaaaaaegaobaaaaiaaaaaaegaobaaaaiaaaaaaegaobaaaahaaaaaadcaaaaaj
pcaabaaaahaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaaahaaaaaa
dcaaaaanpcaabaaaajaaaaaaegaobaaaahaaaaaaegiocaaaacaaaaaaafaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpeeaaaaafpcaabaaaahaaaaaa
egaobaaaahaaaaaaaoaaaaakpcaabaaaajaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpegaobaaaajaaaaaadiaaaaaihcaabaaaakaaaaaaegacbaaa
adaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaalaaaaaafgafbaaa
akaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaakaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaakaaaaaaegaibaaaalaaaaaadcaaaaakhcaabaaa
akaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaakaaaaaaegadbaaaakaaaaaa
diaaaaahpcaabaaaagaaaaaaegaobaaaagaaaaaafgafbaaaakaaaaaadcaaaaaj
pcaabaaaagaaaaaaegaobaaaaiaaaaaaagaabaaaakaaaaaaegaobaaaagaaaaaa
dcaaaaajpcaabaaaafaaaaaaegaobaaaafaaaaaakgakbaaaakaaaaaaegaobaaa
agaaaaaadiaaaaahpcaabaaaafaaaaaaegaobaaaahaaaaaaegaobaaaafaaaaaa
deaaaaakpcaabaaaafaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaadiaaaaahpcaabaaaafaaaaaaegaobaaaajaaaaaaegaobaaa
afaaaaaadiaaaaaihcaabaaaagaaaaaafgafbaaaafaaaaaaegiccaaaacaaaaaa
ahaaaaaadcaaaaakhcaabaaaagaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaa
afaaaaaaegacbaaaagaaaaaadcaaaaakhcaabaaaafaaaaaaegiccaaaacaaaaaa
aiaaaaaakgakbaaaafaaaaaaegacbaaaagaaaaaadcaaaaakhcaabaaaafaaaaaa
egiccaaaacaaaaaaajaaaaaapgapbaaaafaaaaaaegacbaaaafaaaaaadgaaaaaf
icaabaaaakaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaagaaaaaaegiocaaa
acaaaaaacgaaaaaaegaobaaaakaaaaaabbaaaaaiccaabaaaagaaaaaaegiocaaa
acaaaaaachaaaaaaegaobaaaakaaaaaabbaaaaaiecaabaaaagaaaaaaegiocaaa
acaaaaaaciaaaaaaegaobaaaakaaaaaadiaaaaahpcaabaaaahaaaaaajgacbaaa
akaaaaaaegakbaaaakaaaaaabbaaaaaibcaabaaaaiaaaaaaegiocaaaacaaaaaa
cjaaaaaaegaobaaaahaaaaaabbaaaaaiccaabaaaaiaaaaaaegiocaaaacaaaaaa
ckaaaaaaegaobaaaahaaaaaabbaaaaaiecaabaaaaiaaaaaaegiocaaaacaaaaaa
claaaaaaegaobaaaahaaaaaaaaaaaaahhcaabaaaagaaaaaaegacbaaaagaaaaaa
egacbaaaaiaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaakaaaaaabkaabaaa
akaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaakaaaaaaakaabaaaakaaaaaa
dkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaagaaaaaaegiccaaaacaaaaaa
cmaaaaaapgapbaaaaaaaaaaaegacbaaaagaaaaaaaaaaaaahhccabaaaaeaaaaaa
egacbaaaafaaaaaaegacbaaaagaaaaaadiaaaaajhcaabaaaafaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaafaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaafaaaaaa
dcaaaaalhcaabaaaafaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaafaaaaaaaaaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaafaaaaaa
pgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaa
afaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaa
egacbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaa
aeaaaaaaegacbaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaagaaaaaakgaobaaa
abaaaaaaaaaaaaahdccabaaaagaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 208
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecededidfmjefliaiecjkhfhjnmmnaefmkfcabaaaaaabiboaaaaaeaaaaaa
daaaaaaaiaakaaaahmbmaaaaeebnaaaaebgpgodjeiakaaaaeiakaaaaaaacpopp
jmajaaaakmaaaaaaalaaceaaaaaakiaaaaaakiaaaaaaceaaabaakiaaaaaaahaa
abaaabaaaaaaaaaaaaaaalaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
abaaaeaaacaaaeaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaaacaaacaaaiaaahaa
aaaaaaaaacaacgaaahaaapaaaaaaaaaaadaaaaaaaeaabgaaaaaaaaaaadaaaiaa
anaabkaaaaaaaaaaaeaaafaaabaachaaaaaaaaaaaeaaakaaacaaciaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafckaaapkamnmmpmdpamaceldpaaaamadomlkbefdo
fbaaaaafclaaapkaaaaaiadpaaaaialpaaaaaaeaaaaaaalpfbaaaaafcmaaapka
aaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafcnaaapkaaaaaaaaaaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaaiaaaaadaaaaaiiaabaaoejabnaaoekaaiaaaaadaaaaabiaabaaoeja
bkaaoekaaiaaaaadaaaaaciaabaaoejablaaoekaaiaaaaadaaaaaeiaabaaoeja
bmaaoekaajaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappia
afaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaacaaaaaiiaclaaffkacdaaaaac
abaaabiaabaappjaacaaaaadabaaabiaabaaaaibclaaaakabcaaaaaeacaaapia
abaaaaiaaaaaoeiaabaaoejaceaaaaacaaaaahiaacaaoeiaabaaaaacadaaapia
agaaoekaafaaaaadabaaaoiaadaaffiacdaajakaaeaaaaaeabaaaoiaccaajaka
adaaaaiaabaaoeiaaeaaaaaeabaaaoiaceaajakaadaakkiaabaaoeiaaeaaaaae
abaaaoiacfaajakaadaappiaabaaoeiaaiaaaaadacaaaboaaaaaoeiaabaapjia
aiaaaaadadaaaiiaacaaoejabnaaoekaaiaaaaadadaaabiaacaaoejabkaaoeka
aiaaaaadadaaaciaacaaoejablaaoekaaiaaaaadadaaaeiaacaaoejabmaaoeka
ajaaaaadaaaaaiiaadaaoeiaadaaoeiaahaaaaacaaaaaiiaaaaappiaaeaaaaae
acaaahiaadaaoeiaaaaappiaacaaoejbaeaaaaaeacaaahiaabaaaaiaacaaoeia
acaaoejaceaaaaacadaaahiaacaaoeiaafaaaaadaeaaahiaaaaamjiaadaancia
aeaaaaaeaeaaahiaadaamjiaaaaanciaaeaaoeibafaaaaadaeaaahiaacaappia
aeaaoeiaaiaaaaadacaaacoaaeaaoeiaabaapjiaaiaaaaadacaaaeoaadaaoeia
abaapjiaafaaaaadaaaaaiiaafaaffjacmaakkkaafaaaaadacaaafiaacaaoeia
aaaappiaafaaaaadabaaagiaacaanajabkaanakaacaaaaadafaaabiaabaakkia
abaaffiaafaaaaadabaaagiaacaanajablaanakaacaaaaadafaaaciaabaakkia
abaaffiaafaaaaadabaaagiaacaanajabmaanakaacaaaaadafaaaeiaabaakkia
abaaffiaaeaaaaaeabaaahiaafaaoeiaabaaaaiaaaaaoejaafaaaaadabaaahia
abaaoeiachaaoekaabaaaaacafaaabiaboaappkaabaaaaacafaaaciabpaappka
abaaaaacafaaaeiacaaappkaaiaaaaadaaaaaiiaafaaoeiaclaaaakaacaaaaad
afaaaciaaaaappiaafaaaajaacaaaaadaaaaaiiaafaaffiaafaaffjaaiaaaaad
afaaabiaabaaoeiaaaaappiaacaaaaadafaaapiaafaafaiaadaaffkaafaaaaad
afaaapiaafaaoeiackaaoekabdaaaaacafaaapiaafaaoeiaaeaaaaaeafaaapia
afaaoeiaclaakkkaclaappkabdaaaaacafaaapiaafaaoeiaaeaaaaaeafaaapia
afaaoeiaclaakkkaclaaffkacdaaaaacafaaapiaafaaoeiaafaaaaadagaaapia
afaaoeiaafaaoeiaaeaaaaaeafaaapiaafaaoeiacmaaaakbcmaaffkaafaaaaad
afaaapiaafaaoeiaagaaoeiaacaaaaadafaaadiaafaaoniaafaaoiiaafaaaaad
agaaahiaafaaffiaabaaoekaafaaaaadagaaahiaagaaoeiaaeaaffjaafaaaaad
acaaaciaafaaffiaaeaaffjaabaaaaacafaaaeiacmaappkaaeaaaaaeacaaahia
afaamiiaacaaoeiaagaaoeiaaeaaaaaeabaaahiaacaaoeiaabaappkaabaaoeia
aeaaaaaeabaaahiaaeaaaajaabaaoekaabaaoeiaaiaaaaadaaaaaiiaciaaoeka
abaaoeiaacaaaaadaaaaaiiaaaaappiaciaappkaaeaaaaaeacaaahiaaaaappia
ciaaoekbabaaoeiabcaaaaaeafaaahiacjaaaakaabaaoeiaacaaoeiaabaaaaac
abaaahiaaeaaoekaafaaaaadacaaahiaabaaffiacdaaoekaaeaaaaaeabaaalia
ccaakekaabaaaaiaacaakeiaaeaaaaaeabaaahiaceaaoekaabaakkiaabaapeia
acaaaaadabaaahiaabaaoeiacfaaoekaaeaaaaaeabaaahiaabaaoeiacgaappka
afaaoeibaiaaaaadaeaaaboaaaaaoeiaabaaoeiaaiaaaaadaeaaacoaaeaaoeia
abaaoeiaaiaaaaadaeaaaeoaadaaoeiaabaaoeiaafaaaaadaaaaahiaadaaoeia
cgaappkaafaaaaadabaaahiaaaaaffiabpaaoekaaeaaaaaeaaaaaliaboaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiacaaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiaclaaaakaajaaaaadabaaabiaapaaoekaaaaaoeiaajaaaaadabaaacia
baaaoekaaaaaoeiaajaaaaadabaaaeiabbaaoekaaaaaoeiaafaaaaadacaaapia
aaaacjiaaaaakeiaajaaaaadadaaabiabcaaoekaacaaoeiaajaaaaadadaaacia
bdaaoekaacaaoeiaajaaaaadadaaaeiabeaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiia
aaaaaaiaaaaaaaiaaaaappibaeaaaaaeabaaahiabfaaoekaaaaappiaabaaoeia
afaaaaadacaaahiaafaaffiabpaaoekaaeaaaaaeacaaahiaboaaoekaafaaaaia
acaaoeiaaeaaaaaeacaaahiacaaaoekaafaakkiaacaaoeiaacaaaaadacaaahia
acaaoeiacbaaoekaacaaaaadadaaapiaacaaaaibahaaoekaacaaaaadaeaaapia
acaaffibaiaaoekaacaaaaadacaaapiaacaakkibajaaoekaafaaaaadagaaapia
aaaaffiaaeaaoeiaafaaaaadaeaaapiaaeaaoeiaaeaaoeiaaeaaaaaeaeaaapia
adaaoeiaadaaoeiaaeaaoeiaaeaaaaaeadaaapiaadaaoeiaaaaaaaiaagaaoeia
aeaaaaaeaaaaapiaacaaoeiaaaaakkiaadaaoeiaaeaaaaaeacaaapiaacaaoeia
acaaoeiaaeaaoeiaahaaaaacadaaabiaacaaaaiaahaaaaacadaaaciaacaaffia
ahaaaaacadaaaeiaacaakkiaahaaaaacadaaaiiaacaappiaabaaaaacaeaaabia
claaaakaaeaaaaaeacaaapiaacaaoeiaakaaoekaaeaaaaiaafaaaaadaaaaapia
aaaaoeiaadaaoeiaalaaaaadaaaaapiaaaaaoeiacnaaaakaagaaaaacadaaabia
acaaaaiaagaaaaacadaaaciaacaaffiaagaaaaacadaaaeiaacaakkiaagaaaaac
adaaaiiaacaappiaafaaaaadaaaaapiaaaaaoeiaadaaoeiaafaaaaadacaaahia
aaaaffiaamaaoekaaeaaaaaeacaaahiaalaaoekaaaaaaaiaacaaoeiaaeaaaaae
aaaaahiaanaaoekaaaaakkiaacaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappia
aaaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapiaafaaffia
bhaaoekaaeaaaaaeaaaaapiabgaaoekaafaaaaiaaaaaoeiaaeaaaaaeaaaaapia
biaaoekaafaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiabjaaoekaafaaaaad
abaaabiaaaaaffiaafaaaakaafaaaaadabaaaiiaabaaaaiaclaappkbafaaaaad
abaaafiaaaaapeiaclaappkbacaaaaadafaaadoaabaakkiaabaaomiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
afaaamoaaaaaoeiaaeaaaaaeabaaapoaafaappjacnaaeakacnaabfkappppaaaa
fdeieefcpebbaaaaeaaaabaahnaeaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaa
fpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
lcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaa
giaaaaacamaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaa
dgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaa
aaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaa
aaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkbabaaaafaaaaaaapaaaaaibcaabaaaabaaaaaaegbabaaa
acaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaaabaaaaaaegbabaaa
acaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaaabaaaaaaegbabaaa
acaaaaaaegiacaaaadaaaaaaakaaaaaaaaaaaaaiicaabaaaaaaaaaaadkbabaia
mbaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaabaaaaaaegacbaaa
abaaaaaapgapbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaaagafbaaa
aaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaa
acaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaap
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaa
adaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaadcaaaaba
pcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaah
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaahdcaabaaa
aaaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaa
aaaaaaaabkbabaaaaeaaaaaabaaaaaaiicaabaaaaeaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaeaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaaeaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaaeaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaaaeaaaaaa
egaobaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
hcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaadcaaaaajhcaabaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaaeaaaaaa
egbcbaaaacaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaa
mnmmmmdndiaaaaahfcaabaaaadaaaaaaagacbaaaaeaaaaaafgafbaaaaaaaaaaa
dgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaa
igaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaaahaaaaaa
egacbaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegiccaaaaeaaaaaaakaaaaaa
egacbaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaadkiacaaa
aeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaaagaabaiaebaaaaaaabaaaaaa
egiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
agiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaa
egiocaaaadaaaaaaadaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaa
ogikcaaaaaaaaaaaalaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaaafaaaaaa
baaaaaaiicaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaalaaaaaa
baaaaaaibcaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaaiaaaaaa
baaaaaaiccaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaajaaaaaa
baaaaaaiecaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaakaaaaaa
bbaaaaahicaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaaeeaaaaaf
icaabaaaacaaaaaadkaabaaaacaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
acaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaialp
aaaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaaegbobaiaebaaaaaaabaaaaaa
dcaaaaajpcaabaaaacaaaaaapgapbaaaaaaaaaaaegaobaaaacaaaaaaegbobaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aeaaaaaaegacbaaaaeaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaaegacbaaaaeaaaaaadiaaaaah
hcaabaaaaeaaaaaajgaebaaaacaaaaaacgajbaaaadaaaaaadcaaaaakhcaabaaa
aeaaaaaajgaebaaaadaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaaaeaaaaaa
diaaaaahhcaabaaaaeaaaaaapgapbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaj
hcaabaaaafaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaafaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaa
aaaaaaaaegacbaaaafaaaaaadcaaaaalhcaabaaaafaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaafaaaaaadcaaaaalhcaabaaa
afaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaa
afaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaeaaaaaaegacbaaaafaaaaaa
baaaaaahbccabaaaadaaaaaaegacbaaaacaaaaaaegacbaaaafaaaaaabaaaaaah
eccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaa
afaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaa
afaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegacbaaaafaaaaaa
dcaaaaakhcaabaaaafaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egacbaaaafaaaaaaaaaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaaegiccaaa
adaaaaaaapaaaaaaaaaaaaajpcaabaaaagaaaaaafgafbaiaebaaaaaaafaaaaaa
egiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaaahaaaaaaegaobaaaagaaaaaa
egaobaaaagaaaaaaaaaaaaajpcaabaaaaiaaaaaaagaabaiaebaaaaaaafaaaaaa
egiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaafaaaaaakgakbaiaebaaaaaa
afaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaaahaaaaaaegaobaaa
aiaaaaaaegaobaaaaiaaaaaaegaobaaaahaaaaaadcaaaaajpcaabaaaahaaaaaa
egaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaaahaaaaaadcaaaaanpcaabaaa
ajaaaaaaegaobaaaahaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpeeaaaaafpcaabaaaahaaaaaaegaobaaaahaaaaaa
aoaaaaakpcaabaaaajaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
egaobaaaajaaaaaadiaaaaaihcaabaaaakaaaaaaegacbaaaadaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaaihcaabaaaalaaaaaafgafbaaaakaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaakaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaakaaaaaaegaibaaaalaaaaaadcaaaaakhcaabaaaakaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaakaaaaaaegadbaaaakaaaaaadiaaaaahpcaabaaa
agaaaaaaegaobaaaagaaaaaafgafbaaaakaaaaaadcaaaaajpcaabaaaagaaaaaa
egaobaaaaiaaaaaaagaabaaaakaaaaaaegaobaaaagaaaaaadcaaaaajpcaabaaa
afaaaaaaegaobaaaafaaaaaakgakbaaaakaaaaaaegaobaaaagaaaaaadiaaaaah
pcaabaaaafaaaaaaegaobaaaahaaaaaaegaobaaaafaaaaaadeaaaaakpcaabaaa
afaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaahpcaabaaaafaaaaaaegaobaaaajaaaaaaegaobaaaafaaaaaadiaaaaai
hcaabaaaagaaaaaafgafbaaaafaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaak
hcaabaaaagaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaafaaaaaaegacbaaa
agaaaaaadcaaaaakhcaabaaaafaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaa
afaaaaaaegacbaaaagaaaaaadcaaaaakhcaabaaaafaaaaaaegiccaaaacaaaaaa
ajaaaaaapgapbaaaafaaaaaaegacbaaaafaaaaaadgaaaaaficaabaaaakaaaaaa
abeaaaaaaaaaiadpbbaaaaaibcaabaaaagaaaaaaegiocaaaacaaaaaacgaaaaaa
egaobaaaakaaaaaabbaaaaaiccaabaaaagaaaaaaegiocaaaacaaaaaachaaaaaa
egaobaaaakaaaaaabbaaaaaiecaabaaaagaaaaaaegiocaaaacaaaaaaciaaaaaa
egaobaaaakaaaaaadiaaaaahpcaabaaaahaaaaaajgacbaaaakaaaaaaegakbaaa
akaaaaaabbaaaaaibcaabaaaaiaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaa
ahaaaaaabbaaaaaiccaabaaaaiaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaa
ahaaaaaabbaaaaaiecaabaaaaiaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaa
ahaaaaaaaaaaaaahhcaabaaaagaaaaaaegacbaaaagaaaaaaegacbaaaaiaaaaaa
diaaaaahicaabaaaaaaaaaaabkaabaaaakaaaaaabkaabaaaakaaaaaadcaaaaak
icaabaaaaaaaaaaaakaabaaaakaaaaaaakaabaaaakaaaaaadkaabaiaebaaaaaa
aaaaaaaadcaaaaakhcaabaaaagaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaa
aaaaaaaaegacbaaaagaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaafaaaaaa
egacbaaaagaaaaaadiaaaaajhcaabaaaafaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaafaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaafaaaaaadcaaaaalhcaabaaa
afaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
afaaaaaaaaaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaafaaaaaapgipcaaaadaaaaaa
beaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaafaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegacbaaaadaaaaaa
egacbaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaaeaaaaaaegacbaaa
aaaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadp
diaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaaaadgaaaaafmccabaaaagaaaaaakgaobaaaabaaaaaaaaaaaaah
dccabaaaagaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apahaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheommaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaamfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_TranslucencyColor]
Float 3 [_TranslucencyViewDependency]
Float 4 [_Shininess]
Float 5 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 1
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 3
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 0.60009766, 0.39990234 },
		{ 0, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R1, fragment.texcoord[0], texture[0], 2D;
TEX R2.yw, fragment.texcoord[0], texture[3], 2D;
TEX R0.w, fragment.texcoord[0], texture[2], 2D;
MAD R2.xy, R2.wyzw, c[6].x, -c[6].y;
MUL R2.zw, R2.xyxy, R2.xyxy;
ADD_SAT R0.y, R2.z, R2.w;
SLT R0.x, R1.w, c[5];
ADD R0.y, -R0, c[6];
RSQ R0.z, R0.y;
MUL R1.xyz, R1, c[1];
RCP R2.z, R0.z;
DP3 R0.y, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.z, R0.y;
DP3 R0.y, fragment.texcoord[1], R2;
MOV_SAT R2.w, -R0.y;
MUL R3.xyz, R0.z, fragment.texcoord[3];
DP3_SAT R0.z, R3, -fragment.texcoord[1];
ADD R0.z, R0, -R2.w;
MAD R0.z, R0, c[3].x, R2.w;
MAD R0.y, R0, c[6].z, c[6].w;
MAX R2.w, R0.y, c[7].x;
ADD R3.xyz, R3, fragment.texcoord[1];
MUL R1.xyz, R1, fragment.color.primary.w;
MOV result.color.w, R1;
KIL -R0.x;
TEX R0.x, fragment.texcoord[0], texture[1], 2D;
MUL R0.x, R0.z, R0;
MUL R0.xyz, R0.x, c[2];
MAD R0.xyz, R0, c[6].x, R2.w;
DP3 R2.w, R3, R3;
RSQ R2.w, R2.w;
MUL R3.xyz, R2.w, R3;
MUL R0.xyz, R1, R0;
DP3 R2.x, R2, R3;
MOV R2.w, c[7].y;
MUL R2.y, R2.w, c[4].x;
MAX R2.x, R2, c[7];
POW R2.x, R2.x, R2.y;
MUL R0.w, R2.x, R0;
MUL R1.xyz, R1, fragment.texcoord[2];
MAD R0.xyz, R0, c[0], R0.w;
MAD result.color.xyz, R0, c[6].x, R1;
END
# 42 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_TranslucencyColor]
Float 3 [_TranslucencyViewDependency]
Float 4 [_Shininess]
Float 5 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 1
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c6, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c7, 0.60009766, 0.39990234, 128.00000000, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r1, t0, s3
texld r3, t0, s0
texld r6, t0, s1
add_pp r0.x, r3.w, -c5
cmp r0.x, r0, c6, c6.y
mov_pp r0, -r0.x
mul_pp r3.xyz, r3, c1
texkill r0.xyzw
texld r0, t0, s2
mov r0.y, r1
mov r0.x, r1.w
mad_pp r4.xy, r0, c6.z, c6.w
mul_pp r0.xy, r4, r4
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c6.y
rsq_pp r1.x, r0.x
rcp_pp r4.z, r1.x
dp3_pp r0.x, t3, t3
rsq_pp r1.x, r0.x
mul_pp r5.xyz, r1.x, t3
dp3_pp r0.x, t1, r4
mov_pp_sat r1.x, -r0
dp3_pp_sat r2.x, r5, -t1
add_pp r2.x, r2, -r1
mad_pp r1.x, r2, c3, r1
mad_pp r0.x, r0, c7, c7.y
add_pp r2.xyz, r5, t1
mul_pp r1.x, r1, r6
mul_pp r5.xyz, r1.x, c2
dp3_pp r1.x, r2, r2
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r2
max_pp r0.x, r0, c6
mad_pp r2.xyz, r5, c6.z, r0.x
dp3_pp r0.x, r4, r1
max_pp r0.x, r0, c6
mov_pp r1.x, c4
mul_pp r1.x, c7.z, r1
pow_pp r4.x, r0.x, r1.x
mul_pp r1.xyz, r3, v0.w
mul_pp r2.xyz, r1, r2
mov_pp r0.x, r4.x
mul_pp r0.x, r0, r0.w
mul_pp r1.xyz, r1, t2
mad_pp r0.xyz, r2, c0, r0.x
mad_pp r0.xyz, r0, c6.z, r1
mov_pp r0.w, r3
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 3
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 1
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Vector 64 [_Color]
Vector 80 [_TranslucencyColor] 3
Float 92 [_TranslucencyViewDependency]
Float 100 [_Shininess]
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedefhkbaajdknioaobmeehngppdcjpjfjdabaaaaaabeahaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
paafaaaaeaaaaaaahmabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
aaaaaaajbcaabaaaabaaaaaadkaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
aiaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaa
anaaaeadakaabaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaaj
ocaabaaaabaaaaaaagbjbaaaafaaaaaaagaabaaaabaaaaaaagbjbaaaadaaaaaa
diaaaaahhcaabaaaacaaaaaaagaabaaaabaaaaaaegbcbaaaafaaaaaabacaaaai
bcaabaaaabaaaaaaegacbaaaacaaaaaaegbcbaiaebaaaaaaadaaaaaabaaaaaah
bcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaeeaaaaafbcaabaaa
acaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaa
agaabaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaa
adaaaaaaaagabaaaabaaaaaadcaaaaapdcaabaaaacaaaaaahgapbaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialp
aaaaaaaaaaaaaaaaapaaaaahicaabaaaacaaaaaaegaabaaaacaaaaaaegaabaaa
acaaaaaaddaaaaahicaabaaaacaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaiadp
aaaaaaaiicaabaaaacaaaaaadkaabaiaebaaaaaaacaaaaaaabeaaaaaaaaaiadp
elaaaaafecaabaaaacaaaaaadkaabaaaacaaaaaabaaaaaahccaabaaaabaaaaaa
egacbaaaacaaaaaajgahbaaaabaaaaaabaaaaaahecaabaaaabaaaaaaegacbaaa
acaaaaaaegbcbaaaadaaaaaadeaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
abeaaaaaaaaaaaaacpaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaai
icaabaaaabaaaaaabkiacaaaaaaaaaaaagaaaaaaabeaaaaaaaaaaaeddiaaaaah
ccaabaaaabaaaaaabkaabaaaabaaaaaadkaabaaaabaaaaaabjaaaaafccaabaaa
abaaaaaabkaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaa
abaaaaaadkaabaaaacaaaaaadgcaaaagicaabaaaabaaaaaackaabaiaebaaaaaa
abaaaaaadcaaaaajecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaajkjjbjdp
abeaaaaamnmmmmdodeaaaaahecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaa
aaaaaaaaaaaaaaaibcaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaaakaabaaa
abaaaaaadcaaaaakbcaabaaaabaaaaaadkiacaaaaaaaaaaaafaaaaaaakaabaaa
abaaaaaadkaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaadaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaaakaabaaaacaaaaaadiaaaaaihcaabaaaacaaaaaaagaabaaaabaaaaaa
egiccaaaaaaaaaaaafaaaaaadcaaaaamncaabaaaabaaaaaaagajbaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaaaaaaaaaeaaaaaaaeakgakbaaaabaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgbpbaaaacaaaaaadiaaaaahncaabaaaabaaaaaaagaobaaaabaaaaaa
agajbaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaaigadbaaaabaaaaaaegiccaaa
aaaaaaaaabaaaaaafgafbaaaabaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaaeaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 3
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 1
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Vector 64 [_Color]
Vector 80 [_TranslucencyColor] 3
Float 92 [_TranslucencyViewDependency]
Float 100 [_Shininess]
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedaajogjfchkmehofeinalmlchpdjhoaklabaaaaaajiakaaaaaeaaaaaa
daaaaaaalaadaaaakiajaaaageakaaaaebgpgodjhiadaaaahiadaaaaaaacpppp
caadaaaafiaaaaaaadaadeaaaaaafiaaaaaafiaaaeaaceaaaaaafiaaaaaaaaaa
adababaaacacacaaabadadaaaaaaabaaabaaaaaaaaaaaaaaaaaaaeaaadaaabaa
aaaaaaaaaaaaaiaaabaaaeaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaaaea
aaaaialpaaaaaaaaaaaaiadpfbaaaaafagaaapkaaaaaaaedjkjjbjdpmnmmmmdo
aaaaaaaabpaaaaacaaaaaaiaaaaaahlabpaaaaacaaaaaaiaabaacplabpaaaaac
aaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaaja
acaiapkabpaaaaacaaaaaajaadaiapkaecaaaaadaaaacpiaaaaaoelaaaaioeka
acaaaaadabaacpiaaaaappiaaeaaaakbebaaaaababaaapiaecaaaaadabaacpia
aaaaoelaabaioekaecaaaaadacaacpiaaaaaoelaadaioekaecaaaaadadaacpia
aaaaoelaacaioekaaiaaaaadabaacbiaaeaaoelaaeaaoelaahaaaaacabaacbia
abaaaaiaafaaaaadadaachiaabaaaaiaaeaaoelaabaaaaacaeaaahiaaeaaoela
aeaaaaaeaeaachiaaeaaoeiaabaaaaiaacaaoelaceaaaaacafaachiaaeaaoeia
aiaaaaadafaadiiaadaaoeiaacaaoelbaeaaaaaeadaacbiaabaappiaafaaaaka
afaaffkaaeaaaaaeadaacciaabaaffiaafaaaakaafaaffkafkaaaaaeabaadbia
adaaoeiaadaaoeiaafaakkkaacaaaaadabaacbiaabaaaaibafaappkaahaaaaac
abaacbiaabaaaaiaagaaaaacadaaceiaabaaaaiaaiaaaaadabaacbiaadaaoeia
acaaoelaaiaaaaadabaacciaadaaoeiaafaaoeiaalaaaaadacaacciaabaaffia
afaakkkaabaaaaacabaadciaabaaaaibaeaaaaaeabaacbiaabaaaaiaagaaffka
agaakkkaalaaaaadacaaceiaabaaaaiaafaakkkabcaaaaaeacaaciiaacaappka
afaappiaabaaffiaafaaaaadabaacbiaacaaaaiaacaappiaafaaaaadabaachia
abaaaaiaacaaoekaaeaaaaaeabaachiaabaaoeiaafaaaakaacaakkiaafaaaaad
adaachiaaaaaoeiaabaaoekaafaaaaadadaachiaadaaoeiaabaapplaafaaaaad
abaachiaabaaoeiaadaaoeiaabaaaaacabaaaiiaagaaaakaafaaaaadabaaciia
abaappiaadaaffkacaaaaaadaeaacbiaacaaffiaabaappiaafaaaaadabaaciia
adaappiaaeaaaaiaaeaaaaaeabaachiaabaaoeiaaaaaoekaabaappiaacaaaaad
abaachiaabaaoeiaabaaoeiaaeaaaaaeaaaachiaadaaoeiaadaaoelaabaaoeia
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcpaafaaaaeaaaaaaahmabaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaajbcaabaaaabaaaaaa
dkaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaaiaaaaaadbaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaajocaabaaaabaaaaaaagbjbaaa
afaaaaaaagaabaaaabaaaaaaagbjbaaaadaaaaaadiaaaaahhcaabaaaacaaaaaa
agaabaaaabaaaaaaegbcbaaaafaaaaaabacaaaaibcaabaaaabaaaaaaegacbaaa
acaaaaaaegbcbaiaebaaaaaaadaaaaaabaaaaaahbcaabaaaacaaaaaajgahbaaa
abaaaaaajgahbaaaabaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaa
diaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaa
dcaaaaapdcaabaaaacaaaaaahgapbaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaah
icaabaaaacaaaaaaegaabaaaacaaaaaaegaabaaaacaaaaaaddaaaaahicaabaaa
acaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaacaaaaaa
dkaabaiaebaaaaaaacaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaacaaaaaa
dkaabaaaacaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaajgahbaaa
abaaaaaabaaaaaahecaabaaaabaaaaaaegacbaaaacaaaaaaegbcbaaaadaaaaaa
deaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaaf
ccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaaiicaabaaaabaaaaaabkiacaaa
aaaaaaaaagaaaaaaabeaaaaaaaaaaaeddiaaaaahccaabaaaabaaaaaabkaabaaa
abaaaaaadkaabaaaabaaaaaabjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaadkaabaaaacaaaaaa
dgcaaaagicaabaaaabaaaaaackaabaiaebaaaaaaabaaaaaadcaaaaajecaabaaa
abaaaaaackaabaaaabaaaaaaabeaaaaajkjjbjdpabeaaaaamnmmmmdodeaaaaah
ecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaaaaaaaaaaaaaaaaaibcaabaaa
abaaaaaadkaabaiaebaaaaaaabaaaaaaakaabaaaabaaaaaadcaaaaakbcaabaaa
abaaaaaadkiacaaaaaaaaaaaafaaaaaaakaabaaaabaaaaaadkaabaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
adaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaacaaaaaa
diaaaaaihcaabaaaacaaaaaaagaabaaaabaaaaaaegiccaaaaaaaaaaaafaaaaaa
dcaaaaamncaabaaaabaaaaaaagajbaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaaa
aaaaaaeaaaaaaaeakgakbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaacaaaaaa
diaaaaahncaabaaaabaaaaaaagaobaaaabaaaaaaagajbaaaaaaaaaaadcaaaaak
hcaabaaaabaaaaaaigadbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaafgafbaaa
abaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaaeaaaaaaegacbaaa
abaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaiaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_TranslucencyColor]
Float 3 [_TranslucencyViewDependency]
Float 4 [_ShadowStrength]
Float 5 [_Shininess]
Float 6 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 1
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 3
SetTexture 4 [_ShadowMapTexture] 2D 4
"!!ARBfp1.0
PARAM c[9] = { program.local[0..6],
		{ 2, 1, 0.60009766, 0.39990234 },
		{ 0, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R1.yw, fragment.texcoord[0], texture[3], 2D;
TEX R1.x, fragment.texcoord[0], texture[1], 2D;
TEX R0.w, fragment.texcoord[0], texture[2], 2D;
MAD R3.xy, R1.wyzw, c[7].x, -c[7].y;
SLT R0.x, R2.w, c[6];
DP3 R0.y, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.y, R0.y;
MUL R4.xyz, R0.y, fragment.texcoord[3];
MUL R3.zw, R3.xyxy, R3.xyxy;
ADD R1.yzw, R4.xxyz, fragment.texcoord[1].xxyz;
ADD_SAT R0.y, R3.z, R3.w;
DP3 R0.z, R1.yzww, R1.yzww;
RSQ R0.z, R0.z;
ADD R0.y, -R0, c[7];
RSQ R0.y, R0.y;
RCP R3.z, R0.y;
MUL R1.yzw, R0.z, R1;
MUL R2.xyz, R2, c[1];
DP3 R0.z, R3, R1.yzww;
MOV R0.y, c[8];
MUL R1.y, R0, c[5].x;
MAX R0.y, R0.z, c[8].x;
POW R0.y, R0.y, R1.y;
MUL R0.y, R0, R0.w;
DP3 R1.y, fragment.texcoord[1], R3;
MOV_SAT R0.w, -R1.y;
DP3_SAT R0.z, R4, -fragment.texcoord[1];
ADD R0.z, R0, -R0.w;
MAD R0.z, R0, c[3].x, R0.w;
MAD R0.w, R1.y, c[7].z, c[7];
MUL R0.z, R0, R1.x;
MUL R2.xyz, R2, fragment.color.primary.w;
MAX R0.w, R0, c[8].x;
MUL R1.xyz, R0.z, c[2];
MAD R1.xyz, R1, c[7].x, R0.w;
MUL R1.xyz, R2, R1;
MAD R1.xyz, R1, c[0], R0.y;
MUL R2.xyz, R2, fragment.texcoord[2];
MOV R0.y, c[7].x;
MOV result.color.w, R2;
KIL -R0.x;
TXP R0.x, fragment.texcoord[4], texture[4], 2D;
MAD R0.x, R0, c[7], -c[7];
MAD R0.x, R0, c[4], R0.y;
MAD result.color.xyz, R1, R0.x, R2;
END
# 46 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_TranslucencyColor]
Float 3 [_TranslucencyViewDependency]
Float 4 [_ShadowStrength]
Float 5 [_Shininess]
Float 6 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 1
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 3
SetTexture 4 [_ShadowMapTexture] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c7, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c8, 0.60009766, 0.39990234, 128.00000000, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
texld r1, t0, s3
texld r3, t0, s0
texldp r6, t4, s4
texld r7, t0, s1
mov r1.x, r1.w
add_pp r0.x, r3.w, -c6
cmp r0.x, r0, c7, c7.y
mov_pp r0, -r0.x
mad_pp r5.xy, r1, c7.z, c7.w
texkill r0.xyzw
texld r0, t0, s2
dp3_pp r0.x, t3, t3
rsq_pp r0.x, r0.x
mul_pp r4.xyz, r0.x, t3
mul_pp r0.xy, r5, r5
add_pp r2.xyz, r4, t1
dp3_pp r1.x, r2, r2
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c7.y
rsq_pp r0.x, r0.x
rcp_pp r5.z, r0.x
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r2
dp3_pp r1.x, r5, r1
mov_pp r0.x, c5
mul_pp r2.x, c8.z, r0
dp3_pp r0.x, t1, r5
max_pp r1.x, r1, c7
pow_pp r5.x, r1.x, r2.x
mov_pp_sat r1.x, -r0
dp3_pp_sat r2.x, r4, -t1
add_pp r2.x, r2, -r1
mad_pp r1.x, r2, c3, r1
mad_pp r0.x, r0, c8, c8.y
mul_pp r1.x, r1, r7
mul_pp r2.xyz, r3, c1
max_pp r0.x, r0, c7
mul_pp r1.xyz, r1.x, c2
mad_pp r1.xyz, r1, c7.z, r0.x
mul_pp r2.xyz, r2, v0.w
mul_pp r1.xyz, r2, r1
mov_pp r0.x, r5.x
mul_pp r0.x, r0, r0.w
mad_pp r1.xyz, r1, c0, r0.x
mov_pp r0.z, c7
mad_pp r0.x, r6, c7.z, -c7.z
mul_pp r2.xyz, r2, t2
mad_pp r0.x, r0, c4, r0.z
mad_pp r0.xyz, r1, r0.x, r2
mov_pp r0.w, r3
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_TranslucencyMap] 2D 4
SetTexture 2 [_GlossMap] 2D 3
SetTexture 3 [_BumpMap] 2D 2
SetTexture 4 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 128 [_Color]
Vector 144 [_TranslucencyColor] 3
Float 156 [_TranslucencyViewDependency]
Float 160 [_ShadowStrength]
Float 164 [_Shininess]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedfkidgfiicjgfoieebccceffpdcklbomnabaaaaaaoaahaaaaadaaaaaa
cmaaaaaaaaabaaaadeabaaaaejfdeheommaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaamfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefckeagaaaaeaaaaaaa
kjabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaad
lcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
aaaaaaajbcaabaaaabaaaaaadkaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
amaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaa
anaaaeadakaabaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaaj
ocaabaaaabaaaaaaagbjbaaaafaaaaaaagaabaaaabaaaaaaagbjbaaaadaaaaaa
diaaaaahhcaabaaaacaaaaaaagaabaaaabaaaaaaegbcbaaaafaaaaaabacaaaai
bcaabaaaabaaaaaaegacbaaaacaaaaaaegbcbaiaebaaaaaaadaaaaaabaaaaaah
bcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaeeaaaaafbcaabaaa
acaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaa
agaabaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaa
adaaaaaaaagabaaaacaaaaaadcaaaaapdcaabaaaacaaaaaahgapbaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialp
aaaaaaaaaaaaaaaaapaaaaahicaabaaaacaaaaaaegaabaaaacaaaaaaegaabaaa
acaaaaaaddaaaaahicaabaaaacaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaiadp
aaaaaaaiicaabaaaacaaaaaadkaabaiaebaaaaaaacaaaaaaabeaaaaaaaaaiadp
elaaaaafecaabaaaacaaaaaadkaabaaaacaaaaaabaaaaaahccaabaaaabaaaaaa
egacbaaaacaaaaaajgahbaaaabaaaaaabaaaaaahecaabaaaabaaaaaaegacbaaa
acaaaaaaegbcbaaaadaaaaaadeaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
abeaaaaaaaaaaaaacpaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaai
icaabaaaabaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaaaaaaaaeddiaaaaah
ccaabaaaabaaaaaabkaabaaaabaaaaaadkaabaaaabaaaaaabjaaaaafccaabaaa
abaaaaaabkaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaadaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaa
abaaaaaadkaabaaaacaaaaaadgcaaaagicaabaaaabaaaaaackaabaiaebaaaaaa
abaaaaaadcaaaaajecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaajkjjbjdp
abeaaaaamnmmmmdodeaaaaahecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaa
aaaaaaaaaaaaaaaibcaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaaakaabaaa
abaaaaaadcaaaaakbcaabaaaabaaaaaadkiacaaaaaaaaaaaajaaaaaaakaabaaa
abaaaaaadkaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaeaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaaakaabaaaacaaaaaadiaaaaaihcaabaaaacaaaaaaagaabaaaabaaaaaa
egiccaaaaaaaaaaaajaaaaaadcaaaaamncaabaaaabaaaaaaagajbaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaaaaaaaaaeaaaaaaaeakgakbaaaabaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaaiaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgbpbaaaacaaaaaadiaaaaahncaabaaaabaaaaaaagaobaaaabaaaaaa
agajbaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaa
aeaaaaaadcaaaaakhcaabaaaabaaaaaaigadbaaaabaaaaaaegiccaaaaaaaaaaa
abaaaaaafgafbaaaabaaaaaaaoaaaaahdcaabaaaacaaaaaaegbabaaaagaaaaaa
pgbpbaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
aeaaaaaaaagabaaaaaaaaaaadcaaaaajicaabaaaaaaaaaaaakaabaaaacaaaaaa
abeaaaaaaaaaaaeaabeaaaaaaaaaaamadcaaaaakicaabaaaaaaaaaaaakiacaaa
aaaaaaaaakaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaeadcaaaaajhccabaaa
aaaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_TranslucencyMap] 2D 4
SetTexture 2 [_GlossMap] 2D 3
SetTexture 3 [_BumpMap] 2D 2
SetTexture 4 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 128 [_Color]
Vector 144 [_TranslucencyColor] 3
Float 156 [_TranslucencyViewDependency]
Float 160 [_ShadowStrength]
Float 164 [_Shininess]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjdadlhdaekahallelahjginmfoeefjhfabaaaaaapialaaaaaeaaaaaa
daaaaaaaeeaeaaaapaakaaaamealaaaaebgpgodjamaeaaaaamaeaaaaaaacpppp
laadaaaafmaaaaaaadaadiaaaaaafmaaaaaafmaaafaaceaaaaaafmaaaeaaaaaa
aaababaaadacacaaacadadaaabaeaeaaaaaaabaaabaaaaaaaaaaaaaaaaaaaiaa
adaaabaaaaaaaaaaaaaaamaaabaaaeaaaaaaaaaaaaacppppfbaaaaafafaaapka
aaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafagaaapkaaaaaaaedjkjjbjdp
mnmmmmdoaaaaaaaafbaaaaafahaaapkaaaaaaaeaaaaaaamaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaahlabpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachlabpaaaaac
aaaaaaiaafaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaaja
aeaiapkaecaaaaadaaaacpiaaaaaoelaabaioekaacaaaaadabaacpiaaaaappia
aeaaaakbagaaaaacacaaaiiaafaapplaafaaaaadacaaadiaacaappiaafaaoela
ebaaaaababaaapiaecaaaaadabaacpiaaaaaoelaacaioekaecaaaaadadaacpia
aaaaoelaaeaioekaecaaaaadaeaacpiaaaaaoelaadaioekaecaaaaadacaacpia
acaaoeiaaaaioekaaiaaaaadabaacbiaaeaaoelaaeaaoelaahaaaaacabaacbia
abaaaaiaafaaaaadaeaachiaabaaaaiaaeaaoelaabaaaaacafaaahiaaeaaoela
aeaaaaaeafaachiaafaaoeiaabaaaaiaacaaoelaceaaaaacagaachiaafaaoeia
aiaaaaadagaadiiaaeaaoeiaacaaoelbaeaaaaaeaeaacbiaabaappiaafaaaaka
afaaffkaaeaaaaaeaeaacciaabaaffiaafaaaakaafaaffkafkaaaaaeabaadbia
aeaaoeiaaeaaoeiaafaakkkaacaaaaadabaacbiaabaaaaibafaappkaahaaaaac
abaacbiaabaaaaiaagaaaaacaeaaceiaabaaaaiaaiaaaaadabaacbiaaeaaoeia
acaaoelaaiaaaaadabaacciaaeaaoeiaagaaoeiaalaaaaadacaacciaabaaffia
afaakkkaabaaaaacabaadciaabaaaaibaeaaaaaeabaacbiaabaaaaiaagaaffka
agaakkkaalaaaaadacaaceiaabaaaaiaafaakkkabcaaaaaeacaaciiaacaappka
agaappiaabaaffiaafaaaaadacaaciiaadaaaaiaacaappiaafaaaaadabaachia
acaappiaacaaoekaaeaaaaaeabaachiaabaaoeiaafaaaakaacaakkiaafaaaaad
adaachiaaaaaoeiaabaaoekaafaaaaadadaachiaadaaoeiaabaapplaafaaaaad
abaachiaabaaoeiaadaaoeiaafaaaaadadaachiaadaaoeiaadaaoelaabaaaaac
abaaaiiaagaaaakaafaaaaadabaaciiaabaappiaadaaffkacaaaaaadadaaciia
acaaffiaabaappiaafaaaaadabaaciiaaeaappiaadaappiaaeaaaaaeabaachia
abaaoeiaaaaaoekaabaappiaaeaaaaaeabaaciiaacaaaaiaahaaaakaahaaffka
abaaaaacadaaaiiaafaaaakaaeaaaaaeabaaciiaadaaaakaabaappiaadaappia
aeaaaaaeaaaachiaabaaoeiaabaappiaadaaoeiaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefckeagaaaaeaaaaaaakjabaaaafjaaaaaeegiocaaaaaaaaaaa
anaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
fibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
icbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaajbcaabaaaabaaaaaadkaabaaa
aaaaaaaaakiacaiaebaaaaaaaaaaaaaaamaaaaaadbaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaajocaabaaaabaaaaaaagbjbaaaafaaaaaa
agaabaaaabaaaaaaagbjbaaaadaaaaaadiaaaaahhcaabaaaacaaaaaaagaabaaa
abaaaaaaegbcbaaaafaaaaaabacaaaaibcaabaaaabaaaaaaegacbaaaacaaaaaa
egbcbaiaebaaaaaaadaaaaaabaaaaaahbcaabaaaacaaaaaajgahbaaaabaaaaaa
jgahbaaaabaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaah
ocaabaaaabaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaabaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaadcaaaaap
dcaabaaaacaaaaaahgapbaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaa
aaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaa
acaaaaaaegaabaaaacaaaaaaegaabaaaacaaaaaaddaaaaahicaabaaaacaaaaaa
dkaabaaaacaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaacaaaaaadkaabaia
ebaaaaaaacaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaacaaaaaadkaabaaa
acaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaajgahbaaaabaaaaaa
baaaaaahecaabaaaabaaaaaaegacbaaaacaaaaaaegbcbaaaadaaaaaadeaaaaah
ccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaafccaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaaiicaabaaaabaaaaaabkiacaaaaaaaaaaa
akaaaaaaabeaaaaaaaaaaaeddiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
dkaabaaaabaaaaaabjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaa
diaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaadkaabaaaacaaaaaadgcaaaag
icaabaaaabaaaaaackaabaiaebaaaaaaabaaaaaadcaaaaajecaabaaaabaaaaaa
ckaabaaaabaaaaaaabeaaaaajkjjbjdpabeaaaaamnmmmmdodeaaaaahecaabaaa
abaaaaaackaabaaaabaaaaaaabeaaaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaa
dkaabaiaebaaaaaaabaaaaaaakaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaa
dkiacaaaaaaaaaaaajaaaaaaakaabaaaabaaaaaadkaabaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaeaaaaaa
diaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaaagaabaaaabaaaaaaegiccaaaaaaaaaaaajaaaaaadcaaaaam
ncaabaaaabaaaaaaagajbaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaaaaaaaaaea
aaaaaaeakgakbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaaiaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaacaaaaaadiaaaaah
ncaabaaaabaaaaaaagaobaaaabaaaaaaagajbaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaa
igadbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaafgafbaaaabaaaaaaaoaaaaah
dcaabaaaacaaaaaaegbabaaaagaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaa
acaaaaaaegaabaaaacaaaaaaeghobaaaaeaaaaaaaagabaaaaaaaaaaadcaaaaaj
icaabaaaaaaaaaaaakaabaaaacaaaaaaabeaaaaaaaaaaaeaabeaaaaaaaaaaama
dcaaaaakicaabaaaaaaaaaaaakiacaaaaaaaaaaaakaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaeadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheommaaaaaaahaaaaaaaiaaaaaa
laaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaamfaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaiaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
lmaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaadaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
agaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "IGNOREPROJECTOR"="true" "RenderType"="TreeLeaf" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_Time]
Vector 22 [_WorldSpaceCameraPos]
Vector 23 [_WorldSpaceLightPos0]
Vector 24 [unity_Scale]
Vector 25 [_Scale]
Vector 26 [_SquashPlaneNormal]
Float 27 [_SquashAmount]
Vector 28 [_Wind]
Vector 29 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[32] = { { 0, 1, 2, -0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..29],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1, -1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
MUL R0, vertex.normal.y, c[6];
MAD R2, vertex.normal.x, c[5], R0;
ADD R0.xyz, R2, c[0].x;
ABS R1.x, vertex.attrib[14].w;
ADD R4.x, -R1, c[0].y;
MAD R0.xyz, R0, R4.x, vertex.position;
MAD R2, vertex.normal.z, c[7], R2;
MOV R0.w, c[0].y;
DP3 R0.w, R0.w, c[12];
ADD R0.w, vertex.color.x, R0;
ADD R3, R2, c[0].x;
MUL R0.xyz, R0, c[25];
ADD R1.x, vertex.color.y, R0.w;
MOV R1.y, R0.w;
DP4 R0.w, R3, R3;
DP3 R1.x, R0, R1.x;
ADD R1.xy, R1, c[21].y;
MUL R1, R1.xxyy, c[30];
FRC R1, R1;
MAD R1, R1, c[0].z, c[0].w;
FRC R1, R1;
MAD R1, R1, c[0].z, -c[0].y;
ABS R1, R1;
MUL R2, -R1, c[0].z;
ADD R2, R2, c[31].x;
MUL R1, R1, R1;
MUL R1, R1, R2;
RSQ R0.w, R0.w;
ADD R4.zw, R1.xyxz, R1.xyyw;
MAD R2.xyz, R0.w, R3, -vertex.normal;
MAD R1.xyz, R4.x, R2, vertex.normal;
MUL R2.xyz, R4.w, c[28];
MUL R3.xyz, vertex.texcoord[1].y, R2;
MUL R5.xy, vertex.color.y, R1.xzzw;
MUL R2.xz, R5.xyyw, c[31].z;
MUL R2.y, vertex.texcoord[1], c[31];
MAD R2.xyz, R4.zwzw, R2, R3;
MAD R0.xyz, R2, c[28].w, R0;
MAD R0.xyz, vertex.texcoord[1].x, c[28], R0;
DP3 R0.w, R0, c[26];
ADD R0.w, R0, c[26];
MUL R2.xyz, R0.w, c[26];
ADD R0.xyz, -R2, R0;
MAD R0.xyz, R2, c[27].x, R0;
MOV R0.w, c[0].y;
MUL R2, vertex.attrib[14].y, c[6];
MAD R2, vertex.attrib[14].x, c[5], R2;
MAD R2, vertex.attrib[14].z, c[7], R2;
ADD R2, R2, c[0].x;
DP4 R1.w, R2, R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, R2;
DP3 R1.w, R1, R1;
MOV R2.w, c[31];
ADD R2, -vertex.attrib[14], R2;
MAD R2, R4.x, R2, vertex.attrib[14];
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
DP4 R3.w, R0, c[12];
DP4 result.texcoord[3].z, R3, c[19];
DP4 result.texcoord[3].y, R3, c[18];
DP4 result.texcoord[3].x, R3, c[17];
DP3 R3.x, R2, R2;
RSQ R3.x, R3.x;
MUL R3.xyz, R3.x, R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, R1;
MUL R4.xyz, R2.zxyw, R3.yzxw;
MAD R4.xyz, R2.yzxw, R3.zxyw, -R4;
MOV R1.w, c[0].y;
MOV R1.xyz, c[22];
DP4 R5.z, R1, c[15];
DP4 R5.x, R1, c[13];
DP4 R5.y, R1, c[14];
MOV R1, c[23];
MAD R5.xyz, R5, c[24].w, -R0;
MUL R4.xyz, R4, R2.w;
DP4 R6.z, R1, c[15];
DP4 R6.x, R1, c[13];
DP4 R6.y, R1, c[14];
MAD R1.xyz, R6, c[24].w, -R0;
DP3 result.texcoord[1].y, R1, R4;
DP3 result.texcoord[2].y, R4, R5;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
DP3 result.texcoord[1].z, R2, R1;
DP3 result.texcoord[1].x, R1, R3;
DP3 result.texcoord[2].z, R2, R5;
DP3 result.texcoord[2].x, R3, R5;
MOV result.color.xyz, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[29], c[29].zwzw;
MOV result.color.w, vertex.color;
END
# 95 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_Time]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
Vector 24 [_Scale]
Vector 25 [_SquashPlaneNormal]
Float 26 [_SquashAmount]
Vector 27 [_Wind]
Vector 28 [_MainTex_ST]
"vs_2_0
def c29, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c30, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c31, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c32, 0.10000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0, v2.y, c5
mad r2, v2.x, c4, r0
add r0.xyz, r2, c29.x
abs r0.w, v1
add r4.x, -r0.w, c29.y
mov r1.xyz, c11
dp3 r0.w, c29.y, r1
mad r0.xyz, r0, r4.x, v0
mad r2, v2.z, c6, r2
add r3, r2, c29.x
dp4 r1.w, r3, r3
mul r1.xyz, r0, c24
add r0.w, v5.x, r0
add r0.x, v5.y, r0.w
mov r0.y, r0.w
dp3 r0.x, r1, r0.x
add r0.xy, r0, c20.y
mul r0, r0.xxyy, c30
frc r0, r0
mad r0, r0, c29.z, c29.w
frc r0, r0
mad r0, r0, c31.x, c31.y
abs r0, r0
mul r2, r0, r0
mad r0, -r0, c31.x, c31.z
mul r0, r2, r0
rsq r1.w, r1.w
mad r2.xyz, r1.w, r3, -v2
add r4.zw, r0.xyxz, r0.xyyw
mad r0.xyz, r4.x, r2, v2
mul r2.xyz, r4.w, c27
mul r3.xyz, v4.y, r2
mul r5.xy, v5.y, r0.xzzw
mov r1.w, c29.y
mul r2.xz, r5.xyyw, c32.x
mul r2.y, v4, c31.w
mad r2.xyz, r4.zwzw, r2, r3
mad r1.xyz, r2, c27.w, r1
mad r2.xyz, v4.x, c27, r1
dp3 r0.w, r2, c25
add r0.w, r0, c25
mul r1.xyz, r0.w, c25
add r2.xyz, -r1, r2
mad r1.xyz, r1, c26.x, r2
mul r2, v1.y, c5
mad r2, v1.x, c4, r2
mad r2, v1.z, c6, r2
add r2, r2, c29.x
dp4 r0.w, r2, r2
rsq r0.w, r0.w
mul r2.xyz, r0.w, r2
dp3 r0.w, r0, r0
mov r2.w, c31.y
add r2, -v1, r2
mad r2, r4.x, r2, v1
dp4 r3.z, r1, c10
dp4 r3.y, r1, c9
dp4 r3.x, r1, c8
dp4 r3.w, r1, c11
dp4 oT3.z, r3, c18
dp4 oT3.y, r3, c17
dp4 oT3.x, r3, c16
dp3 r3.x, r2, r2
rsq r3.x, r3.x
mul r4.xyz, r3.x, r2
rsq r0.w, r0.w
mul r3.xyz, r0.w, r0
mul r2.xyz, r3.zxyw, r4.yzxw
mov r0.w, c29.y
mov r0.xyz, c21
dp4 r5.z, r0, c14
dp4 r5.x, r0, c12
dp4 r5.y, r0, c13
mad r6.xyz, r5, c23.w, -r1
mad r2.xyz, r3.yzxw, r4.zxyw, -r2
mul r5.xyz, r2, r2.w
mov r0, c14
dp4 r7.z, c22, r0
mov r0, c13
mov r2, c12
dp4 r7.x, c22, r2
dp4 r7.y, c22, r0
mad r0.xyz, r7, c23.w, -r1
dp3 oT1.y, r0, r5
dp3 oT2.y, r5, r6
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
dp3 oT1.z, r3, r0
dp3 oT1.x, r0, r4
dp3 oT2.z, r3, r6
dp3 oT2.x, r4, r6
mov oD0.xyz, c29.y
mad oT0.xy, v3, c28, c28.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedmkahdiamahnbhifedfclikcpfcogbdhjabaaaaaapmaoaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefceeanaaaaeaaaabaafbadaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacafaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaaapaaaaaibcaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaaaaaaaaaiicaabaaaaaaaaaaa
dkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaa
agafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaa
dcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaa
dcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaa
bkaabaaaaaaaaaaabkbabaaaaeaaaaaabaaaaaaiicaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaa
aeaaaaaaegaobaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaaaaaaaaaegbcbaia
ebaaaaaaacaaaaaadcaaaaajhcaabaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaa
aeaaaaaaegbcbaaaacaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaaagacbaaaaeaaaaaafgafbaaa
aaaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
ahaaaaaaegacbaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaaagaabaiaebaaaaaa
abaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaai
hccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaf
iccabaaaacaaaaaadkbabaaaafaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaa
aeaaaaaaegacbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaaagaabaaaabaaaaaaegacbaaaaeaaaaaabaaaaaai
icaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaai
bcaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaai
ccaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaai
ecaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaah
icaabaaaabaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaialpaaaaaaai
pcaabaaaacaaaaaaegaobaaaacaaaaaaegbobaiaebaaaaaaabaaaaaadcaaaaaj
pcaabaaaacaaaaaapgapbaaaaaaaaaaaegaobaaaacaaaaaaegbobaaaabaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
aaaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaa
jgaebaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaaabaaaaaacgajbaaa
acaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaal
hcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaa
egacbaaaaeaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaah
eccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaa
adaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaajhcaabaaaaeaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
aeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
aeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaeaaaaaaegacbaaa
aeaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaa
aeaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahcccabaaaaeaaaaaa
egacbaaaadaaaaaaegacbaaaaeaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaa
aaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecednjhfacjohmdpahnnodefhdadeloenonaabaaaaaajebgaaaaaeaaaaaa
daaaaaaameahaaaababfaaaanibfaaaaebgpgodjimahaaaaimahaaaaaaacpopp
piagaaaajeaaaaaaajaaceaaaaaajaaaaaaajaaaaaaaceaaabaajaaaaaaaadaa
afaaabaaaaaaaaaaaaaaalaaabaaagaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaa
abaaaeaaabaaaiaaaaaaaaaaacaaaaaaabaaajaaaaaaaaaaadaaaaaaaeaaakaa
aaaaaaaaadaaaiaaanaaaoaaaaaaaaaaaeaaafaaabaablaaaaaaaaaaaeaaakaa
acaabmaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafboaaapkamnmmpmdpamaceldp
aaaamadomlkbefdofbaaaaafbpaaapkaaaaaiadpaaaaialpaaaaaaeaaaaaaalp
fbaaaaafcaaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafcbaaapka
aaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoa
adaaoejaagaaoekaagaaookaabaaaaacaaaaabiabcaappkaabaaaaacaaaaacia
bdaappkaabaaaaacaaaaaeiabeaappkaaiaaaaadaaaaabiaaaaaoeiabpaaaaka
acaaaaadaaaaaciaaaaaaaiaafaaaajaacaaaaadaaaaaeiaaaaaffiaafaaffja
afaaaaadabaaadiaacaaoejaaoaaoekaacaaaaadabaaabiaabaaffiaabaaaaia
afaaaaadacaaadiaacaaoejaapaaoekaacaaaaadabaaaciaacaaffiaacaaaaia
afaaaaadacaaadiaacaaoejabaaaoekaacaaaaadabaaaeiaacaaffiaacaaaaia
cdaaaaacaaaaaiiaabaappjaacaaaaadaaaaaiiaaaaappibbpaaaakaaeaaaaae
abaaahiaabaaoeiaaaaappiaaaaaoejaafaaaaadabaaahiaabaaoeiablaaoeka
aiaaaaadaaaaabiaabaaoeiaaaaakkiaacaaaaadacaaapiaaaaafaiaahaaffka
afaaaaadacaaapiaacaaoeiaboaaoekabdaaaaacacaaapiaacaaoeiaaeaaaaae
acaaapiaacaaoeiabpaakkkabpaappkabdaaaaacacaaapiaacaaoeiaaeaaaaae
acaaapiaacaaoeiabpaakkkabpaaffkacdaaaaacacaaapiaacaaoeiaafaaaaad
adaaapiaacaaoeiaacaaoeiaaeaaaaaeacaaapiaacaaoeiacaaaaakbcaaaffka
afaaaaadacaaapiaacaaoeiaadaaoeiaacaaaaadaaaaadiaacaaoniaacaaoiia
afaaaaadacaaahiaaaaaffiaafaaoekaafaaaaadacaaahiaacaaoeiaaeaaffja
afaaaaadadaaaciaaaaaffiaaeaaffjaaiaaaaadaeaaaiiaacaaoejabbaaoeka
aiaaaaadaeaaabiaacaaoejaaoaaoekaaiaaaaadaeaaaciaacaaoejaapaaoeka
aiaaaaadaeaaaeiaacaaoejabaaaoekaajaaaaadaaaaaciaaeaaoeiaaeaaoeia
ahaaaaacaaaaaciaaaaaffiaaeaaaaaeaeaaahiaaeaaoeiaaaaaffiaacaaoejb
aeaaaaaeaeaaahiaaaaappiaaeaaoeiaacaaoejaafaaaaadaaaaaciaafaaffja
caaakkkaafaaaaadadaaafiaaeaaoeiaaaaaffiaceaaaaacafaaahiaaeaaoeia
abaaaaacaaaaaeiacaaappkaaeaaaaaeaaaaahiaaaaamiiaadaaoeiaacaaoeia
aeaaaaaeaaaaahiaaaaaoeiaafaappkaabaaoeiaaeaaaaaeaaaaahiaaeaaaaja
afaaoekaaaaaoeiaaiaaaaadabaaabiabmaaoekaaaaaoeiaacaaaaadabaaabia
abaaaaiabmaappkaaeaaaaaeabaaahiaabaaaaiabmaaoekbaaaaoeiabcaaaaae
acaaahiabnaaaakaaaaaoeiaabaaoeiaabaaaaacabaaapiaajaaoekaafaaaaad
aaaaahiaabaaffiabhaaoekaaeaaaaaeaaaaahiabgaaoekaabaaaaiaaaaaoeia
aeaaaaaeaaaaahiabiaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaahiabjaaoeka
abaappiaaaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabkaappkaacaaoeibaiaaaaad
abaaaiiaabaaoejabbaaoekaaiaaaaadabaaabiaabaaoejaaoaaoekaaiaaaaad
abaaaciaabaaoejaapaaoekaaiaaaaadabaaaeiaabaaoejabaaaoekaajaaaaad
abaaaiiaabaaoeiaabaaoeiaahaaaaacabaaaiiaabaappiaafaaaaadabaaahia
abaappiaabaaoeiaabaaaaacabaaaiiabpaaffkabcaaaaaeadaaapiaaaaappia
abaaoeiaabaaoejaceaaaaacabaaahiaadaaoeiaaiaaaaadacaaaboaabaaoeia
aaaaoeiaafaaaaadadaaahiaabaamjiaafaanciaaeaaaaaeadaaahiaafaamjia
abaanciaadaaoeibafaaaaadadaaahiaadaappiaadaaoeiaaiaaaaadacaaacoa
adaaoeiaaaaaoeiaaiaaaaadacaaaeoaafaaoeiaaaaaoeiaabaaaaacaaaaahia
aiaaoekaafaaaaadaeaaahiaaaaaffiabhaaoekaaeaaaaaeaaaaaliabgaakeka
aaaaaaiaaeaakeiaaeaaaaaeaaaaahiabiaaoekaaaaakkiaaaaapeiaacaaaaad
aaaaahiaaaaaoeiabjaaoekaaeaaaaaeaaaaahiaaaaaoeiabkaappkaacaaoeib
aiaaaaadadaaaboaabaaoeiaaaaaoeiaaiaaaaadadaaacoaadaaoeiaaaaaoeia
aiaaaaadadaaaeoaafaaoeiaaaaaoeiaafaaaaadaaaaapiaacaaffiabdaaoeka
aeaaaaaeaaaaapiabcaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiabeaaoeka
acaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiabfaaoekaafaaaaadabaaahia
aaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaahoaaeaaoekaaaaappia
aaaaoeiaafaaaaadaaaaapiaacaaffiaalaaoekaaeaaaaaeaaaaapiaakaaoeka
acaaaaiaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaacaakkiaaaaaoeiaacaaaaad
aaaaapiaaaaaoeiaanaaoekaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaaeaaaaaeabaaapoaafaappjacbaaeakacbaabfka
ppppaaaafdeieefceeanaaaaeaaaabaafbadaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaa
amaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacafaaaaaa
dgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
aaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaa
adaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaa
aaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkbabaaaafaaaaaaapaaaaaibcaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaa
adaaaaaaaiaaaaaaapaaaaaiccaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaa
adaaaaaaajaaaaaaapaaaaaiecaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaa
adaaaaaaakaaaaaaaaaaaaaiicaabaaaaaaaaaaadkbabaiambaaaaaaabaaaaaa
abeaaaaaaaaaiadpdcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
aaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
egiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaa
kgakbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaaagafbaaaaaaaaaaafgifcaaa
abaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaa
mnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaacaaaaaaegaobaaa
acaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalp
bkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaadaaaaaaegaobaia
ibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaa
egaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaa
acaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
fgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaa
aeaaaaaabaaaaaaiicaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaa
alaaaaaabaaaaaaibcaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaa
aiaaaaaabaaaaaaiccaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaa
ajaaaaaabaaaaaaiecaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaa
akaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaa
eeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakhcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgafbaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaadcaaaaaj
hcaabaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaaeaaaaaaegbcbaaaacaaaaaa
diaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaah
fcaabaaaadaaaaaaagacbaaaaeaaaaaafgafbaaaaaaaaaaadgaaaaafecaabaaa
aaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaaahaaaaaaegacbaaaaaaaaaaa
baaaaaaibcaabaaaabaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaadkiacaaaaeaaaaaaakaaaaaa
dcaaaaalhcaabaaaabaaaaaaagaabaiaebaaaaaaabaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaa
alaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaa
adaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
alaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaa
afaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaa
eeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
agaabaaaabaaaaaaegacbaaaaeaaaaaabaaaaaaiicaabaaaacaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaacaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaacaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaacaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahicaabaaaabaaaaaaegaobaaa
acaaaaaaegaobaaaacaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaaf
icaabaaaacaaaaaaabeaaaaaaaaaialpaaaaaaaipcaabaaaacaaaaaaegaobaaa
acaaaaaaegbobaiaebaaaaaaabaaaaaadcaaaaajpcaabaaaacaaaaaapgapbaaa
aaaaaaaaegaobaaaacaaaaaaegbobaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaak
hcaabaaaadaaaaaajgaebaaaabaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaajhcaabaaaaeaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaal
hcaabaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
egacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegacbaaaaeaaaaaapgipcaaa
adaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaa
egacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaa
abaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaacaaaaaa
egacbaaaaeaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaa
aeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
aeaaaaaaaaaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaaeaaaaaaegacbaaaaeaaaaaapgipcaaaadaaaaaa
beaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaaaeaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaa
aeaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_Time]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_Scale]
Vector 21 [_Scale]
Vector 22 [_SquashPlaneNormal]
Float 23 [_SquashAmount]
Vector 24 [_Wind]
Vector 25 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[28] = { { 0, 1, 2, -0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..25],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1, -1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MUL R0, vertex.normal.y, c[6];
MAD R2, vertex.normal.x, c[5], R0;
ADD R0.xyz, R2, c[0].x;
MAD R2, vertex.normal.z, c[7], R2;
ADD R3, R2, c[0].x;
DP4 R3.w, R3, R3;
ABS R0.w, vertex.attrib[14];
ADD R0.w, -R0, c[0].y;
MAD R0.xyz, R0, R0.w, vertex.position;
MOV R1.x, c[0].y;
DP3 R1.x, R1.x, c[12];
ADD R1.x, vertex.color, R1;
ADD R1.z, vertex.color.y, R1.x;
MUL R0.xyz, R0, c[21];
MOV R1.y, R1.x;
DP3 R1.x, R0, R1.z;
ADD R1.xy, R1, c[17].y;
MUL R1, R1.xxyy, c[26];
FRC R1, R1;
MAD R1, R1, c[0].z, c[0].w;
FRC R1, R1;
MAD R1, R1, c[0].z, -c[0].y;
ABS R1, R1;
MUL R2, -R1, c[0].z;
RSQ R3.w, R3.w;
ADD R2, R2, c[27].x;
MUL R1, R1, R1;
MUL R1, R1, R2;
MAD R2.xyz, R3.w, R3, -vertex.normal;
MAD R3.xyz, R0.w, R2, vertex.normal;
ADD R5.xy, R1.xzzw, R1.ywzw;
MUL R1.xyz, R5.y, c[24];
MUL R2.xy, vertex.color.y, R3.xzzw;
MUL R4.xyz, vertex.texcoord[1].y, R1;
MUL R2.xz, R2.xyyw, c[27].z;
MUL R1, vertex.attrib[14].y, c[6];
MUL R2.y, vertex.texcoord[1], c[27];
MAD R2.xyz, R5.xyxw, R2, R4;
MAD R0.xyz, R2, c[24].w, R0;
MAD R2.xyz, vertex.texcoord[1].x, c[24], R0;
DP3 R0.x, R2, c[22];
MAD R1, vertex.attrib[14].x, c[5], R1;
MAD R1, vertex.attrib[14].z, c[7], R1;
ADD R1, R1, c[0].x;
DP4 R0.y, R1, R1;
RSQ R0.y, R0.y;
MOV R3.w, c[0].y;
MUL R1.xyz, R0.y, R1;
ADD R0.x, R0, c[22].w;
MUL R0.xyz, R0.x, c[22];
ADD R4.xyz, -R0, R2;
MOV R1.w, c[27];
ADD R1, -vertex.attrib[14], R1;
MAD R1, R0.w, R1, vertex.attrib[14];
DP3 R2.x, R1, R1;
DP3 R0.w, R3, R3;
RSQ R2.x, R2.x;
MAD R0.xyz, R0, c[23].x, R4;
MUL R2.xyz, R2.x, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R3;
MOV R0.w, c[0].y;
MUL R3.xyz, R1.zxyw, R2.yzxw;
MAD R5.xyz, R1.yzxw, R2.zxyw, -R3;
MOV R3.xyz, c[18];
DP4 R4.z, R3, c[15];
DP4 R4.y, R3, c[14];
DP4 R4.x, R3, c[13];
MAD R4.xyz, R4, c[20].w, -R0;
MUL R3.xyz, R5, R1.w;
DP3 result.texcoord[2].y, R3, R4;
DP3 result.texcoord[2].z, R1, R4;
DP3 result.texcoord[2].x, R2, R4;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
MOV R0, c[19];
DP4 R4.z, R0, c[15];
DP4 R4.x, R0, c[13];
DP4 R4.y, R0, c[14];
DP3 result.texcoord[1].y, R4, R3;
DP3 result.texcoord[1].z, R1, R4;
DP3 result.texcoord[1].x, R4, R2;
MOV result.color.xyz, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MOV result.color.w, vertex.color;
END
# 87 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_Time]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_Scale]
Vector 21 [_SquashPlaneNormal]
Float 22 [_SquashAmount]
Vector 23 [_Wind]
Vector 24 [_MainTex_ST]
"vs_2_0
def c25, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c26, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c27, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c28, 0.10000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0, v2.y, c5
mad r2, v2.x, c4, r0
mov r1.xyz, c11
dp3 r1.x, c25.y, r1
add r1.x, v5, r1
add r0.xyz, r2, c25.x
mad r2, v2.z, c6, r2
add r3, r2, c25.x
dp4 r3.w, r3, r3
abs r0.w, v1
add r0.w, -r0, c25.y
mad r0.xyz, r0, r0.w, v0
add r1.z, v5.y, r1.x
mul r0.xyz, r0, c20
mov r1.y, r1.x
dp3 r1.x, r0, r1.z
add r1.xy, r1, c16.y
mul r1, r1.xxyy, c26
frc r1, r1
mad r1, r1, c25.z, c25.w
frc r1, r1
mad r1, r1, c27.x, c27.y
abs r1, r1
mul r2, r1, r1
mad r1, -r1, c27.x, c27.z
mul r1, r2, r1
rsq r3.w, r3.w
add r5.xy, r1.xzzw, r1.ywzw
mad r2.xyz, r3.w, r3, -v2
mad r1.xyz, r0.w, r2, v2
mul r2.xyz, r5.y, c23
mul r3.xy, v5.y, r1.xzzw
mul r4.xyz, v4.y, r2
mul r3.xz, r3.xyyw, c28.x
mul r2, v1.y, c5
mul r3.y, v4, c27.w
mad r3.xyz, r5.xyxw, r3, r4
mad r0.xyz, r3, c23.w, r0
mad r3.xyz, v4.x, c23, r0
dp3 r0.x, r3, c21
mad r2, v1.x, c4, r2
mad r2, v1.z, c6, r2
add r2, r2, c25.x
dp4 r0.y, r2, r2
rsq r0.y, r0.y
mul r2.xyz, r0.y, r2
add r0.x, r0, c21.w
mul r0.xyz, r0.x, c21
add r4.xyz, -r0, r3
mov r2.w, c27.y
add r2, -v1, r2
mad r2, r0.w, r2, v1
dp3 r1.w, r2, r2
dp3 r0.w, r1, r1
rsq r1.w, r1.w
mul r3.xyz, r1.w, r2
rsq r0.w, r0.w
mul r2.xyz, r0.w, r1
mad r0.xyz, r0, c22.x, r4
mov r0.w, c25.y
mul r1.xyz, r2.zxyw, r3.yzxw
mad r4.xyz, r2.yzxw, r3.zxyw, -r1
mov r1.w, c25.y
mov r1.xyz, c17
dp4 r5.z, r1, c14
dp4 r5.y, r1, c13
dp4 r5.x, r1, c12
mad r1.xyz, r5, c19.w, -r0
mul r4.xyz, r4, r2.w
dp3 oT2.y, r4, r1
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mov r0, c14
dp4 r5.z, c18, r0
mov r0, c13
dp4 r5.y, c18, r0
dp3 oT2.z, r2, r1
dp3 oT2.x, r3, r1
mov r1, c12
dp4 r5.x, c18, r1
dp3 oT1.y, r5, r4
dp3 oT1.z, r2, r5
dp3 oT1.x, r5, r3
mov oD0.xyz, c25.y
mad oT0.xy, v3, c24, c24.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedgkpgjdjjafhfmdblkcaoojcenkpampfgabaaaaaaieanaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcoealaaaa
eaaaabaapjacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
giaaaaacafaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaa
dgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaa
aaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaa
aaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkbabaaaafaaaaaaapaaaaaibcaabaaaabaaaaaaegbabaaa
acaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaaabaaaaaaegbabaaa
acaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaaabaaaaaaegbabaaa
acaaaaaaegiacaaaadaaaaaaakaaaaaaaaaaaaaiicaabaaaaaaaaaaadkbabaia
mbaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaabaaaaaaegacbaaa
abaaaaaapgapbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaaagafbaaa
aaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaa
acaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaap
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaa
adaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaadcaaaaba
pcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaah
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaahdcaabaaa
aaaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaa
aaaaaaaabkbabaaaaeaaaaaabaaaaaaiicaabaaaaeaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaeaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaaeaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaaeaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaaaeaaaaaa
egaobaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
hcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaadcaaaaajhcaabaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaaeaaaaaa
egbcbaaaacaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaa
mnmmmmdndiaaaaahfcaabaaaadaaaaaaagacbaaaaeaaaaaafgafbaaaaaaaaaaa
dgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaa
igaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaa
egacbaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegiccaaaaeaaaaaaakaaaaaa
egacbaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaadkiacaaa
aeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaaagaabaiaebaaaaaaabaaaaaa
egiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
agiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaa
egiocaaaadaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaaihccabaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaa
acaaaaaadkbabaaaafaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaa
egacbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaagaabaaaabaaaaaaegacbaaaaeaaaaaabaaaaaaiicaabaaa
acaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaa
acaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaa
acaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaa
acaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahicaabaaa
abaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaa
acaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaialpaaaaaaaipcaabaaa
acaaaaaaegaobaaaacaaaaaaegbobaiaebaaaaaaabaaaaaadcaaaaajpcaabaaa
acaaaaaapgapbaaaaaaaaaaaegaobaaaacaaaaaaegbobaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaajgaebaaa
acaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaaabaaaaaacgajbaaaacaaaaaa
egacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaaacaaaaaaaaaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaa
aeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaa
aeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaa
adaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaa
aaaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaeaaaaaapgipcaaaadaaaaaabeaaaaaa
egacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaabaaaaaaheccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedobncbkbcoacpjeeolkibgingdjhapfndabaaaaaaiabeaaaaaeaaaaaa
daaaaaaaciahaaaabebdaaaanmbdaaaaebgpgodjpaagaaaapaagaaaaaaacpopp
faagaaaakaaaaaaaakaaceaaaaaajmaaaaaajmaaaaaaceaaabaajmaaaaaaadaa
abaaabaaaaaaaaaaaaaaahaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
abaaaeaaabaaaeaaaaaaaaaaacaaaaaaabaaafaaaaaaaaaaadaaaaaaaeaaagaa
aaaaaaaaadaaaiaaahaaakaaaaaaaaaaadaabaaaafaabbaaaaaaaaaaaeaaafaa
abaabgaaaaaaaaaaaeaaakaaacaabhaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaaf
bjaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafbkaaapkaaaaaiadp
aaaaialpaaaaaaeaaaaaaalpfbaaaaafblaaapkaaaaaaaeaaaaaeaeamnmmmmdn
jkjjjjdofbaaaaafbmaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapja
bpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafia
afaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaaiaaaaadaaaaaiia
abaaoejaanaaoekaaiaaaaadaaaaabiaabaaoejaakaaoekaaiaaaaadaaaaacia
abaaoejaalaaoekaaiaaaaadaaaaaeiaabaaoejaamaaoekaajaaaaadaaaaaiia
aaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappiaafaaaaadaaaaahiaaaaappia
aaaaoeiaabaaaaacaaaaaiiabkaaffkacdaaaaacabaaabiaabaappjaacaaaaad
abaaabiaabaaaaibbkaaaakabcaaaaaeacaaapiaabaaaaiaaaaaoeiaabaaoeja
ceaaaaacaaaaahiaacaaoeiaabaaaaacadaaapiaafaaoekaafaaaaadabaaaoia
adaaffiabcaajakaaeaaaaaeabaaaoiabbaajakaadaaaaiaabaaoeiaaeaaaaae
abaaaoiabdaajakaadaakkiaabaaoeiaaeaaaaaeabaaaoiabeaajakaadaappia
abaaoeiaaiaaaaadacaaaboaaaaaoeiaabaapjiaaiaaaaadadaaaiiaacaaoeja
anaaoekaaiaaaaadadaaabiaacaaoejaakaaoekaaiaaaaadadaaaciaacaaoeja
alaaoekaaiaaaaadadaaaeiaacaaoejaamaaoekaajaaaaadaaaaaiiaadaaoeia
adaaoeiaahaaaaacaaaaaiiaaaaappiaaeaaaaaeacaaahiaadaaoeiaaaaappia
acaaoejbaeaaaaaeacaaahiaabaaaaiaacaaoeiaacaaoejaceaaaaacadaaahia
acaaoeiaafaaaaadaeaaahiaaaaamjiaadaanciaaeaaaaaeaeaaahiaadaamjia
aaaanciaaeaaoeibafaaaaadaeaaahiaacaappiaaeaaoeiaaiaaaaadacaaacoa
aeaaoeiaabaapjiaaiaaaaadacaaaeoaadaaoeiaabaapjiaafaaaaadaaaaaiia
afaaffjablaakkkaafaaaaadacaaafiaacaaoeiaaaaappiaafaaaaadabaaagia
acaanajaakaanakaacaaaaadafaaabiaabaakkiaabaaffiaafaaaaadabaaagia
acaanajaalaanakaacaaaaadafaaaciaabaakkiaabaaffiaafaaaaadabaaagia
acaanajaamaanakaacaaaaadafaaaeiaabaakkiaabaaffiaaeaaaaaeabaaahia
afaaoeiaabaaaaiaaaaaoejaafaaaaadabaaahiaabaaoeiabgaaoekaabaaaaac
afaaabiaaoaappkaabaaaaacafaaaciaapaappkaabaaaaacafaaaeiabaaappka
aiaaaaadaaaaaiiaafaaoeiabkaaaakaacaaaaadafaaaciaaaaappiaafaaaaja
acaaaaadaaaaaiiaafaaffiaafaaffjaaiaaaaadafaaabiaabaaoeiaaaaappia
acaaaaadafaaapiaafaafaiaadaaffkaafaaaaadafaaapiaafaaoeiabjaaoeka
bdaaaaacafaaapiaafaaoeiaaeaaaaaeafaaapiaafaaoeiabkaakkkabkaappka
bdaaaaacafaaapiaafaaoeiaaeaaaaaeafaaapiaafaaoeiabkaakkkabkaaffka
cdaaaaacafaaapiaafaaoeiaafaaaaadagaaapiaafaaoeiaafaaoeiaaeaaaaae
afaaapiaafaaoeiablaaaakbblaaffkaafaaaaadafaaapiaafaaoeiaagaaoeia
acaaaaadafaaadiaafaaoniaafaaoiiaafaaaaadagaaahiaafaaffiaabaaoeka
afaaaaadagaaahiaagaaoeiaaeaaffjaafaaaaadacaaaciaafaaffiaaeaaffja
abaaaaacafaaaeiablaappkaaeaaaaaeacaaahiaafaamiiaacaaoeiaagaaoeia
aeaaaaaeabaaahiaacaaoeiaabaappkaabaaoeiaaeaaaaaeabaaahiaaeaaaaja
abaaoekaabaaoeiaaiaaaaadaaaaaiiabhaaoekaabaaoeiaacaaaaadaaaaaiia
aaaappiabhaappkaaeaaaaaeacaaahiaaaaappiabhaaoekbabaaoeiabcaaaaae
afaaahiabiaaaakaabaaoeiaacaaoeiaabaaaaacabaaahiaaeaaoekaafaaaaad
acaaahiaabaaffiabcaaoekaaeaaaaaeabaaaliabbaakekaabaaaaiaacaakeia
aeaaaaaeabaaahiabdaaoekaabaakkiaabaapeiaacaaaaadabaaahiaabaaoeia
beaaoekaaeaaaaaeabaaahiaabaaoeiabfaappkaafaaoeibaiaaaaadadaaaboa
aaaaoeiaabaaoeiaaiaaaaadadaaacoaaeaaoeiaabaaoeiaaiaaaaadadaaaeoa
adaaoeiaabaaoeiaafaaaaadaaaaapiaafaaffiaahaaoekaaeaaaaaeaaaaapia
agaaoekaafaaaaiaaaaaoeiaaeaaaaaeaaaaapiaaiaaoekaafaakkiaaaaaoeia
acaaaaadaaaaapiaaaaaoeiaajaaoekaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaaeaaaaaeabaaapoaafaappjabmaaeaka
bmaabfkappppaaaafdeieefcoealaaaaeaaaabaapjacaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaa
aeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacafaaaaaadgaaaaagbcaabaaa
aaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaa
adaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaa
baaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaa
afaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaa
apaaaaaibcaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaa
apaaaaaiccaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaa
apaaaaaiecaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaa
aaaaaaaiicaabaaaaaaaaaaadkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadp
dcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaa
afaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
aaaaaaaipcaabaaaacaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaa
diaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldp
aaaamadomlkbefdobkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaap
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaa
acaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialp
aaaaialpaaaaialpdiaaaaajpcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaa
egaobaiaibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaea
aaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaacaaaaaaigaabaaa
acaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
adaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaa
diaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaabaaaaaai
icaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaai
bcaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaai
ccaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaai
ecaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaah
ccaabaaaaaaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaeeaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaa
fgafbaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaadcaaaaajhcaabaaaaeaaaaaa
pgapbaaaaaaaaaaaegacbaaaaeaaaaaaegbcbaaaacaaaaaadiaaaaahccaabaaa
aaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaa
agacbaaaaeaaaaaafgafbaaaaaaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaa
jkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
aaaaaaaaadaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaa
aeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaaibcaabaaa
abaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaibcaabaaa
abaaaaaaakaabaaaabaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaa
abaaaaaaagaabaiaebaaaaaaabaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaai
pccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaa
aaaaaaaaahaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaaafaaaaaabaaaaaah
bcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaabaaaaaa
egacbaaaaeaaaaaabaaaaaaiicaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaa
adaaaaaaalaaaaaabaaaaaaibcaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaa
adaaaaaaaiaaaaaabaaaaaaiccaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaa
adaaaaaaajaaaaaabaaaaaaiecaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaa
adaaaaaaakaaaaaabbaaaaahicaabaaaabaaaaaaegaobaaaacaaaaaaegaobaaa
acaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaacaaaaaa
abeaaaaaaaaaialpaaaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaaegbobaia
ebaaaaaaabaaaaaadcaaaaajpcaabaaaacaaaaaapgapbaaaaaaaaaaaegaobaaa
acaaaaaaegbobaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaa
adaaaaaacgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaakhcaabaaaadaaaaaa
jgaebaaaabaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaah
hcaabaaaadaaaaaapgapbaaaacaaaaaaegacbaaaadaaaaaadiaaaaajhcaabaaa
aeaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaaeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaa
egacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaa
egiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaa
baaaaaahcccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaah
eccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaa
adaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaajhcaabaaaaeaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
aeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
aeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaa
aeaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
aeaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaa
egacbaaaadaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
jmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_Time]
Vector 22 [_WorldSpaceCameraPos]
Vector 23 [_WorldSpaceLightPos0]
Vector 24 [unity_Scale]
Vector 25 [_Scale]
Vector 26 [_SquashPlaneNormal]
Float 27 [_SquashAmount]
Vector 28 [_Wind]
Vector 29 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[32] = { { 0, 1, 2, -0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..29],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1, -1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
MUL R0, vertex.normal.y, c[6];
MAD R2, vertex.normal.x, c[5], R0;
ADD R0.xyz, R2, c[0].x;
ABS R1.x, vertex.attrib[14].w;
ADD R4.x, -R1, c[0].y;
MAD R0.xyz, R0, R4.x, vertex.position;
MAD R2, vertex.normal.z, c[7], R2;
MOV R0.w, c[0].y;
DP3 R0.w, R0.w, c[12];
ADD R0.w, vertex.color.x, R0;
ADD R3, R2, c[0].x;
MUL R0.xyz, R0, c[25];
ADD R1.x, vertex.color.y, R0.w;
MOV R1.y, R0.w;
DP4 R0.w, R3, R3;
DP3 R1.x, R0, R1.x;
ADD R1.xy, R1, c[21].y;
MUL R1, R1.xxyy, c[30];
FRC R1, R1;
MAD R1, R1, c[0].z, c[0].w;
FRC R1, R1;
MAD R1, R1, c[0].z, -c[0].y;
ABS R1, R1;
MUL R2, -R1, c[0].z;
ADD R2, R2, c[31].x;
MUL R1, R1, R1;
MUL R1, R1, R2;
RSQ R0.w, R0.w;
MAD R2.xyz, R0.w, R3, -vertex.normal;
ADD R4.zw, R1.xyxz, R1.xyyw;
MAD R1.xyz, R4.x, R2, vertex.normal;
MUL R2.xyz, R4.w, c[28];
MUL R3.xyz, vertex.texcoord[1].y, R2;
MUL R5.xy, vertex.color.y, R1.xzzw;
MOV R0.w, c[0].y;
MUL R2.xz, R5.xyyw, c[31].z;
MUL R2.y, vertex.texcoord[1], c[31];
MAD R2.xyz, R4.zwzw, R2, R3;
MAD R0.xyz, R2, c[28].w, R0;
MAD R2.xyz, vertex.texcoord[1].x, c[28], R0;
DP3 R0.x, R2, c[26];
ADD R0.x, R0, c[26].w;
MUL R0.xyz, R0.x, c[26];
ADD R2.xyz, -R0, R2;
MAD R0.xyz, R0, c[27].x, R2;
MUL R2, vertex.attrib[14].y, c[6];
MAD R2, vertex.attrib[14].x, c[5], R2;
MAD R2, vertex.attrib[14].z, c[7], R2;
ADD R2, R2, c[0].x;
DP4 R1.w, R2, R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, R2;
DP3 R1.w, R1, R1;
MOV R2.w, c[31];
ADD R2, -vertex.attrib[14], R2;
MAD R2, R4.x, R2, vertex.attrib[14];
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
DP4 R3.w, R0, c[12];
DP4 result.texcoord[3].w, R3, c[20];
DP4 result.texcoord[3].z, R3, c[19];
DP4 result.texcoord[3].y, R3, c[18];
DP4 result.texcoord[3].x, R3, c[17];
DP3 R3.x, R2, R2;
RSQ R3.x, R3.x;
MUL R3.xyz, R3.x, R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, R1;
MUL R4.xyz, R2.zxyw, R3.yzxw;
MAD R4.xyz, R2.yzxw, R3.zxyw, -R4;
MOV R1.w, c[0].y;
MOV R1.xyz, c[22];
DP4 R5.z, R1, c[15];
DP4 R5.x, R1, c[13];
DP4 R5.y, R1, c[14];
MOV R1, c[23];
MAD R5.xyz, R5, c[24].w, -R0;
MUL R4.xyz, R4, R2.w;
DP4 R6.z, R1, c[15];
DP4 R6.x, R1, c[13];
DP4 R6.y, R1, c[14];
MAD R1.xyz, R6, c[24].w, -R0;
DP3 result.texcoord[1].y, R1, R4;
DP3 result.texcoord[2].y, R4, R5;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
DP3 result.texcoord[1].z, R2, R1;
DP3 result.texcoord[1].x, R1, R3;
DP3 result.texcoord[2].z, R2, R5;
DP3 result.texcoord[2].x, R3, R5;
MOV result.color.xyz, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[29], c[29].zwzw;
MOV result.color.w, vertex.color;
END
# 96 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_Time]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
Vector 24 [_Scale]
Vector 25 [_SquashPlaneNormal]
Float 26 [_SquashAmount]
Vector 27 [_Wind]
Vector 28 [_MainTex_ST]
"vs_2_0
def c29, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c30, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c31, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c32, 0.10000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0, v2.y, c5
mad r2, v2.x, c4, r0
add r0.xyz, r2, c29.x
abs r0.w, v1
add r4.x, -r0.w, c29.y
mov r1.xyz, c11
dp3 r0.w, c29.y, r1
mad r0.xyz, r0, r4.x, v0
mad r2, v2.z, c6, r2
add r3, r2, c29.x
dp4 r1.w, r3, r3
mul r1.xyz, r0, c24
add r0.w, v5.x, r0
add r0.x, v5.y, r0.w
mov r0.y, r0.w
dp3 r0.x, r1, r0.x
add r0.xy, r0, c20.y
mul r0, r0.xxyy, c30
frc r0, r0
mad r0, r0, c29.z, c29.w
frc r0, r0
mad r0, r0, c31.x, c31.y
abs r0, r0
mul r2, r0, r0
mad r0, -r0, c31.x, c31.z
mul r0, r2, r0
rsq r1.w, r1.w
mad r2.xyz, r1.w, r3, -v2
add r4.zw, r0.xyxz, r0.xyyw
mad r0.xyz, r4.x, r2, v2
mul r2.xyz, r4.w, c27
mul r3.xyz, v4.y, r2
mul r5.xy, v5.y, r0.xzzw
mov r1.w, c29.y
mul r2.xz, r5.xyyw, c32.x
mul r2.y, v4, c31.w
mad r2.xyz, r4.zwzw, r2, r3
mad r1.xyz, r2, c27.w, r1
mad r2.xyz, v4.x, c27, r1
dp3 r0.w, r2, c25
add r0.w, r0, c25
mul r1.xyz, r0.w, c25
add r2.xyz, -r1, r2
mad r1.xyz, r1, c26.x, r2
mul r2, v1.y, c5
mad r2, v1.x, c4, r2
mad r2, v1.z, c6, r2
add r2, r2, c29.x
dp4 r0.w, r2, r2
rsq r0.w, r0.w
mul r2.xyz, r0.w, r2
dp3 r0.w, r0, r0
mov r2.w, c31.y
add r2, -v1, r2
mad r2, r4.x, r2, v1
dp4 r3.z, r1, c10
dp4 r3.y, r1, c9
dp4 r3.x, r1, c8
dp4 r3.w, r1, c11
dp4 oT3.w, r3, c19
dp4 oT3.z, r3, c18
dp4 oT3.y, r3, c17
dp4 oT3.x, r3, c16
dp3 r3.x, r2, r2
rsq r3.x, r3.x
mul r4.xyz, r3.x, r2
rsq r0.w, r0.w
mul r3.xyz, r0.w, r0
mul r2.xyz, r3.zxyw, r4.yzxw
mov r0.w, c29.y
mov r0.xyz, c21
dp4 r5.z, r0, c14
dp4 r5.x, r0, c12
dp4 r5.y, r0, c13
mad r6.xyz, r5, c23.w, -r1
mad r2.xyz, r3.yzxw, r4.zxyw, -r2
mul r5.xyz, r2, r2.w
mov r0, c14
dp4 r7.z, c22, r0
mov r0, c13
mov r2, c12
dp4 r7.x, c22, r2
dp4 r7.y, c22, r0
mad r0.xyz, r7, c23.w, -r1
dp3 oT1.y, r0, r5
dp3 oT2.y, r5, r6
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
dp3 oT1.z, r3, r0
dp3 oT1.x, r0, r4
dp3 oT2.z, r3, r6
dp3 oT2.x, r4, r6
mov oD0.xyz, c29.y
mad oT0.xy, v3, c28, c28.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedpmfpoodkafikflifonihoplpnfndiipjabaaaaaapmaoaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefceeanaaaaeaaaabaafbadaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagiaaaaacafaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaaapaaaaaibcaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaaaaaaaaaiicaabaaaaaaaaaaa
dkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaa
agafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaa
dcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaa
dcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaa
bkaabaaaaaaaaaaabkbabaaaaeaaaaaabaaaaaaiicaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaa
aeaaaaaaegaobaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaaaaaaaaaegbcbaia
ebaaaaaaacaaaaaadcaaaaajhcaabaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaa
aeaaaaaaegbcbaaaacaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaaagacbaaaaeaaaaaafgafbaaa
aaaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
ahaaaaaaegacbaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaaagaabaiaebaaaaaa
abaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaai
hccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaf
iccabaaaacaaaaaadkbabaaaafaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaa
aeaaaaaaegacbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaaagaabaaaabaaaaaaegacbaaaaeaaaaaabaaaaaai
icaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaai
bcaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaai
ccaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaai
ecaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaah
icaabaaaabaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaialpaaaaaaai
pcaabaaaacaaaaaaegaobaaaacaaaaaaegbobaiaebaaaaaaabaaaaaadcaaaaaj
pcaabaaaacaaaaaapgapbaaaaaaaaaaaegaobaaaacaaaaaaegbobaaaabaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
aaaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaa
jgaebaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaaabaaaaaacgajbaaa
acaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaal
hcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaa
egacbaaaaeaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaah
eccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaa
adaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaajhcaabaaaaeaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
aeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
aeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaeaaaaaaegacbaaa
aeaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaa
aeaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahcccabaaaaeaaaaaa
egacbaaaadaaaaaaegacbaaaaeaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaa
aaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedeaojgclkhacbfagbljkgopakieedkcipabaaaaaajebgaaaaaeaaaaaa
daaaaaaameahaaaababfaaaanibfaaaaebgpgodjimahaaaaimahaaaaaaacpopp
piagaaaajeaaaaaaajaaceaaaaaajaaaaaaajaaaaaaaceaaabaajaaaaaaaadaa
afaaabaaaaaaaaaaaaaaalaaabaaagaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaa
abaaaeaaabaaaiaaaaaaaaaaacaaaaaaabaaajaaaaaaaaaaadaaaaaaaeaaakaa
aaaaaaaaadaaaiaaanaaaoaaaaaaaaaaaeaaafaaabaablaaaaaaaaaaaeaaakaa
acaabmaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafboaaapkamnmmpmdpamaceldp
aaaamadomlkbefdofbaaaaafbpaaapkaaaaaiadpaaaaialpaaaaaaeaaaaaaalp
fbaaaaafcaaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafcbaaapka
aaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoa
adaaoejaagaaoekaagaaookaabaaaaacaaaaabiabcaappkaabaaaaacaaaaacia
bdaappkaabaaaaacaaaaaeiabeaappkaaiaaaaadaaaaabiaaaaaoeiabpaaaaka
acaaaaadaaaaaciaaaaaaaiaafaaaajaacaaaaadaaaaaeiaaaaaffiaafaaffja
afaaaaadabaaadiaacaaoejaaoaaoekaacaaaaadabaaabiaabaaffiaabaaaaia
afaaaaadacaaadiaacaaoejaapaaoekaacaaaaadabaaaciaacaaffiaacaaaaia
afaaaaadacaaadiaacaaoejabaaaoekaacaaaaadabaaaeiaacaaffiaacaaaaia
cdaaaaacaaaaaiiaabaappjaacaaaaadaaaaaiiaaaaappibbpaaaakaaeaaaaae
abaaahiaabaaoeiaaaaappiaaaaaoejaafaaaaadabaaahiaabaaoeiablaaoeka
aiaaaaadaaaaabiaabaaoeiaaaaakkiaacaaaaadacaaapiaaaaafaiaahaaffka
afaaaaadacaaapiaacaaoeiaboaaoekabdaaaaacacaaapiaacaaoeiaaeaaaaae
acaaapiaacaaoeiabpaakkkabpaappkabdaaaaacacaaapiaacaaoeiaaeaaaaae
acaaapiaacaaoeiabpaakkkabpaaffkacdaaaaacacaaapiaacaaoeiaafaaaaad
adaaapiaacaaoeiaacaaoeiaaeaaaaaeacaaapiaacaaoeiacaaaaakbcaaaffka
afaaaaadacaaapiaacaaoeiaadaaoeiaacaaaaadaaaaadiaacaaoniaacaaoiia
afaaaaadacaaahiaaaaaffiaafaaoekaafaaaaadacaaahiaacaaoeiaaeaaffja
afaaaaadadaaaciaaaaaffiaaeaaffjaaiaaaaadaeaaaiiaacaaoejabbaaoeka
aiaaaaadaeaaabiaacaaoejaaoaaoekaaiaaaaadaeaaaciaacaaoejaapaaoeka
aiaaaaadaeaaaeiaacaaoejabaaaoekaajaaaaadaaaaaciaaeaaoeiaaeaaoeia
ahaaaaacaaaaaciaaaaaffiaaeaaaaaeaeaaahiaaeaaoeiaaaaaffiaacaaoejb
aeaaaaaeaeaaahiaaaaappiaaeaaoeiaacaaoejaafaaaaadaaaaaciaafaaffja
caaakkkaafaaaaadadaaafiaaeaaoeiaaaaaffiaceaaaaacafaaahiaaeaaoeia
abaaaaacaaaaaeiacaaappkaaeaaaaaeaaaaahiaaaaamiiaadaaoeiaacaaoeia
aeaaaaaeaaaaahiaaaaaoeiaafaappkaabaaoeiaaeaaaaaeaaaaahiaaeaaaaja
afaaoekaaaaaoeiaaiaaaaadabaaabiabmaaoekaaaaaoeiaacaaaaadabaaabia
abaaaaiabmaappkaaeaaaaaeabaaahiaabaaaaiabmaaoekbaaaaoeiabcaaaaae
acaaahiabnaaaakaaaaaoeiaabaaoeiaabaaaaacabaaapiaajaaoekaafaaaaad
aaaaahiaabaaffiabhaaoekaaeaaaaaeaaaaahiabgaaoekaabaaaaiaaaaaoeia
aeaaaaaeaaaaahiabiaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaahiabjaaoeka
abaappiaaaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabkaappkaacaaoeibaiaaaaad
abaaaiiaabaaoejabbaaoekaaiaaaaadabaaabiaabaaoejaaoaaoekaaiaaaaad
abaaaciaabaaoejaapaaoekaaiaaaaadabaaaeiaabaaoejabaaaoekaajaaaaad
abaaaiiaabaaoeiaabaaoeiaahaaaaacabaaaiiaabaappiaafaaaaadabaaahia
abaappiaabaaoeiaabaaaaacabaaaiiabpaaffkabcaaaaaeadaaapiaaaaappia
abaaoeiaabaaoejaceaaaaacabaaahiaadaaoeiaaiaaaaadacaaaboaabaaoeia
aaaaoeiaafaaaaadadaaahiaabaamjiaafaanciaaeaaaaaeadaaahiaafaamjia
abaanciaadaaoeibafaaaaadadaaahiaadaappiaadaaoeiaaiaaaaadacaaacoa
adaaoeiaaaaaoeiaaiaaaaadacaaaeoaafaaoeiaaaaaoeiaabaaaaacaaaaahia
aiaaoekaafaaaaadaeaaahiaaaaaffiabhaaoekaaeaaaaaeaaaaaliabgaakeka
aaaaaaiaaeaakeiaaeaaaaaeaaaaahiabiaaoekaaaaakkiaaaaapeiaacaaaaad
aaaaahiaaaaaoeiabjaaoekaaeaaaaaeaaaaahiaaaaaoeiabkaappkaacaaoeib
aiaaaaadadaaaboaabaaoeiaaaaaoeiaaiaaaaadadaaacoaadaaoeiaaaaaoeia
aiaaaaadadaaaeoaafaaoeiaaaaaoeiaafaaaaadaaaaapiaacaaffiabdaaoeka
aeaaaaaeaaaaapiabcaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiabeaaoeka
acaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiabfaaoekaafaaaaadabaaapia
aaaaffiaacaaoekaaeaaaaaeabaaapiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
abaaapiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaapoaaeaaoekaaaaappia
abaaoeiaafaaaaadaaaaapiaacaaffiaalaaoekaaeaaaaaeaaaaapiaakaaoeka
acaaaaiaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaacaakkiaaaaaoeiaacaaaaad
aaaaapiaaaaaoeiaanaaoekaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaaeaaaaaeabaaapoaafaappjacbaaeakacbaabfka
ppppaaaafdeieefceeanaaaaeaaaabaafbadaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaa
amaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacafaaaaaa
dgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
aaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaa
adaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaa
aaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkbabaaaafaaaaaaapaaaaaibcaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaa
adaaaaaaaiaaaaaaapaaaaaiccaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaa
adaaaaaaajaaaaaaapaaaaaiecaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaa
adaaaaaaakaaaaaaaaaaaaaiicaabaaaaaaaaaaadkbabaiambaaaaaaabaaaaaa
abeaaaaaaaaaiadpdcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
aaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
egiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaa
kgakbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaaagafbaaaaaaaaaaafgifcaaa
abaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaa
mnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaacaaaaaaegaobaaa
acaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalp
bkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaadaaaaaaegaobaia
ibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaa
egaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaa
acaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
fgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaa
aeaaaaaabaaaaaaiicaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaa
alaaaaaabaaaaaaibcaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaa
aiaaaaaabaaaaaaiccaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaa
ajaaaaaabaaaaaaiecaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaa
akaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaa
eeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakhcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgafbaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaadcaaaaaj
hcaabaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaaeaaaaaaegbcbaaaacaaaaaa
diaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaah
fcaabaaaadaaaaaaagacbaaaaeaaaaaafgafbaaaaaaaaaaadgaaaaafecaabaaa
aaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaaahaaaaaaegacbaaaaaaaaaaa
baaaaaaibcaabaaaabaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaadkiacaaaaeaaaaaaakaaaaaa
dcaaaaalhcaabaaaabaaaaaaagaabaiaebaaaaaaabaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaa
alaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaa
adaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
alaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaa
afaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaa
eeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
agaabaaaabaaaaaaegacbaaaaeaaaaaabaaaaaaiicaabaaaacaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaacaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaacaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaacaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahicaabaaaabaaaaaaegaobaaa
acaaaaaaegaobaaaacaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaaf
icaabaaaacaaaaaaabeaaaaaaaaaialpaaaaaaaipcaabaaaacaaaaaaegaobaaa
acaaaaaaegbobaiaebaaaaaaabaaaaaadcaaaaajpcaabaaaacaaaaaapgapbaaa
aaaaaaaaegaobaaaacaaaaaaegbobaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaak
hcaabaaaadaaaaaajgaebaaaabaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaajhcaabaaaaeaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaal
hcaabaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
egacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegacbaaaaeaaaaaapgipcaaa
adaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaa
egacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaa
abaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaacaaaaaa
egacbaaaaeaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaa
aeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
aeaaaaaaaaaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaaeaaaaaaegacbaaaaeaaaaaapgipcaaaadaaaaaa
beaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaaaeaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaa
aeaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaa
aaaaaaaaegaobaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_Time]
Vector 22 [_WorldSpaceCameraPos]
Vector 23 [_WorldSpaceLightPos0]
Vector 24 [unity_Scale]
Vector 25 [_Scale]
Vector 26 [_SquashPlaneNormal]
Float 27 [_SquashAmount]
Vector 28 [_Wind]
Vector 29 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[32] = { { 0, 1, 2, -0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..29],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1, -1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
MUL R0, vertex.normal.y, c[6];
MAD R2, vertex.normal.x, c[5], R0;
ADD R0.xyz, R2, c[0].x;
ABS R1.x, vertex.attrib[14].w;
ADD R4.x, -R1, c[0].y;
MAD R0.xyz, R0, R4.x, vertex.position;
MAD R2, vertex.normal.z, c[7], R2;
MOV R0.w, c[0].y;
DP3 R0.w, R0.w, c[12];
ADD R0.w, vertex.color.x, R0;
ADD R3, R2, c[0].x;
MUL R0.xyz, R0, c[25];
ADD R1.x, vertex.color.y, R0.w;
MOV R1.y, R0.w;
DP4 R0.w, R3, R3;
DP3 R1.x, R0, R1.x;
ADD R1.xy, R1, c[21].y;
MUL R1, R1.xxyy, c[30];
FRC R1, R1;
MAD R1, R1, c[0].z, c[0].w;
FRC R1, R1;
MAD R1, R1, c[0].z, -c[0].y;
ABS R1, R1;
MUL R2, -R1, c[0].z;
ADD R2, R2, c[31].x;
MUL R1, R1, R1;
MUL R1, R1, R2;
RSQ R0.w, R0.w;
ADD R4.zw, R1.xyxz, R1.xyyw;
MAD R2.xyz, R0.w, R3, -vertex.normal;
MAD R1.xyz, R4.x, R2, vertex.normal;
MUL R2.xyz, R4.w, c[28];
MUL R3.xyz, vertex.texcoord[1].y, R2;
MUL R5.xy, vertex.color.y, R1.xzzw;
MUL R2.xz, R5.xyyw, c[31].z;
MUL R2.y, vertex.texcoord[1], c[31];
MAD R2.xyz, R4.zwzw, R2, R3;
MAD R0.xyz, R2, c[28].w, R0;
MAD R0.xyz, vertex.texcoord[1].x, c[28], R0;
DP3 R0.w, R0, c[26];
ADD R0.w, R0, c[26];
MUL R2.xyz, R0.w, c[26];
ADD R0.xyz, -R2, R0;
MAD R0.xyz, R2, c[27].x, R0;
MOV R0.w, c[0].y;
MUL R2, vertex.attrib[14].y, c[6];
MAD R2, vertex.attrib[14].x, c[5], R2;
MAD R2, vertex.attrib[14].z, c[7], R2;
ADD R2, R2, c[0].x;
DP4 R1.w, R2, R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, R2;
DP3 R1.w, R1, R1;
MOV R2.w, c[31];
ADD R2, -vertex.attrib[14], R2;
MAD R2, R4.x, R2, vertex.attrib[14];
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
DP4 R3.w, R0, c[12];
DP4 result.texcoord[3].z, R3, c[19];
DP4 result.texcoord[3].y, R3, c[18];
DP4 result.texcoord[3].x, R3, c[17];
DP3 R3.x, R2, R2;
RSQ R3.x, R3.x;
MUL R3.xyz, R3.x, R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, R1;
MUL R4.xyz, R2.zxyw, R3.yzxw;
MAD R4.xyz, R2.yzxw, R3.zxyw, -R4;
MOV R1.w, c[0].y;
MOV R1.xyz, c[22];
DP4 R5.z, R1, c[15];
DP4 R5.x, R1, c[13];
DP4 R5.y, R1, c[14];
MOV R1, c[23];
MAD R5.xyz, R5, c[24].w, -R0;
MUL R4.xyz, R4, R2.w;
DP4 R6.z, R1, c[15];
DP4 R6.x, R1, c[13];
DP4 R6.y, R1, c[14];
MAD R1.xyz, R6, c[24].w, -R0;
DP3 result.texcoord[1].y, R1, R4;
DP3 result.texcoord[2].y, R4, R5;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
DP3 result.texcoord[1].z, R2, R1;
DP3 result.texcoord[1].x, R1, R3;
DP3 result.texcoord[2].z, R2, R5;
DP3 result.texcoord[2].x, R3, R5;
MOV result.color.xyz, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[29], c[29].zwzw;
MOV result.color.w, vertex.color;
END
# 95 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_Time]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
Vector 24 [_Scale]
Vector 25 [_SquashPlaneNormal]
Float 26 [_SquashAmount]
Vector 27 [_Wind]
Vector 28 [_MainTex_ST]
"vs_2_0
def c29, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c30, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c31, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c32, 0.10000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0, v2.y, c5
mad r2, v2.x, c4, r0
add r0.xyz, r2, c29.x
abs r0.w, v1
add r4.x, -r0.w, c29.y
mov r1.xyz, c11
dp3 r0.w, c29.y, r1
mad r0.xyz, r0, r4.x, v0
mad r2, v2.z, c6, r2
add r3, r2, c29.x
dp4 r1.w, r3, r3
mul r1.xyz, r0, c24
add r0.w, v5.x, r0
add r0.x, v5.y, r0.w
mov r0.y, r0.w
dp3 r0.x, r1, r0.x
add r0.xy, r0, c20.y
mul r0, r0.xxyy, c30
frc r0, r0
mad r0, r0, c29.z, c29.w
frc r0, r0
mad r0, r0, c31.x, c31.y
abs r0, r0
mul r2, r0, r0
mad r0, -r0, c31.x, c31.z
mul r0, r2, r0
rsq r1.w, r1.w
mad r2.xyz, r1.w, r3, -v2
add r4.zw, r0.xyxz, r0.xyyw
mad r0.xyz, r4.x, r2, v2
mul r2.xyz, r4.w, c27
mul r3.xyz, v4.y, r2
mul r5.xy, v5.y, r0.xzzw
mov r1.w, c29.y
mul r2.xz, r5.xyyw, c32.x
mul r2.y, v4, c31.w
mad r2.xyz, r4.zwzw, r2, r3
mad r1.xyz, r2, c27.w, r1
mad r2.xyz, v4.x, c27, r1
dp3 r0.w, r2, c25
add r0.w, r0, c25
mul r1.xyz, r0.w, c25
add r2.xyz, -r1, r2
mad r1.xyz, r1, c26.x, r2
mul r2, v1.y, c5
mad r2, v1.x, c4, r2
mad r2, v1.z, c6, r2
add r2, r2, c29.x
dp4 r0.w, r2, r2
rsq r0.w, r0.w
mul r2.xyz, r0.w, r2
dp3 r0.w, r0, r0
mov r2.w, c31.y
add r2, -v1, r2
mad r2, r4.x, r2, v1
dp4 r3.z, r1, c10
dp4 r3.y, r1, c9
dp4 r3.x, r1, c8
dp4 r3.w, r1, c11
dp4 oT3.z, r3, c18
dp4 oT3.y, r3, c17
dp4 oT3.x, r3, c16
dp3 r3.x, r2, r2
rsq r3.x, r3.x
mul r4.xyz, r3.x, r2
rsq r0.w, r0.w
mul r3.xyz, r0.w, r0
mul r2.xyz, r3.zxyw, r4.yzxw
mov r0.w, c29.y
mov r0.xyz, c21
dp4 r5.z, r0, c14
dp4 r5.x, r0, c12
dp4 r5.y, r0, c13
mad r6.xyz, r5, c23.w, -r1
mad r2.xyz, r3.yzxw, r4.zxyw, -r2
mul r5.xyz, r2, r2.w
mov r0, c14
dp4 r7.z, c22, r0
mov r0, c13
mov r2, c12
dp4 r7.x, c22, r2
dp4 r7.y, c22, r0
mad r0.xyz, r7, c23.w, -r1
dp3 oT1.y, r0, r5
dp3 oT2.y, r5, r6
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
dp3 oT1.z, r3, r0
dp3 oT1.x, r0, r4
dp3 oT2.z, r3, r6
dp3 oT2.x, r4, r6
mov oD0.xyz, c29.y
mad oT0.xy, v3, c28, c28.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedmkahdiamahnbhifedfclikcpfcogbdhjabaaaaaapmaoaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefceeanaaaaeaaaabaafbadaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacafaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaaapaaaaaibcaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaaaaaaaaaiicaabaaaaaaaaaaa
dkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaa
agafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaa
dcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaa
dcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaa
bkaabaaaaaaaaaaabkbabaaaaeaaaaaabaaaaaaiicaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaa
aeaaaaaaegaobaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaaaaaaaaaegbcbaia
ebaaaaaaacaaaaaadcaaaaajhcaabaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaa
aeaaaaaaegbcbaaaacaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaaagacbaaaaeaaaaaafgafbaaa
aaaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
ahaaaaaaegacbaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaaagaabaiaebaaaaaa
abaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaai
hccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaf
iccabaaaacaaaaaadkbabaaaafaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaa
aeaaaaaaegacbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaaagaabaaaabaaaaaaegacbaaaaeaaaaaabaaaaaai
icaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaai
bcaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaai
ccaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaai
ecaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaah
icaabaaaabaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaialpaaaaaaai
pcaabaaaacaaaaaaegaobaaaacaaaaaaegbobaiaebaaaaaaabaaaaaadcaaaaaj
pcaabaaaacaaaaaapgapbaaaaaaaaaaaegaobaaaacaaaaaaegbobaaaabaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
aaaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaa
jgaebaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaaabaaaaaacgajbaaa
acaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaal
hcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaa
egacbaaaaeaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaah
eccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaa
adaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaajhcaabaaaaeaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
aeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
aeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaeaaaaaaegacbaaa
aeaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaa
aeaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahcccabaaaaeaaaaaa
egacbaaaadaaaaaaegacbaaaaeaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaa
aaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecednjhfacjohmdpahnnodefhdadeloenonaabaaaaaajebgaaaaaeaaaaaa
daaaaaaameahaaaababfaaaanibfaaaaebgpgodjimahaaaaimahaaaaaaacpopp
piagaaaajeaaaaaaajaaceaaaaaajaaaaaaajaaaaaaaceaaabaajaaaaaaaadaa
afaaabaaaaaaaaaaaaaaalaaabaaagaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaa
abaaaeaaabaaaiaaaaaaaaaaacaaaaaaabaaajaaaaaaaaaaadaaaaaaaeaaakaa
aaaaaaaaadaaaiaaanaaaoaaaaaaaaaaaeaaafaaabaablaaaaaaaaaaaeaaakaa
acaabmaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafboaaapkamnmmpmdpamaceldp
aaaamadomlkbefdofbaaaaafbpaaapkaaaaaiadpaaaaialpaaaaaaeaaaaaaalp
fbaaaaafcaaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafcbaaapka
aaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoa
adaaoejaagaaoekaagaaookaabaaaaacaaaaabiabcaappkaabaaaaacaaaaacia
bdaappkaabaaaaacaaaaaeiabeaappkaaiaaaaadaaaaabiaaaaaoeiabpaaaaka
acaaaaadaaaaaciaaaaaaaiaafaaaajaacaaaaadaaaaaeiaaaaaffiaafaaffja
afaaaaadabaaadiaacaaoejaaoaaoekaacaaaaadabaaabiaabaaffiaabaaaaia
afaaaaadacaaadiaacaaoejaapaaoekaacaaaaadabaaaciaacaaffiaacaaaaia
afaaaaadacaaadiaacaaoejabaaaoekaacaaaaadabaaaeiaacaaffiaacaaaaia
cdaaaaacaaaaaiiaabaappjaacaaaaadaaaaaiiaaaaappibbpaaaakaaeaaaaae
abaaahiaabaaoeiaaaaappiaaaaaoejaafaaaaadabaaahiaabaaoeiablaaoeka
aiaaaaadaaaaabiaabaaoeiaaaaakkiaacaaaaadacaaapiaaaaafaiaahaaffka
afaaaaadacaaapiaacaaoeiaboaaoekabdaaaaacacaaapiaacaaoeiaaeaaaaae
acaaapiaacaaoeiabpaakkkabpaappkabdaaaaacacaaapiaacaaoeiaaeaaaaae
acaaapiaacaaoeiabpaakkkabpaaffkacdaaaaacacaaapiaacaaoeiaafaaaaad
adaaapiaacaaoeiaacaaoeiaaeaaaaaeacaaapiaacaaoeiacaaaaakbcaaaffka
afaaaaadacaaapiaacaaoeiaadaaoeiaacaaaaadaaaaadiaacaaoniaacaaoiia
afaaaaadacaaahiaaaaaffiaafaaoekaafaaaaadacaaahiaacaaoeiaaeaaffja
afaaaaadadaaaciaaaaaffiaaeaaffjaaiaaaaadaeaaaiiaacaaoejabbaaoeka
aiaaaaadaeaaabiaacaaoejaaoaaoekaaiaaaaadaeaaaciaacaaoejaapaaoeka
aiaaaaadaeaaaeiaacaaoejabaaaoekaajaaaaadaaaaaciaaeaaoeiaaeaaoeia
ahaaaaacaaaaaciaaaaaffiaaeaaaaaeaeaaahiaaeaaoeiaaaaaffiaacaaoejb
aeaaaaaeaeaaahiaaaaappiaaeaaoeiaacaaoejaafaaaaadaaaaaciaafaaffja
caaakkkaafaaaaadadaaafiaaeaaoeiaaaaaffiaceaaaaacafaaahiaaeaaoeia
abaaaaacaaaaaeiacaaappkaaeaaaaaeaaaaahiaaaaamiiaadaaoeiaacaaoeia
aeaaaaaeaaaaahiaaaaaoeiaafaappkaabaaoeiaaeaaaaaeaaaaahiaaeaaaaja
afaaoekaaaaaoeiaaiaaaaadabaaabiabmaaoekaaaaaoeiaacaaaaadabaaabia
abaaaaiabmaappkaaeaaaaaeabaaahiaabaaaaiabmaaoekbaaaaoeiabcaaaaae
acaaahiabnaaaakaaaaaoeiaabaaoeiaabaaaaacabaaapiaajaaoekaafaaaaad
aaaaahiaabaaffiabhaaoekaaeaaaaaeaaaaahiabgaaoekaabaaaaiaaaaaoeia
aeaaaaaeaaaaahiabiaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaahiabjaaoeka
abaappiaaaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabkaappkaacaaoeibaiaaaaad
abaaaiiaabaaoejabbaaoekaaiaaaaadabaaabiaabaaoejaaoaaoekaaiaaaaad
abaaaciaabaaoejaapaaoekaaiaaaaadabaaaeiaabaaoejabaaaoekaajaaaaad
abaaaiiaabaaoeiaabaaoeiaahaaaaacabaaaiiaabaappiaafaaaaadabaaahia
abaappiaabaaoeiaabaaaaacabaaaiiabpaaffkabcaaaaaeadaaapiaaaaappia
abaaoeiaabaaoejaceaaaaacabaaahiaadaaoeiaaiaaaaadacaaaboaabaaoeia
aaaaoeiaafaaaaadadaaahiaabaamjiaafaanciaaeaaaaaeadaaahiaafaamjia
abaanciaadaaoeibafaaaaadadaaahiaadaappiaadaaoeiaaiaaaaadacaaacoa
adaaoeiaaaaaoeiaaiaaaaadacaaaeoaafaaoeiaaaaaoeiaabaaaaacaaaaahia
aiaaoekaafaaaaadaeaaahiaaaaaffiabhaaoekaaeaaaaaeaaaaaliabgaakeka
aaaaaaiaaeaakeiaaeaaaaaeaaaaahiabiaaoekaaaaakkiaaaaapeiaacaaaaad
aaaaahiaaaaaoeiabjaaoekaaeaaaaaeaaaaahiaaaaaoeiabkaappkaacaaoeib
aiaaaaadadaaaboaabaaoeiaaaaaoeiaaiaaaaadadaaacoaadaaoeiaaaaaoeia
aiaaaaadadaaaeoaafaaoeiaaaaaoeiaafaaaaadaaaaapiaacaaffiabdaaoeka
aeaaaaaeaaaaapiabcaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiabeaaoeka
acaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiabfaaoekaafaaaaadabaaahia
aaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaahoaaeaaoekaaaaappia
aaaaoeiaafaaaaadaaaaapiaacaaffiaalaaoekaaeaaaaaeaaaaapiaakaaoeka
acaaaaiaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaacaakkiaaaaaoeiaacaaaaad
aaaaapiaaaaaoeiaanaaoekaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaaeaaaaaeabaaapoaafaappjacbaaeakacbaabfka
ppppaaaafdeieefceeanaaaaeaaaabaafbadaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaa
amaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacafaaaaaa
dgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
aaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaa
adaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaa
aaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkbabaaaafaaaaaaapaaaaaibcaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaa
adaaaaaaaiaaaaaaapaaaaaiccaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaa
adaaaaaaajaaaaaaapaaaaaiecaabaaaabaaaaaaegbabaaaacaaaaaaegiacaaa
adaaaaaaakaaaaaaaaaaaaaiicaabaaaaaaaaaaadkbabaiambaaaaaaabaaaaaa
abeaaaaaaaaaiadpdcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
aaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
egiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaa
kgakbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaaagafbaaaaaaaaaaafgifcaaa
abaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaa
mnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaacaaaaaaegaobaaa
acaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalp
bkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaadaaaaaaegaobaia
ibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaa
egaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaa
acaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
fgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaa
aeaaaaaabaaaaaaiicaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaa
alaaaaaabaaaaaaibcaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaa
aiaaaaaabaaaaaaiccaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaa
ajaaaaaabaaaaaaiecaabaaaaeaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaa
akaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaa
eeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakhcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgafbaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaadcaaaaaj
hcaabaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaaeaaaaaaegbcbaaaacaaaaaa
diaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaah
fcaabaaaadaaaaaaagacbaaaaeaaaaaafgafbaaaaaaaaaaadgaaaaafecaabaaa
aaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaaahaaaaaaegacbaaaaaaaaaaa
baaaaaaibcaabaaaabaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaadkiacaaaaeaaaaaaakaaaaaa
dcaaaaalhcaabaaaabaaaaaaagaabaiaebaaaaaaabaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaa
alaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaa
adaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
alaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaa
afaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaa
eeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
agaabaaaabaaaaaaegacbaaaaeaaaaaabaaaaaaiicaabaaaacaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaacaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaacaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaacaaaaaaegbcbaaa
abaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahicaabaaaabaaaaaaegaobaaa
acaaaaaaegaobaaaacaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaaf
icaabaaaacaaaaaaabeaaaaaaaaaialpaaaaaaaipcaabaaaacaaaaaaegaobaaa
acaaaaaaegbobaiaebaaaaaaabaaaaaadcaaaaajpcaabaaaacaaaaaapgapbaaa
aaaaaaaaegaobaaaacaaaaaaegbobaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaak
hcaabaaaadaaaaaajgaebaaaabaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaajhcaabaaaaeaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaal
hcaabaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
egacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegacbaaaaeaaaaaapgipcaaa
adaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaa
egacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaa
abaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaacaaaaaa
egacbaaaaeaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaa
aeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
aeaaaaaaaaaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaaeaaaaaaegacbaaaaeaaaaaapgipcaaaadaaaaaa
beaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaaaeaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaa
aeaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_Time]
Vector 22 [_WorldSpaceCameraPos]
Vector 23 [_WorldSpaceLightPos0]
Vector 24 [unity_Scale]
Vector 25 [_Scale]
Vector 26 [_SquashPlaneNormal]
Float 27 [_SquashAmount]
Vector 28 [_Wind]
Vector 29 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[32] = { { 0, 1, 2, -0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..29],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1, -1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MUL R0, vertex.normal.y, c[6];
MAD R2, vertex.normal.x, c[5], R0;
ADD R0.xyz, R2, c[0].x;
ABS R1.x, vertex.attrib[14].w;
ADD R4.w, -R1.x, c[0].y;
MAD R2, vertex.normal.z, c[7], R2;
MOV R0.w, c[0].y;
DP3 R0.w, R0.w, c[12];
ADD R0.w, vertex.color.x, R0;
MAD R0.xyz, R0, R4.w, vertex.position;
ADD R3, R2, c[0].x;
MUL R0.xyz, R0, c[25];
ADD R1.x, vertex.color.y, R0.w;
MOV R1.y, R0.w;
DP4 R0.w, R3, R3;
DP3 R1.x, R0, R1.x;
ADD R1.xy, R1, c[21].y;
MUL R1, R1.xxyy, c[30];
FRC R1, R1;
MAD R1, R1, c[0].z, c[0].w;
FRC R1, R1;
MAD R1, R1, c[0].z, -c[0].y;
ABS R1, R1;
MUL R2, -R1, c[0].z;
ADD R2, R2, c[31].x;
MUL R1, R1, R1;
MUL R1, R1, R2;
RSQ R0.w, R0.w;
MAD R2.xyz, R0.w, R3, -vertex.normal;
ADD R3.xy, R1.xzzw, R1.ywzw;
MAD R4.xyz, R4.w, R2, vertex.normal;
MUL R1.xyz, R3.y, c[28];
MUL R2.xyz, vertex.texcoord[1].y, R1;
MUL R3.zw, vertex.color.y, R4.xyxz;
MOV R1.w, c[0].y;
MUL R1.xz, R3.zyww, c[31].z;
MUL R1.y, vertex.texcoord[1], c[31];
MAD R1.xyz, R3.xyxw, R1, R2;
DP3 R3.x, R4, R4;
MAD R0.xyz, R1, c[28].w, R0;
MAD R0.xyz, vertex.texcoord[1].x, c[28], R0;
DP3 R0.w, R0, c[26];
ADD R0.w, R0, c[26];
MUL R1.xyz, R0.w, c[26];
ADD R2.xyz, -R1, R0;
MAD R1.xyz, R1, c[27].x, R2;
MUL R0, vertex.attrib[14].y, c[6];
MAD R0, vertex.attrib[14].x, c[5], R0;
MAD R2, vertex.attrib[14].z, c[7], R0;
ADD R2, R2, c[0].x;
DP4 R0.x, R2, R2;
RSQ R0.x, R0.x;
MUL R2.xyz, R0.x, R2;
MOV R2.w, c[31];
ADD R2, -vertex.attrib[14], R2;
MAD R2, R4.w, R2, vertex.attrib[14];
DP3 R3.y, R2, R2;
DP4 R0.w, R1, c[12];
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
DP4 result.texcoord[3].y, R0, c[18];
DP4 result.texcoord[3].x, R0, c[17];
MOV R0.xyz, c[22];
MOV R0.w, c[0].y;
RSQ R3.w, R3.x;
RSQ R3.y, R3.y;
MUL R3.xyz, R3.y, R2;
MUL R2.xyz, R3.w, R4;
MUL R4.xyz, R2.zxyw, R3.yzxw;
MAD R4.xyz, R2.yzxw, R3.zxyw, -R4;
MUL R4.xyz, R4, R2.w;
DP4 R5.z, R0, c[15];
DP4 R5.x, R0, c[13];
DP4 R5.y, R0, c[14];
MAD R0.xyz, R5, c[24].w, -R1;
DP3 result.texcoord[2].y, R4, R0;
DP3 result.texcoord[2].z, R2, R0;
DP3 result.texcoord[2].x, R3, R0;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
MOV R1, c[23];
DP4 R0.z, R1, c[15];
DP4 R0.x, R1, c[13];
DP4 R0.y, R1, c[14];
DP3 result.texcoord[1].y, R0, R4;
DP3 result.texcoord[1].z, R2, R0;
DP3 result.texcoord[1].x, R0, R3;
MOV result.color.xyz, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[29], c[29].zwzw;
MOV result.color.w, vertex.color;
END
# 93 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_Time]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
Vector 24 [_Scale]
Vector 25 [_SquashPlaneNormal]
Float 26 [_SquashAmount]
Vector 27 [_Wind]
Vector 28 [_MainTex_ST]
"vs_2_0
def c29, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c30, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c31, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c32, 0.10000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0, v2.y, c5
mad r2, v2.x, c4, r0
add r0.xyz, r2, c29.x
abs r0.w, v1
add r4.w, -r0, c29.y
mov r1.xyz, c11
dp3 r0.w, c29.y, r1
add r0.w, v5.x, r0
mad r2, v2.z, c6, r2
mad r0.xyz, r0, r4.w, v0
add r3, r2, c29.x
mul r0.xyz, r0, c24
add r1.x, v5.y, r0.w
mov r1.y, r0.w
dp4 r0.w, r3, r3
dp3 r1.x, r0, r1.x
add r1.xy, r1, c20.y
mul r1, r1.xxyy, c30
frc r1, r1
mad r1, r1, c29.z, c29.w
frc r1, r1
mad r1, r1, c31.x, c31.y
abs r1, r1
mul r2, r1, r1
mad r1, -r1, c31.x, c31.z
mul r1, r2, r1
rsq r0.w, r0.w
mad r2.xyz, r0.w, r3, -v2
add r3.xy, r1.xzzw, r1.ywzw
mad r4.xyz, r4.w, r2, v2
mul r1.xyz, r3.y, c27
mul r2.xyz, v4.y, r1
mul r3.zw, v5.y, r4.xyxz
mov r0.w, c29.y
mul r1.xz, r3.zyww, c32.x
mul r1.y, v4, c31.w
mad r1.xyz, r3.xyxw, r1, r2
mad r0.xyz, r1, c27.w, r0
mad r1.xyz, v4.x, c27, r0
dp3 r3.x, r4, r4
dp3 r0.x, r1, c25
add r0.x, r0, c25.w
mul r0.xyz, r0.x, c25
add r2.xyz, -r0, r1
mad r0.xyz, r0, c26.x, r2
mul r1, v1.y, c5
mad r1, v1.x, c4, r1
mad r2, v1.z, c6, r1
add r2, r2, c29.x
dp4 r1.x, r2, r2
rsq r1.x, r1.x
mul r2.xyz, r1.x, r2
mov r2.w, c31.y
add r2, -v1, r2
mad r2, r4.w, r2, v1
dp3 r3.y, r2, r2
dp4 r1.w, r0, c11
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
dp4 oT3.y, r1, c17
dp4 oT3.x, r1, c16
mov r1.w, c29.y
mov r1.xyz, c21
dp4 r5.z, r1, c14
dp4 r5.x, r1, c12
dp4 r5.y, r1, c13
mad r1.xyz, r5, c23.w, -r0
rsq r3.w, r3.x
rsq r3.y, r3.y
mul r3.xyz, r3.y, r2
mul r2.xyz, r3.w, r4
mul r4.xyz, r2.zxyw, r3.yzxw
mad r4.xyz, r2.yzxw, r3.zxyw, -r4
mul r4.xyz, r4, r2.w
dp3 oT2.y, r4, r1
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mov r0, c14
dp4 r5.z, c22, r0
mov r0, c13
dp4 r5.y, c22, r0
dp3 oT2.z, r2, r1
dp3 oT2.x, r3, r1
mov r1, c12
dp4 r5.x, c22, r1
dp3 oT1.y, r5, r4
dp3 oT1.z, r2, r5
dp3 oT1.x, r5, r3
mov oD0.xyz, c29.y
mad oT0.xy, v3, c28, c28.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedbmihafogffnjidbeaeopnmljbmgdidinabaaaaaanaaoaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcbianaaaaeaaaabaaegadaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacafaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaaapaaaaaibcaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaaaaaaaaaiicaabaaaaaaaaaaa
dkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaa
agafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaa
dcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaa
dcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaa
bkaabaaaaaaaaaaabkbabaaaaeaaaaaabaaaaaaiicaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaa
aeaaaaaaegaobaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaaaaaaaaaegbcbaia
ebaaaaaaacaaaaaadcaaaaajhcaabaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaa
aeaaaaaaegbcbaaaacaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaaagacbaaaaeaaaaaafgafbaaa
aaaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
ahaaaaaaegacbaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaaagaabaiaebaaaaaa
abaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaapaaaaaa
diaaaaaidcaabaaaacaaaaaafgafbaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaa
dcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaabaaaaaa
egaabaaaacaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaafaaaaaa
kgakbaaaabaaaaaaegaabaaaabaaaaaadcaaaaakmccabaaaabaaaaaaagiecaaa
aaaaaaaaagaaaaaapgapbaaaabaaaaaaagaebaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaa
alaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaaafaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaaiicaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaa
alaaaaaabaaaaaaibcaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaa
aiaaaaaabaaaaaaiccaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaa
ajaaaaaabaaaaaaiecaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaa
akaaaaaabbaaaaahicaabaaaabaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaa
eeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaa
aaaaialpaaaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaaegbobaiaebaaaaaa
abaaaaaadcaaaaajpcaabaaaacaaaaaapgapbaaaaaaaaaaaegaobaaaacaaaaaa
egbobaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
acaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaa
cgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaa
abaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaa
adaaaaaapgapbaaaacaaaaaaegacbaaaadaaaaaadiaaaaajhcaabaaaaeaaaaaa
fgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
aeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaa
aeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaah
cccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaa
adaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaaadaaaaaa
egacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaa
dcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaeaaaaaaaaaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaeaaaaaa
pgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaa
aeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaaeaaaaaa
egacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaa
adaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefieceddmpjmofnifoiolidbmloiefecjefehddabaaaaaafebgaaaaaeaaaaaa
daaaaaaalaahaaaanabeaaaajibfaaaaebgpgodjhiahaaaahiahaaaaaaacpopp
oeagaaaajeaaaaaaajaaceaaaaaajaaaaaaajaaaaaaaceaaabaajaaaaaaaadaa
afaaabaaaaaaaaaaaaaaalaaabaaagaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaa
abaaaeaaabaaaiaaaaaaaaaaacaaaaaaabaaajaaaaaaaaaaadaaaaaaaeaaakaa
aaaaaaaaadaaaiaaanaaaoaaaaaaaaaaaeaaafaaabaablaaaaaaaaaaaeaaakaa
acaabmaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafboaaapkamnmmpmdpamaceldp
aaaamadomlkbefdofbaaaaafbpaaapkaaaaaiadpaaaaialpaaaaaaeaaaaaaalp
fbaaaaafcaaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafcbaaapka
aaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoa
adaaoejaagaaoekaagaaookaaiaaaaadaaaaaiiaabaaoejabbaaoekaaiaaaaad
aaaaabiaabaaoejaaoaaoekaaiaaaaadaaaaaciaabaaoejaapaaoekaaiaaaaad
aaaaaeiaabaaoejabaaaoekaajaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaac
aaaaaiiaaaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaacaaaaaiia
bpaaffkacdaaaaacabaaabiaabaappjaacaaaaadabaaabiaabaaaaibbpaaaaka
bcaaaaaeacaaapiaabaaaaiaaaaaoeiaabaaoejaceaaaaacaaaaahiaacaaoeia
abaaaaacadaaapiaajaaoekaafaaaaadabaaaoiaadaaffiabhaajakaaeaaaaae
abaaaoiabgaajakaadaaaaiaabaaoeiaaeaaaaaeabaaaoiabiaajakaadaakkia
abaaoeiaaeaaaaaeabaaaoiabjaajakaadaappiaabaaoeiaaiaaaaadacaaaboa
aaaaoeiaabaapjiaaiaaaaadadaaaiiaacaaoejabbaaoekaaiaaaaadadaaabia
acaaoejaaoaaoekaaiaaaaadadaaaciaacaaoejaapaaoekaaiaaaaadadaaaeia
acaaoejabaaaoekaajaaaaadaaaaaiiaadaaoeiaadaaoeiaahaaaaacaaaaaiia
aaaappiaaeaaaaaeacaaahiaadaaoeiaaaaappiaacaaoejbaeaaaaaeacaaahia
abaaaaiaacaaoeiaacaaoejaceaaaaacadaaahiaacaaoeiaafaaaaadaeaaahia
aaaamjiaadaanciaaeaaaaaeaeaaahiaadaamjiaaaaanciaaeaaoeibafaaaaad
aeaaahiaacaappiaaeaaoeiaaiaaaaadacaaacoaaeaaoeiaabaapjiaaiaaaaad
acaaaeoaadaaoeiaabaapjiaafaaaaadaaaaaiiaafaaffjacaaakkkaafaaaaad
acaaafiaacaaoeiaaaaappiaafaaaaadabaaagiaacaanajaaoaanakaacaaaaad
afaaabiaabaakkiaabaaffiaafaaaaadabaaagiaacaanajaapaanakaacaaaaad
afaaaciaabaakkiaabaaffiaafaaaaadabaaagiaacaanajabaaanakaacaaaaad
afaaaeiaabaakkiaabaaffiaaeaaaaaeabaaahiaafaaoeiaabaaaaiaaaaaoeja
afaaaaadabaaahiaabaaoeiablaaoekaabaaaaacafaaabiabcaappkaabaaaaac
afaaaciabdaappkaabaaaaacafaaaeiabeaappkaaiaaaaadaaaaaiiaafaaoeia
bpaaaakaacaaaaadafaaaciaaaaappiaafaaaajaacaaaaadaaaaaiiaafaaffia
afaaffjaaiaaaaadafaaabiaabaaoeiaaaaappiaacaaaaadafaaapiaafaafaia
ahaaffkaafaaaaadafaaapiaafaaoeiaboaaoekabdaaaaacafaaapiaafaaoeia
aeaaaaaeafaaapiaafaaoeiabpaakkkabpaappkabdaaaaacafaaapiaafaaoeia
aeaaaaaeafaaapiaafaaoeiabpaakkkabpaaffkacdaaaaacafaaapiaafaaoeia
afaaaaadagaaapiaafaaoeiaafaaoeiaaeaaaaaeafaaapiaafaaoeiacaaaaakb
caaaffkaafaaaaadafaaapiaafaaoeiaagaaoeiaacaaaaadafaaadiaafaaonia
afaaoiiaafaaaaadagaaahiaafaaffiaafaaoekaafaaaaadagaaahiaagaaoeia
aeaaffjaafaaaaadacaaaciaafaaffiaaeaaffjaabaaaaacafaaaeiacaaappka
aeaaaaaeacaaahiaafaamiiaacaaoeiaagaaoeiaaeaaaaaeabaaahiaacaaoeia
afaappkaabaaoeiaaeaaaaaeabaaahiaaeaaaajaafaaoekaabaaoeiaaiaaaaad
aaaaaiiabmaaoekaabaaoeiaacaaaaadaaaaaiiaaaaappiabmaappkaaeaaaaae
acaaahiaaaaappiabmaaoekbabaaoeiabcaaaaaeafaaahiabnaaaakaabaaoeia
acaaoeiaabaaaaacabaaahiaaiaaoekaafaaaaadacaaahiaabaaffiabhaaoeka
aeaaaaaeabaaaliabgaakekaabaaaaiaacaakeiaaeaaaaaeabaaahiabiaaoeka
abaakkiaabaapeiaacaaaaadabaaahiaabaaoeiabjaaoekaaeaaaaaeabaaahia
abaaoeiabkaappkaafaaoeibaiaaaaadadaaaboaaaaaoeiaabaaoeiaaiaaaaad
adaaacoaaeaaoeiaabaaoeiaaiaaaaadadaaaeoaadaaoeiaabaaoeiaafaaaaad
aaaaapiaafaaffiabdaaoekaaeaaaaaeaaaaapiabcaaoekaafaaaaiaaaaaoeia
aeaaaaaeaaaaapiabeaaoekaafaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeia
bfaaoekaafaaaaadabaaadiaaaaaffiaacaaobkaaeaaaaaeaaaaadiaabaaobka
aaaaaaiaabaaoeiaaeaaaaaeaaaaadiaadaaobkaaaaakkiaaaaaoeiaaeaaaaae
aaaaamoaaeaabekaaaaappiaaaaaeeiaafaaaaadaaaaapiaafaaffiaalaaoeka
aeaaaaaeaaaaapiaakaaoekaafaaaaiaaaaaoeiaaeaaaaaeaaaaapiaamaaoeka
afaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiaanaaoekaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaaeaaaaaeabaaapoa
afaappjacbaaeakacbaabfkappppaaaafdeieefcbianaaaaeaaaabaaegadaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacafaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaaapaaaaaibcaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaaabaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaaaaaaaaaiicaabaaaaaaaaaaa
dkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaa
agafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaa
dcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaa
dcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaa
bkaabaaaaaaaaaaabkbabaaaaeaaaaaabaaaaaaiicaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiccaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiecaabaaaaeaaaaaaegbcbaaa
acaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaa
aeaaaaaaegaobaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaaaaaaaaaegbcbaia
ebaaaaaaacaaaaaadcaaaaajhcaabaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaa
aeaaaaaaegbcbaaaacaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaaagacbaaaaeaaaaaafgafbaaa
aaaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
ahaaaaaaegacbaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaaagaabaiaebaaaaaa
abaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaapaaaaaa
diaaaaaidcaabaaaacaaaaaafgafbaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaa
dcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaabaaaaaa
egaabaaaacaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaafaaaaaa
kgakbaaaabaaaaaaegaabaaaabaaaaaadcaaaaakmccabaaaabaaaaaaagiecaaa
aaaaaaaaagaaaaaapgapbaaaabaaaaaaagaebaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaa
alaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaaafaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaaiicaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaa
alaaaaaabaaaaaaibcaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaa
aiaaaaaabaaaaaaiccaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaa
ajaaaaaabaaaaaaiecaabaaaacaaaaaaegbcbaaaabaaaaaaegiccaaaadaaaaaa
akaaaaaabbaaaaahicaabaaaabaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaa
eeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaa
aaaaialpaaaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaaegbobaiaebaaaaaa
abaaaaaadcaaaaajpcaabaaaacaaaaaapgapbaaaaaaaaaaaegaobaaaacaaaaaa
egbobaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
acaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaa
cgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaa
abaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaa
adaaaaaapgapbaaaacaaaaaaegacbaaaadaaaaaadiaaaaajhcaabaaaaeaaaaaa
fgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
aeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaa
aeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaah
cccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaa
adaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaaadaaaaaa
egacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaa
dcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaeaaaaaaaaaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaeaaaaaa
pgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaa
aeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaaeaaaaaa
egacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaa
adaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_TranslucencyColor]
Float 3 [_TranslucencyViewDependency]
Float 4 [_Shininess]
Float 5 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 1
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 3
SetTexture 4 [_LightTexture0] 2D 4
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 0.60009766, 0.39990234 },
		{ 0, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R3.yw, fragment.texcoord[0], texture[3], 2D;
TEX R1.w, fragment.texcoord[0], texture[2], 2D;
MAD R1.xy, R3.wyzw, c[6].x, -c[6].y;
MUL R3.xy, R1, R1;
SLT R0.y, R2.w, c[5].x;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
ADD_SAT R0.z, R3.x, R3.y;
ADD R0.z, -R0, c[6].y;
RSQ R0.z, R0.z;
RCP R1.z, R0.z;
MOV result.color.w, R2;
TEX R0.w, R0.x, texture[4], 2D;
KIL -R0.y;
TEX R0.x, fragment.texcoord[0], texture[1], 2D;
DP3 R0.y, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.y, R0.y;
MUL R4.xyz, R0.y, fragment.texcoord[1];
DP3 R3.w, R4, R1;
MOV_SAT R0.z, -R3.w;
DP3 R0.y, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.y, R0.y;
MUL R3.xyz, R0.y, fragment.texcoord[2];
DP3_SAT R0.y, R3, -R4;
ADD R3.xyz, R3, R4;
ADD R0.y, R0, -R0.z;
MAD R0.y, R0, c[3].x, R0.z;
DP3 R4.x, R3, R3;
MUL R0.x, R0.y, R0;
MAD R3.w, R3, c[6].z, c[6];
RSQ R4.x, R4.x;
MUL R3.xyz, R4.x, R3;
DP3 R1.x, R1, R3;
MAX R3.w, R3, c[7].x;
MUL R0.xyz, R0.x, c[2];
MAD R0.xyz, R0, c[6].x, R3.w;
MOV R3.w, c[7].y;
MUL R1.y, R3.w, c[4].x;
MAX R1.x, R1, c[7];
POW R3.x, R1.x, R1.y;
MUL R1.xyz, R2, c[1];
MUL R1.xyz, R1, fragment.color.primary.w;
MUL R1.w, R3.x, R1;
MUL R0.xyz, R1, R0;
MAD R0.xyz, R0, c[0], R1.w;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[6].x;
END
# 47 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_TranslucencyColor]
Float 3 [_TranslucencyViewDependency]
Float 4 [_Shininess]
Float 5 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 1
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 3
SetTexture 4 [_LightTexture0] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c6, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c7, 0.60009766, 0.39990234, 128.00000000, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r4, t0, s2
texld r3, t0, s3
texld r0, t0, s0
mov r3.x, r3.w
mad_pp r8.xy, r3, c6.z, c6.w
add_pp r1.x, r0.w, -c5
cmp r1.x, r1, c6, c6.y
mov_pp r1, -r1.x
dp3 r2.x, t3, t3
mul_pp r3.xy, r8, r8
dp3_pp r4.x, t1, t1
dp3_pp r5.x, t2, t2
rsq_pp r4.x, r4.x
mul_pp r4.xyz, r4.x, t1
rsq_pp r5.x, r5.x
mul_pp r5.xyz, r5.x, t2
add_pp r6.xyz, r5, r4
dp3_pp r7.x, r6, r6
rsq_pp r7.x, r7.x
add_pp_sat r3.x, r3, r3.y
add_pp r3.x, -r3, c6.y
rsq_pp r3.x, r3.x
rcp_pp r8.z, r3.x
mul_pp r6.xyz, r7.x, r6
mov_pp r3.x, c4
dp3_pp r6.x, r8, r6
mul_pp r0.xyz, r0, c1
mov r2.xy, r2.x
mul_pp r3.x, c7.z, r3
max_pp r6.x, r6, c6
pow_pp r7.y, r6.x, r3.x
dp3_pp r6.x, r4, r8
mov_pp r3.x, r7.y
mov_pp_sat r7.x, -r6
dp3_pp_sat r4.x, r5, -r4
add_pp r4.x, r4, -r7
mad_pp r4.x, r4, c3, r7
mul_pp r3.x, r3, r4.w
mul_pp r0.xyz, r0, v0.w
texkill r1.xyzw
texld r1, r2, s4
texld r2, t0, s1
mul_pp r2.x, r4, r2
mad_pp r4.x, r6, c7, c7.y
mul_pp r2.xyz, r2.x, c2
max_pp r4.x, r4, c6
mad_pp r2.xyz, r2, c6.z, r4.x
mul_pp r0.xyz, r0, r2
mad_pp r0.xyz, r0, c0, r3.x
mul_pp r0.xyz, r1.x, r0
mul_pp r0.xyz, r0, c6.z
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_TranslucencyMap] 2D 4
SetTexture 2 [_GlossMap] 2D 3
SetTexture 3 [_BumpMap] 2D 2
SetTexture 4 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 128 [_Color]
Vector 144 [_TranslucencyColor] 3
Float 156 [_TranslucencyViewDependency]
Float 164 [_Shininess]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecednbmfkilabnimiphgbjhbkmjcpfcllbahabaaaaaaleahaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
jaagaaaaeaaaaaaakeabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacafaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaaj
bcaabaaaabaaaaaadkaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaamaaaaaa
dbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaead
akaabaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaaagaabaaaabaaaaaaegbcbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaa
dcaaaaajhcaabaaaadaaaaaaegbcbaaaadaaaaaapgapbaaaabaaaaaaegacbaaa
abaaaaaabacaaaaibcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaiaebaaaaaa
acaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaabaaaaaaeghobaaaadaaaaaa
aagabaaaacaaaaaadcaaaaapdcaabaaaaeaaaaaahgapbaaaaeaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahccaabaaaabaaaaaaegaabaaaaeaaaaaaegaabaaaaeaaaaaa
ddaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaai
ccaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaaeaaaaaabkaabaaaabaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaa
aeaaaaaaegacbaaaacaaaaaadgcaaaagecaabaaaabaaaaaabkaabaiaebaaaaaa
abaaaaaadcaaaaajccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaajkjjbjdp
abeaaaaamnmmmmdodeaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaa
aaaaaaaaaaaaaaaibcaabaaaabaaaaaackaabaiaebaaaaaaabaaaaaaakaabaaa
abaaaaaadcaaaaakbcaabaaaabaaaaaadkiacaaaaaaaaaaaajaaaaaaakaabaaa
abaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaeaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaaakaabaaaacaaaaaadiaaaaaincaabaaaabaaaaaaagaabaaaabaaaaaa
agijcaaaaaaaaaaaajaaaaaadcaaaaamhcaabaaaabaaaaaaigadbaaaabaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaaafgafbaaaabaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaaiaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgbpbaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaa
adaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaeaaaaaaegacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaaaaaaaaed
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaadiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaapgapbaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
pgapbaaaaaaaaaaaeghobaaaaeaaaaaaaagabaaaaaaaaaaaaaaaaaahicaabaaa
aaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_TranslucencyMap] 2D 4
SetTexture 2 [_GlossMap] 2D 3
SetTexture 3 [_BumpMap] 2D 2
SetTexture 4 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 128 [_Color]
Vector 144 [_TranslucencyColor] 3
Float 156 [_TranslucencyViewDependency]
Float 164 [_Shininess]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedndhlkgadplnoehajjhohbncjnohbpnfhabaaaaaahaalaaaaaeaaaaaa
daaaaaaaoiadaaaaiaakaaaadmalaaaaebgpgodjlaadaaaalaadaaaaaaacpppp
feadaaaafmaaaaaaadaadiaaaaaafmaaaaaafmaaafaaceaaaaaafmaaaeaaaaaa
aaababaaadacacaaacadadaaabaeaeaaaaaaabaaabaaaaaaaaaaaaaaaaaaaiaa
adaaabaaaaaaaaaaaaaaamaaabaaaeaaaaaaaaaaaaacppppfbaaaaafafaaapka
aaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafagaaapkaaaaaaaedjkjjbjdp
mnmmmmdoaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacpla
bpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaia
aeaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaac
aaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaajaaeaiapka
ecaaaaadaaaacpiaaaaaoelaabaioekaacaaaaadabaacpiaaaaappiaaeaaaakb
aiaaaaadacaaaiiaaeaaoelaaeaaoelaabaaaaacacaaadiaacaappiaebaaaaab
abaaapiaecaaaaadabaacpiaaaaaoelaacaioekaecaaaaadadaacpiaaaaaoela
aeaioekaecaaaaadaeaacpiaaaaaoelaadaioekaecaaaaadacaacpiaacaaoeia
aaaioekaaeaaaaaeaeaacbiaabaappiaafaaaakaafaaffkaaeaaaaaeaeaaccia
abaaffiaafaaaakaafaaffkafkaaaaaeabaadbiaaeaaoeiaaeaaoeiaafaakkka
acaaaaadabaacbiaabaaaaibafaappkaahaaaaacabaacbiaabaaaaiaagaaaaac
aeaaceiaabaaaaiaaiaaaaadabaacbiaacaaoelaacaaoelaahaaaaacabaacbia
abaaaaiaafaaaaadafaachiaabaaaaiaacaaoelaaiaaaaadafaaciiaaeaaoeia
afaaoeiaabaaaaacabaadciaafaappibaeaaaaaeafaaciiaafaappiaagaaffka
agaakkkaalaaaaadabaaceiaafaappiaafaakkkaceaaaaacagaachiaadaaoela
aiaaaaadabaadiiaagaaoeiaafaaoeibaeaaaaaeafaachiaacaaoelaabaaaaia
agaaoeiaceaaaaacagaachiaafaaoeiaaiaaaaadabaacbiaaeaaoeiaagaaoeia
alaaaaadacaacciaabaaaaiaafaakkkabcaaaaaeacaaceiaacaappkaabaappia
abaaffiaafaaaaadabaacbiaadaaaaiaacaakkiaafaaaaadadaachiaabaaaaia
acaaoekaaeaaaaaeabaachiaadaaoeiaafaaaakaabaakkiaafaaaaadadaachia
aaaaoeiaabaaoekaafaaaaadadaachiaadaaoeiaabaapplaafaaaaadabaachia
abaaoeiaadaaoeiaabaaaaacabaaaiiaagaaaakaafaaaaadabaaciiaabaappia
adaaffkacaaaaaadadaacbiaacaaffiaabaappiaafaaaaadabaaciiaaeaappia
adaaaaiaaeaaaaaeabaachiaabaaoeiaaaaaoekaabaappiaacaaaaadabaaciia
acaaaaiaacaaaaiaafaaaaadaaaachiaabaappiaabaaoeiaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcjaagaaaaeaaaaaaakeabaaaafjaaaaaeegiocaaa
aaaaaaaaanaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
afaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaaaaaaaaajbcaabaaaabaaaaaadkaabaaaaaaaaaaaakiacaia
ebaaaaaaaaaaaaaaamaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaabaaaaaaegbcbaaaaeaaaaaa
baaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
abaaaaaaegbcbaaaadaaaaaadcaaaaajhcaabaaaadaaaaaaegbcbaaaadaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaabacaaaaibcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaa
abaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaadcaaaaapdcaabaaaaeaaaaaa
hgapbaaaaeaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaa
aaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahccaabaaaabaaaaaaegaabaaa
aeaaaaaaegaabaaaaeaaaaaaddaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
abeaaaaaaaaaiadpaaaaaaaiccaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaa
abeaaaaaaaaaiadpelaaaaafecaabaaaaeaaaaaabkaabaaaabaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaacaaaaaadgcaaaagecaabaaa
abaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaajccaabaaaabaaaaaabkaabaaa
abaaaaaaabeaaaaajkjjbjdpabeaaaaamnmmmmdodeaaaaahccaabaaaabaaaaaa
bkaabaaaabaaaaaaabeaaaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaackaabaia
ebaaaaaaabaaaaaaakaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaadkiacaaa
aaaaaaaaajaaaaaaakaabaaaabaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaeaaaaaadiaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaacaaaaaadiaaaaaincaabaaa
abaaaaaaagaabaaaabaaaaaaagijcaaaaaaaaaaaajaaaaaadcaaaaamhcaabaaa
abaaaaaaigadbaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaaa
fgafbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
aaaaaaaaaiaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaacaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaadeaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaabkiacaaaaaaaaaaa
akaaaaaaabeaaaaaaaaaaaeddiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaabaaaaaabjaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaapgapbaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaa
efaaaaajpcaabaaaabaaaaaapgapbaaaaaaaaaaaeghobaaaaeaaaaaaaagabaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
ejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
knaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaiaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_TranslucencyColor]
Float 3 [_TranslucencyViewDependency]
Float 4 [_Shininess]
Float 5 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 1
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 3
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 0.60009766, 0.39990234 },
		{ 0, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R1, fragment.texcoord[0], texture[0], 2D;
TEX R2.yw, fragment.texcoord[0], texture[3], 2D;
TEX R0.w, fragment.texcoord[0], texture[2], 2D;
MAD R2.xy, R2.wyzw, c[6].x, -c[6].y;
SLT R0.x, R1.w, c[5];
DP3 R0.y, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.y, R0.y;
MUL R3.xyz, R0.y, fragment.texcoord[2];
MUL R2.zw, R2.xyxy, R2.xyxy;
ADD_SAT R0.y, R2.z, R2.w;
ADD R4.xyz, R3, fragment.texcoord[1];
DP3 R0.z, R4, R4;
RSQ R0.z, R0.z;
ADD R0.y, -R0, c[6];
RSQ R0.y, R0.y;
RCP R2.z, R0.y;
MOV R0.y, c[7];
MUL R4.xyz, R0.z, R4;
MUL R1.xyz, R1, c[1];
DP3 R0.z, R2, R4;
MUL R2.w, R0.y, c[4].x;
MAX R0.y, R0.z, c[7].x;
DP3 R0.z, fragment.texcoord[1], R2;
MOV_SAT R2.x, -R0.z;
POW R0.y, R0.y, R2.w;
MUL R0.y, R0, R0.w;
DP3_SAT R0.w, R3, -fragment.texcoord[1];
ADD R0.w, R0, -R2.x;
MAD R0.z, R0, c[6], c[6].w;
MAD R0.w, R0, c[3].x, R2.x;
MAX R0.z, R0, c[7].x;
MUL R1.xyz, R1, fragment.color.primary.w;
MOV result.color.w, R1;
KIL -R0.x;
TEX R0.x, fragment.texcoord[0], texture[1], 2D;
MUL R0.x, R0.w, R0;
MUL R2.xyz, R0.x, c[2];
MAD R2.xyz, R2, c[6].x, R0.z;
MUL R1.xyz, R1, R2;
MAD R0.xyz, R1, c[0], R0.y;
MUL result.color.xyz, R0, c[6].x;
END
# 41 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_TranslucencyColor]
Float 3 [_TranslucencyViewDependency]
Float 4 [_Shininess]
Float 5 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 1
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c6, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c7, 0.60009766, 0.39990234, 128.00000000, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
dcl t2.xyz
texld r1, t0, s3
texld r3, t0, s0
texld r6, t0, s1
mov r1.x, r1.w
add_pp r0.x, r3.w, -c5
cmp r0.x, r0, c6, c6.y
mov_pp r0, -r0.x
mad_pp r5.xy, r1, c6.z, c6.w
texkill r0.xyzw
texld r0, t0, s2
dp3_pp r0.x, t2, t2
rsq_pp r0.x, r0.x
mul_pp r4.xyz, r0.x, t2
mul_pp r0.xy, r5, r5
add_pp r2.xyz, r4, t1
dp3_pp r1.x, r2, r2
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c6.y
rsq_pp r0.x, r0.x
rcp_pp r5.z, r0.x
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r2
dp3_pp r1.x, r5, r1
mov_pp r0.x, c4
mul_pp r2.x, c7.z, r0
dp3_pp r0.x, t1, r5
max_pp r1.x, r1, c6
pow_pp r5.x, r1.x, r2.x
mov_pp_sat r1.x, -r0
dp3_pp_sat r2.x, r4, -t1
add_pp r2.x, r2, -r1
mad_pp r1.x, r2, c3, r1
mad_pp r0.x, r0, c7, c7.y
mul_pp r1.x, r1, r6
mul_pp r2.xyz, r3, c1
max_pp r0.x, r0, c6
mul_pp r1.xyz, r1.x, c2
mad_pp r1.xyz, r1, c6.z, r0.x
mov_pp r0.x, r5.x
mul_pp r0.x, r0, r0.w
mul_pp r2.xyz, r2, v0.w
mul_pp r1.xyz, r2, r1
mad_pp r0.xyz, r1, c0, r0.x
mul_pp r0.xyz, r0, c6.z
mov_pp r0.w, r3
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 3
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 1
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Vector 64 [_Color]
Vector 80 [_TranslucencyColor] 3
Float 92 [_TranslucencyViewDependency]
Float 100 [_Shininess]
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecednjgbfekmpmhaipekoiiddniakafineieabaaaaaammagaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcmaafaaaaeaaaaaaahaabaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacafaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaaj
bcaabaaaabaaaaaadkaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaaiaaaaaa
dbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaead
akaabaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaa
abaaaaaaagaabaaaabaaaaaaagbjbaaaaeaaaaaadcaaaaajhcaabaaaacaaaaaa
egbcbaaaaeaaaaaaagaabaaaabaaaaaaegbcbaaaadaaaaaabacaaaaibcaabaaa
abaaaaaajgahbaaaabaaaaaaegbcbaiaebaaaaaaadaaaaaaefaaaaajpcaabaaa
adaaaaaaegbabaaaabaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaadcaaaaap
dcaabaaaadaaaaaahgapbaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaa
aaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahccaabaaa
abaaaaaaegaabaaaadaaaaaaegaabaaaadaaaaaaddaaaaahccaabaaaabaaaaaa
bkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaaiccaabaaaabaaaaaabkaabaia
ebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaadaaaaaabkaabaaa
abaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaadaaaaaaegbcbaaaadaaaaaa
dgcaaaagecaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaajccaabaaa
abaaaaaabkaabaaaabaaaaaaabeaaaaajkjjbjdpabeaaaaamnmmmmdodeaaaaah
ccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaaaaaaaaaaaaibcaabaaa
abaaaaaackaabaiaebaaaaaaabaaaaaaakaabaaaabaaaaaadcaaaaakbcaabaaa
abaaaaaadkiacaaaaaaaaaaaafaaaaaaakaabaaaabaaaaaackaabaaaabaaaaaa
efaaaaajpcaabaaaaeaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
adaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaaeaaaaaa
diaaaaaincaabaaaabaaaaaaagaabaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaa
dcaaaaamhcaabaaaabaaaaaaigadbaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaaafgafbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaacaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaa
abaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
cpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaa
bkiacaaaaaaaaaaaagaaaaaaabeaaaaaaaaaaaeddiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaa
abaaaaaapgapbaaaaaaaaaaaaaaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 3
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 1
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Vector 64 [_Color]
Vector 80 [_TranslucencyColor] 3
Float 92 [_TranslucencyViewDependency]
Float 100 [_Shininess]
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjhnbhlinjabngeafgfpojgnnlhmfephmabaaaaaadaakaaaaaeaaaaaa
daaaaaaajaadaaaafiajaaaapmajaaaaebgpgodjfiadaaaafiadaaaaaaacpppp
aaadaaaafiaaaaaaadaadeaaaaaafiaaaaaafiaaaeaaceaaaaaafiaaaaaaaaaa
adababaaacacacaaabadadaaaaaaabaaabaaaaaaaaaaaaaaaaaaaeaaadaaabaa
aaaaaaaaaaaaaiaaabaaaeaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaaaea
aaaaialpaaaaaaaaaaaaiadpfbaaaaafagaaapkaaaaaaaedjkjjbjdpmnmmmmdo
aaaaaaaabpaaaaacaaaaaaiaaaaaahlabpaaaaacaaaaaaiaabaacplabpaaaaac
aaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaaja
adaiapkaecaaaaadaaaacpiaaaaaoelaaaaioekaacaaaaadabaacpiaaaaappia
aeaaaakbebaaaaababaaapiaecaaaaadabaacpiaaaaaoelaabaioekaecaaaaad
acaacpiaaaaaoelaadaioekaecaaaaadadaacpiaaaaaoelaacaioekaaiaaaaad
abaacbiaadaaoelaadaaoelaahaaaaacabaacbiaabaaaaiaafaaaaadadaachia
abaaaaiaadaaoelaabaaaaacaeaaahiaadaaoelaaeaaaaaeaeaachiaaeaaoeia
abaaaaiaacaaoelaceaaaaacafaachiaaeaaoeiaaiaaaaadafaadiiaadaaoeia
acaaoelbaeaaaaaeadaacbiaabaappiaafaaaakaafaaffkaaeaaaaaeadaaccia
abaaffiaafaaaakaafaaffkafkaaaaaeabaadbiaadaaoeiaadaaoeiaafaakkka
acaaaaadabaacbiaabaaaaibafaappkaahaaaaacabaacbiaabaaaaiaagaaaaac
adaaceiaabaaaaiaaiaaaaadabaacbiaadaaoeiaacaaoelaaiaaaaadabaaccia
adaaoeiaafaaoeiaalaaaaadacaacciaabaaffiaafaakkkaabaaaaacabaadcia
abaaaaibaeaaaaaeabaacbiaabaaaaiaagaaffkaagaakkkaalaaaaadacaaceia
abaaaaiaafaakkkabcaaaaaeacaaciiaacaappkaafaappiaabaaffiaafaaaaad
abaacbiaacaaaaiaacaappiaafaaaaadabaachiaabaaaaiaacaaoekaaeaaaaae
abaachiaabaaoeiaafaaaakaacaakkiaafaaaaadadaachiaaaaaoeiaabaaoeka
afaaaaadadaachiaadaaoeiaabaapplaafaaaaadabaachiaabaaoeiaadaaoeia
abaaaaacabaaaiiaagaaaakaafaaaaadabaaciiaabaappiaadaaffkacaaaaaad
adaacbiaacaaffiaabaappiaafaaaaadabaaciiaadaappiaadaaaaiaaeaaaaae
abaachiaabaaoeiaaaaaoekaabaappiaacaaaaadaaaachiaabaaoeiaabaaoeia
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcmaafaaaaeaaaaaaahaabaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
afaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaaaaaaaaajbcaabaaaabaaaaaadkaabaaaaaaaaaaaakiacaia
ebaaaaaaaaaaaaaaaiaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaadiaaaaahocaabaaaabaaaaaaagaabaaaabaaaaaaagbjbaaaaeaaaaaa
dcaaaaajhcaabaaaacaaaaaaegbcbaaaaeaaaaaaagaabaaaabaaaaaaegbcbaaa
adaaaaaabacaaaaibcaabaaaabaaaaaajgahbaaaabaaaaaaegbcbaiaebaaaaaa
adaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaadaaaaaa
aagabaaaabaaaaaadcaaaaapdcaabaaaadaaaaaahgapbaaaadaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahccaabaaaabaaaaaaegaabaaaadaaaaaaegaabaaaadaaaaaa
ddaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaai
ccaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaadaaaaaabkaabaaaabaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaa
adaaaaaaegbcbaaaadaaaaaadgcaaaagecaabaaaabaaaaaabkaabaiaebaaaaaa
abaaaaaadcaaaaajccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaajkjjbjdp
abeaaaaamnmmmmdodeaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaa
aaaaaaaaaaaaaaaibcaabaaaabaaaaaackaabaiaebaaaaaaabaaaaaaakaabaaa
abaaaaaadcaaaaakbcaabaaaabaaaaaadkiacaaaaaaaaaaaafaaaaaaakaabaaa
abaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaadaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaaakaabaaaaeaaaaaadiaaaaaincaabaaaabaaaaaaagaabaaaabaaaaaa
agijcaaaaaaaaaaaafaaaaaadcaaaaamhcaabaaaabaaaaaaigadbaaaabaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaaafgafbaaaabaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgbpbaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
acaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaabkiacaaaaaaaaaaaagaaaaaaabeaaaaaaaaaaaed
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaapgapbaaaaaaaaaaaaaaaaaahhccabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheojmaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaiaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_TranslucencyColor]
Float 3 [_TranslucencyViewDependency]
Float 4 [_Shininess]
Float 5 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 1
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 3
SetTexture 4 [_LightTexture0] 2D 4
SetTexture 5 [_LightTextureB0] 2D 5
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 0, 0.5, 2, 1 },
		{ 0.60009766, 0.39990234, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R3, fragment.texcoord[0], texture[0], 2D;
TEX R4.yw, fragment.texcoord[0], texture[3], 2D;
TEX R2.w, fragment.texcoord[0], texture[2], 2D;
MAD R1.xy, R4.wyzw, c[6].z, -c[6].w;
SLT R0.w, R3, c[5].x;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RCP R0.x, fragment.texcoord[3].w;
MUL R2.xy, R1, R1;
MAD R0.xy, fragment.texcoord[3], R0.x, c[6].y;
MOV result.color.w, R3;
TEX R1.w, R0.z, texture[5], 2D;
KIL -R0.w;
TEX R0.w, R0, texture[4], 2D;
TEX R0.x, fragment.texcoord[0], texture[1], 2D;
ADD_SAT R0.z, R2.x, R2.y;
DP3 R0.y, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.y, R0.y;
MUL R4.xyz, R0.y, fragment.texcoord[1];
ADD R0.z, -R0, c[6].w;
RSQ R0.z, R0.z;
RCP R1.z, R0.z;
DP3 R0.y, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.y, R0.y;
MUL R2.xyz, R0.y, fragment.texcoord[2];
DP3 R4.w, R4, R1;
DP3_SAT R0.z, R2, -R4;
ADD R2.xyz, R2, R4;
MOV_SAT R0.y, -R4.w;
ADD R0.z, R0, -R0.y;
MAD R0.y, R0.z, c[3].x, R0;
MAD R4.x, R4.w, c[7], c[7].y;
MUL R0.x, R0.y, R0;
DP3 R4.z, R2, R2;
MAX R4.y, R4.x, c[6].x;
RSQ R4.x, R4.z;
MUL R2.xyz, R4.x, R2;
DP3 R1.x, R1, R2;
MUL R0.xyz, R0.x, c[2];
MOV R4.x, c[7].z;
MUL R1.y, R4.x, c[4].x;
MAX R1.x, R1, c[6];
POW R2.x, R1.x, R1.y;
MUL R1.xyz, R3, c[1];
MUL R1.xyz, R1, fragment.color.primary.w;
MAD R0.xyz, R0, c[6].z, R4.y;
MUL R0.xyz, R1, R0;
MUL R2.x, R2, R2.w;
MAD R1.xyz, R0, c[0], R2.x;
SLT R0.x, c[6], fragment.texcoord[3].z;
MUL R0.x, R0, R0.w;
MUL R0.x, R0, R1.w;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[6].z;
END
# 53 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_TranslucencyColor]
Float 3 [_TranslucencyViewDependency]
Float 4 [_Shininess]
Float 5 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 1
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 3
SetTexture 4 [_LightTexture0] 2D 4
SetTexture 5 [_LightTextureB0] 2D 5
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c6, 0.00000000, 1.00000000, 0.50000000, 2.00000000
def c7, 2.00000000, -1.00000000, 0.60009766, 0.39990234
def c8, 128.00000000, 0, 0, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
dcl t2.xyz
dcl t3
texld r4, t0, s3
texld r5, t0, s2
texld r1, t0, s0
add_pp r0.x, r1.w, -c5
cmp r0.x, r0, c6, c6.y
mov_pp r0, -r0.x
dp3 r2.x, t3, t3
rcp r3.x, t3.w
mov r2.xy, r2.x
dp3_pp r4.x, t1, t1
dp3_pp r5.x, t2, t2
rsq_pp r5.x, r5.x
mul_pp r5.xyz, r5.x, t2
mul_pp r1.xyz, r1, c1
mad r3.xy, t3, r3.x, c6.z
rsq_pp r4.x, r4.x
mul_pp r1.xyz, r1, v0.w
texkill r0.xyzw
texld r0, r3, s4
texld r3, t0, s1
texld r2, r2, s5
mov r0.y, r4
mul_pp r4.xyz, r4.x, t1
add_pp r6.xyz, r5, r4
mov r0.x, r4.w
mad_pp r8.xy, r0, c7.x, c7.y
mul_pp r0.xy, r8, r8
add_pp_sat r0.x, r0, r0.y
dp3_pp r7.x, r6, r6
rsq_pp r7.x, r7.x
add_pp r0.x, -r0, c6.y
rsq_pp r0.x, r0.x
rcp_pp r8.z, r0.x
mul_pp r6.xyz, r7.x, r6
mov_pp r0.x, c4
dp3_pp r6.x, r8, r6
mul_pp r0.x, c8, r0
max_pp r6.x, r6, c6
pow_pp r7.y, r6.x, r0.x
dp3_pp r6.x, r4, r8
mov_pp r0.x, r7.y
mov_pp_sat r7.x, -r6
dp3_pp_sat r4.x, r5, -r4
add_pp r4.x, r4, -r7
mad_pp r4.x, r4, c3, r7
mul_pp r3.x, r4, r3
mad_pp r4.x, r6, c7.z, c7.w
mul_pp r0.x, r0, r5.w
mul_pp r3.xyz, r3.x, c2
max_pp r4.x, r4, c6
mad_pp r3.xyz, r3, c6.w, r4.x
mul_pp r1.xyz, r1, r3
mad_pp r0.xyz, r1, c0, r0.x
cmp r1.x, -t3.z, c6, c6.y
mul_pp r1.x, r1, r0.w
mul_pp r1.x, r1, r2
mul_pp r0.xyz, r1.x, r0
mul_pp r0.xyz, r0, c6.w
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_TranslucencyMap] 2D 5
SetTexture 2 [_GlossMap] 2D 4
SetTexture 3 [_BumpMap] 2D 3
SetTexture 4 [_LightTexture0] 2D 0
SetTexture 5 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 128 [_Color]
Vector 144 [_TranslucencyColor] 3
Float 156 [_TranslucencyViewDependency]
Float 164 [_Shininess]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedfmkjnkgbjfaoaieednakoomigaalooofabaaaaaaimaiaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
giahaaaaeaaaaaaankabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaa
afaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacafaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaajbcaabaaa
abaaaaaadkaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaamaaaaaadbaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaa
abaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaa
eeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
agaabaaaabaaaaaaegbcbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaa
adaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaadcaaaaaj
hcaabaaaadaaaaaaegbcbaaaadaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
bacaaaaibcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
efaaaaajpcaabaaaaeaaaaaaegbabaaaabaaaaaaeghobaaaadaaaaaaaagabaaa
adaaaaaadcaaaaapdcaabaaaaeaaaaaahgapbaaaaeaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahccaabaaaabaaaaaaegaabaaaaeaaaaaaegaabaaaaeaaaaaaddaaaaah
ccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaaiccaabaaa
abaaaaaabkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
aeaaaaaabkaabaaaabaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaaeaaaaaa
egacbaaaacaaaaaadgcaaaagecaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaa
dcaaaaajccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaajkjjbjdpabeaaaaa
mnmmmmdodeaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaaaaa
aaaaaaaibcaabaaaabaaaaaackaabaiaebaaaaaaabaaaaaaakaabaaaabaaaaaa
dcaaaaakbcaabaaaabaaaaaadkiacaaaaaaaaaaaajaaaaaaakaabaaaabaaaaaa
ckaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaafaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
akaabaaaacaaaaaadiaaaaaincaabaaaabaaaaaaagaabaaaabaaaaaaagijcaaa
aaaaaaaaajaaaaaadcaaaaamhcaabaaaabaaaaaaigadbaaaabaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaaafgafbaaaabaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaaiaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgbpbaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aeaaaaaaegacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaai
bcaabaaaabaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaaaaaaaaeddiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaaeaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaapgapbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaa
egbabaaaafaaaaaapgbpbaaaafaaaaaaaaaaaaakdcaabaaaabaaaaaaegaabaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaaeaaaaaaaagabaaaaaaaaaaadbaaaaah
icaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaaafaaaaaaabaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaaaaaaaaa
dkaabaaaabaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
afaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaa
eghobaaaafaaaaaaaagabaaaabaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaa
aaaaaaaaagaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_TranslucencyMap] 2D 5
SetTexture 2 [_GlossMap] 2D 4
SetTexture 3 [_BumpMap] 2D 3
SetTexture 4 [_LightTexture0] 2D 0
SetTexture 5 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 128 [_Color]
Vector 144 [_TranslucencyColor] 3
Float 156 [_TranslucencyViewDependency]
Float 164 [_Shininess]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedcbpkklpemgbfnekfhijbhpccoafaojhlabaaaaaakmamaaaaaeaaaaaa
daaaaaaaemaeaaaalmalaaaahiamaaaaebgpgodjbeaeaaaabeaeaaaaaaacpppp
leadaaaagaaaaaaaadaadmaaaaaagaaaaaaagaaaagaaceaaaaaagaaaaeaaaaaa
afababaaaaacacaaadadadaaacaeaeaaabafafaaaaaaabaaabaaaaaaaaaaaaaa
aaaaaiaaadaaabaaaaaaaaaaaaaaamaaabaaaeaaaaaaaaaaaaacppppfbaaaaaf
afaaapkaaaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafagaaapkaaaaaaadp
aaaaaaedjkjjbjdpmnmmmmdobpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaia
abaacplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaaiaaeaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaaja
aeaiapkabpaaaaacaaaaaajaafaiapkaecaaaaadaaaacpiaaaaaoelaacaioeka
acaaaaadabaacpiaaaaappiaaeaaaakbagaaaaacacaaaiiaaeaapplaaeaaaaae
acaaadiaaeaaoelaacaappiaagaaaakaaiaaaaadadaaaiiaaeaaoelaaeaaoela
abaaaaacadaaadiaadaappiaebaaaaababaaapiaecaaaaadabaacpiaaaaaoela
adaioekaecaaaaadaeaacpiaaaaaoelaafaioekaecaaaaadafaacpiaaaaaoela
aeaioekaecaaaaadacaacpiaacaaoeiaaaaioekaecaaaaadadaacpiaadaaoeia
abaioekaaeaaaaaeacaacbiaabaappiaafaaaakaafaaffkaaeaaaaaeacaaccia
abaaffiaafaaaakaafaaffkafkaaaaaeabaadbiaacaaoeiaacaaoeiaafaakkka
acaaaaadabaacbiaabaaaaibafaappkaahaaaaacabaacbiaabaaaaiaagaaaaac
acaaceiaabaaaaiaaiaaaaadabaacbiaacaaoelaacaaoelaahaaaaacabaacbia
abaaaaiaafaaaaadafaachiaabaaaaiaacaaoelaaiaaaaadabaacciaacaaoeia
afaaoeiaabaaaaacabaadeiaabaaffibaeaaaaaeabaacciaabaaffiaagaakkka
agaappkaalaaaaadadaacciaabaaffiaafaakkkaceaaaaacagaachiaadaaoela
aiaaaaadagaadiiaagaaoeiaafaaoeibaeaaaaaeafaachiaacaaoelaabaaaaia
agaaoeiaceaaaaacagaachiaafaaoeiaaiaaaaadabaacbiaacaaoeiaagaaoeia
alaaaaadacaacbiaabaaaaiaafaakkkabcaaaaaeacaacciaacaappkaagaappia
abaakkiaafaaaaadabaacbiaaeaaaaiaacaaffiaafaaaaadabaachiaabaaaaia
acaaoekaaeaaaaaeabaachiaabaaoeiaafaaaakaadaaffiaafaaaaadadaacoia
aaaabliaabaablkaafaaaaadadaacoiaadaaoeiaabaapplaafaaaaadabaachia
abaaoeiaadaabliaabaaaaacabaaaiiaagaaffkaafaaaaadabaaciiaabaappia
adaaffkacaaaaaadadaacciaacaaaaiaabaappiaafaaaaadabaaciiaafaappia
adaaffiaaeaaaaaeabaachiaabaaoeiaaaaaoekaabaappiaafaaaaadabaaciia
acaappiaadaaaaiafiaaaaaeabaaciiaaeaakklbafaakkkaabaappiaacaaaaad
abaaciiaabaappiaabaappiaafaaaaadaaaachiaabaappiaabaaoeiaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcgiahaaaaeaaaaaaankabaaaafjaaaaae
egiocaaaaaaaaaaaanaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaad
aagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaa
ffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
afaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaacaaaaaaaaaaaaajbcaabaaaabaaaaaadkaabaaaaaaaaaaaakiacaia
ebaaaaaaaaaaaaaaamaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaabaaaaaaegbcbaaaaeaaaaaa
baaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
abaaaaaaegbcbaaaadaaaaaadcaaaaajhcaabaaaadaaaaaaegbcbaaaadaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaabacaaaaibcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaa
abaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadcaaaaapdcaabaaaaeaaaaaa
hgapbaaaaeaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaa
aaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahccaabaaaabaaaaaaegaabaaa
aeaaaaaaegaabaaaaeaaaaaaddaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
abeaaaaaaaaaiadpaaaaaaaiccaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaa
abeaaaaaaaaaiadpelaaaaafecaabaaaaeaaaaaabkaabaaaabaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaacaaaaaadgcaaaagecaabaaa
abaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaajccaabaaaabaaaaaabkaabaaa
abaaaaaaabeaaaaajkjjbjdpabeaaaaamnmmmmdodeaaaaahccaabaaaabaaaaaa
bkaabaaaabaaaaaaabeaaaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaackaabaia
ebaaaaaaabaaaaaaakaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaadkiacaaa
aaaaaaaaajaaaaaaakaabaaaabaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaafaaaaaadiaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaacaaaaaadiaaaaaincaabaaa
abaaaaaaagaabaaaabaaaaaaagijcaaaaaaaaaaaajaaaaaadcaaaaamhcaabaaa
abaaaaaaigadbaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaaa
fgafbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
aaaaaaaaaiaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaacaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaadeaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaabkiacaaaaaaaaaaa
akaaaaaaabeaaaaaaaaaaaeddiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaabaaaaaabjaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaapgapbaaa
aaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaa
aaaaaaakdcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaa
aeaaaaaaaagabaaaaaaaaaaadbaaaaahicaabaaaaaaaaaaaabeaaaaaaaaaaaaa
ckbabaaaafaaaaaaabaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaaagaabaaaabaaaaaaeghobaaaafaaaaaaaagabaaaabaaaaaa
apaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaaagaabaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheo
leaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaiaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_TranslucencyColor]
Float 3 [_TranslucencyViewDependency]
Float 4 [_Shininess]
Float 5 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 1
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 3
SetTexture 4 [_LightTextureB0] 2D 4
SetTexture 5 [_LightTexture0] CUBE 5
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 0.60009766, 0.39990234 },
		{ 0, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R3, fragment.texcoord[0], texture[0], 2D;
TEX R4.yw, fragment.texcoord[0], texture[3], 2D;
TEX R1.w, fragment.texcoord[3], texture[5], CUBE;
TEX R2.w, fragment.texcoord[0], texture[2], 2D;
MAD R1.xy, R4.wyzw, c[6].x, -c[6].y;
MUL R2.xy, R1, R1;
SLT R0.y, R3.w, c[5].x;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
ADD_SAT R0.z, R2.x, R2.y;
ADD R0.z, -R0, c[6].y;
RSQ R0.z, R0.z;
RCP R1.z, R0.z;
MOV result.color.w, R3;
TEX R0.w, R0.x, texture[4], 2D;
KIL -R0.y;
TEX R0.x, fragment.texcoord[0], texture[1], 2D;
DP3 R0.y, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.y, R0.y;
MUL R4.xyz, R0.y, fragment.texcoord[1];
DP3 R0.y, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.y, R0.y;
MUL R2.xyz, R0.y, fragment.texcoord[2];
DP3 R4.w, R4, R1;
DP3_SAT R0.z, R2, -R4;
ADD R2.xyz, R2, R4;
MOV_SAT R0.y, -R4.w;
ADD R0.z, R0, -R0.y;
MAD R0.y, R0.z, c[3].x, R0;
MAD R4.x, R4.w, c[6].z, c[6].w;
MUL R0.x, R0.y, R0;
DP3 R4.z, R2, R2;
MAX R4.y, R4.x, c[7].x;
RSQ R4.x, R4.z;
MUL R2.xyz, R4.x, R2;
DP3 R1.x, R1, R2;
MUL R0.xyz, R0.x, c[2];
MOV R4.x, c[7].y;
MUL R1.y, R4.x, c[4].x;
MAX R1.x, R1, c[7];
POW R2.x, R1.x, R1.y;
MUL R1.xyz, R3, c[1];
MUL R1.xyz, R1, fragment.color.primary.w;
MAD R0.xyz, R0, c[6].x, R4.y;
MUL R0.xyz, R1, R0;
MUL R2.x, R2, R2.w;
MAD R1.xyz, R0, c[0], R2.x;
MUL R0.x, R0.w, R1.w;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[6].x;
END
# 49 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_TranslucencyColor]
Float 3 [_TranslucencyViewDependency]
Float 4 [_Shininess]
Float 5 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 1
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 3
SetTexture 4 [_LightTextureB0] 2D 4
SetTexture 5 [_LightTexture0] CUBE 5
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_cube s5
def c6, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c7, 0.60009766, 0.39990234, 128.00000000, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r4, t0, s3
texld r5, t0, s2
texld r3, t0, s1
texld r1, t0, s0
add_pp r0.x, r1.w, -c5
cmp r0.x, r0, c6, c6.y
mov_pp r0, -r0.x
dp3 r2.x, t3, t3
dp3_pp r4.x, t1, t1
dp3_pp r5.x, t2, t2
rsq_pp r5.x, r5.x
mul_pp r5.xyz, r5.x, t2
mul_pp r1.xyz, r1, c1
mov r2.xy, r2.x
rsq_pp r4.x, r4.x
mul_pp r1.xyz, r1, v0.w
texkill r0.xyzw
texld r0, r2, s4
texld r2, t3, s5
mov r2.y, r4
mul_pp r4.xyz, r4.x, t1
add_pp r6.xyz, r5, r4
mov r2.x, r4.w
mad_pp r8.xy, r2, c6.z, c6.w
mul_pp r2.xy, r8, r8
dp3_pp r7.x, r6, r6
rsq_pp r7.x, r7.x
add_pp_sat r2.x, r2, r2.y
add_pp r2.x, -r2, c6.y
rsq_pp r2.x, r2.x
rcp_pp r8.z, r2.x
mul_pp r6.xyz, r7.x, r6
mov_pp r2.x, c4
dp3_pp r6.x, r8, r6
mul_pp r2.x, c7.z, r2
max_pp r6.x, r6, c6
pow_pp r7.y, r6.x, r2.x
dp3_pp r6.x, r4, r8
mov_pp r2.x, r7.y
mul_pp r2.x, r2, r5.w
mov_pp_sat r7.x, -r6
dp3_pp_sat r4.x, r5, -r4
add_pp r4.x, r4, -r7
mad_pp r4.x, r4, c3, r7
mul_pp r3.x, r4, r3
mad_pp r4.x, r6, c7, c7.y
mul_pp r3.xyz, r3.x, c2
max_pp r4.x, r4, c6
mad_pp r3.xyz, r3, c6.z, r4.x
mul_pp r1.xyz, r1, r3
mad_pp r1.xyz, r1, c0, r2.x
mul r0.x, r0, r2.w
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c6.z
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_TranslucencyMap] 2D 5
SetTexture 2 [_GlossMap] 2D 4
SetTexture 3 [_BumpMap] 2D 3
SetTexture 4 [_LightTextureB0] 2D 1
SetTexture 5 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 128 [_Color]
Vector 144 [_TranslucencyColor] 3
Float 156 [_TranslucencyViewDependency]
Float 164 [_Shininess]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecednnfjojkdnnheagolgahkeehpeocenadaabaaaaaapeahaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
naagaaaaeaaaaaaaleabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaa
afaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafidaaaaeaahabaaaafaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacafaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaajbcaabaaa
abaaaaaadkaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaamaaaaaadbaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaa
abaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaa
eeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
agaabaaaabaaaaaaegbcbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaa
adaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaadcaaaaaj
hcaabaaaadaaaaaaegbcbaaaadaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
bacaaaaibcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
efaaaaajpcaabaaaaeaaaaaaegbabaaaabaaaaaaeghobaaaadaaaaaaaagabaaa
adaaaaaadcaaaaapdcaabaaaaeaaaaaahgapbaaaaeaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahccaabaaaabaaaaaaegaabaaaaeaaaaaaegaabaaaaeaaaaaaddaaaaah
ccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaaiccaabaaa
abaaaaaabkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
aeaaaaaabkaabaaaabaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaaeaaaaaa
egacbaaaacaaaaaadgcaaaagecaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaa
dcaaaaajccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaajkjjbjdpabeaaaaa
mnmmmmdodeaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaaaaa
aaaaaaaibcaabaaaabaaaaaackaabaiaebaaaaaaabaaaaaaakaabaaaabaaaaaa
dcaaaaakbcaabaaaabaaaaaadkiacaaaaaaaaaaaajaaaaaaakaabaaaabaaaaaa
ckaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaafaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
akaabaaaacaaaaaadiaaaaaincaabaaaabaaaaaaagaabaaaabaaaaaaagijcaaa
aaaaaaaaajaaaaaadcaaaaamhcaabaaaabaaaaaaigadbaaaabaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaaafgafbaaaabaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaaiaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgbpbaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aeaaaaaaegacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaai
bcaabaaaabaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaaaaaaaaeddiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaaeaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaapgapbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaapgapbaaa
aaaaaaaaeghobaaaaeaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
egbcbaaaafaaaaaaeghobaaaafaaaaaaaagabaaaaaaaaaaaapaaaaahicaabaaa
aaaaaaaaagaabaaaabaaaaaapgapbaaaacaaaaaadiaaaaahhccabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_TranslucencyMap] 2D 5
SetTexture 2 [_GlossMap] 2D 4
SetTexture 3 [_BumpMap] 2D 3
SetTexture 4 [_LightTextureB0] 2D 1
SetTexture 5 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 128 [_Color]
Vector 144 [_TranslucencyColor] 3
Float 156 [_TranslucencyViewDependency]
Float 164 [_Shininess]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedcebjgmclmlfknjifmfpongdciedclbdoabaaaaaaoaalaaaaaeaaaaaa
daaaaaaabiaeaaaapaakaaaakmalaaaaebgpgodjoaadaaaaoaadaaaaaaacpppp
iaadaaaagaaaaaaaadaadmaaaaaagaaaaaaagaaaagaaceaaaaaagaaaafaaaaaa
aeababaaaaacacaaadadadaaacaeaeaaabafafaaaaaaabaaabaaaaaaaaaaaaaa
aaaaaiaaadaaabaaaaaaaaaaaaaaamaaabaaaeaaaaaaaaaaaaacppppfbaaaaaf
afaaapkaaaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafagaaapkaaaaaaaed
jkjjbjdpmnmmmmdoaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaia
abaacplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaaiaaeaaahlabpaaaaacaaaaaajiaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaaja
aeaiapkabpaaaaacaaaaaajaafaiapkaecaaaaadaaaacpiaaaaaoelaacaioeka
acaaaaadabaacpiaaaaappiaaeaaaakbaiaaaaadacaaaiiaaeaaoelaaeaaoela
abaaaaacacaaadiaacaappiaebaaaaababaaapiaecaaaaadabaacpiaaaaaoela
adaioekaecaaaaadadaacpiaaaaaoelaafaioekaecaaaaadaeaacpiaaaaaoela
aeaioekaecaaaaadacaaapiaacaaoeiaabaioekaecaaaaadafaaapiaaeaaoela
aaaioekaaeaaaaaeaeaacbiaabaappiaafaaaakaafaaffkaaeaaaaaeaeaaccia
abaaffiaafaaaakaafaaffkafkaaaaaeabaadbiaaeaaoeiaaeaaoeiaafaakkka
acaaaaadabaacbiaabaaaaibafaappkaahaaaaacabaacbiaabaaaaiaagaaaaac
aeaaceiaabaaaaiaaiaaaaadabaacbiaacaaoelaacaaoelaahaaaaacabaacbia
abaaaaiaafaaaaadafaachiaabaaaaiaacaaoelaaiaaaaadabaacciaaeaaoeia
afaaoeiaabaaaaacabaadeiaabaaffibaeaaaaaeabaacciaabaaffiaagaaffka
agaakkkaalaaaaadacaacciaabaaffiaafaakkkaceaaaaacagaachiaadaaoela
aiaaaaadagaadiiaagaaoeiaafaaoeibaeaaaaaeafaachiaacaaoelaabaaaaia
agaaoeiaceaaaaacagaachiaafaaoeiaaiaaaaadabaacbiaaeaaoeiaagaaoeia
alaaaaadacaaceiaabaaaaiaafaakkkabcaaaaaeacaaciiaacaappkaagaappia
abaakkiaafaaaaadacaaciiaadaaaaiaacaappiaafaaaaadabaachiaacaappia
acaaoekaaeaaaaaeabaachiaabaaoeiaafaaaakaacaaffiaafaaaaadadaachia
aaaaoeiaabaaoekaafaaaaadadaachiaadaaoeiaabaapplaafaaaaadabaachia
abaaoeiaadaaoeiaabaaaaacabaaaiiaagaaaakaafaaaaadabaaciiaabaappia
adaaffkacaaaaaadadaacbiaacaakkiaabaappiaafaaaaadabaaciiaaeaappia
adaaaaiaaeaaaaaeabaachiaabaaoeiaaaaaoekaabaappiaafaaaaadabaaciia
acaaaaiaafaappiaacaaaaadabaaciiaabaappiaabaappiaafaaaaadaaaachia
abaappiaabaaoeiaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcnaagaaaa
eaaaaaaaleabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
fibiaaaeaahabaaaaeaaaaaaffffaaaafidaaaaeaahabaaaafaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacafaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaajbcaabaaaabaaaaaa
dkaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaamaaaaaadbaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaa
abaaaaaaegbcbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaadcaaaaajhcaabaaa
adaaaaaaegbcbaaaadaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabacaaaai
bcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegbabaaaabaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaa
dcaaaaapdcaabaaaaeaaaaaahgapbaaaaeaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaah
ccaabaaaabaaaaaaegaabaaaaeaaaaaaegaabaaaaeaaaaaaddaaaaahccaabaaa
abaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaaiccaabaaaabaaaaaa
bkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaeaaaaaa
bkaabaaaabaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaa
acaaaaaadgcaaaagecaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaaj
ccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaajkjjbjdpabeaaaaamnmmmmdo
deaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaaaaaaaaaaaai
bcaabaaaabaaaaaackaabaiaebaaaaaaabaaaaaaakaabaaaabaaaaaadcaaaaak
bcaabaaaabaaaaaadkiacaaaaaaaaaaaajaaaaaaakaabaaaabaaaaaackaabaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaafaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
acaaaaaadiaaaaaincaabaaaabaaaaaaagaabaaaabaaaaaaagijcaaaaaaaaaaa
ajaaaaaadcaaaaamhcaabaaaabaaaaaaigadbaaaabaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaaafgafbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaaaaaaaaaaiaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaa
acaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaa
egacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaibcaabaaa
abaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaaaaaaaaeddiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaaeaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
aaaaaaaaabaaaaaapgapbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
afaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaapgapbaaaaaaaaaaa
eghobaaaaeaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaa
afaaaaaaeghobaaaafaaaaaaaagabaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
agaabaaaabaaaaaapgapbaaaacaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaiaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_TranslucencyColor]
Float 3 [_TranslucencyViewDependency]
Float 4 [_ShadowStrength]
Float 5 [_Shininess]
Float 6 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 1
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 3
SetTexture 4 [_LightTexture0] 2D 4
"!!ARBfp1.0
PARAM c[9] = { program.local[0..6],
		{ 2, 1, 0.60009766, 0.39990234 },
		{ 0, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R3.yw, fragment.texcoord[0], texture[3], 2D;
TEX R0.w, fragment.texcoord[3], texture[4], 2D;
TEX R1.w, fragment.texcoord[0], texture[2], 2D;
MAD R1.xy, R3.wyzw, c[7].x, -c[7].y;
MUL R3.xy, R1, R1;
SLT R0.x, R2.w, c[6];
ADD_SAT R0.y, R3.x, R3;
ADD R0.y, -R0, c[7];
RSQ R0.z, R0.y;
MUL R2.xyz, R2, c[1];
RCP R1.z, R0.z;
DP3 R0.y, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.z, R0.y;
MUL R3.xyz, R0.z, fragment.texcoord[2];
DP3 R0.y, fragment.texcoord[1], R1;
MOV_SAT R0.z, -R0.y;
DP3_SAT R3.w, R3, -fragment.texcoord[1];
ADD R3.w, R3, -R0.z;
MAD R0.z, R3.w, c[3].x, R0;
MAD R0.y, R0, c[7].z, c[7].w;
MAX R3.w, R0.y, c[8].x;
ADD R3.xyz, R3, fragment.texcoord[1];
MUL R2.xyz, R2, fragment.color.primary.w;
MAD R0.w, R0, c[7].x, -c[7].x;
MOV result.color.w, R2;
KIL -R0.x;
TEX R0.x, fragment.texcoord[0], texture[1], 2D;
MUL R0.x, R0.z, R0;
MUL R0.xyz, R0.x, c[2];
MAD R0.xyz, R0, c[7].x, R3.w;
DP3 R3.w, R3, R3;
MUL R0.xyz, R2, R0;
RSQ R3.w, R3.w;
MUL R2.xyz, R3.w, R3;
DP3 R1.x, R1, R2;
MOV R3.x, c[8].y;
MUL R1.y, R3.x, c[5].x;
MAX R1.x, R1, c[8];
POW R1.x, R1.x, R1.y;
MUL R1.y, R1.x, R1.w;
MOV R1.x, c[7];
MAD R0.w, R0, c[4].x, R1.x;
MAD R0.xyz, R0, c[0], R1.y;
MUL result.color.xyz, R0, R0.w;
END
# 45 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_TranslucencyColor]
Float 3 [_TranslucencyViewDependency]
Float 4 [_ShadowStrength]
Float 5 [_Shininess]
Float 6 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_TranslucencyMap] 2D 1
SetTexture 2 [_GlossMap] 2D 2
SetTexture 3 [_BumpMap] 2D 3
SetTexture 4 [_LightTexture0] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c7, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c8, 0.60009766, 0.39990234, 128.00000000, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
dcl t2.xyz
dcl t3.xy
texld r2, t0, s3
texld r3, t0, s0
texld r6, t0, s1
texld r1, t0, s2
add_pp r0.x, r3.w, -c6
cmp r0.x, r0, c7, c7.y
mov_pp r0, -r0.x
mul_pp r3.xyz, r3, c1
texkill r0.xyzw
texld r0, t3, s4
mov r0.y, r2
mov r0.x, r2.w
mad_pp r4.xy, r0, c7.z, c7.w
mul_pp r0.xy, r4, r4
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c7.y
rsq_pp r1.x, r0.x
rcp_pp r4.z, r1.x
dp3_pp r0.x, t2, t2
rsq_pp r1.x, r0.x
mul_pp r5.xyz, r1.x, t2
dp3_pp r0.x, t1, r4
mov_pp_sat r1.x, -r0
dp3_pp_sat r2.x, r5, -t1
add_pp r2.x, r2, -r1
mad_pp r1.x, r2, c3, r1
mad_pp r0.x, r0, c8, c8.y
add_pp r2.xyz, r5, t1
mul_pp r1.x, r1, r6
mul_pp r5.xyz, r1.x, c2
dp3_pp r1.x, r2, r2
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r2
max_pp r0.x, r0, c7
mad_pp r2.xyz, r5, c7.z, r0.x
dp3_pp r0.x, r4, r1
mov_pp r1.x, c5
mul_pp r1.x, c8.z, r1
max_pp r0.x, r0, c7
pow_pp r4.x, r0.x, r1.x
mul_pp r0.xyz, r3, v0.w
mul_pp r2.xyz, r0, r2
mov_pp r0.x, r4.x
mul_pp r0.x, r0, r1.w
mad_pp r1.x, r0.w, c7.z, -c7.z
mov_pp r0.z, c7
mad_pp r1.x, r1, c4, r0.z
mad_pp r0.xyz, r2, c0, r0.x
mul_pp r0.xyz, r0, r1.x
mov_pp r0.w, r3
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_TranslucencyMap] 2D 4
SetTexture 2 [_GlossMap] 2D 3
SetTexture 3 [_BumpMap] 2D 2
SetTexture 4 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 128 [_Color]
Vector 144 [_TranslucencyColor] 3
Float 156 [_TranslucencyViewDependency]
Float 160 [_ShadowStrength]
Float 164 [_Shininess]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedfieeiohcdmakgihghfomghjejhfhfofdabaaaaaahmahaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaiaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
fiagaaaaeaaaaaaajgabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacafaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaaj
bcaabaaaabaaaaaadkaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaamaaaaaa
dbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaead
akaabaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaa
abaaaaaaagaabaaaabaaaaaaagbjbaaaaeaaaaaadcaaaaajhcaabaaaacaaaaaa
egbcbaaaaeaaaaaaagaabaaaabaaaaaaegbcbaaaadaaaaaabacaaaaibcaabaaa
abaaaaaajgahbaaaabaaaaaaegbcbaiaebaaaaaaadaaaaaaefaaaaajpcaabaaa
adaaaaaaegbabaaaabaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaadcaaaaap
dcaabaaaadaaaaaahgapbaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaa
aaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahccaabaaa
abaaaaaaegaabaaaadaaaaaaegaabaaaadaaaaaaddaaaaahccaabaaaabaaaaaa
bkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaaiccaabaaaabaaaaaabkaabaia
ebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaadaaaaaabkaabaaa
abaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaadaaaaaaegbcbaaaadaaaaaa
dgcaaaagecaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaajccaabaaa
abaaaaaabkaabaaaabaaaaaaabeaaaaajkjjbjdpabeaaaaamnmmmmdodeaaaaah
ccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaaaaaaaaaaaaibcaabaaa
abaaaaaackaabaiaebaaaaaaabaaaaaaakaabaaaabaaaaaadcaaaaakbcaabaaa
abaaaaaadkiacaaaaaaaaaaaajaaaaaaakaabaaaabaaaaaackaabaaaabaaaaaa
efaaaaajpcaabaaaaeaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
aeaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaaeaaaaaa
diaaaaaincaabaaaabaaaaaaagaabaaaabaaaaaaagijcaaaaaaaaaaaajaaaaaa
dcaaaaamhcaabaaaabaaaaaaigadbaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaaafgafbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaaiaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaacaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaa
abaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
cpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaa
bkiacaaaaaaaaaaaakaaaaaaabeaaaaaaaaaaaeddiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaadaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaa
abaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaa
eghobaaaaeaaaaaaaagabaaaaaaaaaaadcaaaaajicaabaaaaaaaaaaadkaabaaa
abaaaaaaabeaaaaaaaaaaaeaabeaaaaaaaaaaamadcaaaaakicaabaaaaaaaaaaa
akiacaaaaaaaaaaaakaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaeadiaaaaah
hccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_TranslucencyMap] 2D 4
SetTexture 2 [_GlossMap] 2D 3
SetTexture 3 [_BumpMap] 2D 2
SetTexture 4 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 128 [_Color]
Vector 144 [_TranslucencyColor] 3
Float 156 [_TranslucencyViewDependency]
Float 160 [_ShadowStrength]
Float 164 [_Shininess]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjbkibaejdfnojjcnpfomfeelcmhppnjhabaaaaaafialaaaaaeaaaaaa
daaaaaaaaiaeaaaagiakaaaacealaaaaebgpgodjnaadaaaanaadaaaaaaacpppp
headaaaafmaaaaaaadaadiaaaaaafmaaaaaafmaaafaaceaaaaaafmaaaeaaaaaa
aaababaaadacacaaacadadaaabaeaeaaaaaaabaaabaaaaaaaaaaaaaaaaaaaiaa
adaaabaaaaaaaaaaaaaaamaaabaaaeaaaaaaaaaaaaacppppfbaaaaafafaaapka
aaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafagaaapkaaaaaaaedjkjjbjdp
mnmmmmdoaaaaaaaafbaaaaafahaaapkaaaaaaaeaaaaaaamaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapka
bpaaaaacaaaaaajaaeaiapkaecaaaaadaaaacpiaaaaaoelaabaioekaacaaaaad
abaacpiaaaaappiaaeaaaakbabaaaaacacaaadiaaaaabllaebaaaaababaaapia
ecaaaaadabaacpiaaaaaoelaacaioekaecaaaaadadaacpiaaaaaoelaaeaioeka
ecaaaaadaeaacpiaaaaaoelaadaioekaecaaaaadacaacpiaacaaoeiaaaaioeka
aiaaaaadabaacbiaadaaoelaadaaoelaahaaaaacabaacbiaabaaaaiaafaaaaad
acaachiaabaaaaiaadaaoelaabaaaaacaeaaahiaadaaoelaaeaaaaaeaeaachia
aeaaoeiaabaaaaiaacaaoelaceaaaaacafaachiaaeaaoeiaaiaaaaadafaadiia
acaaoeiaacaaoelbaeaaaaaeacaacbiaabaappiaafaaaakaafaaffkaaeaaaaae
acaacciaabaaffiaafaaaakaafaaffkafkaaaaaeabaadbiaacaaoeiaacaaoeia
afaakkkaacaaaaadabaacbiaabaaaaibafaappkaahaaaaacabaacbiaabaaaaia
agaaaaacacaaceiaabaaaaiaaiaaaaadabaacbiaacaaoeiaacaaoelaaiaaaaad
abaacciaacaaoeiaafaaoeiaalaaaaadacaacbiaabaaffiaafaakkkaabaaaaac
abaadciaabaaaaibaeaaaaaeabaacbiaabaaaaiaagaaffkaagaakkkaalaaaaad
acaacciaabaaaaiaafaakkkabcaaaaaeacaaceiaacaappkaafaappiaabaaffia
afaaaaadabaacbiaadaaaaiaacaakkiaafaaaaadabaachiaabaaaaiaacaaoeka
aeaaaaaeabaachiaabaaoeiaafaaaakaacaaffiaafaaaaadadaachiaaaaaoeia
abaaoekaafaaaaadadaachiaadaaoeiaabaapplaafaaaaadabaachiaabaaoeia
adaaoeiaabaaaaacabaaaiiaagaaaakaafaaaaadabaaciiaabaappiaadaaffka
caaaaaadadaacbiaacaaaaiaabaappiaafaaaaadabaaciiaaeaappiaadaaaaia
aeaaaaaeabaachiaabaaoeiaaaaaoekaabaappiaaeaaaaaeabaaciiaacaappia
ahaaaakaahaaffkaabaaaaacacaaabiaafaaaakaaeaaaaaeabaaciiaadaaaaka
abaappiaacaaaaiaafaaaaadaaaachiaabaappiaabaaoeiaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcfiagaaaaeaaaaaaajgabaaaafjaaaaaeegiocaaa
aaaaaaaaanaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
afaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaaaaaaaaajbcaabaaaabaaaaaadkaabaaaaaaaaaaaakiacaia
ebaaaaaaaaaaaaaaamaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaadiaaaaahocaabaaaabaaaaaaagaabaaaabaaaaaaagbjbaaaaeaaaaaa
dcaaaaajhcaabaaaacaaaaaaegbcbaaaaeaaaaaaagaabaaaabaaaaaaegbcbaaa
adaaaaaabacaaaaibcaabaaaabaaaaaajgahbaaaabaaaaaaegbcbaiaebaaaaaa
adaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaadaaaaaa
aagabaaaacaaaaaadcaaaaapdcaabaaaadaaaaaahgapbaaaadaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahccaabaaaabaaaaaaegaabaaaadaaaaaaegaabaaaadaaaaaa
ddaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaai
ccaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaadaaaaaabkaabaaaabaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaa
adaaaaaaegbcbaaaadaaaaaadgcaaaagecaabaaaabaaaaaabkaabaiaebaaaaaa
abaaaaaadcaaaaajccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaajkjjbjdp
abeaaaaamnmmmmdodeaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaa
aaaaaaaaaaaaaaaibcaabaaaabaaaaaackaabaiaebaaaaaaabaaaaaaakaabaaa
abaaaaaadcaaaaakbcaabaaaabaaaaaadkiacaaaaaaaaaaaajaaaaaaakaabaaa
abaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaeaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaaakaabaaaaeaaaaaadiaaaaaincaabaaaabaaaaaaagaabaaaabaaaaaa
agijcaaaaaaaaaaaajaaaaaadcaaaaamhcaabaaaabaaaaaaigadbaaaabaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaaafgafbaaaabaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaaiaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgbpbaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
acaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaaaaaaaaed
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaadiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaogbkbaaaabaaaaaaeghobaaaaeaaaaaaaagabaaaaaaaaaaadcaaaaaj
icaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaeaabeaaaaaaaaaaama
dcaaaaakicaabaaaaaaaaaaaakiacaaaaaaaaaaaakaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaeadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaa
knaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaiaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "IGNOREPROJECTOR"="true" "RenderType"="TreeLeaf" }
  Cull Off
  Fog { Mode Off }
  Offset 1, 1
Program "vp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Vector 13 [_Time]
Vector 14 [unity_LightShadowBias]
Vector 15 [_Scale]
Vector 16 [_SquashPlaneNormal]
Float 17 [_SquashAmount]
Vector 18 [_Wind]
Vector 19 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[22] = { { 0, 1, 2, -0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..19],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0, vertex.normal.y, c[6];
MAD R1, vertex.normal.x, c[5], R0;
ADD R0.xyz, R1, c[0].x;
ABS R2.x, vertex.attrib[14].w;
ADD R2.w, -R2.x, c[0].y;
MAD R0.xyz, R0, R2.w, vertex.position;
MAD R1, vertex.normal.z, c[7], R1;
ADD R3, R1, c[0].x;
DP4 R3.y, R3, R3;
MOV R0.w, c[0].y;
DP3 R0.w, R0.w, c[12];
MUL R2.xyz, R0, c[15];
ADD R0.w, vertex.color.x, R0;
ADD R0.x, vertex.color.y, R0.w;
MOV R0.y, R0.w;
DP3 R0.x, R2, R0.x;
ADD R0.xy, R0, c[13].y;
MUL R0, R0.xxyy, c[20];
FRC R0, R0;
MAD R0, R0, c[0].z, c[0].w;
FRC R0, R0;
MAD R0, R0, c[0].z, -c[0].y;
ABS R0, R0;
MUL R1, -R0, c[0].z;
ADD R1, R1, c[21].x;
MUL R0, R0, R0;
MUL R0, R0, R1;
RSQ R3.y, R3.y;
MAD R1.xy, R3.y, R3.xzzw, -vertex.normal.xzzw;
ADD R3.xy, R0.xzzw, R0.ywzw;
MAD R0.xy, R2.w, R1, vertex.normal.xzzw;
MUL R0.xy, vertex.color.y, R0;
MUL R0.xz, R0.xyyw, c[21].z;
MUL R1.xyz, R3.y, c[18];
MOV R0.w, c[0].y;
MUL R1.xyz, vertex.texcoord[1].y, R1;
MUL R0.y, vertex.texcoord[1], c[21];
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[18].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[18], R0;
DP3 R0.x, R1, c[16];
ADD R0.x, R0, c[16].w;
MUL R0.xyz, R0.x, c[16];
ADD R1.xyz, -R0, R1;
MAD R0.xyz, R0, c[17].x, R1;
DP4 R1.y, R0, c[4];
DP4 R1.x, R0, c[3];
ADD R1.x, R1, c[14];
MAX R1.z, R1.x, -R1.y;
ADD R1.z, R1, -R1.x;
MAD result.position.z, R1, c[14].y, R1.x;
MOV result.position.w, R1.y;
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[19], c[19].zwzw;
END
# 55 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Vector 12 [_Time]
Vector 13 [unity_LightShadowBias]
Vector 14 [_Scale]
Vector 15 [_SquashPlaneNormal]
Float 16 [_SquashAmount]
Vector 17 [_Wind]
Vector 18 [_MainTex_ST]
"vs_2_0
def c19, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c20, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c21, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c22, 0.10000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0, v2.y, c5
mad r1, v2.x, c4, r0
add r0.xyz, r1, c19.x
abs r0.w, v1
add r3.w, -r0, c19.y
mad r0.xyz, r0, r3.w, v0
mov r2.xyz, c11
dp3 r0.w, c19.y, r2
mad r1, v2.z, c6, r1
add r2, r1, c19.x
dp4 r2.y, r2, r2
mul r3.xyz, r0, c14
add r0.w, v5.x, r0
add r0.x, v5.y, r0.w
mov r0.y, r0.w
dp3 r0.x, r3, r0.x
add r0.xy, r0, c12.y
mul r0, r0.xxyy, c20
frc r0, r0
mad r0, r0, c19.z, c19.w
frc r0, r0
mad r0, r0, c21.x, c21.y
abs r0, r0
mul r1, r0, r0
mad r0, -r0, c21.x, c21.z
mul r0, r1, r0
rsq r2.y, r2.y
mad r1.xy, r2.y, r2.xzzw, -v2.xzzw
add r2.xy, r0.xzzw, r0.ywzw
mad r0.xy, r3.w, r1, v2.xzzw
mul r0.xy, v5.y, r0
mul r0.xz, r0.xyyw, c22.x
mul r1.xyz, r2.y, c17
mov r0.w, c19.y
mul r1.xyz, v4.y, r1
mul r0.y, v4, c21.w
mad r0.xyz, r2.xyxw, r0, r1
mad r0.xyz, r0, c17.w, r3
mad r1.xyz, v4.x, c17, r0
dp3 r0.x, r1, c15
add r0.x, r0, c15.w
mul r0.xyz, r0.x, c15
add r1.xyz, -r0, r1
mad r0.xyz, r0, c16.x, r1
dp4 r1.x, r0, c2
add r1.x, r1, c13
max r1.y, r1.x, c19.x
add r1.y, r1, -r1.x
mad r1.z, r1.y, c13.y, r1.x
dp4 r1.w, r0, c3
dp4 r1.x, r0, c0
dp4 r1.y, r0, c1
mov oPos, r1
mov oT0, r1
mad oT1.xy, v3, c18, c18.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Vector 80 [unity_LightShadowBias]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedlfgbeonlfibbkmagddjbpekpohingljdabaaaaaaeeajaaaaadaaaaaa
cmaaaaaapeaaaaaaemabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaiaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapadaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheofaaaaaaaacaaaaaa
aiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcpaahaaaaeaaaabaapmabaaaafjaaaaae
egiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaaagaaaaaafjaaaaaeegiocaaaadaaaaaaapaaaaaafjaaaaae
egiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadicbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaafpaaaaaddcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacaeaaaaaabaaaaaaiccaabaaa
aaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiicaabaaa
aaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaa
aaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiecaabaaa
aaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaaeeaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaigaabaaaaaaaaaaafgafbaaa
aaaaaaaaigbabaiaebaaaaaaacaaaaaaaaaaaaaiecaabaaaaaaaaaaadkbabaia
mbaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajdcaabaaaaaaaaaaakgakbaaa
aaaaaaaaegaabaaaaaaaaaaaigbabaaaacaaaaaadiaaaaahicaabaaaaaaaaaaa
bkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaabaaaaaaagabbaaa
aaaaaaaapgapbaaaaaaaaaaaapaaaaaibcaabaaaacaaaaaaegbabaaaacaaaaaa
egiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaaacaaaaaaegbabaaaacaaaaaa
egiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaaacaaaaaaegbabaaaacaaaaaa
egiacaaaadaaaaaaakaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaa
kgakbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaeaaaaaaafaaaaaadgaaaaagbcaabaaaacaaaaaadkiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaadkiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaacaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakicaabaaa
aaaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaahccaabaaaacaaaaaadkaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaah
icaabaaaaaaaaaaabkaabaaaacaaaaaabkbabaaaafaaaaaabaaaaaahbcaabaaa
acaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaa
agafbaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaa
dcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaa
dcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaah
dcaabaaaacaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaa
adaaaaaafgafbaaaacaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaa
adaaaaaaegacbaaaadaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaabaaaaaa
bkaabaaaacaaaaaabkbabaaaaeaaaaaadgaaaaafecaabaaaacaaaaaaabeaaaaa
jkjjjjdodcaaaaajhcaabaaaabaaaaaaigaabaaaacaaaaaaegacbaaaabaaaaaa
egacbaaaadaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaapgipcaaa
aaaaaaaaadaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaa
aeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaa
abaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaaaaaaaaai
ecaabaaaaaaaaaaackaabaaaaaaaaaaaakiacaaaacaaaaaaafaaaaaadgaaaaaf
lccabaaaaaaaaaaaegambaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaackaabaiaebaaaaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaakeccabaaaaaaaaaaabkiacaaaacaaaaaa
afaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Vector 80 [unity_LightShadowBias]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedbkdpkkmfomdabidciafcglbmgfcdkfmeabaaaaaagaaoaaaaaeaaaaaa
daaaaaaaeiafaaaaeaanaaaaaiaoaaaaebgpgodjbaafaaaabaafaaaaaaacpopp
iiaeaaaaiiaaaaaaaiaaceaaaaaaieaaaaaaieaaaaaaceaaabaaieaaaaaaadaa
abaaabaaaaaaaaaaaaaaahaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
acaaafaaabaaaeaaaaaaaaaaadaaaaaaaeaaafaaaaaaaaaaadaaaiaaahaaajaa
aaaaaaaaaeaaafaaabaabaaaaaaaaaaaaeaaakaaacaabbaaaaaaaaaaaaaaaaaa
aaacpoppfbaaaaafbdaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaaf
beaaapkaaaaaiadpaaaaaaeaaaaaaalpaaaaialpfbaaaaafbfaaapkaaaaaaaea
aaaaeaeamnmmmmdnjkjjjjdofbaaaaafbgaaapkaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
bpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaooka
aiaaaaadaaaaaciaacaaoejaakaaoekaaiaaaaadaaaaaiiaacaaoejaamaaoeka
aiaaaaadaaaaabiaacaaoejaajaaoekaaiaaaaadaaaaaeiaacaaoejaalaaoeka
ajaaaaadaaaaaciaaaaaoeiaaaaaoeiaahaaaaacaaaaaciaaaaaffiaaeaaaaae
aaaaadiaaaaaoiiaaaaaffiaacaaoijbcdaaaaacaaaaaeiaabaappjaacaaaaad
aaaaaeiaaaaakkibbeaaaakaaeaaaaaeaaaaadiaaaaakkiaaaaaoeiaacaaoija
afaaaaadaaaaaiiaafaaffjabfaakkkaafaaaaadabaaafiaaaaaneiaaaaappia
afaaaaadaaaaadiaacaaoejaajaaoekaacaaaaadacaaabiaaaaaffiaaaaaaaia
afaaaaadaaaaadiaacaaoejaakaaoekaacaaaaadacaaaciaaaaaffiaaaaaaaia
afaaaaadaaaaadiaacaaoejaalaaoekaacaaaaadacaaaeiaaaaaffiaaaaaaaia
aeaaaaaeaaaaahiaacaaoeiaaaaakkiaaaaaoejaafaaaaadaaaaahiaaaaaoeia
baaaoekaabaaaaacacaaabiaanaappkaabaaaaacacaaaciaaoaappkaabaaaaac
acaaaeiaapaappkaaiaaaaadaaaaaiiaacaaoeiabeaaaakaacaaaaadacaaacia
aaaappiaafaaaajaacaaaaadaaaaaiiaacaaffiaafaaffjaaiaaaaadacaaabia
aaaaoeiaaaaappiaacaaaaadacaaapiaacaafaiaadaaffkaafaaaaadacaaapia
acaaoeiabdaaoekabdaaaaacacaaapiaacaaoeiaaeaaaaaeacaaapiaacaaoeia
beaaffkabeaakkkabdaaaaacacaaapiaacaaoeiaaeaaaaaeacaaapiaacaaoeia
beaaffkabeaappkacdaaaaacacaaapiaacaaoeiaafaaaaadadaaapiaacaaoeia
acaaoeiaaeaaaaaeacaaapiaacaaoeiabfaaaakbbfaaffkaafaaaaadacaaapia
acaaoeiaadaaoeiaacaaaaadacaaadiaacaaoniaacaaoiiaafaaaaadadaaahia
acaaffiaabaaoekaafaaaaadadaaahiaadaaoeiaaeaaffjaafaaaaadabaaacia
acaaffiaaeaaffjaabaaaaacacaaaeiabfaappkaaeaaaaaeabaaahiaacaamiia
abaaoeiaadaaoeiaaeaaaaaeaaaaahiaabaaoeiaabaappkaaaaaoeiaaeaaaaae
aaaaahiaaeaaaajaabaaoekaaaaaoeiaaiaaaaadaaaaaiiabbaaoekaaaaaoeia
acaaaaadaaaaaiiaaaaappiabbaappkaaeaaaaaeabaaahiaaaaappiabbaaoekb
aaaaoeiabcaaaaaeacaaahiabcaaaakaaaaaoeiaabaaoeiaafaaaaadaaaaapia
acaaffiaagaaoekaaeaaaaaeaaaaapiaafaaoekaacaaaaiaaaaaoeiaaeaaaaae
aaaaapiaahaaoekaacaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiaaiaaoeka
acaaaaadaaaaaeiaaaaakkiaaeaaaakaalaaaaadabaaabiaaaaakkiabgaaaaka
acaaaaadabaaabiaaaaakkibabaaaaiaaeaaaaaeaaaaaemaaeaaffkaabaaaaia
aaaakkiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaaima
aaaappiappppaaaafdeieefcpaahaaaaeaaaabaapmabaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaa
acaaaaaaagaaaaaafjaaaaaeegiocaaaadaaaaaaapaaaaaafjaaaaaeegiocaaa
aeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadicbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaaddcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagiaaaaacaeaaaaaabaaaaaaiccaabaaaaaaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaaiicaabaaaaaaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaaaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaaiecaabaaaaaaaaaaa
egbcbaaaacaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaaaaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaadcaaaaakdcaabaaaaaaaaaaaigaabaaaaaaaaaaafgafbaaaaaaaaaaa
igbabaiaebaaaaaaacaaaaaaaaaaaaaiecaabaaaaaaaaaaadkbabaiambaaaaaa
abaaaaaaabeaaaaaaaaaiadpdcaaaaajdcaabaaaaaaaaaaakgakbaaaaaaaaaaa
egaabaaaaaaaaaaaigbabaaaacaaaaaadiaaaaahicaabaaaaaaaaaaabkbabaaa
afaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaabaaaaaaagabbaaaaaaaaaaa
pgapbaaaaaaaaaaaapaaaaaibcaabaaaacaaaaaaegbabaaaacaaaaaaegiacaaa
adaaaaaaaiaaaaaaapaaaaaiccaabaaaacaaaaaaegbabaaaacaaaaaaegiacaaa
adaaaaaaajaaaaaaapaaaaaiecaabaaaacaaaaaaegbabaaaacaaaaaaegiacaaa
adaaaaaaakaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaakgakbaaa
aaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaeaaaaaaafaaaaaadgaaaaagbcaabaaaacaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaacaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaacaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakicaabaaaaaaaaaaa
egacbaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaacaaaaaadkaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahicaabaaa
aaaaaaaabkaabaaaacaaaaaabkbabaaaafaaaaaabaaaaaahbcaabaaaacaaaaaa
egacbaaaaaaaaaaapgapbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaaagafbaaa
acaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaa
acaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaap
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaa
adaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaadcaaaaba
pcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaah
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaahdcaabaaa
acaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaaadaaaaaa
fgafbaaaacaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaa
egacbaaaadaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaa
acaaaaaabkbabaaaaeaaaaaadgaaaaafecaabaaaacaaaaaaabeaaaaajkjjjjdo
dcaaaaajhcaabaaaabaaaaaaigaabaaaacaaaaaaegacbaaaabaaaaaaegacbaaa
adaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaapgipcaaaaaaaaaaa
adaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaa
egiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaa
egiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaaaaaaaaaiecaabaaa
aaaaaaaackaabaaaaaaaaaaaakiacaaaacaaaaaaafaaaaaadgaaaaaflccabaaa
aaaaaaaaegambaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaakeccabaaaaaaaaaaabkiacaaaacaaaaaaafaaaaaa
akaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaiaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapadaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Vector 13 [_Time]
Vector 14 [_LightPositionRange]
Vector 15 [_Scale]
Vector 16 [_SquashPlaneNormal]
Float 17 [_SquashAmount]
Vector 18 [_Wind]
Vector 19 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[22] = { { 0, 1, 2, -0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..19],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0, vertex.normal.y, c[6];
MAD R1, vertex.normal.x, c[5], R0;
ADD R0.xyz, R1, c[0].x;
ABS R2.x, vertex.attrib[14].w;
ADD R2.w, -R2.x, c[0].y;
MAD R0.xyz, R0, R2.w, vertex.position;
MAD R1, vertex.normal.z, c[7], R1;
ADD R3, R1, c[0].x;
DP4 R3.y, R3, R3;
MOV R0.w, c[0].y;
DP3 R0.w, R0.w, c[12];
MUL R2.xyz, R0, c[15];
ADD R0.w, vertex.color.x, R0;
ADD R0.x, vertex.color.y, R0.w;
MOV R0.y, R0.w;
DP3 R0.x, R2, R0.x;
ADD R0.xy, R0, c[13].y;
MUL R0, R0.xxyy, c[20];
FRC R0, R0;
MAD R0, R0, c[0].z, c[0].w;
FRC R0, R0;
MAD R0, R0, c[0].z, -c[0].y;
ABS R0, R0;
MUL R1, -R0, c[0].z;
ADD R1, R1, c[21].x;
MUL R0, R0, R0;
MUL R0, R0, R1;
RSQ R3.y, R3.y;
MAD R1.xy, R3.y, R3.xzzw, -vertex.normal.xzzw;
ADD R3.xy, R0.xzzw, R0.ywzw;
MAD R0.xy, R2.w, R1, vertex.normal.xzzw;
MUL R0.xy, vertex.color.y, R0;
MUL R0.xz, R0.xyyw, c[21].z;
MUL R1.xyz, R3.y, c[18];
MOV R0.w, c[0].y;
MUL R1.xyz, vertex.texcoord[1].y, R1;
MUL R0.y, vertex.texcoord[1], c[21];
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[18].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[18], R0;
DP3 R0.x, R1, c[16];
ADD R0.x, R0, c[16].w;
MUL R0.xyz, R0.x, c[16];
ADD R1.xyz, -R0, R1;
MAD R0.xyz, R0, c[17].x, R1;
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
ADD result.texcoord[0].xyz, R1, -c[14];
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[19], c[19].zwzw;
END
# 54 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Vector 12 [_Time]
Vector 13 [_LightPositionRange]
Vector 14 [_Scale]
Vector 15 [_SquashPlaneNormal]
Float 16 [_SquashAmount]
Vector 17 [_Wind]
Vector 18 [_MainTex_ST]
"vs_2_0
def c19, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c20, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c21, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c22, 0.10000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0, v2.y, c5
mad r1, v2.x, c4, r0
add r0.xyz, r1, c19.x
abs r0.w, v1
add r3.w, -r0, c19.y
mad r0.xyz, r0, r3.w, v0
mov r2.xyz, c11
dp3 r0.w, c19.y, r2
mad r1, v2.z, c6, r1
add r2, r1, c19.x
dp4 r2.y, r2, r2
mul r3.xyz, r0, c14
add r0.w, v5.x, r0
add r0.x, v5.y, r0.w
mov r0.y, r0.w
dp3 r0.x, r3, r0.x
add r0.xy, r0, c12.y
mul r0, r0.xxyy, c20
frc r0, r0
mad r0, r0, c19.z, c19.w
frc r0, r0
mad r0, r0, c21.x, c21.y
abs r0, r0
mul r1, r0, r0
mad r0, -r0, c21.x, c21.z
mul r0, r1, r0
rsq r2.y, r2.y
mad r1.xy, r2.y, r2.xzzw, -v2.xzzw
add r2.xy, r0.xzzw, r0.ywzw
mad r0.xy, r3.w, r1, v2.xzzw
mul r0.xy, v5.y, r0
mul r0.xz, r0.xyyw, c22.x
mul r1.xyz, r2.y, c17
mov r0.w, c19.y
mul r1.xyz, v4.y, r1
mul r0.y, v4, c21.w
mad r0.xyz, r2.xyxw, r0, r1
mad r0.xyz, r0, c17.w, r3
mad r1.xyz, v4.x, c17, r0
dp3 r0.x, r1, c15
add r0.x, r0, c15.w
mul r0.xyz, r0.x, c15
add r1.xyz, -r0, r1
mad r0.xyz, r0, c16.x, r1
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
add oT0.xyz, r1, -c13
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mad oT1.xy, v3, c18, c18.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedionmlpomacdajagblckjnolnmbbaohjdabaaaaaaieajaaaaadaaaaaa
cmaaaaaapeaaaaaageabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaiaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapadaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheogiaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaafmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcbiaiaaaaeaaaabaaagacaaaafjaaaaaeegiocaaaaaaaaaaa
aiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
acaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaafjaaaaaeegiocaaaaeaaaaaa
amaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadicbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaaddcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
hccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagiaaaaacaeaaaaaabaaaaaai
ccaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaai
icaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaai
bcaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaai
ecaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaah
ccaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaaeeaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaigaabaaaaaaaaaaa
fgafbaaaaaaaaaaaigbabaiaebaaaaaaacaaaaaaaaaaaaaiecaabaaaaaaaaaaa
dkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajdcaabaaaaaaaaaaa
kgakbaaaaaaaaaaaegaabaaaaaaaaaaaigbabaaaacaaaaaadiaaaaahicaabaaa
aaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaabaaaaaa
agabbaaaaaaaaaaapgapbaaaaaaaaaaaapaaaaaibcaabaaaacaaaaaaegbabaaa
acaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaaacaaaaaaegbabaaa
acaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaaacaaaaaaegbabaaa
acaaaaaaegiacaaaadaaaaaaakaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
acaaaaaakgakbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaadgaaaaagbcaabaaaacaaaaaa
dkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaadkiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaacaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaak
icaabaaaaaaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaaaaaaaaahccaabaaaacaaaaaadkaabaaaaaaaaaaaakbabaaaafaaaaaa
aaaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaabkbabaaaafaaaaaabaaaaaah
bcaabaaaacaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaaaaaaaaipcaabaaa
acaaaaaaagafbaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdo
bkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaa
acaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialp
diaaaaajpcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaa
acaaaaaadcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaea
aaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
aaaaaaahdcaabaaaacaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaai
hcaabaaaadaaaaaafgafbaaaacaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaah
hcaabaaaadaaaaaaegacbaaaadaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaa
abaaaaaabkaabaaaacaaaaaabkbabaaaaeaaaaaadgaaaaafecaabaaaacaaaaaa
abeaaaaajkjjjjdodcaaaaajhcaabaaaabaaaaaaigaabaaaacaaaaaaegacbaaa
abaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaa
pgipcaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
agbabaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaai
icaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaal
hcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaia
ebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaadaaaaaaapaaaaaaaaaaaaajhccabaaaabaaaaaaegacbaaa
aaaaaaaaegiccaiaebaaaaaaacaaaaaaabaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedfmndhcicbeheogkdmpkpfdnpgjkadeojabaaaaaajmaoaaaaaeaaaaaa
daaaaaaaeeafaaaageanaaaacmaoaaaaebgpgodjamafaaaaamafaaaaaaacpopp
ieaeaaaaiiaaaaaaaiaaceaaaaaaieaaaaaaieaaaaaaceaaabaaieaaaaaaadaa
abaaabaaaaaaaaaaaaaaahaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
acaaabaaabaaaeaaaaaaaaaaadaaaaaaaeaaafaaaaaaaaaaadaaaiaaaiaaajaa
aaaaaaaaaeaaafaaabaabbaaaaaaaaaaaeaaakaaacaabcaaaaaaaaaaaaaaaaaa
aaacpoppfbaaaaafbeaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaaf
bfaaapkaaaaaiadpaaaaaaeaaaaaaalpaaaaialpfbaaaaafbgaaapkaaaaaaaea
aaaaeaeamnmmmmdnjkjjjjdobpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeabaaadoaadaaoeja
acaaoekaacaaookaaiaaaaadaaaaaciaacaaoejaakaaoekaaiaaaaadaaaaaiia
acaaoejaamaaoekaaiaaaaadaaaaabiaacaaoejaajaaoekaaiaaaaadaaaaaeia
acaaoejaalaaoekaajaaaaadaaaaaciaaaaaoeiaaaaaoeiaahaaaaacaaaaacia
aaaaffiaaeaaaaaeaaaaadiaaaaaoiiaaaaaffiaacaaoijbcdaaaaacaaaaaeia
abaappjaacaaaaadaaaaaeiaaaaakkibbfaaaakaaeaaaaaeaaaaadiaaaaakkia
aaaaoeiaacaaoijaafaaaaadaaaaaiiaafaaffjabgaakkkaafaaaaadabaaafia
aaaaneiaaaaappiaafaaaaadaaaaadiaacaaoejaajaaoekaacaaaaadacaaabia
aaaaffiaaaaaaaiaafaaaaadaaaaadiaacaaoejaakaaoekaacaaaaadacaaacia
aaaaffiaaaaaaaiaafaaaaadaaaaadiaacaaoejaalaaoekaacaaaaadacaaaeia
aaaaffiaaaaaaaiaaeaaaaaeaaaaahiaacaaoeiaaaaakkiaaaaaoejaafaaaaad
aaaaahiaaaaaoeiabbaaoekaabaaaaacacaaabiaanaappkaabaaaaacacaaacia
aoaappkaabaaaaacacaaaeiaapaappkaaiaaaaadaaaaaiiaacaaoeiabfaaaaka
acaaaaadacaaaciaaaaappiaafaaaajaacaaaaadaaaaaiiaacaaffiaafaaffja
aiaaaaadacaaabiaaaaaoeiaaaaappiaacaaaaadacaaapiaacaafaiaadaaffka
afaaaaadacaaapiaacaaoeiabeaaoekabdaaaaacacaaapiaacaaoeiaaeaaaaae
acaaapiaacaaoeiabfaaffkabfaakkkabdaaaaacacaaapiaacaaoeiaaeaaaaae
acaaapiaacaaoeiabfaaffkabfaappkacdaaaaacacaaapiaacaaoeiaafaaaaad
adaaapiaacaaoeiaacaaoeiaaeaaaaaeacaaapiaacaaoeiabgaaaakbbgaaffka
afaaaaadacaaapiaacaaoeiaadaaoeiaacaaaaadacaaadiaacaaoniaacaaoiia
afaaaaadadaaahiaacaaffiaabaaoekaafaaaaadadaaahiaadaaoeiaaeaaffja
afaaaaadabaaaciaacaaffiaaeaaffjaabaaaaacacaaaeiabgaappkaaeaaaaae
abaaahiaacaamiiaabaaoeiaadaaoeiaaeaaaaaeaaaaahiaabaaoeiaabaappka
aaaaoeiaaeaaaaaeaaaaahiaaeaaaajaabaaoekaaaaaoeiaaiaaaaadaaaaaiia
bcaaoekaaaaaoeiaacaaaaadaaaaaiiaaaaappiabcaappkaaeaaaaaeabaaahia
aaaappiabcaaoekbaaaaoeiabcaaaaaeacaaahiabdaaaakaaaaaoeiaabaaoeia
afaaaaadaaaaahiaacaaffiaaoaaoekaaeaaaaaeaaaaahiaanaaoekaacaaaaia
aaaaoeiaaeaaaaaeaaaaahiaapaaoekaacaakkiaaaaaoeiaacaaaaadaaaaahia
aaaaoeiabaaaoekaacaaaaadaaaaahoaaaaaoeiaaeaaoekbafaaaaadaaaaapia
acaaffiaagaaoekaaeaaaaaeaaaaapiaafaaoekaacaaaaiaaaaaoeiaaeaaaaae
aaaaapiaahaaoekaacaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiaaiaaoeka
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
ppppaaaafdeieefcbiaiaaaaeaaaabaaagacaaaafjaaaaaeegiocaaaaaaaaaaa
aiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
acaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaafjaaaaaeegiocaaaaeaaaaaa
amaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadicbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaaddcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
hccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagiaaaaacaeaaaaaabaaaaaai
ccaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaajaaaaaabaaaaaai
icaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaalaaaaaabaaaaaai
bcaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaaiaaaaaabaaaaaai
ecaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaakaaaaaabbaaaaah
ccaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaaeeaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaigaabaaaaaaaaaaa
fgafbaaaaaaaaaaaigbabaiaebaaaaaaacaaaaaaaaaaaaaiecaabaaaaaaaaaaa
dkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajdcaabaaaaaaaaaaa
kgakbaaaaaaaaaaaegaabaaaaaaaaaaaigbabaaaacaaaaaadiaaaaahicaabaaa
aaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaabaaaaaa
agabbaaaaaaaaaaapgapbaaaaaaaaaaaapaaaaaibcaabaaaacaaaaaaegbabaaa
acaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaaacaaaaaaegbabaaa
acaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaaacaaaaaaegbabaaa
acaaaaaaegiacaaaadaaaaaaakaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
acaaaaaakgakbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaadgaaaaagbcaabaaaacaaaaaa
dkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaadkiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaacaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaak
icaabaaaaaaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaaaaaaaaahccaabaaaacaaaaaadkaabaaaaaaaaaaaakbabaaaafaaaaaa
aaaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaabkbabaaaafaaaaaabaaaaaah
bcaabaaaacaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaaaaaaaaipcaabaaa
acaaaaaaagafbaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdo
bkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaa
acaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialp
diaaaaajpcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaa
acaaaaaadcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaea
aaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
aaaaaaahdcaabaaaacaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaai
hcaabaaaadaaaaaafgafbaaaacaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaah
hcaabaaaadaaaaaaegacbaaaadaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaa
abaaaaaabkaabaaaacaaaaaabkbabaaaaeaaaaaadgaaaaafecaabaaaacaaaaaa
abeaaaaajkjjjjdodcaaaaajhcaabaaaabaaaaaaigaabaaaacaaaaaaegacbaaa
abaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaa
pgipcaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
agbabaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaai
icaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaal
hcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaia
ebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaadaaaaaaapaaaaaaaaaaaaajhccabaaaabaaaaaaegacbaaa
aaaaaaaaegiccaiaebaaaaaaacaaaaaaabaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaiaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apadaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahaiaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0 } };
TEMP R0;
TEX R0.w, fragment.texcoord[1], texture[0], 2D;
SLT R0.x, R0.w, c[0];
MOV result.color, c[1].x;
KIL -R0.x;
END
# 4 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c1, 0.00000000, 1.00000000, 0, 0
dcl t0.xyzw
dcl t1.xy
texld r0, t1, s0
add_pp r0.x, r0.w, -c0
cmp r0.x, r0, c1, c1.y
mov_pp r0, -r0.x
texkill r0.xyzw
rcp r0.x, t0.w
mul r0.x, t0.z, r0
mov_pp r0, r0.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedbjglihenigcaenjjkckflhoeflnljfmgabaaaaaakiabaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcoiaaaaaa
eaaaaaaadkaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaajbcaabaaa
aaaaaaaadkaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaaiaaaaaadbaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaa
aaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedgdbigdcdfhkicoebdmoclnoieiognpliabaaaaaagaacaaaaaeaaaaaa
daaaaaaaoeaaaaaaneabaaaacmacaaaaebgpgodjkmaaaaaakmaaaaaaaaacpppp
hiaaaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaaiaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaacpiaaaaaoelaaaaioekaacaaaaadaaaacpiaaaaappiaaaaaaakb
ebaaaaabaaaaapiaabaaaaacaaaacpiaabaaaakaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcoiaaaaaaeaaaaaaadkaaaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaaaaaaaaajbcaabaaaaaaaaaaadkaabaaaaaaaaaaaakiacaiaebaaaaaa
aaaaaaaaaiaaaaaadbaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaaaaanaaaeadakaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabejfdeheofaaaaaaaacaaaaaa
aiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[4] = { program.local[0..1],
		{ 1, 255, 65025, 16581375 },
		{ 0.99900001, 0.0039215689 } };
TEMP R0;
TEX R0.w, fragment.texcoord[1], texture[0], 2D;
SLT R0.x, R0.w, c[1];
KIL -R0.x;
DP3 R0.x, fragment.texcoord[0], fragment.texcoord[0];
RSQ R0.x, R0.x;
RCP R0.x, R0.x;
MUL R0.x, R0, c[0].w;
MIN R0.x, R0, c[3];
MUL R0, R0.x, c[2];
FRC R0, R0;
MAD result.color, -R0.yzww, c[3].y, R0;
END
# 11 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c2, 0.00000000, 1.00000000, 0.99900001, 0.00392157
def c3, 1.00000000, 255.00000000, 65025.00000000, 16581375.00000000
dcl t0.xyz
dcl t1.xy
texld r0, t1, s0
add_pp r0.x, r0.w, -c1
cmp r0.x, r0, c2, c2.y
mov_pp r0, -r0.x
texkill r0.xyzw
dp3 r0.x, t0, t0
rsq r0.x, r0.x
rcp r0.x, r0.x
mul r0.x, r0, c0.w
min r0.x, r0, c2.z
mul r0, r0.x, c3
frc r1, r0
mov r0.z, -r1.w
mov r0.xyw, -r1.yzxw
mad r0, r0, c2.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Float 128 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedfdhfljnffomhokigbnccogfdcpmmhhkmabaaaaaajiacaaaaadaaaaaa
cmaaaaaajmaaaaaanaaaaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmaabaaaaeaaaaaaahaaaaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaacaaaaaa
fkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaad
hcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaajbcaabaaaaaaaaaaadkaabaaaaaaaaaaa
akiacaiaebaaaaaaaaaaaaaaaiaaaaaadbaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaelaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaa
abaaaaaaabaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
hhlohpdpdiaaaaakpcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaahpedaaabhoehppachnelbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaanpccabaaaaaaaaaaajgapbaiaebaaaaaaaaaaaaaaaceaaaaaibiaiadl
ibiaiadlibiaiadlibiaiadlegaobaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Float 128 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedeknkcodnokeokohlfibjlgcmpoegdepfabaaaaaadmaeaaaaaeaaaaaa
daaaaaaanaabaaaajiadaaaaaiaeaaaaebgpgodjjiabaaaajiabaaaaaaacpppp
fiabaaaaeaaaaaaaacaaciaaaaaaeaaaaaaaeaaaabaaceaaaaaaeaaaaaaaaaaa
aaaaaiaaabaaaaaaaaaaaaaaabaaabaaabaaabaaaaaaaaaaaaacppppfbaaaaaf
acaaapkaibiaiadlaaaaaaaaaaaaaaaaaaaaaaaafbaaaaafadaaapkahhlohplp
aaljdolpaaaahklpaaaaaaiafbaaaaafaeaaapkaaaaaiadpaaaahpedaaabhoeh
ppachnelbpaaaaacaaaaaaiaaaaaahlabpaaaaacaaaaaaiaabaaadlabpaaaaac
aaaaaajaaaaiapkaecaaaaadaaaacpiaabaaoelaaaaioekaacaaaaadaaaacpia
aaaappiaaaaaaakbebaaaaabaaaaapiaaiaaaaadaaaaabiaaaaaoelaaaaaoela
ahaaaaacaaaaabiaaaaaaaiaagaaaaacaaaaabiaaaaaaaiaafaaaaadaaaaacia
aaaaaaiaabaappkaabaaaaacabaaaiiaadaaaakaaeaaaaaeaaaaabiaaaaaaaia
abaappkaabaappiaafaaaaadabaaapiaaaaaffiaaeaaoekabdaaaaacabaaapia
abaaoeiafiaaaaaeaaaaapiaaaaaaaiaadaaoekbabaaoeiaaeaaaaaeabaaclia
aaaamjiaacaaaakbaaaaoeiaaeaaaaaeabaaceiaaaaappiaacaaaakbaaaakkia
abaaaaacaaaicpiaabaaoeiappppaaaafdeieefcmaabaaaaeaaaaaaahaaaaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaacaaaaaa
fkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaad
hcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaajbcaabaaaaaaaaaaadkaabaaaaaaaaaaa
akiacaiaebaaaaaaaaaaaaaaaiaaaaaadbaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaelaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaa
abaaaaaaabaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
hhlohpdpdiaaaaakpcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaahpedaaabhoehppachnelbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaanpccabaaaaaaaaaaajgapbaiaebaaaaaaaaaaaaaaaceaaaaaibiaiadl
ibiaiadlibiaiadlibiaiadlegaobaaaaaaaaaaadoaaaaabejfdeheogiaaaaaa
adaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaafmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "SHADOWCOLLECTOR"
  Tags { "LIGHTMODE"="SHADOWCOLLECTOR" "IGNOREPROJECTOR"="true" "RenderType"="TreeLeaf" }
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
Keywords { "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 13 [unity_World2Shadow0]
Matrix 17 [unity_World2Shadow1]
Matrix 21 [unity_World2Shadow2]
Matrix 25 [unity_World2Shadow3]
Matrix 29 [_Object2World]
Vector 33 [_Time]
Vector 34 [_Scale]
Vector 35 [_SquashPlaneNormal]
Float 36 [_SquashAmount]
Vector 37 [_Wind]
Vector 38 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[41] = { { 0, 1, 2, -0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[13..38],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0, vertex.normal.y, c[10];
MAD R1, vertex.normal.x, c[9], R0;
ADD R0.xyz, R1, c[0].x;
ABS R2.x, vertex.attrib[14].w;
ADD R2.w, -R2.x, c[0].y;
MAD R0.xyz, R0, R2.w, vertex.position;
MAD R1, vertex.normal.z, c[11], R1;
ADD R3, R1, c[0].x;
DP4 R3.y, R3, R3;
MOV R0.w, c[0].y;
DP3 R0.w, R0.w, c[32];
MUL R2.xyz, R0, c[34];
ADD R0.w, vertex.color.x, R0;
ADD R0.x, vertex.color.y, R0.w;
MOV R0.y, R0.w;
DP3 R0.x, R2, R0.x;
ADD R0.xy, R0, c[33].y;
MUL R0, R0.xxyy, c[39];
FRC R0, R0;
MAD R0, R0, c[0].z, c[0].w;
FRC R0, R0;
MAD R0, R0, c[0].z, -c[0].y;
ABS R0, R0;
MUL R1, -R0, c[0].z;
ADD R1, R1, c[40].x;
MUL R0, R0, R0;
MUL R0, R0, R1;
RSQ R3.y, R3.y;
MAD R1.xy, R3.y, R3.xzzw, -vertex.normal.xzzw;
ADD R3.xy, R0.xzzw, R0.ywzw;
MAD R0.xy, R2.w, R1, vertex.normal.xzzw;
MUL R0.xy, vertex.color.y, R0;
MUL R0.xz, R0.xyyw, c[40].z;
MUL R1.xyz, R3.y, c[37];
MOV R2.w, c[0].y;
MUL R1.xyz, vertex.texcoord[1].y, R1;
MUL R0.y, vertex.texcoord[1], c[40];
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[37].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[37], R0;
DP3 R0.x, R1, c[35];
ADD R0.x, R0, c[35].w;
MUL R0.xyz, R0.x, c[35];
ADD R1.xyz, -R0, R1;
MAD R2.xyz, R0, c[36].x, R1;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[32];
DP4 R0.z, R2, c[31];
DP4 R0.x, R2, c[29];
DP4 R0.y, R2, c[30];
MOV R1.xyz, R0;
MOV R0.w, -R0;
DP4 result.texcoord[0].z, R1, c[15];
DP4 result.texcoord[0].y, R1, c[14];
DP4 result.texcoord[0].x, R1, c[13];
DP4 result.texcoord[1].z, R1, c[19];
DP4 result.texcoord[1].y, R1, c[18];
DP4 result.texcoord[1].x, R1, c[17];
DP4 result.texcoord[2].z, R1, c[23];
DP4 result.texcoord[2].y, R1, c[22];
DP4 result.texcoord[2].x, R1, c[21];
DP4 result.texcoord[3].z, R1, c[27];
DP4 result.texcoord[3].y, R1, c[26];
DP4 result.texcoord[3].x, R1, c[25];
MOV result.texcoord[4], R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
MAD result.texcoord[5].xy, vertex.texcoord[0], c[38], c[38].zwzw;
END
# 70 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [glstate_matrix_invtrans_modelview0]
Matrix 12 [unity_World2Shadow0]
Matrix 16 [unity_World2Shadow1]
Matrix 20 [unity_World2Shadow2]
Matrix 24 [unity_World2Shadow3]
Matrix 28 [_Object2World]
Vector 32 [_Time]
Vector 33 [_Scale]
Vector 34 [_SquashPlaneNormal]
Float 35 [_SquashAmount]
Vector 36 [_Wind]
Vector 37 [_MainTex_ST]
"vs_2_0
def c38, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c39, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c40, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c41, 0.10000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0, v2.y, c9
mad r1, v2.x, c8, r0
add r0.xyz, r1, c38.x
abs r0.w, v1
add r3.w, -r0, c38.y
mad r0.xyz, r0, r3.w, v0
mov r2.xyz, c31
dp3 r0.w, c38.y, r2
mad r1, v2.z, c10, r1
add r2, r1, c38.x
dp4 r2.y, r2, r2
mov r2.w, c38.y
mul r3.xyz, r0, c33
add r0.w, v5.x, r0
add r0.x, v5.y, r0.w
mov r0.y, r0.w
dp3 r0.x, r3, r0.x
add r0.xy, r0, c32.y
mul r0, r0.xxyy, c39
frc r0, r0
mad r0, r0, c38.z, c38.w
frc r0, r0
mad r0, r0, c40.x, c40.y
abs r0, r0
mul r1, r0, r0
mad r0, -r0, c40.x, c40.z
mul r0, r1, r0
rsq r2.y, r2.y
mad r1.xy, r2.y, r2.xzzw, -v2.xzzw
add r2.xy, r0.xzzw, r0.ywzw
mad r0.xy, r3.w, r1, v2.xzzw
mul r0.xy, v5.y, r0
mul r1.xyz, r2.y, c36
mul r0.xz, r0.xyyw, c41.x
mul r1.xyz, v4.y, r1
mul r0.y, v4, c40.w
mad r0.xyz, r2.xyxw, r0, r1
mad r0.xyz, r0, c36.w, r3
mad r1.xyz, v4.x, c36, r0
dp3 r0.x, r1, c34
add r0.x, r0, c34.w
mul r0.xyz, r0.x, c34
add r1.xyz, -r0, r1
mad r2.xyz, r0, c35.x, r1
dp4 r0.w, r2, c2
dp4 r1.w, r2, c31
dp4 r0.z, r2, c30
dp4 r0.x, r2, c28
dp4 r0.y, r2, c29
mov r1.xyz, r0
mov r0.w, -r0
dp4 oT0.z, r1, c14
dp4 oT0.y, r1, c13
dp4 oT0.x, r1, c12
dp4 oT1.z, r1, c18
dp4 oT1.y, r1, c17
dp4 oT1.x, r1, c16
dp4 oT2.z, r1, c22
dp4 oT2.y, r1, c21
dp4 oT2.x, r1, c20
dp4 oT3.z, r1, c26
dp4 oT3.y, r1, c25
dp4 oT3.x, r1, c24
mov oT4, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
mad oT5.xy, v3, c37, c37.zwzw
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 13 [unity_World2Shadow0]
Matrix 17 [unity_World2Shadow1]
Matrix 21 [unity_World2Shadow2]
Matrix 25 [unity_World2Shadow3]
Matrix 29 [_Object2World]
Vector 33 [_Time]
Vector 34 [_Scale]
Vector 35 [_SquashPlaneNormal]
Float 36 [_SquashAmount]
Vector 37 [_Wind]
Vector 38 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[41] = { { 0, 1, 2, -0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[13..38],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0, vertex.normal.y, c[10];
MAD R1, vertex.normal.x, c[9], R0;
ADD R0.xyz, R1, c[0].x;
ABS R2.x, vertex.attrib[14].w;
ADD R2.w, -R2.x, c[0].y;
MAD R0.xyz, R0, R2.w, vertex.position;
MAD R1, vertex.normal.z, c[11], R1;
ADD R3, R1, c[0].x;
DP4 R3.y, R3, R3;
MOV R0.w, c[0].y;
DP3 R0.w, R0.w, c[32];
MUL R2.xyz, R0, c[34];
ADD R0.w, vertex.color.x, R0;
ADD R0.x, vertex.color.y, R0.w;
MOV R0.y, R0.w;
DP3 R0.x, R2, R0.x;
ADD R0.xy, R0, c[33].y;
MUL R0, R0.xxyy, c[39];
FRC R0, R0;
MAD R0, R0, c[0].z, c[0].w;
FRC R0, R0;
MAD R0, R0, c[0].z, -c[0].y;
ABS R0, R0;
MUL R1, -R0, c[0].z;
ADD R1, R1, c[40].x;
MUL R0, R0, R0;
MUL R0, R0, R1;
RSQ R3.y, R3.y;
MAD R1.xy, R3.y, R3.xzzw, -vertex.normal.xzzw;
ADD R3.xy, R0.xzzw, R0.ywzw;
MAD R0.xy, R2.w, R1, vertex.normal.xzzw;
MUL R0.xy, vertex.color.y, R0;
MUL R0.xz, R0.xyyw, c[40].z;
MUL R1.xyz, R3.y, c[37];
MOV R2.w, c[0].y;
MUL R1.xyz, vertex.texcoord[1].y, R1;
MUL R0.y, vertex.texcoord[1], c[40];
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[37].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[37], R0;
DP3 R0.x, R1, c[35];
ADD R0.x, R0, c[35].w;
MUL R0.xyz, R0.x, c[35];
ADD R1.xyz, -R0, R1;
MAD R2.xyz, R0, c[36].x, R1;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[32];
DP4 R0.z, R2, c[31];
DP4 R0.x, R2, c[29];
DP4 R0.y, R2, c[30];
MOV R1.xyz, R0;
MOV R0.w, -R0;
DP4 result.texcoord[0].z, R1, c[15];
DP4 result.texcoord[0].y, R1, c[14];
DP4 result.texcoord[0].x, R1, c[13];
DP4 result.texcoord[1].z, R1, c[19];
DP4 result.texcoord[1].y, R1, c[18];
DP4 result.texcoord[1].x, R1, c[17];
DP4 result.texcoord[2].z, R1, c[23];
DP4 result.texcoord[2].y, R1, c[22];
DP4 result.texcoord[2].x, R1, c[21];
DP4 result.texcoord[3].z, R1, c[27];
DP4 result.texcoord[3].y, R1, c[26];
DP4 result.texcoord[3].x, R1, c[25];
MOV result.texcoord[4], R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
MAD result.texcoord[5].xy, vertex.texcoord[0], c[38], c[38].zwzw;
END
# 70 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [glstate_matrix_invtrans_modelview0]
Matrix 12 [unity_World2Shadow0]
Matrix 16 [unity_World2Shadow1]
Matrix 20 [unity_World2Shadow2]
Matrix 24 [unity_World2Shadow3]
Matrix 28 [_Object2World]
Vector 32 [_Time]
Vector 33 [_Scale]
Vector 34 [_SquashPlaneNormal]
Float 35 [_SquashAmount]
Vector 36 [_Wind]
Vector 37 [_MainTex_ST]
"vs_2_0
def c38, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c39, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c40, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c41, 0.10000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0, v2.y, c9
mad r1, v2.x, c8, r0
add r0.xyz, r1, c38.x
abs r0.w, v1
add r3.w, -r0, c38.y
mad r0.xyz, r0, r3.w, v0
mov r2.xyz, c31
dp3 r0.w, c38.y, r2
mad r1, v2.z, c10, r1
add r2, r1, c38.x
dp4 r2.y, r2, r2
mov r2.w, c38.y
mul r3.xyz, r0, c33
add r0.w, v5.x, r0
add r0.x, v5.y, r0.w
mov r0.y, r0.w
dp3 r0.x, r3, r0.x
add r0.xy, r0, c32.y
mul r0, r0.xxyy, c39
frc r0, r0
mad r0, r0, c38.z, c38.w
frc r0, r0
mad r0, r0, c40.x, c40.y
abs r0, r0
mul r1, r0, r0
mad r0, -r0, c40.x, c40.z
mul r0, r1, r0
rsq r2.y, r2.y
mad r1.xy, r2.y, r2.xzzw, -v2.xzzw
add r2.xy, r0.xzzw, r0.ywzw
mad r0.xy, r3.w, r1, v2.xzzw
mul r0.xy, v5.y, r0
mul r1.xyz, r2.y, c36
mul r0.xz, r0.xyyw, c41.x
mul r1.xyz, v4.y, r1
mul r0.y, v4, c40.w
mad r0.xyz, r2.xyxw, r0, r1
mad r0.xyz, r0, c36.w, r3
mad r1.xyz, v4.x, c36, r0
dp3 r0.x, r1, c34
add r0.x, r0, c34.w
mul r0.xyz, r0.x, c34
add r1.xyz, -r0, r1
mad r2.xyz, r0, c35.x, r1
dp4 r0.w, r2, c2
dp4 r1.w, r2, c31
dp4 r0.z, r2, c30
dp4 r0.x, r2, c28
dp4 r0.y, r2, c29
mov r1.xyz, r0
mov r0.w, -r0
dp4 oT0.z, r1, c14
dp4 oT0.y, r1, c13
dp4 oT0.x, r1, c12
dp4 oT1.z, r1, c18
dp4 oT1.y, r1, c17
dp4 oT1.x, r1, c16
dp4 oT2.z, r1, c22
dp4 oT2.y, r1, c21
dp4 oT2.x, r1, c20
dp4 oT3.z, r1, c26
dp4 oT3.y, r1, c25
dp4 oT3.x, r1, c24
mov oT4, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
mad oT5.xy, v3, c37, c37.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedknjoalhiogmdoodcllgbkmgcgdeakfhdabaaaaaaamanaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaiaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapadaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefceaalaaaaeaaaabaanaacaaaafjaaaaaeegiocaaaaaaaaaaa
aiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
biaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaafjaaaaaeegiocaaaaeaaaaaa
amaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadicbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaaddcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
hccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagfaaaaaddccabaaa
agaaaaaagiaaaaacaeaaaaaabaaaaaaiccaabaaaaaaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaajaaaaaabaaaaaaiicaabaaaaaaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaaaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaaiaaaaaabaaaaaaiecaabaaaaaaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
dcaabaaaaaaaaaaaigaabaaaaaaaaaaafgafbaaaaaaaaaaaigbabaiaebaaaaaa
acaaaaaaaaaaaaaiecaabaaaaaaaaaaadkbabaiambaaaaaaabaaaaaaabeaaaaa
aaaaiadpdcaaaaajdcaabaaaaaaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaa
igbabaaaacaaaaaadiaaaaahicaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaa
mnmmmmdndiaaaaahfcaabaaaabaaaaaaagabbaaaaaaaaaaapgapbaaaaaaaaaaa
apaaaaaibcaabaaaacaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaa
apaaaaaiccaabaaaacaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaa
apaaaaaiecaabaaaacaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaakgakbaaaaaaaaaaaegbcbaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaeaaaaaa
afaaaaaadgaaaaagbcaabaaaacaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaacaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaa
dkiacaaaadaaaaaaaoaaaaaabaaaaaakicaabaaaaaaaaaaaegacbaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaacaaaaaa
dkaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaa
acaaaaaabkbabaaaafaaaaaabaaaaaahbcaabaaaacaaaaaaegacbaaaaaaaaaaa
pgapbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaaagafbaaaacaaaaaafgifcaaa
abaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaa
mnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaacaaaaaaegaobaaa
acaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalp
bkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaadaaaaaaegaobaia
ibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaa
egaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaahdcaabaaaacaaaaaangafbaaa
acaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaacaaaaaa
egiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
fgbfbaaaaeaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaacaaaaaabkbabaaa
aeaaaaaadgaaaaafecaabaaaacaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
abaaaaaaigaabaaaacaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaabaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
adaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaapaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaajaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaiaaaaaaagaabaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaakaaaaaa
kgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaa
acaaaaaaalaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaaapaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaabaaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaabcaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaabdaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaabfaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabeaaaaaa
agaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaabgaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaacaaaaaabhaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaa
dgaaaaafhccabaaaafaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaackiacaaaadaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckiacaaaadaaaaaaaeaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaackiacaaaadaaaaaaagaaaaaackaabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaadaaaaaa
ahaaaaaadgaaaaagiccabaaaafaaaaaaakaabaiaebaaaaaaaaaaaaaadcaaaaal
dccabaaaagaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaa
aaaaaaaaahaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecednkmbfmocikcimdejkiamdjffiiggokcgabaaaaaajibdaaaaaeaaaaaa
daaaaaaaliagaaaaaabcaaaamibcaaaaebgpgodjiaagaaaaiaagaaaaaaacpopp
aeagaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
abaaabaaaaaaaaaaaaaaahaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
acaaaiaabaaaaeaaaaaaaaaaadaaaaaabaaabeaaaaaaaaaaaeaaafaaabaaceaa
aaaaaaaaaeaaakaaacaacfaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafchaaapka
mnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafciaaapkaaaaaiadpaaaaaaea
aaaaaalpaaaaialpfbaaaaafcjaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdo
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaac
afaaafiaafaaapjaaeaaaaaeafaaadoaadaaoejaacaaoekaacaaookaaiaaaaad
aaaaaciaacaaoejabnaaoekaaiaaaaadaaaaaiiaacaaoejabpaaoekaaiaaaaad
aaaaabiaacaaoejabmaaoekaaiaaaaadaaaaaeiaacaaoejaboaaoekaajaaaaad
aaaaaciaaaaaoeiaaaaaoeiaahaaaaacaaaaaciaaaaaffiaaeaaaaaeaaaaadia
aaaaoiiaaaaaffiaacaaoijbcdaaaaacaaaaaeiaabaappjaacaaaaadaaaaaeia
aaaakkibciaaaakaaeaaaaaeaaaaadiaaaaakkiaaaaaoeiaacaaoijaafaaaaad
aaaaaiiaafaaffjacjaakkkaafaaaaadabaaafiaaaaaneiaaaaappiaafaaaaad
aaaaadiaacaaoejabmaaoekaacaaaaadacaaabiaaaaaffiaaaaaaaiaafaaaaad
aaaaadiaacaaoejabnaaoekaacaaaaadacaaaciaaaaaffiaaaaaaaiaafaaaaad
aaaaadiaacaaoejaboaaoekaacaaaaadacaaaeiaaaaaffiaaaaaaaiaaeaaaaae
aaaaahiaacaaoeiaaaaakkiaaaaaoejaafaaaaadaaaaahiaaaaaoeiaceaaoeka
abaaaaacacaaabiacaaappkaabaaaaacacaaaciacbaappkaabaaaaacacaaaeia
ccaappkaaiaaaaadaaaaaiiaacaaoeiaciaaaakaacaaaaadacaaaciaaaaappia
afaaaajaacaaaaadaaaaaiiaacaaffiaafaaffjaaiaaaaadacaaabiaaaaaoeia
aaaappiaacaaaaadacaaapiaacaafaiaadaaffkaafaaaaadacaaapiaacaaoeia
chaaoekabdaaaaacacaaapiaacaaoeiaaeaaaaaeacaaapiaacaaoeiaciaaffka
ciaakkkabdaaaaacacaaapiaacaaoeiaaeaaaaaeacaaapiaacaaoeiaciaaffka
ciaappkacdaaaaacacaaapiaacaaoeiaafaaaaadadaaapiaacaaoeiaacaaoeia
aeaaaaaeacaaapiaacaaoeiacjaaaakbcjaaffkaafaaaaadacaaapiaacaaoeia
adaaoeiaacaaaaadacaaadiaacaaoniaacaaoiiaafaaaaadadaaahiaacaaffia
abaaoekaafaaaaadadaaahiaadaaoeiaaeaaffjaafaaaaadabaaaciaacaaffia
aeaaffjaabaaaaacacaaaeiacjaappkaaeaaaaaeabaaahiaacaamiiaabaaoeia
adaaoeiaaeaaaaaeaaaaahiaabaaoeiaabaappkaaaaaoeiaaeaaaaaeaaaaahia
aeaaaajaabaaoekaaaaaoeiaaiaaaaadaaaaaiiacfaaoekaaaaaoeiaacaaaaad
aaaaaiiaaaaappiacfaappkaaeaaaaaeabaaahiaaaaappiacfaaoekbaaaaoeia
bcaaaaaeacaaahiacgaaaakaaaaaoeiaabaaoeiaafaaaaadaaaaabiaacaaffia
bjaakkkaaeaaaaaeaaaaabiabiaakkkaacaaaaiaaaaaaaiaaeaaaaaeaaaaabia
bkaakkkaacaakkiaaaaaaaiaacaaaaadaaaaabiaaaaaaaiablaakkkaabaaaaac
aeaaaioaaaaaaaibafaaaaadaaaaapiaacaaffiacbaaoekaaeaaaaaeaaaaapia
caaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiaccaaoekaacaakkiaaaaaoeia
acaaaaadaaaaapiaaaaaoeiacdaaoekaafaaaaadabaaahiaaaaaffiaafaaoeka
aeaaaaaeabaaahiaaeaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaagaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaahoaahaaoekaaaaappiaabaaoeiaafaaaaad
abaaahiaaaaaffiaajaaoekaaeaaaaaeabaaahiaaiaaoekaaaaaaaiaabaaoeia
aeaaaaaeabaaahiaakaaoekaaaaakkiaabaaoeiaaeaaaaaeabaaahoaalaaoeka
aaaappiaabaaoeiaafaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeabaaahia
amaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaaoaaoekaaaaakkiaabaaoeia
aeaaaaaeacaaahoaapaaoekaaaaappiaabaaoeiaafaaaaadabaaahiaaaaaffia
bbaaoekaaeaaaaaeabaaahiabaaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahia
bcaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaahoabdaaoekaaaaappiaabaaoeia
abaaaaacaeaaahoaaaaaoeiaafaaaaadaaaaapiaacaaffiabfaaoekaaeaaaaae
aaaaapiabeaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiabgaaoekaacaakkia
aaaaoeiaacaaaaadaaaaapiaaaaaoeiabhaaoekaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefceaalaaaa
eaaaabaanaacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabiaaaaaafjaaaaaeegiocaaa
adaaaaaabaaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaa
aaaaaaaafpaaaaadicbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaaddcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagfaaaaaddccabaaaagaaaaaagiaaaaacaeaaaaaa
baaaaaaiccaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaajaaaaaa
baaaaaaiicaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaalaaaaaa
baaaaaaibcaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaaiaaaaaa
baaaaaaiecaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaakaaaaaa
bbaaaaahccaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaaeeaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaigaabaaa
aaaaaaaafgafbaaaaaaaaaaaigbabaiaebaaaaaaacaaaaaaaaaaaaaiecaabaaa
aaaaaaaadkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajdcaabaaa
aaaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaaigbabaaaacaaaaaadiaaaaah
icaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaa
abaaaaaaagabbaaaaaaaaaaapgapbaaaaaaaaaaaapaaaaaibcaabaaaacaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaaacaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaaacaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaacaaaaaakgakbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaadgaaaaagbcaabaaa
acaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaadkiacaaa
adaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaadkiacaaaadaaaaaaaoaaaaaa
baaaaaakicaabaaaaaaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaaaaaaaaahccaabaaaacaaaaaadkaabaaaaaaaaaaaakbabaaa
afaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaabkbabaaaafaaaaaa
baaaaaahbcaabaaaacaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaaaaaaaai
pcaabaaaacaaaaaaagafbaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaak
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamado
mlkbefdobkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaa
egaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialp
aaaaialpdiaaaaajpcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaia
ibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaea
aaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaa
adaaaaaaaaaaaaahdcaabaaaacaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaa
diaaaaaihcaabaaaadaaaaaafgafbaaaacaaaaaaegiccaaaaaaaaaaaadaaaaaa
diaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaafgbfbaaaaeaaaaaadiaaaaah
ccaabaaaabaaaaaabkaabaaaacaaaaaabkbabaaaaeaaaaaadgaaaaafecaabaaa
acaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaaabaaaaaaigaabaaaacaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
abaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaa
dcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaa
alaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaa
adaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaa
egaobaaaabaaaaaaegiocaaaadaaaaaaapaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaacaaaaaaajaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaaaiaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaaakaaaaaakgakbaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaaacaaaaaaalaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
amaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hccabaaaacaaaaaaegiccaaaacaaaaaaapaaaaaapgapbaaaabaaaaaaegacbaaa
acaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaa
bbaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagaabaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
bcaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaacaaaaaabdaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaabfaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaabeaaaaaaagaabaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabgaaaaaakgakbaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaa
bhaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaaafaaaaaa
egacbaaaabaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaackiacaaa
adaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaa
akaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
adaaaaaaagaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaackiacaaaadaaaaaaahaaaaaadgaaaaagiccabaaa
afaaaaaaakaabaiaebaaaaaaaaaaaaaadcaaaaaldccabaaaagaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaiaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapadaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaahaiaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
lmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 13 [unity_World2Shadow0]
Matrix 17 [unity_World2Shadow1]
Matrix 21 [unity_World2Shadow2]
Matrix 25 [unity_World2Shadow3]
Matrix 29 [_Object2World]
Vector 33 [_Time]
Vector 34 [_Scale]
Vector 35 [_SquashPlaneNormal]
Float 36 [_SquashAmount]
Vector 37 [_Wind]
Vector 38 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[41] = { { 0, 1, 2, -0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[13..38],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0, vertex.normal.y, c[10];
MAD R1, vertex.normal.x, c[9], R0;
ADD R0.xyz, R1, c[0].x;
ABS R2.x, vertex.attrib[14].w;
ADD R2.w, -R2.x, c[0].y;
MAD R0.xyz, R0, R2.w, vertex.position;
MAD R1, vertex.normal.z, c[11], R1;
ADD R3, R1, c[0].x;
DP4 R3.y, R3, R3;
MOV R0.w, c[0].y;
DP3 R0.w, R0.w, c[32];
MUL R2.xyz, R0, c[34];
ADD R0.w, vertex.color.x, R0;
ADD R0.x, vertex.color.y, R0.w;
MOV R0.y, R0.w;
DP3 R0.x, R2, R0.x;
ADD R0.xy, R0, c[33].y;
MUL R0, R0.xxyy, c[39];
FRC R0, R0;
MAD R0, R0, c[0].z, c[0].w;
FRC R0, R0;
MAD R0, R0, c[0].z, -c[0].y;
ABS R0, R0;
MUL R1, -R0, c[0].z;
ADD R1, R1, c[40].x;
MUL R0, R0, R0;
MUL R0, R0, R1;
RSQ R3.y, R3.y;
MAD R1.xy, R3.y, R3.xzzw, -vertex.normal.xzzw;
ADD R3.xy, R0.xzzw, R0.ywzw;
MAD R0.xy, R2.w, R1, vertex.normal.xzzw;
MUL R0.xy, vertex.color.y, R0;
MUL R0.xz, R0.xyyw, c[40].z;
MUL R1.xyz, R3.y, c[37];
MOV R2.w, c[0].y;
MUL R1.xyz, vertex.texcoord[1].y, R1;
MUL R0.y, vertex.texcoord[1], c[40];
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[37].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[37], R0;
DP3 R0.x, R1, c[35];
ADD R0.x, R0, c[35].w;
MUL R0.xyz, R0.x, c[35];
ADD R1.xyz, -R0, R1;
MAD R2.xyz, R0, c[36].x, R1;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[32];
DP4 R0.z, R2, c[31];
DP4 R0.x, R2, c[29];
DP4 R0.y, R2, c[30];
MOV R1.xyz, R0;
MOV R0.w, -R0;
DP4 result.texcoord[0].z, R1, c[15];
DP4 result.texcoord[0].y, R1, c[14];
DP4 result.texcoord[0].x, R1, c[13];
DP4 result.texcoord[1].z, R1, c[19];
DP4 result.texcoord[1].y, R1, c[18];
DP4 result.texcoord[1].x, R1, c[17];
DP4 result.texcoord[2].z, R1, c[23];
DP4 result.texcoord[2].y, R1, c[22];
DP4 result.texcoord[2].x, R1, c[21];
DP4 result.texcoord[3].z, R1, c[27];
DP4 result.texcoord[3].y, R1, c[26];
DP4 result.texcoord[3].x, R1, c[25];
MOV result.texcoord[4], R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
MAD result.texcoord[5].xy, vertex.texcoord[0], c[38], c[38].zwzw;
END
# 70 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [glstate_matrix_invtrans_modelview0]
Matrix 12 [unity_World2Shadow0]
Matrix 16 [unity_World2Shadow1]
Matrix 20 [unity_World2Shadow2]
Matrix 24 [unity_World2Shadow3]
Matrix 28 [_Object2World]
Vector 32 [_Time]
Vector 33 [_Scale]
Vector 34 [_SquashPlaneNormal]
Float 35 [_SquashAmount]
Vector 36 [_Wind]
Vector 37 [_MainTex_ST]
"vs_2_0
def c38, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c39, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c40, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c41, 0.10000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0, v2.y, c9
mad r1, v2.x, c8, r0
add r0.xyz, r1, c38.x
abs r0.w, v1
add r3.w, -r0, c38.y
mad r0.xyz, r0, r3.w, v0
mov r2.xyz, c31
dp3 r0.w, c38.y, r2
mad r1, v2.z, c10, r1
add r2, r1, c38.x
dp4 r2.y, r2, r2
mov r2.w, c38.y
mul r3.xyz, r0, c33
add r0.w, v5.x, r0
add r0.x, v5.y, r0.w
mov r0.y, r0.w
dp3 r0.x, r3, r0.x
add r0.xy, r0, c32.y
mul r0, r0.xxyy, c39
frc r0, r0
mad r0, r0, c38.z, c38.w
frc r0, r0
mad r0, r0, c40.x, c40.y
abs r0, r0
mul r1, r0, r0
mad r0, -r0, c40.x, c40.z
mul r0, r1, r0
rsq r2.y, r2.y
mad r1.xy, r2.y, r2.xzzw, -v2.xzzw
add r2.xy, r0.xzzw, r0.ywzw
mad r0.xy, r3.w, r1, v2.xzzw
mul r0.xy, v5.y, r0
mul r1.xyz, r2.y, c36
mul r0.xz, r0.xyyw, c41.x
mul r1.xyz, v4.y, r1
mul r0.y, v4, c40.w
mad r0.xyz, r2.xyxw, r0, r1
mad r0.xyz, r0, c36.w, r3
mad r1.xyz, v4.x, c36, r0
dp3 r0.x, r1, c34
add r0.x, r0, c34.w
mul r0.xyz, r0.x, c34
add r1.xyz, -r0, r1
mad r2.xyz, r0, c35.x, r1
dp4 r0.w, r2, c2
dp4 r1.w, r2, c31
dp4 r0.z, r2, c30
dp4 r0.x, r2, c28
dp4 r0.y, r2, c29
mov r1.xyz, r0
mov r0.w, -r0
dp4 oT0.z, r1, c14
dp4 oT0.y, r1, c13
dp4 oT0.x, r1, c12
dp4 oT1.z, r1, c18
dp4 oT1.y, r1, c17
dp4 oT1.x, r1, c16
dp4 oT2.z, r1, c22
dp4 oT2.y, r1, c21
dp4 oT2.x, r1, c20
dp4 oT3.z, r1, c26
dp4 oT3.y, r1, c25
dp4 oT3.x, r1, c24
mov oT4, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
mad oT5.xy, v3, c37, c37.zwzw
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 13 [unity_World2Shadow0]
Matrix 17 [unity_World2Shadow1]
Matrix 21 [unity_World2Shadow2]
Matrix 25 [unity_World2Shadow3]
Matrix 29 [_Object2World]
Vector 33 [_Time]
Vector 34 [_Scale]
Vector 35 [_SquashPlaneNormal]
Float 36 [_SquashAmount]
Vector 37 [_Wind]
Vector 38 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[41] = { { 0, 1, 2, -0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[13..38],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 3, 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0, vertex.normal.y, c[10];
MAD R1, vertex.normal.x, c[9], R0;
ADD R0.xyz, R1, c[0].x;
ABS R2.x, vertex.attrib[14].w;
ADD R2.w, -R2.x, c[0].y;
MAD R0.xyz, R0, R2.w, vertex.position;
MAD R1, vertex.normal.z, c[11], R1;
ADD R3, R1, c[0].x;
DP4 R3.y, R3, R3;
MOV R0.w, c[0].y;
DP3 R0.w, R0.w, c[32];
MUL R2.xyz, R0, c[34];
ADD R0.w, vertex.color.x, R0;
ADD R0.x, vertex.color.y, R0.w;
MOV R0.y, R0.w;
DP3 R0.x, R2, R0.x;
ADD R0.xy, R0, c[33].y;
MUL R0, R0.xxyy, c[39];
FRC R0, R0;
MAD R0, R0, c[0].z, c[0].w;
FRC R0, R0;
MAD R0, R0, c[0].z, -c[0].y;
ABS R0, R0;
MUL R1, -R0, c[0].z;
ADD R1, R1, c[40].x;
MUL R0, R0, R0;
MUL R0, R0, R1;
RSQ R3.y, R3.y;
MAD R1.xy, R3.y, R3.xzzw, -vertex.normal.xzzw;
ADD R3.xy, R0.xzzw, R0.ywzw;
MAD R0.xy, R2.w, R1, vertex.normal.xzzw;
MUL R0.xy, vertex.color.y, R0;
MUL R0.xz, R0.xyyw, c[40].z;
MUL R1.xyz, R3.y, c[37];
MOV R2.w, c[0].y;
MUL R1.xyz, vertex.texcoord[1].y, R1;
MUL R0.y, vertex.texcoord[1], c[40];
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[37].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[37], R0;
DP3 R0.x, R1, c[35];
ADD R0.x, R0, c[35].w;
MUL R0.xyz, R0.x, c[35];
ADD R1.xyz, -R0, R1;
MAD R2.xyz, R0, c[36].x, R1;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[32];
DP4 R0.z, R2, c[31];
DP4 R0.x, R2, c[29];
DP4 R0.y, R2, c[30];
MOV R1.xyz, R0;
MOV R0.w, -R0;
DP4 result.texcoord[0].z, R1, c[15];
DP4 result.texcoord[0].y, R1, c[14];
DP4 result.texcoord[0].x, R1, c[13];
DP4 result.texcoord[1].z, R1, c[19];
DP4 result.texcoord[1].y, R1, c[18];
DP4 result.texcoord[1].x, R1, c[17];
DP4 result.texcoord[2].z, R1, c[23];
DP4 result.texcoord[2].y, R1, c[22];
DP4 result.texcoord[2].x, R1, c[21];
DP4 result.texcoord[3].z, R1, c[27];
DP4 result.texcoord[3].y, R1, c[26];
DP4 result.texcoord[3].x, R1, c[25];
MOV result.texcoord[4], R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
MAD result.texcoord[5].xy, vertex.texcoord[0], c[38], c[38].zwzw;
END
# 70 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [glstate_matrix_invtrans_modelview0]
Matrix 12 [unity_World2Shadow0]
Matrix 16 [unity_World2Shadow1]
Matrix 20 [unity_World2Shadow2]
Matrix 24 [unity_World2Shadow3]
Matrix 28 [_Object2World]
Vector 32 [_Time]
Vector 33 [_Scale]
Vector 34 [_SquashPlaneNormal]
Float 35 [_SquashAmount]
Vector 36 [_Wind]
Vector 37 [_MainTex_ST]
"vs_2_0
def c38, 0.00000000, 1.00000000, 2.00000000, -0.50000000
def c39, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c40, 2.00000000, -1.00000000, 3.00000000, 0.30000001
def c41, 0.10000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0, v2.y, c9
mad r1, v2.x, c8, r0
add r0.xyz, r1, c38.x
abs r0.w, v1
add r3.w, -r0, c38.y
mad r0.xyz, r0, r3.w, v0
mov r2.xyz, c31
dp3 r0.w, c38.y, r2
mad r1, v2.z, c10, r1
add r2, r1, c38.x
dp4 r2.y, r2, r2
mov r2.w, c38.y
mul r3.xyz, r0, c33
add r0.w, v5.x, r0
add r0.x, v5.y, r0.w
mov r0.y, r0.w
dp3 r0.x, r3, r0.x
add r0.xy, r0, c32.y
mul r0, r0.xxyy, c39
frc r0, r0
mad r0, r0, c38.z, c38.w
frc r0, r0
mad r0, r0, c40.x, c40.y
abs r0, r0
mul r1, r0, r0
mad r0, -r0, c40.x, c40.z
mul r0, r1, r0
rsq r2.y, r2.y
mad r1.xy, r2.y, r2.xzzw, -v2.xzzw
add r2.xy, r0.xzzw, r0.ywzw
mad r0.xy, r3.w, r1, v2.xzzw
mul r0.xy, v5.y, r0
mul r1.xyz, r2.y, c36
mul r0.xz, r0.xyyw, c41.x
mul r1.xyz, v4.y, r1
mul r0.y, v4, c40.w
mad r0.xyz, r2.xyxw, r0, r1
mad r0.xyz, r0, c36.w, r3
mad r1.xyz, v4.x, c36, r0
dp3 r0.x, r1, c34
add r0.x, r0, c34.w
mul r0.xyz, r0.x, c34
add r1.xyz, -r0, r1
mad r2.xyz, r0, c35.x, r1
dp4 r0.w, r2, c2
dp4 r1.w, r2, c31
dp4 r0.z, r2, c30
dp4 r0.x, r2, c28
dp4 r0.y, r2, c29
mov r1.xyz, r0
mov r0.w, -r0
dp4 oT0.z, r1, c14
dp4 oT0.y, r1, c13
dp4 oT0.x, r1, c12
dp4 oT1.z, r1, c18
dp4 oT1.y, r1, c17
dp4 oT1.x, r1, c16
dp4 oT2.z, r1, c22
dp4 oT2.y, r1, c21
dp4 oT2.x, r1, c20
dp4 oT3.z, r1, c26
dp4 oT3.y, r1, c25
dp4 oT3.x, r1, c24
mov oT4, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
mad oT5.xy, v3, c37, c37.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedknjoalhiogmdoodcllgbkmgcgdeakfhdabaaaaaaamanaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaiaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapadaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefceaalaaaaeaaaabaanaacaaaafjaaaaaeegiocaaaaaaaaaaa
aiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
biaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaafjaaaaaeegiocaaaaeaaaaaa
amaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadicbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaaddcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
hccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagfaaaaaddccabaaa
agaaaaaagiaaaaacaeaaaaaabaaaaaaiccaabaaaaaaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaajaaaaaabaaaaaaiicaabaaaaaaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaalaaaaaabaaaaaaibcaabaaaaaaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaaiaaaaaabaaaaaaiecaabaaaaaaaaaaaegbcbaaaacaaaaaa
egiccaaaadaaaaaaakaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
dcaabaaaaaaaaaaaigaabaaaaaaaaaaafgafbaaaaaaaaaaaigbabaiaebaaaaaa
acaaaaaaaaaaaaaiecaabaaaaaaaaaaadkbabaiambaaaaaaabaaaaaaabeaaaaa
aaaaiadpdcaaaaajdcaabaaaaaaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaa
igbabaaaacaaaaaadiaaaaahicaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaa
mnmmmmdndiaaaaahfcaabaaaabaaaaaaagabbaaaaaaaaaaapgapbaaaaaaaaaaa
apaaaaaibcaabaaaacaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaa
apaaaaaiccaabaaaacaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaa
apaaaaaiecaabaaaacaaaaaaegbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaakgakbaaaaaaaaaaaegbcbaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaeaaaaaa
afaaaaaadgaaaaagbcaabaaaacaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaacaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaa
dkiacaaaadaaaaaaaoaaaaaabaaaaaakicaabaaaaaaaaaaaegacbaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaacaaaaaa
dkaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaa
acaaaaaabkbabaaaafaaaaaabaaaaaahbcaabaaaacaaaaaaegacbaaaaaaaaaaa
pgapbaaaaaaaaaaaaaaaaaaipcaabaaaacaaaaaaagafbaaaacaaaaaafgifcaaa
abaaaaaaaaaaaaaadiaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaa
mnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaacaaaaaaegaobaaa
acaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalp
bkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaadaaaaaaegaobaia
ibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaa
egaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaahdcaabaaaacaaaaaangafbaaa
acaaaaaaigaabaaaacaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaacaaaaaa
egiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
fgbfbaaaaeaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaacaaaaaabkbabaaa
aeaaaaaadgaaaaafecaabaaaacaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
abaaaaaaigaabaaaacaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaabaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
adaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaapaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaajaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaiaaaaaaagaabaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaakaaaaaa
kgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaa
acaaaaaaalaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaaapaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaabaaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaabcaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaabdaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaabfaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabeaaaaaa
agaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaabgaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaacaaaaaabhaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaa
dgaaaaafhccabaaaafaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaackiacaaaadaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckiacaaaadaaaaaaaeaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaackiacaaaadaaaaaaagaaaaaackaabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaadaaaaaa
ahaaaaaadgaaaaagiccabaaaafaaaaaaakaabaiaebaaaaaaaaaaaaaadcaaaaal
dccabaaaagaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaa
aaaaaaaaahaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecednkmbfmocikcimdejkiamdjffiiggokcgabaaaaaajibdaaaaaeaaaaaa
daaaaaaaliagaaaaaabcaaaamibcaaaaebgpgodjiaagaaaaiaagaaaaaaacpopp
aeagaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
abaaabaaaaaaaaaaaaaaahaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
acaaaiaabaaaaeaaaaaaaaaaadaaaaaabaaabeaaaaaaaaaaaeaaafaaabaaceaa
aaaaaaaaaeaaakaaacaacfaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafchaaapka
mnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafciaaapkaaaaaiadpaaaaaaea
aaaaaalpaaaaialpfbaaaaafcjaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdo
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaac
afaaafiaafaaapjaaeaaaaaeafaaadoaadaaoejaacaaoekaacaaookaaiaaaaad
aaaaaciaacaaoejabnaaoekaaiaaaaadaaaaaiiaacaaoejabpaaoekaaiaaaaad
aaaaabiaacaaoejabmaaoekaaiaaaaadaaaaaeiaacaaoejaboaaoekaajaaaaad
aaaaaciaaaaaoeiaaaaaoeiaahaaaaacaaaaaciaaaaaffiaaeaaaaaeaaaaadia
aaaaoiiaaaaaffiaacaaoijbcdaaaaacaaaaaeiaabaappjaacaaaaadaaaaaeia
aaaakkibciaaaakaaeaaaaaeaaaaadiaaaaakkiaaaaaoeiaacaaoijaafaaaaad
aaaaaiiaafaaffjacjaakkkaafaaaaadabaaafiaaaaaneiaaaaappiaafaaaaad
aaaaadiaacaaoejabmaaoekaacaaaaadacaaabiaaaaaffiaaaaaaaiaafaaaaad
aaaaadiaacaaoejabnaaoekaacaaaaadacaaaciaaaaaffiaaaaaaaiaafaaaaad
aaaaadiaacaaoejaboaaoekaacaaaaadacaaaeiaaaaaffiaaaaaaaiaaeaaaaae
aaaaahiaacaaoeiaaaaakkiaaaaaoejaafaaaaadaaaaahiaaaaaoeiaceaaoeka
abaaaaacacaaabiacaaappkaabaaaaacacaaaciacbaappkaabaaaaacacaaaeia
ccaappkaaiaaaaadaaaaaiiaacaaoeiaciaaaakaacaaaaadacaaaciaaaaappia
afaaaajaacaaaaadaaaaaiiaacaaffiaafaaffjaaiaaaaadacaaabiaaaaaoeia
aaaappiaacaaaaadacaaapiaacaafaiaadaaffkaafaaaaadacaaapiaacaaoeia
chaaoekabdaaaaacacaaapiaacaaoeiaaeaaaaaeacaaapiaacaaoeiaciaaffka
ciaakkkabdaaaaacacaaapiaacaaoeiaaeaaaaaeacaaapiaacaaoeiaciaaffka
ciaappkacdaaaaacacaaapiaacaaoeiaafaaaaadadaaapiaacaaoeiaacaaoeia
aeaaaaaeacaaapiaacaaoeiacjaaaakbcjaaffkaafaaaaadacaaapiaacaaoeia
adaaoeiaacaaaaadacaaadiaacaaoniaacaaoiiaafaaaaadadaaahiaacaaffia
abaaoekaafaaaaadadaaahiaadaaoeiaaeaaffjaafaaaaadabaaaciaacaaffia
aeaaffjaabaaaaacacaaaeiacjaappkaaeaaaaaeabaaahiaacaamiiaabaaoeia
adaaoeiaaeaaaaaeaaaaahiaabaaoeiaabaappkaaaaaoeiaaeaaaaaeaaaaahia
aeaaaajaabaaoekaaaaaoeiaaiaaaaadaaaaaiiacfaaoekaaaaaoeiaacaaaaad
aaaaaiiaaaaappiacfaappkaaeaaaaaeabaaahiaaaaappiacfaaoekbaaaaoeia
bcaaaaaeacaaahiacgaaaakaaaaaoeiaabaaoeiaafaaaaadaaaaabiaacaaffia
bjaakkkaaeaaaaaeaaaaabiabiaakkkaacaaaaiaaaaaaaiaaeaaaaaeaaaaabia
bkaakkkaacaakkiaaaaaaaiaacaaaaadaaaaabiaaaaaaaiablaakkkaabaaaaac
aeaaaioaaaaaaaibafaaaaadaaaaapiaacaaffiacbaaoekaaeaaaaaeaaaaapia
caaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiaccaaoekaacaakkiaaaaaoeia
acaaaaadaaaaapiaaaaaoeiacdaaoekaafaaaaadabaaahiaaaaaffiaafaaoeka
aeaaaaaeabaaahiaaeaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaagaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaahoaahaaoekaaaaappiaabaaoeiaafaaaaad
abaaahiaaaaaffiaajaaoekaaeaaaaaeabaaahiaaiaaoekaaaaaaaiaabaaoeia
aeaaaaaeabaaahiaakaaoekaaaaakkiaabaaoeiaaeaaaaaeabaaahoaalaaoeka
aaaappiaabaaoeiaafaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeabaaahia
amaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaaoaaoekaaaaakkiaabaaoeia
aeaaaaaeacaaahoaapaaoekaaaaappiaabaaoeiaafaaaaadabaaahiaaaaaffia
bbaaoekaaeaaaaaeabaaahiabaaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahia
bcaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaahoabdaaoekaaaaappiaabaaoeia
abaaaaacaeaaahoaaaaaoeiaafaaaaadaaaaapiaacaaffiabfaaoekaaeaaaaae
aaaaapiabeaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiabgaaoekaacaakkia
aaaaoeiaacaaaaadaaaaapiaaaaaoeiabhaaoekaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefceaalaaaa
eaaaabaanaacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabiaaaaaafjaaaaaeegiocaaa
adaaaaaabaaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaa
aaaaaaaafpaaaaadicbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaaddcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagfaaaaaddccabaaaagaaaaaagiaaaaacaeaaaaaa
baaaaaaiccaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaajaaaaaa
baaaaaaiicaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaalaaaaaa
baaaaaaibcaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaaiaaaaaa
baaaaaaiecaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaadaaaaaaakaaaaaa
bbaaaaahccaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaaeeaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaigaabaaa
aaaaaaaafgafbaaaaaaaaaaaigbabaiaebaaaaaaacaaaaaaaaaaaaaiecaabaaa
aaaaaaaadkbabaiambaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajdcaabaaa
aaaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaaigbabaaaacaaaaaadiaaaaah
icaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaa
abaaaaaaagabbaaaaaaaaaaapgapbaaaaaaaaaaaapaaaaaibcaabaaaacaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaaiaaaaaaapaaaaaiccaabaaaacaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaajaaaaaaapaaaaaiecaabaaaacaaaaaa
egbabaaaacaaaaaaegiacaaaadaaaaaaakaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaacaaaaaakgakbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaadgaaaaagbcaabaaa
acaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaadkiacaaa
adaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaadkiacaaaadaaaaaaaoaaaaaa
baaaaaakicaabaaaaaaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaaaaaaaaahccaabaaaacaaaaaadkaabaaaaaaaaaaaakbabaaa
afaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaabkbabaaaafaaaaaa
baaaaaahbcaabaaaacaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaaaaaaaai
pcaabaaaacaaaaaaagafbaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaak
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamado
mlkbefdobkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaa
egaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialp
aaaaialpdiaaaaajpcaabaaaadaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaia
ibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaea
aaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaa
adaaaaaaaaaaaaahdcaabaaaacaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaa
diaaaaaihcaabaaaadaaaaaafgafbaaaacaaaaaaegiccaaaaaaaaaaaadaaaaaa
diaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaafgbfbaaaaeaaaaaadiaaaaah
ccaabaaaabaaaaaabkaabaaaacaaaaaabkbabaaaaeaaaaaadgaaaaafecaabaaa
acaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaaabaaaaaaigaabaaaacaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
abaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaa
dcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaa
alaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaa
adaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaa
egaobaaaabaaaaaaegiocaaaadaaaaaaapaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaacaaaaaaajaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaaaiaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaaakaaaaaakgakbaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaaacaaaaaaalaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
amaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hccabaaaacaaaaaaegiccaaaacaaaaaaapaaaaaapgapbaaaabaaaaaaegacbaaa
acaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaa
bbaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagaabaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
bcaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaacaaaaaabdaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaabfaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaabeaaaaaaagaabaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabgaaaaaakgakbaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaa
bhaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaaafaaaaaa
egacbaaaabaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaackiacaaa
adaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaa
akaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
adaaaaaaagaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaackiacaaaadaaaaaaahaaaaaadgaaaaagiccabaaa
afaaaaaaakaabaiaebaaaaaaaaaaaaaadcaaaaaldccabaaaagaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaiaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapadaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaahaiaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
lmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
Float 4 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 2 [_ShadowMapTexture] 2D 2
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.w, fragment.texcoord[5], texture[0], 2D;
SLT R0.w, R0, c[4].x;
SLT R2, fragment.texcoord[4].w, c[2];
SGE R1, fragment.texcoord[4].w, c[1];
MUL R1, R1, R2;
MUL R0.xyz, R1.y, fragment.texcoord[1];
MAD R0.xyz, R1.x, fragment.texcoord[0], R0;
MAD R0.xyz, R1.z, fragment.texcoord[2], R0;
MAD R0.xyz, fragment.texcoord[3], R1.w, R0;
MAD_SAT R1.y, fragment.texcoord[4].w, c[3].z, c[3].w;
MOV result.color.y, c[5].x;
TEX R0.x, R0, texture[2], 2D;
KIL -R0.w;
ADD R0.z, R0.x, -R0;
MOV R0.x, c[5];
CMP R1.x, R0.z, c[3], R0;
MUL R0.y, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0, c[5].x;
MUL R0.xy, R0.y, c[5];
FRC R0.zw, R0.xyxy;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[5].z, R0.z;
ADD_SAT result.color.x, R1, R1.y;
MOV result.color.zw, R0.xyxy;
END
# 24 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
Float 4 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 2 [_ShadowMapTexture] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s2
def c5, 0.00000000, 1.00000000, 255.00000000, 0.00392157
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyzw
dcl t5.xy
texld r2, t5, s0
add r1, t4.w, -c2
add r0, t4.w, -c1
cmp r1, r1, c5.x, c5.y
cmp r0, r0, c5.y, c5.x
mul r0, r0, r1
mul r1.xyz, r0.y, t1
mad r1.xyz, r0.x, t0, r1
mad r1.xyz, r0.z, t2, r1
add_pp r0.x, r2.w, -c4
mad r2.xyz, t3, r0.w, r1
cmp r0.x, r0, c5, c5.y
mov_pp r1, -r0.x
texld r0, r2, s2
texkill r1.xyzw
mul r1.x, -t4.w, c0.w
mov r2.x, c3
add r0.x, r0, -r2.z
cmp r0.x, r0, c5.y, r2
add r1.x, r1, c5.y
mul r2.xy, r1.x, c5.yzxw
mad_sat r1.x, t4.w, c3.z, c3.w
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c5.w, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c5
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
Float 4 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 2 [_ShadowMapTexture] 2D 2
"!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[6] = { program.local[0..4],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.w, fragment.texcoord[5], texture[0], 2D;
SLT R0.w, R0, c[4].x;
SLT R2, fragment.texcoord[4].w, c[2];
SGE R1, fragment.texcoord[4].w, c[1];
MUL R1, R1, R2;
MUL R0.xyz, R1.y, fragment.texcoord[1];
MAD R0.xyz, R1.x, fragment.texcoord[0], R0;
MAD R0.xyz, R1.z, fragment.texcoord[2], R0;
MAD R0.xyz, fragment.texcoord[3], R1.w, R0;
MAD_SAT R1.y, fragment.texcoord[4].w, c[3].z, c[3].w;
MOV result.color.y, c[5].x;
TEX R0.x, R0, texture[2], SHADOW2D;
KIL -R0.w;
MOV R0.y, c[5].x;
ADD R0.w, R0.y, -c[3].x;
MAD R1.x, R0, R0.w, c[3];
MUL R0.z, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0.z, c[5].x;
MUL R0.xy, R0.y, c[5];
FRC R0.zw, R0.xyxy;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[5].z, R0.z;
ADD_SAT result.color.x, R1, R1.y;
MOV result.color.zw, R0.xyxy;
END
# 24 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
Float 4 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 2 [_ShadowMapTexture] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s2
def c5, 0.00000000, 1.00000000, 255.00000000, 0.00392157
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyzw
dcl t5.xy
texld r2, t5, s0
add r1, t4.w, -c2
add r0, t4.w, -c1
cmp r1, r1, c5.x, c5.y
cmp r0, r0, c5.y, c5.x
mul r0, r0, r1
mul r1.xyz, r0.y, t1
mad r1.xyz, r0.x, t0, r1
mad r1.xyz, r0.z, t2, r1
add_pp r0.x, r2.w, -c4
mad r2.xyz, t3, r0.w, r1
cmp r0.x, r0, c5, c5.y
mov_pp r1, -r0.x
texld r0, r2, s2
texkill r1.xyzw
mov r2.x, c3
add r2.x, c5.y, -r2
mul r1.x, -t4.w, c0.w
mad r0.x, r0, r2, c3
add r1.x, r1, c5.y
mul r2.xy, r1.x, c5.yzxw
mad_sat r1.x, t4.w, c3.z, c3.w
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c5.w, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c5
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_NATIVE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 144
Float 128 [_Cutoff]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 96 [_LightSplitsNear]
Vector 112 [_LightSplitsFar]
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
"ps_4_0
eefiecedeoecebgmgjacdlgecbmgabahhakkajdgabaaaaaaceafaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
adadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcomadaaaaeaaaaaaaplaaaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabjaaaaaafkaiaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadicbabaaa
afaaaaaagcbaaaaddcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaagaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaaaaaaaaajbcaabaaaaaaaaaaadkaabaaaaaaaaaaaakiacaia
ebaaaaaaaaaaaaaaaiaaaaaadbaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaanaaaeadakaabaaaaaaaaaaabnaaaaaipcaabaaaaaaaaaaa
pgbpbaaaafaaaaaaegiocaaaacaaaaaaagaaaaaaabaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdbaaaaai
pcaabaaaabaaaaaapgbpbaaaafaaaaaaegiocaaaacaaaaaaahaaaaaaabaaaaak
pcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpdiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegbcbaaaacaaaaaadcaaaaaj
hcaabaaaabaaaaaaegbcbaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegbcbaaaadaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaaeaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaehaaaaalbcaabaaaaaaaaaaaegaabaaaaaaaaaaaaghabaaa
abaaaaaaaagabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaa
akiacaiaebaaaaaaacaaaaaabiaaaaaaabeaaaaaaaaaiadpdcaaaaakbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaacaaaaaabiaaaaaa
dccaaaalccaabaaaaaaaaaaadkbabaaaafaaaaaackiacaaaacaaaaaabiaaaaaa
dkiacaaaacaaaaaabiaaaaaaaacaaaahbccabaaaaaaaaaaabkaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkbabaiaebaaaaaaafaaaaaa
dkiacaaaabaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaakdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaahpedaaaaaaaaaaaaaaaabkaaaaaf
dcaabaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakeccabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaabkaabaaaaaaaaaaadgaaaaafcccabaaaaaaaaaaaabeaaaaaaaaaiadp
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_NATIVE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 144
Float 128 [_Cutoff]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 96 [_LightSplitsNear]
Vector 112 [_LightSplitsFar]
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
"ps_4_0_level_9_1
eefiecedddgcgmnopllhnahekhhkemiegfkbbimjabaaaaaajiahaaaaafaaaaaa
deaaaaaajaacaaaaieagaaaajeagaaaageahaaaaebgpgodjfeacaaaafeacaaaa
aaacpppppiabaaaafmaaaaaaaeaacmaaaaaafmaaaaaafmaaacaaceaaaaaafmaa
abaaaaaaaaababaaaaaaaiaaabaaaaaaaaaaaaaaabaaafaaabaaabaaaaaaaaaa
acaaagaaacaaacaaaaaaaaaaacaabiaaabaaaeaaaaaaaaaaaaacppppfbaaaaaf
afaaapkaaaaaaaaaaaaaiadpaaaahpedibiaiadlbpaaaaacaaaaaaiaaaaaahla
bpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaaahlabpaaaaacaaaaaaia
adaaahlabpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaaiaafaaadlabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaadaaaacpiaafaaoela
abaioekaacaaaaadaaaacpiaaaaappiaaaaaaakbacaaaaadabaaapiaaeaappla
adaaoekbfiaaaaaeabaaapiaabaaoeiaafaaaakaafaaffkaacaaaaadacaaapia
aeaapplaacaaoekbfiaaaaaeabaaapiaacaaoeiaabaaoeiaafaaaakaafaaaaad
acaaahiaabaaffiaabaaoelaaeaaaaaeacaaahiaaaaaoelaabaaaaiaacaaoeia
aeaaaaaeabaaahiaacaaoelaabaakkiaacaaoeiaaeaaaaaeabaaahiaadaaoela
abaappiaabaaoeiaebaaaaabaaaaapiaecaaaaadaaaacpiaabaaoeiaaaaioeka
abaaaaacaaaaaciaafaaffkabcaaaaaeabaacbiaaaaaaaiaaaaaffiaaeaaaaka
aeaaaaaeaaaabbiaaeaapplaaeaakkkaaeaappkaacaaaaadabaadbiaaaaaaaia
abaaaaiaaeaaaaaeaaaaabiaaeaapplaabaappkbaaaaffiaafaaaaadaaaaadia
aaaaaaiaafaamjkabdaaaaacaaaaadiaaaaaoeiaaeaaaaaeabaaceiaaaaaffia
afaappkbaaaaaaiaabaaaaacabaaciiaaaaaffiaabaaaaacabaaaciaafaaffka
abaaaaacaaaicpiaabaaoeiappppaaaafdeieefcomadaaaaeaaaaaaaplaaaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabjaaaaaafkaiaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadicbabaaa
afaaaaaagcbaaaaddcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaagaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaaaaaaaaajbcaabaaaaaaaaaaadkaabaaaaaaaaaaaakiacaia
ebaaaaaaaaaaaaaaaiaaaaaadbaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaanaaaeadakaabaaaaaaaaaaabnaaaaaipcaabaaaaaaaaaaa
pgbpbaaaafaaaaaaegiocaaaacaaaaaaagaaaaaaabaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdbaaaaai
pcaabaaaabaaaaaapgbpbaaaafaaaaaaegiocaaaacaaaaaaahaaaaaaabaaaaak
pcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpdiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegbcbaaaacaaaaaadcaaaaaj
hcaabaaaabaaaaaaegbcbaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegbcbaaaadaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaaeaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaehaaaaalbcaabaaaaaaaaaaaegaabaaaaaaaaaaaaghabaaa
abaaaaaaaagabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaa
akiacaiaebaaaaaaacaaaaaabiaaaaaaabeaaaaaaaaaiadpdcaaaaakbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaacaaaaaabiaaaaaa
dccaaaalccaabaaaaaaaaaaadkbabaaaafaaaaaackiacaaaacaaaaaabiaaaaaa
dkiacaaaacaaaaaabiaaaaaaaacaaaahbccabaaaaaaaaaaabkaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkbabaiaebaaaaaaafaaaaaa
dkiacaaaabaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaakdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaahpedaaaaaaaaaaaaaaaabkaaaaaf
dcaabaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakeccabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaabkaabaaaaaaaaaaadgaaaaafcccabaaaaaaaaaaaabeaaaaaaaaaiadp
doaaaaabfdegejdaaiaaaaaaiaaaaaaaaaaaaaaaejfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
Float 8 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 2 [_ShadowMapTexture] 2D 2
"!!ARBfp1.0
PARAM c[10] = { program.local[0..8],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.w, fragment.texcoord[5], texture[0], 2D;
ADD R1.xyz, fragment.texcoord[4], -c[1];
ADD R2.xyz, fragment.texcoord[4], -c[4];
SLT R0.w, R0, c[8].x;
DP3 R1.x, R1, R1;
ADD R0.xyz, fragment.texcoord[4], -c[2];
DP3 R1.y, R0, R0;
ADD R0.xyz, fragment.texcoord[4], -c[3];
DP3 R1.z, R0, R0;
DP3 R1.w, R2, R2;
SLT R2, R1, c[5];
ADD_SAT R0.xyz, R2.yzww, -R2;
MUL R1.xyz, R0.x, fragment.texcoord[1];
MAD R1.xyz, R2.x, fragment.texcoord[0], R1;
MAD R1.xyz, R0.y, fragment.texcoord[2], R1;
MAD R0.xyz, fragment.texcoord[3], R0.z, R1;
ADD R1.xyz, -fragment.texcoord[4], c[7];
MOV result.color.y, c[9].x;
TEX R0.x, R0, texture[2], 2D;
KIL -R0.w;
ADD R0.y, R0.x, -R0.z;
DP3 R0.z, R1, R1;
RSQ R0.z, R0.z;
MOV R0.x, c[9];
CMP R0.x, R0.y, c[6], R0;
MUL R0.y, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0, c[9].x;
RCP R1.x, R0.z;
MUL R0.zw, R0.y, c[9].xyxy;
MAD_SAT R0.y, R1.x, c[6].z, c[6].w;
FRC R0.zw, R0;
ADD_SAT result.color.x, R0, R0.y;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[9].z, R0.z;
MOV result.color.zw, R0.xyxy;
END
# 35 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
Float 8 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 2 [_ShadowMapTexture] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s2
def c9, 0.00000000, 1.00000000, 255.00000000, 0.00392157
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
dcl t5.xy
texld r1, t5, s0
add r0.xyz, t4, -c1
add r2.xyz, t4, -c4
dp3 r0.x, r0, r0
add r1.xyz, t4, -c2
dp3 r0.y, r1, r1
add r1.xyz, t4, -c3
dp3 r0.z, r1, r1
dp3 r0.w, r2, r2
add r0, r0, -c5
cmp r0, r0, c9.x, c9.y
mov r1.x, r0.y
mov r1.z, r0.w
mov r1.y, r0.z
add_sat r1.xyz, r1, -r0
mul r2.xyz, r1.x, t1
mad r2.xyz, r0.x, t0, r2
add_pp r0.x, r1.w, -c8
mad r2.xyz, r1.y, t2, r2
mad r2.xyz, t3, r1.z, r2
cmp r0.x, r0, c9, c9.y
mov_pp r1, -r0.x
texld r0, r2, s2
texkill r1.xyzw
add r0.x, r0, -r2.z
mov r1.x, c6
add r2.xyz, -t4, c7
cmp r0.x, r0, c9.y, r1
dp3 r1.x, r2, r2
mul r2.x, -t4.w, c0.w
rsq r1.x, r1.x
add r2.x, r2, c9.y
rcp r1.x, r1.x
mad_sat r1.x, r1, c6.z, c6.w
mul r2.xy, r2.x, c9.yzxw
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c9.w, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c9
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
Float 8 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 2 [_ShadowMapTexture] 2D 2
"!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[10] = { program.local[0..8],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.w, fragment.texcoord[5], texture[0], 2D;
ADD R1.xyz, fragment.texcoord[4], -c[1];
ADD R2.xyz, fragment.texcoord[4], -c[4];
SLT R0.w, R0, c[8].x;
DP3 R1.x, R1, R1;
ADD R0.xyz, fragment.texcoord[4], -c[2];
DP3 R1.y, R0, R0;
ADD R0.xyz, fragment.texcoord[4], -c[3];
DP3 R1.z, R0, R0;
DP3 R1.w, R2, R2;
SLT R2, R1, c[5];
ADD_SAT R0.xyz, R2.yzww, -R2;
MUL R1.xyz, R0.x, fragment.texcoord[1];
MAD R1.xyz, R2.x, fragment.texcoord[0], R1;
MAD R1.xyz, R0.y, fragment.texcoord[2], R1;
MAD R0.xyz, fragment.texcoord[3], R0.z, R1;
ADD R1.xyz, -fragment.texcoord[4], c[7];
MOV result.color.y, c[9].x;
TEX R0.x, R0, texture[2], SHADOW2D;
KIL -R0.w;
DP3 R0.z, R1, R1;
RSQ R0.z, R0.z;
MOV R0.y, c[9].x;
ADD R0.y, R0, -c[6].x;
MAD R0.x, R0, R0.y, c[6];
MUL R0.y, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0, c[9].x;
RCP R1.x, R0.z;
MUL R0.zw, R0.y, c[9].xyxy;
MAD_SAT R0.y, R1.x, c[6].z, c[6].w;
FRC R0.zw, R0;
ADD_SAT result.color.x, R0, R0.y;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[9].z, R0.z;
MOV result.color.zw, R0.xyxy;
END
# 35 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
Float 8 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 2 [_ShadowMapTexture] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s2
def c9, 0.00000000, 1.00000000, 255.00000000, 0.00392157
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
dcl t5.xy
texld r1, t5, s0
add r0.xyz, t4, -c1
add r2.xyz, t4, -c4
dp3 r0.x, r0, r0
add r1.xyz, t4, -c2
dp3 r0.y, r1, r1
add r1.xyz, t4, -c3
dp3 r0.z, r1, r1
dp3 r0.w, r2, r2
add r0, r0, -c5
cmp r0, r0, c9.x, c9.y
mov r1.x, r0.y
mov r1.z, r0.w
mov r1.y, r0.z
add_sat r1.xyz, r1, -r0
mul r2.xyz, r1.x, t1
mad r2.xyz, r0.x, t0, r2
add_pp r0.x, r1.w, -c8
mad r2.xyz, r1.y, t2, r2
mad r2.xyz, t3, r1.z, r2
cmp r0.x, r0, c9, c9.y
mov_pp r1, -r0.x
texld r0, r2, s2
texkill r1.xyzw
mov r1.x, c6
add r1.x, c9.y, -r1
add r2.xyz, -t4, c7
mad r0.x, r0, r1, c6
dp3 r1.x, r2, r2
mul r2.x, -t4.w, c0.w
rsq r1.x, r1.x
add r2.x, r2, c9.y
rcp r1.x, r1.x
mad_sat r1.x, r1, c6.z, c6.w
mul r2.xy, r2.x, c9.yzxw
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c9.w, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c9
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 144
Float 128 [_Cutoff]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 0 [unity_ShadowSplitSpheres0]
Vector 16 [unity_ShadowSplitSpheres1]
Vector 32 [unity_ShadowSplitSpheres2]
Vector 48 [unity_ShadowSplitSpheres3]
Vector 64 [unity_ShadowSplitSqRadii]
Vector 384 [_LightShadowData]
Vector 400 [unity_ShadowFadeCenterAndType]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
"ps_4_0
eefiecedhknojmebbbgmikmjhhojkacipbokgfmjabaaaaaajeagaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
adadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfmafaaaaeaaaaaaafhabaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabkaaaaaafkaiaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaa
afaaaaaagcbaaaaddcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaagaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaaaaaaaaajbcaabaaaaaaaaaaadkaabaaaaaaaaaaaakiacaia
ebaaaaaaaaaaaaaaaiaaaaaadbaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaanaaaeadakaabaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egbcbaaaafaaaaaaegiccaiaebaaaaaaacaaaaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaaaafaaaaaaegiccaiaebaaaaaaacaaaaaaabaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaaaafaaaaaaegiccaiaebaaaaaaacaaaaaaacaaaaaabaaaaaahecaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaaaafaaaaaaegiccaiaebaaaaaaacaaaaaaadaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaadbaaaaaipcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegiocaaaacaaaaaaaeaaaaaadhaaaaaphcaabaaaabaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaaaaaaceaaaaa
aaaaaaiaaaaaaaiaaaaaaaiaaaaaaaaaabaaaaakpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaaaaaaahocaabaaa
aaaaaaaaagajbaaaabaaaaaafgaobaaaaaaaaaaadeaaaaakocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegbcbaaaacaaaaaadcaaaaajhcaabaaa
abaaaaaaegbcbaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaaj
hcaabaaaaaaaaaaaegbcbaaaadaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegbcbaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaaehaaaaalbcaabaaaaaaaaaaaegaabaaaaaaaaaaaaghabaaaabaaaaaa
aagabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaaakiacaia
ebaaaaaaacaaaaaabiaaaaaaabeaaaaaaaaaiadpdcaaaaakbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaacaaaaaabiaaaaaaaaaaaaaj
ocaabaaaaaaaaaaaagbjbaaaafaaaaaaagijcaiaebaaaaaaacaaaaaabjaaaaaa
baaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaelaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaalccaabaaaaaaaaaaabkaabaaa
aaaaaaaackiacaaaacaaaaaabiaaaaaadkiacaaaacaaaaaabiaaaaaaaacaaaah
bccabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalbcaabaaa
aaaaaaaadkbabaiaebaaaaaaafaaaaaadkiacaaaabaaaaaaafaaaaaaabeaaaaa
aaaaiadpdiaaaaakdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaahpedaaaaaaaaaaaaaaaabkaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
dcaaaaakeccabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaibiaiadl
akaabaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaabkaabaaaaaaaaaaadgaaaaaf
cccabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 144
Float 128 [_Cutoff]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 0 [unity_ShadowSplitSpheres0]
Vector 16 [unity_ShadowSplitSpheres1]
Vector 32 [unity_ShadowSplitSpheres2]
Vector 48 [unity_ShadowSplitSpheres3]
Vector 64 [unity_ShadowSplitSqRadii]
Vector 384 [_LightShadowData]
Vector 400 [unity_ShadowFadeCenterAndType]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
"ps_4_0_level_9_1
eefiecedacbobjjolimljiomeigioaanangaeeedabaaaaaapiajaaaaafaaaaaa
deaaaaaaiaadaaaaoeaiaaaapeaiaaaameajaaaaebgpgodjeeadaaaaeeadaaaa
aaacppppoiacaaaafmaaaaaaaeaacmaaaaaafmaaaaaafmaaacaaceaaaaaafmaa
abaaaaaaaaababaaaaaaaiaaabaaaaaaaaaaaaaaabaaafaaabaaabaaaaaaaaaa
acaaaaaaafaaacaaaaaaaaaaacaabiaaacaaahaaaaaaaaaaaaacppppfbaaaaaf
ajaaapkaaaaaaaaaaaaaiadpaaaaaaiaaaaaialpfbaaaaafakaaapkaaaaaiadp
aaaahpedibiaiadlaaaaaaaabpaaaaacaaaaaaiaaaaaahlabpaaaaacaaaaaaia
abaaahlabpaaaaacaaaaaaiaacaaahlabpaaaaacaaaaaaiaadaaahlabpaaaaac
aaaaaaiaaeaaaplabpaaaaacaaaaaaiaafaaadlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkaecaaaaadaaaacpiaafaaoelaabaioekaacaaaaad
aaaacpiaaaaappiaaaaaaakbacaaaaadabaaahiaaeaaoelaacaaoekbaiaaaaad
abaaabiaabaaoeiaabaaoeiaacaaaaadacaaahiaaeaaoelaadaaoekbaiaaaaad
abaaaciaacaaoeiaacaaoeiaacaaaaadacaaahiaaeaaoelaaeaaoekbaiaaaaad
abaaaeiaacaaoeiaacaaoeiaacaaaaadacaaahiaaeaaoelaafaaoekbaiaaaaad
abaaaiiaacaaoeiaacaaoeiaacaaaaadabaaapiaabaaoeiaagaaoekbfiaaaaae
acaaahiaabaaoeiaajaakkkaajaappkafiaaaaaeabaaapiaabaaoeiaajaaaaka
ajaaffkaacaaaaadadaaadiaacaaoeiaabaamjiaacaaaaadadaaaeiaacaakkia
abaappiaalaaaaadabaaaoiaadaabliaajaaaakaafaaaaadacaaahiaabaappia
abaaoelaaeaaaaaeacaaahiaaaaaoelaabaaaaiaacaaoeiaaeaaaaaeacaaahia
acaaoelaabaakkiaacaaoeiaaeaaaaaeabaaahiaadaaoelaabaaffiaacaaoeia
ebaaaaabaaaaapiaecaaaaadaaaacpiaabaaoeiaaaaioekaabaaaaacaaaaacia
ajaaffkabcaaaaaeabaacbiaaaaaaaiaaaaaffiaahaaaakaacaaaaadacaaahia
aeaaoelaaiaaoekbaiaaaaadaaaaabiaacaaoeiaacaaoeiaahaaaaacaaaaabia
aaaaaaiaagaaaaacaaaaabiaaaaaaaiaaeaaaaaeaaaabbiaaaaaaaiaahaakkka
ahaappkaacaaaaadabaadbiaaaaaaaiaabaaaaiaaeaaaaaeaaaaabiaaeaappla
abaappkbaaaaffiaafaaaaadaaaaadiaaaaaaaiaakaaoekabdaaaaacaaaaadia
aaaaoeiaaeaaaaaeabaaceiaaaaaffiaakaakkkbaaaaaaiaabaaaaacabaaciia
aaaaffiaabaaaaacabaaaciaajaaffkaabaaaaacaaaicpiaabaaoeiappppaaaa
fdeieefcfmafaaaaeaaaaaaafhabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabkaaaaaa
fkaiaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadhcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagcbaaaaddcbabaaaagaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaagaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaajbcaabaaa
aaaaaaaadkaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaaiaaaaaadbaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaa
aaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaafaaaaaaegiccaiaebaaaaaa
acaaaaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaaegiccaiaebaaaaaa
acaaaaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaaegiccaiaebaaaaaa
acaaaaaaacaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaaegiccaiaebaaaaaa
acaaaaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaadbaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaacaaaaaa
aeaaaaaadhaaaaaphcaabaaaabaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaialpaaaaaaaaaceaaaaaaaaaaaiaaaaaaaiaaaaaaaiaaaaaaaaa
abaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpaaaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaafgaobaaa
aaaaaaaadeaaaaakocaabaaaaaaaaaaafgaobaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaa
egbcbaaaacaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaaabaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaadaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaa
aeaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaehaaaaalbcaabaaaaaaaaaaa
egaabaaaaaaaaaaaaghabaaaabaaaaaaaagabaaaaaaaaaaackaabaaaaaaaaaaa
aaaaaaajccaabaaaaaaaaaaaakiacaiaebaaaaaaacaaaaaabiaaaaaaabeaaaaa
aaaaiadpdcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaacaaaaaabiaaaaaaaaaaaaajocaabaaaaaaaaaaaagbjbaaaafaaaaaa
agijcaiaebaaaaaaacaaaaaabjaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaa
aaaaaaaajgahbaaaaaaaaaaaelaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
dccaaaalccaabaaaaaaaaaaabkaabaaaaaaaaaaackiacaaaacaaaaaabiaaaaaa
dkiacaaaacaaaaaabiaaaaaaaacaaaahbccabaaaaaaaaaaabkaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkbabaiaebaaaaaaafaaaaaa
dkiacaaaabaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaakdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaahpedaaaaaaaaaaaaaaaabkaaaaaf
dcaabaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakeccabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaabkaabaaaaaaaaaaadgaaaaafcccabaaaaaaaaaaaabeaaaaaaaaaiadp
doaaaaabfdegejdaaiaaaaaaiaaaaaaaaaaaaaaaejfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Dependency "OptimizedShader" = "Hidden/Nature/Tree Creator Leaves Optimized"
Fallback "Diffuse"
}