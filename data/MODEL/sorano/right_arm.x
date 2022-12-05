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
 -6.73827;1.02751;1.00197;,
 0.80032;1.02751;1.00197;,
 0.80032;1.44253;0.00000;,
 -6.73827;1.44253;0.00000;,
 0.80032;1.02751;-1.00197;,
 -6.73827;1.02751;-1.00197;,
 0.80032;0.02554;-1.41700;,
 -6.73827;0.02554;-1.41700;,
 0.80032;-0.97643;-1.00197;,
 -6.73827;-0.97643;-1.00197;,
 0.80032;-1.39146;0.00000;,
 -6.73827;-1.39146;0.00000;,
 0.80032;-0.97643;1.00197;,
 -6.73827;-0.97643;1.00197;,
 0.80032;0.02554;1.41700;,
 -6.73827;0.02554;1.41700;,
 -6.73827;0.02554;0.00000;,
 0.80032;0.02554;0.00000;,
 -9.99662;0.54485;0.54120;,
 -9.56308;1.00365;1.00000;,
 -9.56308;1.41787;0.00000;,
 -9.99662;0.76902;0.00000;,
 -9.56308;1.00365;-1.00000;,
 -9.99662;0.54485;-0.54120;,
 -9.56308;0.00365;-1.41421;,
 -9.99662;0.00365;-0.76537;,
 -9.56308;-0.99635;-1.00000;,
 -9.99662;-0.53754;-0.54120;,
 -9.56308;-1.41056;0.00000;,
 -9.99662;-0.76171;0.00000;,
 -9.56308;-0.99635;1.00000;,
 -9.99662;-0.53754;0.54120;,
 -9.56308;0.00365;1.41421;,
 -9.99662;0.00365;0.76537;,
 -8.91423;1.31022;1.30656;,
 -8.91423;1.85141;0.00000;,
 -8.91423;1.31022;-1.30656;,
 -8.91423;0.00365;-1.84776;,
 -8.91423;-1.30291;-1.30656;,
 -8.91423;-1.84411;0.00000;,
 -8.91423;-1.30291;1.30656;,
 -8.91423;0.00365;1.84776;,
 -8.14887;1.41787;1.41421;,
 -8.14886;2.00365;0.00000;,
 -8.14887;1.41787;-1.41421;,
 -8.14886;0.00365;-2.00000;,
 -8.14886;-1.41056;-1.41421;,
 -8.14886;-1.99635;0.00000;,
 -8.14886;-1.41056;1.41421;,
 -8.14886;0.00365;2.00000;,
 -7.38350;1.31022;1.30656;,
 -7.38350;1.85141;0.00000;,
 -7.38350;1.31022;-1.30656;,
 -7.38350;0.00365;-1.84776;,
 -7.38350;-1.30291;-1.30656;,
 -7.38350;-1.84410;0.00000;,
 -7.38350;-1.30291;1.30656;,
 -7.38350;0.00365;1.84776;,
 -6.73465;1.00365;1.00000;,
 -6.73465;1.41787;0.00000;,
 -6.73465;1.00365;-1.00000;,
 -6.73465;0.00365;-1.41421;,
 -6.73465;-0.99635;-1.00000;,
 -6.73465;-1.41056;0.00000;,
 -6.73465;-0.99635;1.00000;,
 -6.73465;0.00365;1.41421;,
 -6.30110;0.54485;0.54120;,
 -6.30110;0.76902;0.00000;,
 -6.30110;0.54485;-0.54120;,
 -6.30110;0.00365;-0.76537;,
 -6.30110;-0.53754;-0.54120;,
 -6.30110;-0.76171;0.00000;,
 -6.30110;-0.53754;0.54120;,
 -6.30110;0.00365;0.76537;,
 -10.14886;0.00365;0.00000;,
 -6.14886;0.00365;0.00000;;
 
 88;
 4;0,1,2,3;,
 4;3,2,4,5;,
 4;5,4,6,7;,
 4;7,6,8,9;,
 4;9,8,10,11;,
 4;11,10,12,13;,
 4;13,12,14,15;,
 4;15,14,1,0;,
 3;3,16,0;,
 3;5,16,3;,
 3;7,16,5;,
 3;9,16,7;,
 3;11,16,9;,
 3;13,16,11;,
 3;15,16,13;,
 3;0,16,15;,
 3;1,17,2;,
 3;2,17,4;,
 3;4,17,6;,
 3;6,17,8;,
 3;8,17,10;,
 3;10,17,12;,
 3;12,17,14;,
 3;14,17,1;,
 4;18,19,20,21;,
 4;21,20,22,23;,
 4;23,22,24,25;,
 4;25,24,26,27;,
 4;27,26,28,29;,
 4;29,28,30,31;,
 4;31,30,32,33;,
 4;33,32,19,18;,
 4;19,34,35,20;,
 4;20,35,36,22;,
 4;22,36,37,24;,
 4;24,37,38,26;,
 4;26,38,39,28;,
 4;28,39,40,30;,
 4;30,40,41,32;,
 4;32,41,34,19;,
 4;34,42,43,35;,
 4;35,43,44,36;,
 4;36,44,45,37;,
 4;37,45,46,38;,
 4;38,46,47,39;,
 4;39,47,48,40;,
 4;40,48,49,41;,
 4;41,49,42,34;,
 4;42,50,51,43;,
 4;43,51,52,44;,
 4;44,52,53,45;,
 4;45,53,54,46;,
 4;46,54,55,47;,
 4;47,55,56,48;,
 4;48,56,57,49;,
 4;49,57,50,42;,
 4;50,58,59,51;,
 4;51,59,60,52;,
 4;52,60,61,53;,
 4;53,61,62,54;,
 4;54,62,63,55;,
 4;55,63,64,56;,
 4;56,64,65,57;,
 4;57,65,58,50;,
 4;58,66,67,59;,
 4;59,67,68,60;,
 4;60,68,69,61;,
 4;61,69,70,62;,
 4;62,70,71,63;,
 4;63,71,72,64;,
 4;64,72,73,65;,
 4;65,73,66,58;,
 3;21,74,18;,
 3;23,74,21;,
 3;25,74,23;,
 3;27,74,25;,
 3;29,74,27;,
 3;31,74,29;,
 3;33,74,31;,
 3;18,74,33;,
 3;66,75,67;,
 3;67,75,68;,
 3;68,75,69;,
 3;69,75,70;,
 3;70,75,71;,
 3;71,75,72;,
 3;72,75,73;,
 3;73,75,66;;
 
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
  0.000000;0.707110;0.707104;,
  0.000000;1.000000;0.000000;,
  0.000000;0.707110;-0.707104;,
  0.000000;0.000000;-1.000000;,
  0.000000;-0.707107;-0.707107;,
  0.000000;-1.000000;-0.000000;,
  0.000000;-0.707107;0.707107;,
  0.000000;0.000000;1.000000;,
  -1.000000;0.000000;0.000000;,
  1.000000;0.000000;0.000000;,
  -0.924736;0.269130;0.269131;,
  -0.924737;0.380607;0.000000;,
  -0.924736;0.269130;-0.269131;,
  -0.924736;-0.000001;-0.380609;,
  -0.924736;-0.269131;-0.269130;,
  -0.924737;-0.380608;0.000000;,
  -0.924736;-0.269131;0.269130;,
  -0.924736;-0.000001;0.380609;,
  -0.709231;0.498492;0.498494;,
  -0.709232;0.704975;0.000000;,
  -0.709231;0.498492;-0.498494;,
  -0.709231;-0.000001;-0.704976;,
  -0.709232;-0.498493;-0.498493;,
  -0.709232;-0.704975;0.000000;,
  -0.709232;-0.498493;0.498493;,
  -0.709231;-0.000001;0.704976;,
  -0.384550;0.652734;0.652733;,
  -0.384549;0.923105;0.000000;,
  -0.384550;0.652734;-0.652733;,
  -0.384550;-0.000001;-0.923104;,
  -0.384549;-0.652734;-0.652734;,
  -0.384549;-0.923105;0.000000;,
  -0.384549;-0.652734;0.652734;,
  -0.384550;-0.000001;0.923104;,
  -0.000000;0.707108;0.707105;,
  -0.000000;0.707108;-0.707105;,
  0.000001;-0.000001;-1.000000;,
  0.000003;-0.707107;-0.707106;,
  0.000004;-1.000000;-0.000000;,
  0.000003;-0.707107;0.707106;,
  0.000001;-0.000001;1.000000;,
  0.384550;0.652734;0.652733;,
  0.384549;0.923105;0.000000;,
  0.384550;0.652734;-0.652733;,
  0.384551;-0.000001;-0.923104;,
  0.384550;-0.652734;-0.652732;,
  0.384550;-0.923104;-0.000000;,
  0.384550;-0.652734;0.652732;,
  0.384551;-0.000001;0.923104;,
  0.709227;0.498495;0.498497;,
  0.709227;0.704980;0.000000;,
  0.709227;0.498495;-0.498497;,
  0.709227;-0.000001;-0.704980;,
  0.709227;-0.498497;-0.498495;,
  0.709227;-0.704980;-0.000000;,
  0.709227;-0.498497;0.498495;,
  0.709227;-0.000001;0.704980;,
  0.924735;0.269133;0.269134;,
  0.924735;0.380612;0.000000;,
  0.924735;0.269133;-0.269134;,
  0.924734;-0.000001;-0.380614;,
  0.924735;-0.269134;-0.269133;,
  0.924735;-0.380612;-0.000000;,
  0.924735;-0.269134;0.269133;,
  0.924734;-0.000001;0.380614;,
  -1.000000;-0.000001;0.000000;,
  1.000000;-0.000001;0.000000;;
  88;
  4;0,0,1,1;,
  4;1,1,2,2;,
  4;2,2,3,3;,
  4;3,3,4,4;,
  4;4,4,5,5;,
  4;5,5,6,6;,
  4;6,6,7,7;,
  4;7,7,0,0;,
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
  4;10,18,19,11;,
  4;11,19,20,12;,
  4;12,20,21,13;,
  4;13,21,22,14;,
  4;14,22,23,15;,
  4;15,23,24,16;,
  4;16,24,25,17;,
  4;17,25,18,10;,
  4;18,26,27,19;,
  4;19,27,28,20;,
  4;20,28,29,21;,
  4;21,29,30,22;,
  4;22,30,31,23;,
  4;23,31,32,24;,
  4;24,32,33,25;,
  4;25,33,26,18;,
  4;26,34,1,27;,
  4;27,1,35,28;,
  4;28,35,36,29;,
  4;29,36,37,30;,
  4;30,37,38,31;,
  4;31,38,39,32;,
  4;32,39,40,33;,
  4;33,40,34,26;,
  4;34,41,42,1;,
  4;1,42,43,35;,
  4;35,43,44,36;,
  4;36,44,45,37;,
  4;37,45,46,38;,
  4;38,46,47,39;,
  4;39,47,48,40;,
  4;40,48,41,34;,
  4;41,49,50,42;,
  4;42,50,51,43;,
  4;43,51,52,44;,
  4;44,52,53,45;,
  4;45,53,54,46;,
  4;46,54,55,47;,
  4;47,55,56,48;,
  4;48,56,49,41;,
  4;49,57,58,50;,
  4;50,58,59,51;,
  4;51,59,60,52;,
  4;52,60,61,53;,
  4;53,61,62,54;,
  4;54,62,63,55;,
  4;55,63,64,56;,
  4;56,64,57,49;,
  3;11,65,10;,
  3;12,65,11;,
  3;13,65,12;,
  3;14,65,13;,
  3;15,65,14;,
  3;16,65,15;,
  3;17,65,16;,
  3;10,65,17;,
  3;57,66,58;,
  3;58,66,59;,
  3;59,66,60;,
  3;60,66,61;,
  3;61,66,62;,
  3;62,66,63;,
  3;63,66,64;,
  3;64,66,57;;
 }
 MeshTextureCoords {
  76;
  0.921360;0.562240;,
  0.921360;0.432880;,
  0.914230;0.432880;,
  0.914230;0.562240;,
  0.921360;0.432880;,
  0.921360;0.562240;,
  0.938550;0.432880;,
  0.938550;0.562240;,
  0.955740;0.432880;,
  0.955740;0.562240;,
  0.962870;0.432880;,
  0.962870;0.562240;,
  0.955740;0.432880;,
  0.955740;0.562240;,
  0.938550;0.432880;,
  0.938550;0.562240;,
  0.938550;0.562240;,
  0.938550;0.432880;,
  0.929640;0.618160;,
  0.921770;0.610720;,
  0.914660;0.610720;,
  0.925790;0.618160;,
  0.921770;0.610720;,
  0.929640;0.618160;,
  0.938930;0.610720;,
  0.938930;0.618160;,
  0.956090;0.610720;,
  0.948210;0.618160;,
  0.963200;0.610720;,
  0.952060;0.618160;,
  0.956090;0.610720;,
  0.948210;0.618160;,
  0.938930;0.610720;,
  0.938930;0.618160;,
  0.916500;0.599580;,
  0.907220;0.599580;,
  0.916500;0.599580;,
  0.938930;0.599580;,
  0.961350;0.599580;,
  0.970630;0.599580;,
  0.961350;0.599580;,
  0.938930;0.599580;,
  0.914660;0.586450;,
  0.904610;0.586450;,
  0.914660;0.586450;,
  0.938930;0.586450;,
  0.963200;0.586450;,
  0.973250;0.586450;,
  0.963200;0.586450;,
  0.938930;0.586450;,
  0.916500;0.573320;,
  0.907220;0.573320;,
  0.916500;0.573320;,
  0.938930;0.573320;,
  0.961350;0.573320;,
  0.970630;0.573320;,
  0.961350;0.573320;,
  0.938930;0.573320;,
  0.921770;0.562180;,
  0.914660;0.562180;,
  0.921770;0.562180;,
  0.938930;0.562180;,
  0.956090;0.562180;,
  0.963200;0.562180;,
  0.956090;0.562180;,
  0.938930;0.562180;,
  0.929640;0.554740;,
  0.925790;0.554740;,
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