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
 213;
 -82.16000;27.59872;-168.64000;,
 -82.16000;27.59872;168.64000;,
 -82.16000;62.16000;168.64000;,
 -82.16000;62.16000;-168.64000;,
 -82.16000;62.16000;-200.96880;,
 -82.16000;27.59872;-200.96880;,
 -82.16000;27.59872;-168.64000;,
 -82.16000;62.16000;-168.64000;,
 -82.16000;12.66368;-168.64000;,
 -82.16000;12.66368;168.64000;,
 82.16000;12.66368;-168.64000;,
 82.16000;27.59872;-168.64000;,
 82.16000;27.59872;168.64000;,
 82.16000;12.66368;168.64000;,
 -82.16000;27.59872;-179.70673;,
 -82.16000;12.66368;-173.77697;,
 -82.16000;12.66368;-168.64000;,
 82.16000;12.66368;-173.77697;,
 82.16000;27.59872;-179.70673;,
 82.16000;27.59872;-168.64000;,
 82.16000;12.66368;-168.64000;,
 -70.49216;-62.16000;-168.64000;,
 -70.49216;-62.16000;168.64000;,
 -82.16000;-62.16000;168.64000;,
 -82.16000;-62.16000;-168.64000;,
 -70.49216;12.66368;-168.64000;,
 -70.49216;12.66368;-173.77697;,
 -70.49216;12.66368;-173.77697;,
 -82.16000;12.66368;-173.77697;,
 -82.16000;27.59872;-179.70673;,
 -70.49216;27.59872;-179.70673;,
 -70.49216;12.66368;168.64000;,
 -70.49216;27.59872;168.64000;,
 -82.16000;27.59872;168.64000;,
 -82.16000;12.66368;168.64000;,
 -70.49216;27.59872;-179.70673;,
 -70.49216;27.59872;-168.64000;,
 -70.49216;62.16000;168.64000;,
 -82.16000;62.16000;168.64000;,
 -70.49216;27.59872;-200.96880;,
 -70.49216;62.16000;168.64000;,
 -70.49216;62.16000;-168.64000;,
 -82.16000;62.16000;-168.64000;,
 -70.49216;62.16000;-200.96880;,
 -70.49216;62.16000;-168.64000;,
 -0.15968;-62.16000;-168.64000;,
 -0.15968;-62.16000;168.64000;,
 -0.15968;12.66368;-168.64000;,
 -0.15968;12.66368;-173.77697;,
 -0.15968;12.66368;-173.77697;,
 -0.15968;27.59872;-179.70673;,
 -0.15968;12.66368;168.64000;,
 -0.15968;27.59872;168.64000;,
 -0.15968;27.59872;-179.70673;,
 -0.15968;27.59872;-168.64000;,
 -0.15968;62.16000;168.64000;,
 -0.15968;27.59872;-200.96880;,
 -0.15968;62.16000;168.64000;,
 -0.15968;62.16000;-168.64000;,
 -0.15968;62.16000;-200.96880;,
 -0.15968;62.16000;-168.64000;,
 8.01168;12.66368;-168.64000;,
 8.01168;12.66368;-173.77697;,
 8.01168;-62.16000;-168.64000;,
 8.01168;-62.16000;168.64000;,
 8.01168;12.66368;-173.77697;,
 8.01168;27.59872;-179.70673;,
 8.01168;27.59872;-179.70673;,
 8.01168;27.59872;-168.64000;,
 8.01168;12.66368;168.64000;,
 8.01168;27.59872;168.64000;,
 8.01168;27.59872;-200.96880;,
 8.01168;62.16000;168.64000;,
 8.01168;62.16000;-200.96880;,
 8.01168;62.16000;168.64000;,
 8.01168;62.16000;-168.64000;,
 8.01168;62.16000;-168.64000;,
 71.30768;12.66368;-168.64000;,
 71.30768;12.66368;-173.77697;,
 71.30768;-62.16000;-168.64000;,
 82.16000;-62.16000;-168.64000;,
 82.16000;-62.16000;168.64000;,
 71.30768;-62.16000;168.64000;,
 71.30768;12.66368;-173.77697;,
 71.30768;27.59872;-179.70673;,
 82.16000;27.59872;-179.70673;,
 82.16000;12.66368;-173.77697;,
 71.30768;27.59872;-179.70673;,
 71.30768;27.59872;-168.64000;,
 71.30768;12.66368;168.64000;,
 82.16000;12.66368;168.64000;,
 82.16000;27.59872;168.64000;,
 71.30768;27.59872;168.64000;,
 71.30768;27.59872;-200.96880;,
 82.16000;27.59872;-200.96880;,
 82.16000;62.16000;168.64000;,
 71.30768;62.16000;168.64000;,
 71.30768;62.16000;-200.96880;,
 82.16000;62.16000;-200.96880;,
 71.30768;62.16000;168.64000;,
 82.16000;62.16000;168.64000;,
 82.16000;62.16000;-168.64000;,
 71.30768;62.16000;-168.64000;,
 71.30768;62.16000;-168.64000;,
 82.16000;62.16000;-168.64000;,
 -70.49216;-62.16000;145.33264;,
 -0.15968;-62.16000;145.33264;,
 -0.15968;-62.16000;-168.64000;,
 -70.49216;-62.16000;-168.64000;,
 -0.15968;12.66368;145.33264;,
 -70.49216;12.66368;145.33264;,
 8.01168;2.33168;-54.66736;,
 8.01168;-62.16000;-54.66736;,
 8.01168;-62.16000;-168.64000;,
 8.01168;2.33168;-168.64000;,
 8.01168;12.66368;-54.66736;,
 71.30768;2.33168;-54.66736;,
 71.30768;12.66368;-54.66736;,
 71.30768;2.33168;-168.64000;,
 71.30768;-62.16000;-168.64000;,
 71.30768;-62.16000;-54.66736;,
 -0.15968;2.33168;-168.64000;,
 82.16000;2.33168;-168.64000;,
 82.16000;-62.16000;-168.64000;,
 -0.15968;2.33168;145.33264;,
 82.16000;2.33168;-168.64000;,
 82.16000;2.33168;168.64000;,
 82.16000;-62.16000;-168.64000;,
 -70.49216;2.33168;145.33264;,
 82.16000;2.33168;168.64000;,
 71.30768;2.33168;168.64000;,
 71.30768;-62.16000;168.64000;,
 82.16000;-62.16000;168.64000;,
 -70.49216;2.33168;-168.64000;,
 -82.16000;-62.16000;-168.64000;,
 -82.16000;2.33168;-168.64000;,
 8.01168;2.33168;168.64000;,
 -0.15968;2.33168;168.64000;,
 -0.15968;-62.16000;168.64000;,
 8.01168;-62.16000;168.64000;,
 -82.16000;2.33168;-168.64000;,
 -82.16000;-62.16000;-168.64000;,
 -82.16000;2.33168;168.64000;,
 -70.49216;2.33168;168.64000;,
 -70.49216;-62.16000;168.64000;,
 -82.16000;2.33168;168.64000;,
 -82.16000;-62.16000;168.64000;,
 34.48256;-62.16000;-168.64000;,
 34.48256;-62.16000;-54.66736;,
 40.89248;-62.16000;-54.66736;,
 40.89248;-62.16000;-168.64000;,
 34.48256;-62.16000;-168.64000;,
 40.89248;-62.16000;-168.64000;,
 40.89248;-62.16000;168.64000;,
 34.48256;-62.16000;168.64000;,
 34.48256;2.33168;-54.66736;,
 40.89248;2.33168;-54.66736;,
 34.48256;-62.16000;168.64000;,
 40.89248;-62.16000;168.64000;,
 40.89248;2.33168;168.64000;,
 34.48256;2.33168;168.64000;,
 34.48256;12.66368;-54.66736;,
 40.89248;12.66368;-54.66736;,
 40.89248;12.66368;168.64000;,
 34.48256;12.66368;168.64000;,
 34.48256;12.66368;-168.64000;,
 40.89248;12.66368;-168.64000;,
 40.89248;27.59872;168.64000;,
 34.48256;27.59872;168.64000;,
 34.48256;12.66368;-173.77697;,
 40.89248;12.66368;-173.77697;,
 40.89248;62.16000;168.64000;,
 34.48256;62.16000;168.64000;,
 34.48256;12.66368;-173.77697;,
 34.48256;27.59872;-179.70673;,
 40.89248;27.59872;-179.70673;,
 40.89248;12.66368;-173.77697;,
 34.48256;62.16000;168.64000;,
 40.89248;62.16000;168.64000;,
 40.89248;62.16000;-168.64000;,
 34.48256;62.16000;-168.64000;,
 34.48256;27.59872;-179.70673;,
 34.48256;27.59872;-168.64000;,
 40.89248;27.59872;-168.64000;,
 40.89248;27.59872;-179.70673;,
 34.48256;62.16000;-168.64000;,
 40.89248;62.16000;-168.64000;,
 40.89248;62.16000;-200.96880;,
 34.48256;62.16000;-200.96880;,
 34.48256;27.59872;-200.96880;,
 40.89248;27.59872;-200.96880;,
 47.78656;-62.16000;-54.66736;,
 47.78656;-62.16000;-168.64000;,
 47.78656;2.33168;-54.66736;,
 47.78656;-62.16000;-168.64000;,
 47.78656;-62.16000;168.64000;,
 47.78656;12.66368;-54.66736;,
 47.78656;-62.16000;168.64000;,
 47.78656;2.33168;168.64000;,
 47.78656;12.66368;-168.64000;,
 47.78656;12.66368;168.64000;,
 47.78656;12.66368;-173.77697;,
 47.78656;27.59872;168.64000;,
 47.78656;12.66368;-173.77697;,
 47.78656;27.59872;-179.70673;,
 47.78656;62.16000;168.64000;,
 47.78656;27.59872;-179.70673;,
 47.78656;27.59872;-168.64000;,
 47.78656;62.16000;168.64000;,
 47.78656;62.16000;-168.64000;,
 47.78656;27.59872;-200.96880;,
 47.78656;62.16000;-168.64000;,
 47.78656;62.16000;-200.96880;;
 
 142;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,9,1,0;,
 4;10,11,12,13;,
 4;14,15,16,6;,
 4;17,18,19,20;,
 4;21,22,23,24;,
 4;25,16,15,26;,
 4;27,28,29,30;,
 4;31,32,33,34;,
 4;35,14,6,36;,
 4;32,37,38,33;,
 4;36,6,5,39;,
 4;40,41,42,2;,
 4;39,5,4,43;,
 4;44,43,4,7;,
 4;45,46,22,21;,
 4;47,25,26,48;,
 4;49,27,30,50;,
 4;51,52,32,31;,
 4;53,35,36,54;,
 4;52,55,37,32;,
 4;54,36,39,56;,
 4;57,58,41,40;,
 4;56,39,43,59;,
 4;60,59,43,44;,
 4;61,47,48,62;,
 4;63,64,46,45;,
 4;65,49,50,66;,
 4;67,53,54,68;,
 4;69,70,52,51;,
 4;68,54,56,71;,
 4;70,72,55,52;,
 4;71,56,59,73;,
 4;74,75,58,57;,
 4;73,59,60,76;,
 4;77,78,17,20;,
 4;79,80,81,82;,
 4;83,84,85,86;,
 4;87,88,19,18;,
 4;89,90,91,92;,
 4;88,93,94,19;,
 4;92,91,95,96;,
 4;93,97,98,94;,
 4;99,100,101,102;,
 4;97,103,104,98;,
 4;105,106,107,108;,
 4;109,110,25,47;,
 4;111,112,113,114;,
 4;111,114,61,115;,
 4;116,117,77,118;,
 4;116,118,119,120;,
 4;114,113,107,121;,
 4;114,121,47,61;,
 4;118,77,20,122;,
 4;118,122,123,119;,
 4;121,107,106,124;,
 4;121,124,109,47;,
 4;125,10,13,126;,
 4;125,126,81,127;,
 4;124,106,105,128;,
 4;124,128,110,109;,
 4;129,90,89,130;,
 4;129,130,131,132;,
 4;128,105,108,133;,
 4;128,133,25,110;,
 4;133,108,134,135;,
 4;133,135,16,25;,
 4;136,69,51,137;,
 4;136,137,138,139;,
 4;140,141,23,142;,
 4;140,142,9,8;,
 4;137,51,31,143;,
 4;137,143,144,138;,
 4;145,146,144,143;,
 4;145,143,31,34;,
 4;147,113,112,148;,
 4;147,148,149,150;,
 4;151,152,153,154;,
 4;151,154,64,63;,
 4;148,112,111,155;,
 4;148,155,156,149;,
 4;157,158,159,160;,
 4;157,160,136,139;,
 4;155,111,115,161;,
 4;155,161,162,156;,
 4;160,159,163,164;,
 4;160,164,69,136;,
 4;161,115,61,165;,
 4;161,165,166,162;,
 4;164,163,167,168;,
 4;164,168,70,69;,
 4;165,61,62,169;,
 4;165,169,170,166;,
 4;168,167,171,172;,
 4;168,172,72,70;,
 4;173,65,66,174;,
 4;173,174,175,176;,
 4;177,178,179,180;,
 4;177,180,75,74;,
 4;181,67,68,182;,
 4;181,182,183,184;,
 4;185,186,187,188;,
 4;185,188,73,76;,
 4;182,68,71,189;,
 4;182,189,190,183;,
 4;188,187,190,189;,
 4;188,189,71,73;,
 4;191,120,119,192;,
 4;191,192,150,149;,
 4;191,149,156,193;,
 4;191,193,116,120;,
 4;194,79,82,195;,
 4;194,195,153,152;,
 4;193,156,162,196;,
 4;193,196,117,116;,
 4;197,131,130,198;,
 4;197,198,159,158;,
 4;196,162,166,199;,
 4;196,199,77,117;,
 4;198,130,89,200;,
 4;198,200,163,159;,
 4;199,166,170,201;,
 4;199,201,78,77;,
 4;200,89,92,202;,
 4;200,202,167,163;,
 4;203,176,175,204;,
 4;203,204,84,83;,
 4;202,92,96,205;,
 4;202,205,171,167;,
 4;206,184,183,207;,
 4;206,207,88,87;,
 4;208,99,102,209;,
 4;208,209,179,178;,
 4;207,183,190,210;,
 4;207,210,93,88;,
 4;211,103,97,212;,
 4;211,212,187,186;,
 4;210,190,187,212;,
 4;210,212,97,93;,
 4;94,98,101,11;,
 4;11,101,95,12;;
 
 MeshMaterialList {
  6;
  142;
  3,
  3,
  0,
  0,
  0,
  0,
  0,
  5,
  4,
  0,
  5,
  3,
  5,
  3,
  3,
  3,
  0,
  5,
  4,
  0,
  5,
  3,
  5,
  3,
  3,
  3,
  5,
  0,
  4,
  5,
  0,
  5,
  3,
  3,
  3,
  3,
  5,
  0,
  4,
  5,
  0,
  5,
  3,
  3,
  3,
  3,
  1,
  0,
  5,
  5,
  5,
  5,
  0,
  0,
  0,
  0,
  5,
  5,
  0,
  0,
  0,
  0,
  0,
  0,
  5,
  5,
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
  2,
  0,
  0,
  1,
  1,
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
  5,
  5,
  3,
  3,
  4,
  4,
  3,
  3,
  5,
  5,
  3,
  3,
  5,
  5,
  3,
  3,
  0,
  2,
  1,
  1,
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
  5,
  5,
  0,
  0,
  4,
  4,
  3,
  3,
  5,
  5,
  3,
  3,
  5,
  5,
  3,
  3,
  3,
  3,
  3,
  3;;
  Material {
   0.800000;0.765600;0.724800;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.292000;0.298400;0.298400;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.768800;0.119200;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.489600;0.351200;0.088000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.787200;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data\\TEXTURE\\subway_entrance.png";
   }
  }
  Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  10;
  -1.000000;0.000000;0.000000;,
  0.000000;-1.000000;-0.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;0.000000;1.000000;,
  1.000000;0.000000;0.000000;,
  0.000000;0.000000;-1.000000;,
  0.000000;-0.369015;-0.929423;,
  0.000000;-0.369015;-0.929423;,
  0.000000;-0.369015;-0.929423;,
  0.000000;-0.369015;-0.929423;;
  142;
  4;0,0,0,0;,
  4;0,0,0,0;,
  4;0,0,0,0;,
  4;4,4,4,4;,
  4;0,0,0,0;,
  4;4,4,4,4;,
  4;1,1,1,1;,
  4;1,1,1,1;,
  4;6,6,6,6;,
  4;3,3,3,3;,
  4;2,2,2,2;,
  4;3,3,3,3;,
  4;1,1,1,1;,
  4;2,2,2,2;,
  4;5,5,5,5;,
  4;2,2,2,2;,
  4;1,1,1,1;,
  4;1,1,1,1;,
  4;7,6,6,7;,
  4;3,3,3,3;,
  4;2,2,2,2;,
  4;3,3,3,3;,
  4;1,1,1,1;,
  4;2,2,2,2;,
  4;5,5,5,5;,
  4;2,2,2,2;,
  4;1,1,1,1;,
  4;1,1,1,1;,
  4;7,7,7,7;,
  4;2,2,2,2;,
  4;3,3,3,3;,
  4;1,1,1,1;,
  4;3,3,3,3;,
  4;5,5,5,5;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;1,1,1,1;,
  4;1,1,1,1;,
  4;8,8,9,9;,
  4;2,2,2,2;,
  4;3,3,3,3;,
  4;1,1,1,1;,
  4;3,3,3,3;,
  4;5,5,5,5;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;1,1,1,1;,
  4;4,4,4,4;,
  4;4,4,4,4;,
  4;0,0,0,0;,
  4;0,0,0,0;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;0,0,0,0;,
  4;0,0,0,0;,
  4;4,4,4,4;,
  4;4,4,4,4;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;4,4,4,4;,
  4;4,4,4,4;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;0,0,0,0;,
  4;0,0,0,0;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;1,1,1,1;,
  4;1,1,1,1;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;1,1,1,1;,
  4;1,1,1,1;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;1,1,1,1;,
  4;1,1,1,1;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;8,7,7,8;,
  4;8,8,8,8;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;1,1,1,1;,
  4;1,1,1,1;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;1,1,1,1;,
  4;1,1,1,1;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;1,1,1,1;,
  4;1,1,1,1;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;1,1,1,1;,
  4;1,1,1,1;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;6,8,8,6;,
  4;6,6,8,8;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;1,1,1,1;,
  4;1,1,1,1;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;4,4,4,4;,
  4;4,4,4,4;;
 }
 MeshTextureCoords {
  213;
  1.000000;0.278000;,
  0.000000;0.278000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.278000;,
  0.000000;0.278000;,
  0.000000;0.000000;,
  1.000000;0.398140;,
  0.000000;0.398140;,
  0.000000;0.398140;,
  0.000000;0.278000;,
  1.000000;0.278000;,
  1.000000;0.398140;,
  0.000000;0.278000;,
  0.000000;0.398140;,
  0.000000;0.398140;,
  1.000000;0.398140;,
  1.000000;0.278000;,
  1.000000;0.278000;,
  1.000000;0.398140;,
  0.071010;0.000000;,
  0.071010;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.071010;0.398140;,
  0.071010;0.398140;,
  -0.250762;0.836066;,
  -0.372668;0.836066;,
  -0.372668;0.156508;,
  -0.250762;0.156508;,
  0.928990;0.398140;,
  0.928990;0.278000;,
  1.000000;0.278000;,
  1.000000;0.398140;,
  0.071010;0.278000;,
  0.071010;0.278000;,
  0.928990;0.000000;,
  1.000000;0.000000;,
  0.071010;0.278000;,
  0.071010;0.000000;,
  0.071010;1.000000;,
  0.000000;1.000000;,
  0.071010;0.000000;,
  0.071010;0.000000;,
  0.499030;0.000000;,
  0.499030;1.000000;,
  0.499030;0.398140;,
  0.499030;0.398140;,
  0.484072;0.836066;,
  0.484072;0.156508;,
  0.500970;0.398140;,
  0.500970;0.278000;,
  0.499030;0.278000;,
  0.499030;0.278000;,
  0.500970;0.000000;,
  0.499030;0.278000;,
  0.499030;0.000000;,
  0.499030;1.000000;,
  0.499030;0.000000;,
  0.499030;0.000000;,
  0.548760;0.398140;,
  0.548760;0.398140;,
  0.548760;0.000000;,
  0.548760;1.000000;,
  0.569447;0.836066;,
  0.569447;0.156508;,
  0.548760;0.278000;,
  0.548760;0.278000;,
  0.451240;0.398140;,
  0.451240;0.278000;,
  0.548760;0.278000;,
  0.451240;0.000000;,
  0.548760;0.000000;,
  0.548760;0.000000;,
  0.548760;1.000000;,
  0.548760;0.000000;,
  0.933960;0.398140;,
  0.933960;0.398140;,
  0.933960;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.933960;1.000000;,
  1.230764;0.836066;,
  1.230764;0.156508;,
  1.344149;0.156508;,
  1.344149;0.836066;,
  0.933960;0.278000;,
  0.933960;0.278000;,
  0.066040;0.398140;,
  0.000000;0.398140;,
  0.000000;0.278000;,
  0.066040;0.278000;,
  0.933960;0.278000;,
  1.000000;0.278000;,
  0.000000;0.000000;,
  0.066040;0.000000;,
  0.933960;0.000000;,
  1.000000;0.000000;,
  0.933960;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.933960;1.000000;,
  0.933960;0.000000;,
  1.000000;0.000000;,
  0.071010;1.000000;,
  0.499030;1.000000;,
  0.499030;1.000000;,
  0.071010;1.000000;,
  0.499030;0.398140;,
  0.071010;0.398140;,
  0.548760;0.481250;,
  0.548760;1.000000;,
  0.548760;1.000000;,
  0.548760;0.481250;,
  0.548760;0.398140;,
  0.933960;0.481250;,
  0.933960;0.398140;,
  0.933960;0.481250;,
  0.933960;1.000000;,
  0.933960;1.000000;,
  0.499030;0.481250;,
  1.000000;0.481250;,
  1.000000;1.000000;,
  0.499030;0.481250;,
  0.000000;0.481250;,
  1.000000;0.481250;,
  0.000000;1.000000;,
  0.071010;0.481250;,
  0.000000;0.481250;,
  0.066040;0.481250;,
  0.066040;1.000000;,
  0.000000;1.000000;,
  0.071010;0.481250;,
  0.000000;1.000000;,
  0.000000;0.481250;,
  0.451240;0.481250;,
  0.500970;0.481250;,
  0.500970;1.000000;,
  0.451240;1.000000;,
  1.000000;0.481250;,
  1.000000;1.000000;,
  0.000000;0.481250;,
  0.928990;0.481250;,
  0.928990;1.000000;,
  1.000000;0.481250;,
  1.000000;1.000000;,
  0.709850;1.000000;,
  0.709850;1.000000;,
  0.748860;1.000000;,
  0.748860;1.000000;,
  0.709850;0.000000;,
  0.748860;0.000000;,
  0.748860;1.000000;,
  0.709850;1.000000;,
  0.709850;0.481250;,
  0.748860;0.481250;,
  0.290150;1.000000;,
  0.251140;1.000000;,
  0.251140;0.481250;,
  0.290150;0.481250;,
  0.709850;0.398140;,
  0.748860;0.398140;,
  0.251140;0.398140;,
  0.290150;0.398140;,
  0.709850;0.398140;,
  0.748860;0.398140;,
  0.251140;0.278000;,
  0.290150;0.278000;,
  0.709850;0.398140;,
  0.748860;0.398140;,
  0.251140;0.000000;,
  0.290150;0.000000;,
  0.846015;0.836066;,
  0.846015;0.156508;,
  0.912986;0.156508;,
  0.912986;0.836066;,
  0.709850;0.000000;,
  0.748860;0.000000;,
  0.748860;1.000000;,
  0.709850;1.000000;,
  0.709850;0.278000;,
  0.709850;0.278000;,
  0.748860;0.278000;,
  0.748860;0.278000;,
  0.709850;0.000000;,
  0.748860;0.000000;,
  0.748860;0.000000;,
  0.709850;0.000000;,
  0.709850;0.278000;,
  0.748860;0.278000;,
  0.790810;1.000000;,
  0.790810;1.000000;,
  0.790810;0.481250;,
  0.790810;0.000000;,
  0.790810;1.000000;,
  0.790810;0.398140;,
  0.209190;1.000000;,
  0.209190;0.481250;,
  0.790810;0.398140;,
  0.209190;0.398140;,
  0.790810;0.398140;,
  0.209190;0.278000;,
  0.985015;0.836066;,
  0.985015;0.156508;,
  0.209190;0.000000;,
  0.790810;0.278000;,
  0.790810;0.278000;,
  0.790810;0.000000;,
  0.790810;1.000000;,
  0.790810;0.278000;,
  0.790810;0.000000;,
  0.790810;0.000000;;
 }
}