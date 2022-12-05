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
 76;
 6.41004;1.01212;1.00197;,
 6.41004;1.42715;0.00000;,
 -1.12855;1.42715;0.00000;,
 -1.12855;1.01213;1.00197;,
 6.41004;1.01212;-1.00197;,
 -1.12855;1.01213;-1.00197;,
 6.41004;0.01016;-1.41700;,
 -1.12855;0.01016;-1.41700;,
 6.41004;-0.99181;-1.00197;,
 -1.12855;-0.99181;-1.00197;,
 6.41004;-1.40684;-0.00000;,
 -1.12855;-1.40684;0.00000;,
 6.41004;-0.99181;1.00197;,
 -1.12855;-0.99181;1.00197;,
 6.41004;0.01016;1.41700;,
 -1.12855;0.01016;1.41700;,
 6.41004;0.01016;0.00000;,
 -1.12855;0.01016;0.00000;,
 9.66839;0.52947;0.54120;,
 9.66839;0.75364;0.00000;,
 9.23484;1.40249;0.00000;,
 9.23485;0.98827;1.00000;,
 9.66839;0.52947;-0.54120;,
 9.23485;0.98827;-1.00000;,
 9.66839;-0.01173;-0.76537;,
 9.23485;-0.01173;-1.41421;,
 9.66839;-0.55293;-0.54120;,
 9.23485;-1.01173;-1.00000;,
 9.66839;-0.77710;-0.00000;,
 9.23484;-1.42594;-0.00000;,
 9.66839;-0.55293;0.54120;,
 9.23485;-1.01173;1.00000;,
 9.66839;-0.01173;0.76537;,
 9.23485;-0.01173;1.41421;,
 8.58600;1.83603;0.00000;,
 8.58600;1.29484;1.30656;,
 8.58600;1.29484;-1.30656;,
 8.58600;-0.01173;-1.84776;,
 8.58600;-1.31829;-1.30656;,
 8.58600;-1.85949;-0.00000;,
 8.58600;-1.31829;1.30656;,
 8.58600;-0.01173;1.84776;,
 7.82063;1.98827;0.00000;,
 7.82063;1.40249;1.41421;,
 7.82063;1.40249;-1.41421;,
 7.82063;-0.01173;-2.00000;,
 7.82063;-1.42594;-1.41421;,
 7.82063;-2.01173;-0.00000;,
 7.82063;-1.42594;1.41421;,
 7.82063;-0.01173;2.00000;,
 7.05526;1.83603;0.00000;,
 7.05526;1.29484;1.30656;,
 7.05526;1.29484;-1.30656;,
 7.05526;-0.01173;-1.84776;,
 7.05526;-1.31829;-1.30656;,
 7.05526;-1.85949;-0.00000;,
 7.05526;-1.31829;1.30656;,
 7.05526;-0.01173;1.84776;,
 6.40642;1.40249;0.00000;,
 6.40642;0.98827;1.00000;,
 6.40642;0.98827;-1.00000;,
 6.40642;-0.01173;-1.41421;,
 6.40642;-1.01173;-1.00000;,
 6.40642;-1.42594;-0.00000;,
 6.40642;-1.01173;1.00000;,
 6.40642;-0.01173;1.41421;,
 5.97287;0.75364;0.00000;,
 5.97287;0.52947;0.54120;,
 5.97287;0.52947;-0.54120;,
 5.97287;-0.01173;-0.76537;,
 5.97287;-0.55292;-0.54120;,
 5.97287;-0.77709;-0.00000;,
 5.97287;-0.55292;0.54120;,
 5.97287;-0.01173;0.76537;,
 9.82063;-0.01173;-0.00000;,
 5.82063;-0.01173;-0.00000;;
 
 88;
 4;0,1,2,3;,
 4;1,4,5,2;,
 4;4,6,7,5;,
 4;6,8,9,7;,
 4;8,10,11,9;,
 4;10,12,13,11;,
 4;12,14,15,13;,
 4;14,0,3,15;,
 3;1,0,16;,
 3;4,1,16;,
 3;6,4,16;,
 3;8,6,16;,
 3;10,8,16;,
 3;12,10,16;,
 3;14,12,16;,
 3;0,14,16;,
 3;3,2,17;,
 3;2,5,17;,
 3;5,7,17;,
 3;7,9,17;,
 3;9,11,17;,
 3;11,13,17;,
 3;13,15,17;,
 3;15,3,17;,
 4;18,19,20,21;,
 4;19,22,23,20;,
 4;22,24,25,23;,
 4;24,26,27,25;,
 4;26,28,29,27;,
 4;28,30,31,29;,
 4;30,32,33,31;,
 4;32,18,21,33;,
 4;21,20,34,35;,
 4;20,23,36,34;,
 4;23,25,37,36;,
 4;25,27,38,37;,
 4;27,29,39,38;,
 4;29,31,40,39;,
 4;31,33,41,40;,
 4;33,21,35,41;,
 4;35,34,42,43;,
 4;34,36,44,42;,
 4;36,37,45,44;,
 4;37,38,46,45;,
 4;38,39,47,46;,
 4;39,40,48,47;,
 4;40,41,49,48;,
 4;41,35,43,49;,
 4;43,42,50,51;,
 4;42,44,52,50;,
 4;44,45,53,52;,
 4;45,46,54,53;,
 4;46,47,55,54;,
 4;47,48,56,55;,
 4;48,49,57,56;,
 4;49,43,51,57;,
 4;51,50,58,59;,
 4;50,52,60,58;,
 4;52,53,61,60;,
 4;53,54,62,61;,
 4;54,55,63,62;,
 4;55,56,64,63;,
 4;56,57,65,64;,
 4;57,51,59,65;,
 4;59,58,66,67;,
 4;58,60,68,66;,
 4;60,61,69,68;,
 4;61,62,70,69;,
 4;62,63,71,70;,
 4;63,64,72,71;,
 4;64,65,73,72;,
 4;65,59,67,73;,
 3;19,18,74;,
 3;22,19,74;,
 3;24,22,74;,
 3;26,24,74;,
 3;28,26,74;,
 3;30,28,74;,
 3;32,30,74;,
 3;18,32,74;,
 3;67,66,75;,
 3;66,68,75;,
 3;68,69,75;,
 3;69,70,75;,
 3;70,71,75;,
 3;71,72,75;,
 3;72,73,75;,
 3;73,67,75;;
 
 MeshMaterialList {
  1;
  88;
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
  67;
  0.000000;0.707109;0.707105;,
  0.000001;1.000000;0.000000;,
  0.000000;0.707109;-0.707105;,
  0.000000;0.000001;-1.000000;,
  0.000000;-0.707107;-0.707107;,
  0.000000;-1.000000;-0.000000;,
  0.000000;-0.707107;0.707107;,
  0.000000;0.000001;1.000000;,
  1.000000;0.000000;0.000000;,
  -1.000000;0.000000;0.000000;,
  0.924736;0.269132;0.269131;,
  0.924735;0.380611;0.000000;,
  0.924736;0.269132;-0.269131;,
  0.924736;0.000000;-0.380609;,
  0.924736;-0.269133;-0.269131;,
  0.924734;-0.380613;-0.000000;,
  0.924736;-0.269133;0.269131;,
  0.924736;0.000000;0.380609;,
  0.709231;0.498494;0.498493;,
  0.709230;0.704977;0.000000;,
  0.709231;0.498494;-0.498493;,
  0.709230;-0.000000;-0.704977;,
  0.709230;-0.498495;-0.498493;,
  0.709229;-0.704979;-0.000000;,
  0.709230;-0.498495;0.498493;,
  0.709230;-0.000000;0.704977;,
  0.384550;0.652734;0.652732;,
  0.384551;0.923104;0.000000;,
  0.384550;0.652734;-0.652732;,
  0.384549;-0.000001;-0.923104;,
  0.384550;-0.652734;-0.652733;,
  0.384551;-0.923104;-0.000000;,
  0.384550;-0.652734;0.652733;,
  0.384549;-0.000001;0.923104;,
  0.000000;0.707108;0.707105;,
  0.000000;1.000000;0.000000;,
  0.000000;0.707108;-0.707105;,
  0.000000;-0.000001;-1.000000;,
  0.000000;-0.707107;-0.707107;,
  0.000000;-0.707107;0.707107;,
  0.000000;-0.000001;1.000000;,
  -0.384553;0.652733;0.652732;,
  -0.384553;0.923103;0.000000;,
  -0.384553;0.652733;-0.652732;,
  -0.384553;-0.000001;-0.923103;,
  -0.384552;-0.652733;-0.652733;,
  -0.384553;-0.923103;0.000000;,
  -0.384552;-0.652732;0.652733;,
  -0.384553;-0.000001;0.923103;,
  -0.709230;0.498493;0.498495;,
  -0.709231;0.704976;0.000000;,
  -0.709230;0.498493;-0.498495;,
  -0.709229;-0.000001;-0.704978;,
  -0.709231;-0.498494;-0.498494;,
  -0.709231;-0.704976;0.000000;,
  -0.709230;-0.498494;0.498494;,
  -0.709229;-0.000001;0.704978;,
  -0.924734;0.269133;0.269135;,
  -0.924735;0.380612;0.000000;,
  -0.924734;0.269133;-0.269135;,
  -0.924734;-0.000001;-0.380614;,
  -0.924735;-0.269134;-0.269133;,
  -0.924735;-0.380612;0.000000;,
  -0.924735;-0.269134;0.269133;,
  -0.924734;-0.000001;0.380614;,
  1.000000;0.000000;-0.000000;,
  -1.000000;-0.000001;0.000000;;
  88;
  4;0,1,1,0;,
  4;1,2,2,1;,
  4;2,3,3,2;,
  4;3,4,4,3;,
  4;4,5,5,4;,
  4;5,6,6,5;,
  4;6,7,7,6;,
  4;7,0,0,7;,
  3;8,8,8;,
  3;8,8,8;,
  3;8,8,8;,
  3;8,8,8;,
  3;8,8,8;,
  3;8,8,8;,
  3;8,8,8;,
  3;8,8,8;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  3;9,9,9;,
  4;10,11,19,18;,
  4;11,12,20,19;,
  4;12,13,21,20;,
  4;13,14,22,21;,
  4;14,15,23,22;,
  4;15,16,24,23;,
  4;16,17,25,24;,
  4;17,10,18,25;,
  4;18,19,27,26;,
  4;19,20,28,27;,
  4;20,21,29,28;,
  4;21,22,30,29;,
  4;22,23,31,30;,
  4;23,24,32,31;,
  4;24,25,33,32;,
  4;25,18,26,33;,
  4;26,27,35,34;,
  4;27,28,36,35;,
  4;28,29,37,36;,
  4;29,30,38,37;,
  4;30,31,5,38;,
  4;31,32,39,5;,
  4;32,33,40,39;,
  4;33,26,34,40;,
  4;34,35,42,41;,
  4;35,36,43,42;,
  4;36,37,44,43;,
  4;37,38,45,44;,
  4;38,5,46,45;,
  4;5,39,47,46;,
  4;39,40,48,47;,
  4;40,34,41,48;,
  4;41,42,50,49;,
  4;42,43,51,50;,
  4;43,44,52,51;,
  4;44,45,53,52;,
  4;45,46,54,53;,
  4;46,47,55,54;,
  4;47,48,56,55;,
  4;48,41,49,56;,
  4;49,50,58,57;,
  4;50,51,59,58;,
  4;51,52,60,59;,
  4;52,53,61,60;,
  4;53,54,62,61;,
  4;54,55,63,62;,
  4;55,56,64,63;,
  4;56,49,57,64;,
  3;11,10,65;,
  3;12,11,65;,
  3;13,12,65;,
  3;14,13,65;,
  3;15,14,65;,
  3;16,15,65;,
  3;17,16,65;,
  3;10,17,65;,
  3;57,58,66;,
  3;58,59,66;,
  3;59,60,66;,
  3;60,61,66;,
  3;61,62,66;,
  3;62,63,66;,
  3;63,64,66;,
  3;64,57,66;;
 }
 MeshTextureCoords {
  76;
  0.921360;0.562240;,
  0.914230;0.562240;,
  0.914230;0.432880;,
  0.921360;0.432880;,
  0.921360;0.562240;,
  0.921360;0.432880;,
  0.938550;0.562240;,
  0.938550;0.432880;,
  0.955740;0.562240;,
  0.955740;0.432880;,
  0.962870;0.562240;,
  0.962870;0.432880;,
  0.955740;0.562240;,
  0.955740;0.432880;,
  0.938550;0.562240;,
  0.938550;0.432880;,
  0.938550;0.562240;,
  0.938550;0.432880;,
  0.929640;0.618160;,
  0.925790;0.618160;,
  0.914660;0.610720;,
  0.921770;0.610720;,
  0.929640;0.618160;,
  0.921770;0.610720;,
  0.938930;0.618160;,
  0.938930;0.610720;,
  0.948210;0.618160;,
  0.956090;0.610720;,
  0.952060;0.618160;,
  0.963200;0.610720;,
  0.948210;0.618160;,
  0.956090;0.610720;,
  0.938930;0.618160;,
  0.938930;0.610720;,
  0.907220;0.599580;,
  0.916500;0.599580;,
  0.916500;0.599580;,
  0.938930;0.599580;,
  0.961350;0.599580;,
  0.970630;0.599580;,
  0.961350;0.599580;,
  0.938930;0.599580;,
  0.904610;0.586450;,
  0.914660;0.586450;,
  0.914660;0.586450;,
  0.938930;0.586450;,
  0.963200;0.586450;,
  0.973250;0.586450;,
  0.963200;0.586450;,
  0.938930;0.586450;,
  0.907220;0.573320;,
  0.916500;0.573320;,
  0.916500;0.573320;,
  0.938930;0.573320;,
  0.961350;0.573320;,
  0.970630;0.573320;,
  0.961350;0.573320;,
  0.938930;0.573320;,
  0.914660;0.562180;,
  0.921770;0.562180;,
  0.921770;0.562180;,
  0.938930;0.562180;,
  0.956090;0.562180;,
  0.963200;0.562180;,
  0.956090;0.562180;,
  0.938930;0.562180;,
  0.925790;0.554740;,
  0.929640;0.554740;,
  0.929640;0.554740;,
  0.938930;0.554740;,
  0.948210;0.554740;,
  0.952060;0.554740;,
  0.948210;0.554740;,
  0.938930;0.554740;,
  0.938930;0.620770;,
  0.938930;0.552130;;
 }
}
