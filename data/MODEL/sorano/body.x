xof 0302txt 0064
template Header {
 <3D82AB43-62DA-11cf-AB39-0020AF71E433>
 WORD major;
 WORD minor;
 DWORD flags;
}

template Vector {
 <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template Coords2d {
 <F6F23F44-7686-11cf-8F52-0040333594A3>
 FLOAT u;
 FLOAT v;
}

template Matrix4x4 {
 <F6F23F45-7686-11cf-8F52-0040333594A3>
 array FLOAT matrix[16];
}

template ColorRGBA {
 <35FF44E0-6C7C-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template IndexedColor {
 <1630B820-7842-11cf-8F52-0040333594A3>
 DWORD index;
 ColorRGBA indexColor;
}

template Boolean {
 <4885AE61-78E8-11cf-8F52-0040333594A3>
 WORD truefalse;
}

template Boolean2d {
 <4885AE63-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template MaterialWrap {
 <4885AE60-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template TextureFilename {
 <A42790E1-7810-11cf-8F52-0040333594A3>
 STRING filename;
}

template Material {
 <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshFace {
 <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshFaceWraps {
 <4885AE62-78E8-11cf-8F52-0040333594A3>
 DWORD nFaceWrapValues;
 Boolean2d faceWrapValues;
}

template MeshTextureCoords {
 <F6F23F40-7686-11cf-8F52-0040333594A3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList {
 <F6F23F42-7686-11cf-8F52-0040333594A3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
}

template MeshNormals {
 <F6F23F43-7686-11cf-8F52-0040333594A3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template MeshVertexColors {
 <1630B821-7842-11cf-8F52-0040333594A3>
 DWORD nVertexColors;
 array IndexedColor vertexColors[nVertexColors];
}

template Mesh {
 <3D82AB44-62DA-11cf-AB39-0020AF71E433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

Header{
1;
0;
1;
}

Mesh {
 112;
 -9.75472;-11.77368;-9.75472;,
 -13.79526;-11.77368;0.00000;,
 -9.01350;-0.10822;0.00000;,
 -6.37350;-0.10822;-6.37350;,
 -9.75472;-11.77368;9.75472;,
 -6.37350;-0.10822;6.37350;,
 -0.00000;-11.77368;13.79526;,
 -0.00000;-0.10822;9.01350;,
 9.75472;-11.77368;9.75472;,
 6.37350;-0.10822;6.37350;,
 13.79526;-11.77368;-0.00000;,
 9.01350;-0.10822;-0.00000;,
 9.75472;-11.77368;-9.75472;,
 6.37351;-0.10822;-6.37351;,
 0.00000;-11.77368;-13.79526;,
 0.00000;-0.10822;-9.01350;,
 3.18675;-0.10822;-7.69350;,
 -3.18675;-0.10822;-7.69350;,
 -4.38341;10.06582;-4.38341;,
 -6.19908;10.06582;0.00000;,
 -4.45077;11.77368;0.00000;,
 -3.14716;11.77368;-3.14717;,
 -6.19908;10.06582;0.00000;,
 -4.38341;10.06582;4.38341;,
 -3.14716;11.77368;3.14716;,
 -4.45077;11.77368;0.00000;,
 0.00000;10.06582;6.19908;,
 0.00000;11.77368;4.45077;,
 4.38341;10.06582;4.38341;,
 3.14717;11.77368;3.14716;,
 6.19909;10.06582;0.00000;,
 4.45077;11.77368;0.00000;,
 6.19909;10.06582;0.00000;,
 4.38342;10.06582;-4.38342;,
 3.14717;11.77368;-3.14717;,
 4.45077;11.77368;0.00000;,
 2.19171;10.06582;-5.29125;,
 1.43003;11.77368;-3.85843;,
 0.00000;10.06582;-6.19909;,
 -2.19171;10.06582;-5.29125;,
 -1.43003;11.77368;-3.85843;,
 0.00000;11.77368;-4.45077;,
 0.00000;11.77368;0.00000;,
 0.00000;11.77368;0.00000;,
 -5.12815;6.25846;-5.12815;,
 -7.25230;6.25846;0.00000;,
 -6.58432;6.67575;-1.33399;,
 -5.88106;9.30296;1.27725;,
 -5.12815;6.25846;5.12815;,
 0.00000;6.25846;7.25230;,
 5.12815;6.25846;5.12815;,
 7.25230;6.25846;0.00000;,
 6.50509;6.87331;1.39332;,
 5.85082;9.36279;-1.31029;,
 2.37789;8.16215;-5.74074;,
 4.75578;8.16215;-4.75578;,
 5.12815;6.25846;-5.12815;,
 -2.37789;8.16215;-5.74074;,
 0.00000;8.16215;-6.72569;,
 0.00000;6.25846;-7.25230;,
 -5.75083;3.07512;-5.75083;,
 -9.01350;-0.10822;0.00000;,
 -6.37350;-0.10822;6.37350;,
 -7.25230;6.25846;0.00000;,
 -0.00000;-0.10822;9.01350;,
 6.37350;-0.10822;6.37350;,
 9.01350;-0.10822;-0.00000;,
 9.01350;-0.10822;-0.00000;,
 6.37351;-0.10822;-6.37351;,
 5.75083;3.07512;-5.75083;,
 0.00000;1.67947;-8.51898;,
 0.56816;1.88277;-8.22739;,
 0.00000;-0.10822;-9.01350;,
 -0.56816;1.88277;-8.22739;,
 6.19909;10.06582;0.00000;,
 5.88106;9.30296;1.27725;,
 6.50509;6.87331;1.39332;,
 5.85082;9.36279;-1.31029;,
 6.58432;6.67575;-1.33399;,
 5.95290;7.96994;-1.99405;,
 -5.88106;9.30296;1.27725;,
 -6.50509;6.87331;1.39332;,
 -5.99939;7.93765;1.90337;,
 -6.19908;10.06582;0.00000;,
 -6.58432;6.67575;-1.33399;,
 -7.25230;6.25846;0.00000;,
 5.95290;7.96994;-1.99405;,
 -5.85082;9.36279;-1.31029;,
 7.25230;6.25846;0.00000;,
 6.58432;6.67575;-1.33399;,
 -5.95290;7.96994;-1.99405;,
 -4.75578;8.16215;-4.75578;,
 5.99939;7.93765;1.90337;,
 -6.50509;6.87331;1.39332;,
 5.88106;9.30296;1.27725;,
 -5.99939;7.93765;1.90337;,
 -5.85082;9.36279;-1.31029;,
 -5.95290;7.96994;-1.99405;,
 5.99939;7.93765;1.90337;,
 7.25230;6.25846;0.00000;,
 2.07605;6.25846;-6.39238;,
 -2.07604;6.25846;-6.39238;,
 -1.66876;3.38431;-7.35615;,
 1.06440;2.19443;-7.93563;,
 1.66877;3.38431;-7.35615;,
 1.53158;2.71340;-7.59856;,
 -1.06440;2.19443;-7.93563;,
 -1.53158;2.71340;-7.59856;,
 3.18675;-0.10822;-7.69350;,
 -6.37350;-0.10822;-6.37350;,
 -3.18675;-0.10822;-7.69350;,
 -9.01350;-0.10822;0.00000;;
 
 107;
 4;0,1,2,3;,
 4;1,4,5,2;,
 4;4,6,7,5;,
 4;6,8,9,7;,
 4;8,10,11,9;,
 4;10,12,13,11;,
 3;12,14,13;,
 3;14,15,13;,
 3;15,16,13;,
 3;15,14,17;,
 3;17,14,3;,
 3;14,0,3;,
 4;18,19,20,21;,
 4;22,23,24,25;,
 4;23,26,27,24;,
 4;26,28,29,27;,
 4;28,30,31,29;,
 4;32,33,34,35;,
 4;33,36,37,34;,
 4;38,39,40,41;,
 3;21,20,42;,
 3;25,24,43;,
 3;24,27,43;,
 3;27,29,43;,
 3;29,31,43;,
 3;35,34,42;,
 4;34,37,41,42;,
 4;41,40,21,42;,
 3;44,45,46;,
 3;47,23,22;,
 4;48,49,26,23;,
 4;49,50,28,26;,
 3;50,51,52;,
 3;53,33,32;,
 3;54,55,56;,
 3;57,58,59;,
 3;60,45,44;,
 4;61,62,48,63;,
 4;62,64,49,48;,
 4;64,65,50,49;,
 4;65,66,51,50;,
 3;67,68,69;,
 4;70,71,72,73;,
 3;74,75,76;,
 3;77,78,79;,
 3;80,81,82;,
 3;83,84,85;,
 3;86,33,53;,
 3;18,87,19;,
 3;88,56,89;,
 3;44,46,90;,
 4;86,56,55,33;,
 3;18,90,87;,
 3;89,56,86;,
 4;44,90,18,91;,
 3;50,52,92;,
 3;63,48,93;,
 3;28,94,30;,
 3;95,23,47;,
 3;28,92,94;,
 3;95,48,23;,
 3;50,92,28;,
 3;93,48,95;,
 3;74,78,77;,
 3;84,96,97;,
 3;76,75,98;,
 3;85,81,83;,
 3;74,76,99;,
 3;83,81,80;,
 3;99,78,74;,
 3;83,96,84;,
 4;18,39,57,91;,
 3;58,57,39;,
 3;54,58,36;,
 4;55,54,36,33;,
 3;58,39,38;,
 3;36,58,38;,
 3;54,59,58;,
 3;54,100,59;,
 3;57,44,91;,
 3;57,101,44;,
 4;40,39,18,21;,
 4;37,36,38,41;,
 3;54,56,100;,
 3;57,59,101;,
 3;59,102,101;,
 3;103,104,105;,
 4;72,71,103,105;,
 4;106,73,72,107;,
 4;105,68,108,72;,
 4;101,102,60,44;,
 4;69,68,105,104;,
 4;109,107,72,110;,
 4;60,102,107,109;,
 4;56,69,104,100;,
 3;100,104,59;,
 3;106,70,73;,
 3;59,70,102;,
 3;59,104,70;,
 3;70,104,103;,
 3;70,103,71;,
 3;102,70,106;,
 3;102,106,107;,
 3;60,111,45;,
 3;109,111,60;,
 3;88,69,56;,
 3;67,69,88;;
 
 MeshMaterialList {
  1;
  107;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0;;
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data\\TEXTURE\\murabitouv_draw.png";
   }
  }
 }
 MeshNormals {
  77;
  -0.654273;0.379280;-0.654273;,
  -0.925282;0.379280;0.000000;,
  -0.654273;0.379280;0.654273;,
  0.000000;0.379280;0.925282;,
  0.654273;0.379280;0.654273;,
  0.925282;0.379280;0.000000;,
  0.654273;0.379280;-0.654273;,
  -0.076429;0.378171;-0.922575;,
  -0.571808;0.320946;-0.755003;,
  -0.946953;0.311369;-0.079554;,
  -0.669042;0.323674;0.669042;,
  0.000000;0.323674;0.946169;,
  0.669042;0.323674;0.669042;,
  0.946953;0.311370;-0.079554;,
  0.571808;0.320946;-0.755003;,
  -0.000000;0.299012;-0.954249;,
  -0.261397;0.929163;-0.261397;,
  -0.369670;0.929163;0.000000;,
  -0.261397;0.929163;0.261397;,
  -0.000000;0.929163;0.369670;,
  0.261397;0.929163;0.261397;,
  0.369670;0.929163;0.000000;,
  0.261396;0.929163;-0.261396;,
  0.000000;0.929163;-0.369670;,
  0.000000;1.000000;0.000000;,
  -0.726727;0.429051;-0.536455;,
  -0.919992;0.391938;-0.000000;,
  -0.726726;0.429050;0.536455;,
  -0.000000;0.512454;0.858715;,
  0.726727;0.429049;0.536456;,
  0.919993;0.391935;0.000000;,
  0.726728;0.429048;-0.536455;,
  0.000000;0.512453;-0.858715;,
  -0.720669;0.266179;-0.640145;,
  -0.962241;0.266177;-0.056939;,
  -0.768831;0.264283;0.582282;,
  0.000000;0.266614;0.963803;,
  0.768831;0.264283;0.582282;,
  0.962241;0.266176;-0.056939;,
  0.720669;0.266178;-0.640144;,
  -0.000001;0.266615;-0.963803;,
  0.895109;0.247610;0.370768;,
  0.895108;0.247612;0.370769;,
  0.895108;0.247611;0.370770;,
  0.895109;0.247610;-0.370768;,
  0.895109;0.247612;-0.370767;,
  0.895110;0.247608;-0.370768;,
  -0.895108;0.247613;0.370768;,
  -0.895108;0.247612;0.370769;,
  -0.895110;0.247610;0.370767;,
  -0.895110;0.247609;-0.370766;,
  -0.895108;0.247613;-0.370768;,
  -0.895108;0.247614;-0.370767;,
  0.344241;0.436829;-0.831071;,
  -0.362680;0.319086;-0.875584;,
  -0.344242;0.436829;-0.831070;,
  -0.582283;0.264285;-0.768831;,
  -0.370767;0.247611;-0.895109;,
  -0.000000;0.266613;-0.963804;,
  0.370766;0.247611;-0.895110;,
  0.582282;0.264283;-0.768832;,
  -0.199764;0.852941;-0.482271;,
  0.199763;0.852941;-0.482272;,
  0.370766;0.247612;-0.895109;,
  -0.370766;0.247611;-0.895110;,
  0.000000;0.266585;-0.963811;,
  -0.370769;0.247608;-0.895109;,
  -0.370764;0.247611;-0.895110;,
  -0.370780;0.247587;-0.895111;,
  -0.251202;0.258039;-0.932906;,
  0.251202;0.258039;-0.932906;,
  0.370782;0.247584;-0.895110;,
  0.370765;0.247609;-0.895111;,
  0.370769;0.247606;-0.895110;,
  -0.735629;0.265767;-0.623071;,
  0.735629;0.265768;-0.623071;,
  0.370766;0.247611;-0.895110;;
  107;
  4;0,1,9,8;,
  4;1,2,10,9;,
  4;2,3,11,10;,
  4;3,4,12,11;,
  4;4,5,13,12;,
  4;5,6,14,13;,
  3;6,7,14;,
  3;7,15,14;,
  3;24,24,24;,
  3;15,7,54;,
  3;54,7,8;,
  3;7,0,8;,
  4;25,26,17,16;,
  4;26,27,18,17;,
  4;27,28,19,18;,
  4;28,29,20,19;,
  4;29,30,21,20;,
  4;30,31,22,21;,
  4;31,53,62,22;,
  4;32,55,61,23;,
  3;16,17,24;,
  3;17,18,24;,
  3;18,19,24;,
  3;19,20,24;,
  3;20,21,24;,
  3;21,22,24;,
  4;22,62,23,24;,
  4;23,61,16,24;,
  3;33,34,50;,
  3;47,27,26;,
  4;35,36,28,27;,
  4;36,37,29,28;,
  3;37,38,41;,
  3;44,31,30;,
  3;59,60,39;,
  3;57,58,40;,
  3;74,34,33;,
  4;9,10,35,34;,
  4;10,11,36,35;,
  4;11,12,37,36;,
  4;12,13,38,37;,
  3;13,14,75;,
  4;65,70,15,69;,
  3;30,43,41;,
  3;44,46,45;,
  3;47,49,48;,
  3;26,50,34;,
  3;45,31,44;,
  3;25,52,26;,
  3;38,39,46;,
  3;33,50,51;,
  4;45,39,60,31;,
  3;25,51,52;,
  3;46,39,45;,
  4;33,51,25,56;,
  3;37,41,42;,
  3;34,35,49;,
  3;29,43,30;,
  3;48,27,47;,
  3;29,42,43;,
  3;48,35,27;,
  3;37,42,29;,
  3;49,35,48;,
  3;30,46,44;,
  3;50,52,51;,
  3;41,43,42;,
  3;34,49,26;,
  3;30,41,38;,
  3;26,49,47;,
  3;38,46,30;,
  3;26,52,50;,
  4;25,55,57,56;,
  3;58,57,55;,
  3;59,58,53;,
  4;60,59,53,31;,
  3;58,55,32;,
  3;53,58,32;,
  3;59,40,58;,
  3;59,63,40;,
  3;57,33,56;,
  3;57,64,33;,
  4;61,55,25,16;,
  4;62,53,32,23;,
  3;59,39,63;,
  3;57,40,64;,
  3;40,66,64;,
  3;71,73,72;,
  4;15,70,71,72;,
  4;68,69,15,67;,
  4;72,14,76,15;,
  4;64,66,74,33;,
  4;75,14,72,73;,
  4;8,67,15,54;,
  4;74,66,67,8;,
  4;39,75,73,63;,
  3;63,73,40;,
  3;68,65,69;,
  3;40,65,66;,
  3;40,73,65;,
  3;65,73,71;,
  3;65,71,70;,
  3;66,65,68;,
  3;66,68,67;,
  3;74,9,34;,
  3;8,9,74;,
  3;38,75,39;,
  3;13,75,38;;
 }
 MeshTextureCoords {
  112;
  0.730274;0.303968;,
  0.747232;0.303968;,
  0.727162;0.208151;,
  0.716082;0.208151;,
  0.730274;0.303968;,
  0.716082;0.208151;,
  0.689331;0.303968;,
  0.689331;0.208151;,
  0.648389;0.303968;,
  0.662581;0.208151;,
  0.631430;0.303968;,
  0.651500;0.208151;,
  0.648389;0.303968;,
  0.662581;0.208151;,
  0.689331;0.303968;,
  0.689331;0.208151;,
  0.675956;0.208151;,
  0.702707;0.208151;,
  0.538938;0.596420;,
  0.606503;0.596420;,
  0.541444;0.532867;,
  0.492934;0.532867;,
  0.831905;0.357981;,
  0.798962;0.357981;,
  0.776532;0.332816;,
  0.800184;0.332816;,
  0.719431;0.357981;,
  0.719431;0.332816;,
  0.639899;0.357981;,
  0.662329;0.332816;,
  0.606956;0.357981;,
  0.638677;0.332816;,
  0.145139;0.596420;,
  0.212704;0.596420;,
  0.258708;0.532867;,
  0.210198;0.532867;,
  0.294263;0.596420;,
  0.322606;0.532867;,
  0.375821;0.596420;,
  0.457379;0.596420;,
  0.429036;0.532867;,
  0.375821;0.532867;,
  0.375821;0.532867;,
  0.719431;0.332816;,
  0.566651;0.738100;,
  0.645695;0.738100;,
  0.620838;0.722572;,
  0.826135;0.369221;,
  0.812474;0.414081;,
  0.719431;0.414081;,
  0.626387;0.414081;,
  0.587847;0.414081;,
  0.601404;0.405021;,
  0.158099;0.622581;,
  0.287334;0.667260;,
  0.198848;0.667260;,
  0.184991;0.738100;,
  0.464308;0.667260;,
  0.375821;0.667260;,
  0.375821;0.738100;,
  0.589822;0.856560;,
  0.882969;0.507892;,
  0.835070;0.507892;,
  0.851015;0.414081;,
  0.719431;0.507892;,
  0.603791;0.507892;,
  0.555892;0.507892;,
  0.040409;0.975019;,
  0.138649;0.975019;,
  0.161820;0.856560;,
  0.375821;0.908495;,
  0.354679;0.900930;,
  0.375821;0.975019;,
  0.396964;0.900930;,
  0.093395;0.509147;,
  0.075735;0.531048;,
  0.075506;0.600801;,
  0.109611;0.529331;,
  0.109161;0.606473;,
  0.116962;0.569318;,
  0.049730;0.530178;,
  0.050542;0.595252;,
  0.056166;0.566745;,
  0.035179;0.509746;,
  0.019571;0.600543;,
  0.035179;0.611719;,
  0.154300;0.674412;,
  0.593543;0.622581;,
  0.105947;0.738100;,
  0.130804;0.722572;,
  0.597342;0.674412;,
  0.552794;0.667260;,
  0.610579;0.389339;,
  0.837457;0.405021;,
  0.612726;0.369221;,
  0.828282;0.389339;,
  0.018277;0.528575;,
  0.009501;0.565880;,
  0.067077;0.570245;,
  0.093395;0.618452;,
  0.298567;0.738100;,
  0.453075;0.738100;,
  0.437919;0.845054;,
  0.336212;0.889332;,
  0.313722;0.845054;,
  0.318828;0.870020;,
  0.415430;0.889332;,
  0.432815;0.870020;,
  0.257235;0.975019;,
  0.612993;0.975019;,
  0.494407;0.975019;,
  0.711233;0.975019;;
 }
}
