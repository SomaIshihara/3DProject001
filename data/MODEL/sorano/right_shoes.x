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
 172;
 2.54381;-4.26861;-5.57915;,
 2.04971;-4.26861;-7.18417;,
 2.04971;-2.76062;-7.18417;,
 2.34752;-2.76062;-5.57915;,
 1.36648;-4.26861;-7.91500;,
 1.36648;-2.76062;-7.91500;,
 0.68324;-4.26861;-8.20949;,
 0.68324;-2.76062;-8.20949;,
 0.00000;-4.26861;-8.29340;,
 0.00000;-2.76062;-8.29340;,
 0.00000;-4.26861;-8.29340;,
 -0.68324;-4.26861;-8.20949;,
 -0.68324;-2.76062;-8.20949;,
 0.00000;-2.76062;-8.29340;,
 -1.36647;-4.26861;-7.91500;,
 -1.36647;-2.76062;-7.91500;,
 -2.04971;-4.26861;-7.18417;,
 -1.93637;-2.76062;-7.18417;,
 -2.73295;-4.26861;-5.57915;,
 -2.61932;-2.76062;-5.57915;,
 2.04971;-2.38344;-5.57915;,
 2.04971;-2.76062;-7.18417;,
 1.36648;-2.76062;-7.91500;,
 1.36648;-2.38344;-5.57915;,
 2.04971;-2.38344;-5.57915;,
 0.68324;-2.76062;-8.20949;,
 0.68324;-2.38344;-5.57915;,
 0.00000;-2.76062;-8.29340;,
 0.00000;-2.38344;-5.57915;,
 -0.68324;-2.76062;-8.20949;,
 -0.68324;-2.38344;-5.57915;,
 -1.36647;-2.76062;-7.91500;,
 -1.36647;-2.38344;-5.57915;,
 -1.93637;-2.76062;-7.18417;,
 -2.04971;-2.38344;-5.57915;,
 -2.04971;-2.38344;-5.57915;,
 1.73766;1.54832;0.90260;,
 1.10593;1.68255;1.96761;,
 1.10593;0.25535;1.96761;,
 1.73766;0.25535;0.90260;,
 0.62853;1.76334;2.40295;,
 0.62853;0.25535;2.40295;,
 0.00000;1.76334;2.56361;,
 0.00000;0.25535;2.56361;,
 0.00000;1.76334;2.56361;,
 -0.62853;1.76334;2.40295;,
 -0.62853;0.25535;2.40295;,
 0.00000;0.25535;2.56361;,
 -1.10593;1.68255;1.96761;,
 -1.10593;0.25535;1.96761;,
 -1.73766;1.54832;0.90260;,
 -1.73766;0.25535;0.90260;,
 -2.07907;1.52273;-0.16140;,
 -2.19828;0.25535;-0.15059;,
 1.10593;-1.25263;1.96761;,
 1.73766;-1.25263;0.90260;,
 0.62853;-1.25263;2.40295;,
 0.00000;-1.25263;2.56361;,
 -0.62853;-1.25263;2.40295;,
 0.00000;-1.25263;2.56361;,
 -1.10593;-1.25263;1.96761;,
 -1.73766;-1.25263;0.90260;,
 -2.19828;-1.25263;-0.15059;,
 1.10593;-2.76062;1.96761;,
 1.73766;-2.76062;0.90260;,
 0.62853;-2.76062;2.40295;,
 0.00000;-2.76062;2.56361;,
 -0.62853;-2.76062;2.40295;,
 0.00000;-2.76062;2.56361;,
 -1.10593;-2.76062;1.96761;,
 -1.73766;-2.76062;0.90260;,
 -2.19828;-2.76062;-0.15059;,
 1.10593;-4.26861;1.96761;,
 1.73766;-4.26861;0.90260;,
 0.62853;-4.26861;2.40295;,
 0.00000;-4.26861;2.56361;,
 -0.62853;-4.26861;2.40295;,
 0.00000;-4.26861;2.56361;,
 -1.10593;-4.26861;1.96761;,
 -1.73766;-4.26861;0.90260;,
 -2.19828;-4.26861;-0.15059;,
 1.73766;-4.26861;0.90260;,
 2.04971;-4.26861;-0.15065;,
 2.19828;-4.26861;-0.15059;,
 1.10593;-4.26861;1.96761;,
 1.36648;-4.26861;-0.15065;,
 0.62853;-4.26861;2.40295;,
 0.68324;-4.26861;-0.15065;,
 0.00000;-4.26861;2.56361;,
 0.00000;-4.26861;-0.15065;,
 -0.62853;-4.26861;2.40295;,
 -0.68324;-4.26861;-0.15065;,
 -1.10593;-4.26861;1.96761;,
 -1.36647;-4.26861;-0.15065;,
 -1.73766;-4.26861;0.90260;,
 -2.04971;-4.26861;-0.15065;,
 -2.19828;-4.26861;-0.15059;,
 2.05877;-4.26861;-2.86490;,
 1.36648;-4.26861;-2.86490;,
 0.68324;-4.26861;-2.86490;,
 0.00000;-4.26861;-2.86490;,
 -0.68324;-4.26861;-2.86490;,
 -1.36647;-4.26861;-2.86490;,
 -2.04971;-4.26861;-2.86490;,
 -2.68458;-4.26861;-2.86490;,
 2.04971;-4.26861;-4.27119;,
 2.30407;-4.26861;-4.27119;,
 1.36648;-4.26861;-4.27119;,
 0.68324;-4.26861;-4.27119;,
 0.00000;-4.26861;-4.27119;,
 -0.68324;-4.26861;-4.27119;,
 -1.36647;-4.26861;-4.27119;,
 -2.04971;-4.26861;-4.27119;,
 -2.88603;-4.26861;-4.27119;,
 2.54381;-4.26861;-5.57915;,
 2.04971;-4.26861;-5.57915;,
 2.04971;-4.26861;-7.18417;,
 1.36648;-4.26861;-5.57915;,
 1.36648;-4.26861;-7.91500;,
 0.68324;-4.26861;-5.57915;,
 0.68324;-4.26861;-8.20949;,
 0.00000;-4.26861;-5.57915;,
 0.00000;-4.26861;-8.29340;,
 -0.68324;-4.26861;-5.57915;,
 -0.68324;-4.26861;-8.20949;,
 -1.36647;-4.26861;-5.57915;,
 -1.36647;-4.26861;-7.91500;,
 -2.04971;-4.26861;-5.57915;,
 -2.04971;-4.26861;-7.18417;,
 -2.73295;-4.26861;-5.57915;,
 -2.68458;-4.26861;-2.86490;,
 -2.68458;-2.76062;-2.86490;,
 -2.57790;-2.38344;-4.27119;,
 -2.63935;-2.75942;-4.27119;,
 2.19828;-4.26861;-0.15059;,
 2.19828;-2.76062;-0.15059;,
 2.05877;-4.26861;-2.86490;,
 2.06782;-2.76062;-2.86490;,
 2.08240;-2.76920;-4.27119;,
 2.02537;-2.38344;-4.27119;,
 2.19828;-1.25263;-0.15059;,
 2.19828;0.25535;-0.15059;,
 2.10519;1.63027;-0.19027;,
 1.36648;-1.25263;-4.27119;,
 1.67171;-1.25263;-4.27119;,
 0.68324;-1.25263;-4.27119;,
 0.00000;-1.25263;-4.27119;,
 -0.68324;-1.25263;-4.27119;,
 -1.36647;-1.25263;-4.27119;,
 -1.69438;-1.25263;-4.27119;,
 1.67171;-1.25263;-4.27119;,
 1.62023;0.25535;-2.86490;,
 1.76024;2.00129;-2.14695;,
 0.00000;0.25535;-2.86490;,
 -0.68324;0.25535;-2.86490;,
 0.00000;2.11558;-2.86490;,
 -0.68324;2.03350;-2.86490;,
 1.36648;0.25535;-2.86490;,
 0.68324;0.25535;-2.86490;,
 1.38019;1.97419;-2.70486;,
 0.68324;2.03350;-2.86490;,
 1.62023;0.25535;-2.86490;,
 1.76024;2.00129;-2.14695;,
 -1.36647;0.25535;-2.86490;,
 -1.84826;0.25535;-2.86490;,
 -1.32909;1.92036;-2.74884;,
 -1.89798;1.88745;-2.11653;,
 -1.84826;0.25535;-2.86490;,
 -1.69438;-1.25263;-4.27119;,
 -1.89798;1.88745;-2.11653;,
 -2.88603;-4.26861;-4.27119;,
 2.30407;-4.26861;-4.27119;;
 
 132;
 4;0,1,2,3;,
 4;1,4,5,2;,
 4;4,6,7,5;,
 4;6,8,9,7;,
 4;10,11,12,13;,
 4;11,14,15,12;,
 4;14,16,17,15;,
 4;16,18,19,17;,
 3;3,2,20;,
 4;21,22,23,24;,
 4;22,25,26,23;,
 4;25,27,28,26;,
 4;27,29,30,28;,
 4;29,31,32,30;,
 4;31,33,34,32;,
 3;17,19,35;,
 4;36,37,38,39;,
 4;37,40,41,38;,
 4;40,42,43,41;,
 4;44,45,46,47;,
 4;45,48,49,46;,
 4;48,50,51,49;,
 4;51,50,52,53;,
 4;39,38,54,55;,
 4;38,41,56,54;,
 4;41,43,57,56;,
 4;47,46,58,59;,
 4;46,49,60,58;,
 4;49,51,61,60;,
 4;61,51,53,62;,
 4;55,54,63,64;,
 4;54,56,65,63;,
 4;56,57,66,65;,
 4;59,58,67,68;,
 4;58,60,69,67;,
 4;60,61,70,69;,
 4;70,61,62,71;,
 4;64,63,72,73;,
 4;63,65,74,72;,
 4;65,66,75,74;,
 4;68,67,76,77;,
 4;67,69,78,76;,
 4;69,70,79,78;,
 4;79,70,71,80;,
 3;81,82,83;,
 4;81,84,85,82;,
 4;84,86,87,85;,
 4;86,88,89,87;,
 4;88,90,91,89;,
 4;90,92,93,91;,
 4;92,94,95,93;,
 3;94,96,95;,
 3;83,82,97;,
 4;82,85,98,97;,
 4;85,87,99,98;,
 4;87,89,100,99;,
 4;89,91,101,100;,
 4;91,93,102,101;,
 4;93,95,103,102;,
 4;95,96,104,103;,
 3;97,105,106;,
 4;97,98,107,105;,
 4;98,99,108,107;,
 4;99,100,109,108;,
 4;100,101,110,109;,
 4;101,102,111,110;,
 4;102,103,112,111;,
 4;103,104,113,112;,
 3;114,115,116;,
 4;115,117,118,116;,
 4;117,119,120,118;,
 4;119,121,122,120;,
 4;121,123,124,122;,
 4;123,125,126,124;,
 4;125,127,128,126;,
 3;127,129,128;,
 4;130,80,71,131;,
 3;132,133,131;,
 3;131,71,62;,
 3;131,62,53;,
 3;131,53,52;,
 4;73,134,135,64;,
 4;134,136,137,135;,
 3;137,138,139;,
 4;64,135,140,55;,
 3;135,137,140;,
 4;55,140,141,39;,
 3;140,137,141;,
 4;39,141,142,36;,
 3;141,137,142;,
 3;3,20,139;,
 4;24,23,143,144;,
 4;23,26,145,143;,
 4;26,28,146,145;,
 4;28,30,147,146;,
 4;30,32,148,147;,
 4;32,34,149,148;,
 3;19,133,132;,
 4;112,113,129,127;,
 4;111,112,127,125;,
 4;110,111,125,123;,
 4;109,110,123,121;,
 4;108,109,121,119;,
 4;107,108,119,117;,
 4;105,107,117,115;,
 4;106,105,115,114;,
 3;139,138,3;,
 3;20,150,139;,
 3;139,150,137;,
 3;150,151,137;,
 4;142,137,151,152;,
 4;153,146,147,154;,
 4;155,153,154,156;,
 4;157,143,145,158;,
 4;159,157,158,160;,
 4;161,144,143,157;,
 4;162,161,157,159;,
 4;158,145,146,153;,
 4;160,158,153,155;,
 4;163,148,149,164;,
 4;165,163,164,166;,
 4;154,147,148,163;,
 4;156,154,163,165;,
 3;167,168,131;,
 3;168,35,131;,
 3;35,132,131;,
 4;169,167,131,52;,
 3;35,19,132;,
 4;18,170,133,19;,
 4;131,133,170,130;,
 4;136,171,138,137;,
 4;3,138,171,0;;
 
 MeshMaterialList {
  1;
  132;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
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
  84;
  0.994563;0.100959;-0.025537;,
  0.878785;0.032027;-0.476142;,
  0.575326;0.000000;-0.817924;,
  0.261503;0.000000;-0.965203;,
  0.000000;0.000000;-1.000000;,
  -0.261506;0.000000;-0.965202;,
  -0.593392;0.014091;-0.804790;,
  -0.848970;0.048839;-0.526180;,
  -0.968261;0.094870;-0.231236;,
  0.943343;0.331798;0.003825;,
  0.891116;0.242953;-0.383257;,
  -0.817591;0.335167;-0.468197;,
  -0.876961;0.435788;-0.202557;,
  0.607095;0.762391;-0.224042;,
  0.029835;0.902861;-0.428897;,
  0.010156;0.909185;-0.416269;,
  0.000000;0.910388;-0.413755;,
  -0.010156;0.909185;-0.416269;,
  -0.034078;0.902685;-0.428950;,
  -0.452063;0.834281;-0.315618;,
  0.998258;0.057948;0.011122;,
  0.790508;0.117779;-0.601020;,
  0.290218;0.097876;-0.951942;,
  0.056475;0.023394;-0.998130;,
  0.000000;0.000000;-1.000000;,
  -0.044470;0.017484;-0.998858;,
  -0.247127;0.112555;-0.962424;,
  -0.782462;0.184274;-0.594808;,
  -0.991014;0.094242;0.094916;,
  0.898887;0.018394;0.437795;,
  0.775422;0.000000;0.631444;,
  0.474857;0.000000;0.880063;,
  0.000000;0.000000;1.000000;,
  -0.474857;0.000000;0.880063;,
  -0.775422;0.000000;0.631444;,
  -0.900923;0.022451;0.433397;,
  0.894437;0.009190;0.447099;,
  -0.895497;0.011215;0.444926;,
  0.889825;0.000000;0.456303;,
  0.474857;0.000000;0.880063;,
  -0.889825;0.000000;0.456303;,
  0.889825;0.000000;0.456303;,
  0.889825;0.000000;0.456303;,
  0.474857;0.000000;0.880063;,
  -0.474857;0.000000;0.880063;,
  -0.889825;0.000000;0.456303;,
  0.000000;-1.000000;-0.000000;,
  -0.956864;0.000000;0.290535;,
  -0.956864;0.000000;0.290535;,
  -0.991087;0.133165;-0.003734;,
  -0.966712;0.035037;0.253456;,
  0.983535;-0.000770;0.180718;,
  0.994848;0.088290;-0.049823;,
  0.983460;0.000000;0.181126;,
  0.987798;0.025828;0.153587;,
  0.949711;0.307462;0.059299;,
  0.000000;0.720286;-0.693677;,
  0.000000;0.720286;-0.693677;,
  -0.906962;0.410248;-0.095481;,
  0.000000;0.366514;-0.930413;,
  0.153162;0.418142;-0.895376;,
  0.886303;0.131841;-0.443943;,
  0.030194;0.377828;-0.925383;,
  -0.129892;0.423494;-0.896538;,
  -0.023808;0.374915;-0.926754;,
  -0.675330;0.372726;-0.636400;,
  -0.991354;0.130416;-0.014455;,
  0.984767;0.124008;0.121888;,
  0.084398;0.977411;-0.193765;,
  0.057508;0.983365;-0.172298;,
  0.019501;0.989208;-0.145215;,
  0.000000;0.990181;-0.139793;,
  -0.019502;0.989208;-0.145215;,
  -0.065689;0.982861;-0.172247;,
  -0.100715;0.975902;-0.193576;,
  -0.992473;0.040320;0.115636;,
  0.983609;-0.001539;0.180309;,
  0.999231;0.033347;0.020618;,
  0.968407;0.248780;-0.017222;,
  0.000000;0.682018;-0.731335;,
  -0.900281;0.350827;-0.257710;,
  0.613332;0.749986;0.247680;,
  -0.995035;0.099379;-0.005453;,
  0.984868;0.102521;0.139729;;
  132;
  4;0,1,10,9;,
  4;1,2,2,10;,
  4;2,3,3,2;,
  4;3,4,4,3;,
  4;4,5,5,4;,
  4;5,6,6,5;,
  4;6,7,11,6;,
  4;7,8,12,11;,
  3;9,10,13;,
  4;68,69,14,13;,
  4;69,70,15,14;,
  4;70,71,16,15;,
  4;71,72,17,16;,
  4;72,73,18,17;,
  4;73,74,19,18;,
  3;11,12,19;,
  4;29,30,30,36;,
  4;30,31,31,30;,
  4;31,32,32,31;,
  4;32,33,33,32;,
  4;33,34,34,33;,
  4;34,35,37,34;,
  4;37,35,28,50;,
  4;36,30,30,38;,
  4;30,31,39,30;,
  4;31,32,32,39;,
  4;32,33,33,32;,
  4;33,34,34,33;,
  4;34,37,40,34;,
  4;40,37,50,47;,
  4;38,30,30,41;,
  4;30,39,31,30;,
  4;39,32,32,31;,
  4;32,33,33,32;,
  4;33,34,34,33;,
  4;34,40,40,34;,
  4;40,40,47,48;,
  4;41,30,30,42;,
  4;30,31,43,30;,
  4;31,32,32,43;,
  4;32,33,44,32;,
  4;33,34,34,44;,
  4;34,40,45,34;,
  4;45,40,48,47;,
  3;46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  3;46,46,46;,
  3;46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  3;46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  3;46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  3;46,46,46;,
  4;75,47,48,49;,
  3;58,66,49;,
  3;49,48,47;,
  3;49,47,50;,
  3;49,50,28;,
  4;42,76,51,41;,
  4;76,77,52,51;,
  3;52,67,55;,
  4;41,51,53,38;,
  3;51,52,53;,
  4;38,53,54,36;,
  3;53,52,54;,
  4;36,54,20,29;,
  3;54,52,20;,
  3;9,13,55;,
  4;13,14,56,56;,
  4;14,15,56,56;,
  4;15,16,56,56;,
  4;16,17,56,56;,
  4;17,18,57,56;,
  4;18,19,56,57;,
  3;12,66,58;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  4;46,46,46,46;,
  3;55,67,9;,
  3;13,78,55;,
  3;55,78,52;,
  3;78,61,52;,
  4;20,52,61,21;,
  4;59,56,56,64;,
  4;24,59,64,25;,
  4;60,56,56,62;,
  4;22,60,62,23;,
  4;79,56,56,60;,
  4;21,61,60,22;,
  4;62,56,56,59;,
  4;23,62,59,24;,
  4;63,57,56,65;,
  4;26,63,65,27;,
  4;64,56,57,63;,
  4;25,64,63,26;,
  3;65,80,49;,
  3;80,19,49;,
  3;81,81,81;,
  4;27,65,49,28;,
  3;19,12,58;,
  4;8,82,66,12;,
  4;49,66,82,75;,
  4;77,83,67,52;,
  4;9,67,83,0;;
 }
 MeshTextureCoords {
  172;
  0.631363;0.181053;,
  0.611512;0.181053;,
  0.611512;0.162403;,
  0.631363;0.162403;,
  0.602473;0.181053;,
  0.602473;0.162403;,
  0.598830;0.181053;,
  0.598830;0.162403;,
  0.597793;0.181053;,
  0.597793;0.162403;,
  0.597793;0.086354;,
  0.598830;0.086354;,
  0.598830;0.067703;,
  0.597793;0.067703;,
  0.602473;0.086354;,
  0.602473;0.067703;,
  0.611512;0.086354;,
  0.611512;0.067703;,
  0.631363;0.086354;,
  0.631363;0.067703;,
  0.631363;0.157737;,
  0.762548;0.698478;,
  0.738091;0.698478;,
  0.738091;0.684977;,
  0.762548;0.684977;,
  0.713635;0.698478;,
  0.713635;0.684977;,
  0.689179;0.698478;,
  0.689179;0.684977;,
  0.664723;0.698478;,
  0.664723;0.684977;,
  0.640267;0.698478;,
  0.640267;0.684977;,
  0.619868;0.698478;,
  0.615810;0.684977;,
  0.631363;0.063038;,
  0.711529;0.109109;,
  0.724701;0.107449;,
  0.724701;0.125101;,
  0.711529;0.125101;,
  0.730086;0.106450;,
  0.730086;0.125101;,
  0.732073;0.106450;,
  0.732073;0.125101;,
  0.732073;0.011750;,
  0.730086;0.011750;,
  0.730086;0.030401;,
  0.732073;0.030401;,
  0.724701;0.012750;,
  0.724701;0.030401;,
  0.711529;0.014410;,
  0.711529;0.030401;,
  0.698370;0.014726;,
  0.698503;0.030401;,
  0.724701;0.143752;,
  0.711529;0.143752;,
  0.730086;0.143752;,
  0.732073;0.143752;,
  0.730086;0.049052;,
  0.732073;0.049052;,
  0.724701;0.049052;,
  0.711529;0.049052;,
  0.698503;0.049052;,
  0.724701;0.162403;,
  0.711529;0.162403;,
  0.730086;0.162403;,
  0.732073;0.162403;,
  0.730086;0.067703;,
  0.732073;0.067703;,
  0.724701;0.067703;,
  0.711529;0.067703;,
  0.698503;0.067703;,
  0.724701;0.181053;,
  0.711529;0.181053;,
  0.730086;0.181053;,
  0.732073;0.181053;,
  0.730086;0.086354;,
  0.732073;0.086354;,
  0.724701;0.086354;,
  0.711529;0.086354;,
  0.698503;0.086354;,
  0.848811;0.793297;,
  0.855295;0.815182;,
  0.858382;0.815181;,
  0.835685;0.771168;,
  0.841098;0.815182;,
  0.825765;0.762123;,
  0.826902;0.815182;,
  0.812705;0.758784;,
  0.812705;0.815182;,
  0.799646;0.762123;,
  0.798509;0.815182;,
  0.789726;0.771168;,
  0.784312;0.815182;,
  0.776600;0.793297;,
  0.770116;0.815182;,
  0.767029;0.815181;,
  0.855483;0.871579;,
  0.841098;0.871579;,
  0.826902;0.871579;,
  0.812705;0.871579;,
  0.798509;0.871579;,
  0.784312;0.871579;,
  0.770116;0.871579;,
  0.756925;0.871579;,
  0.855295;0.900799;,
  0.860580;0.900799;,
  0.841098;0.900799;,
  0.826902;0.900799;,
  0.812705;0.900799;,
  0.798509;0.900799;,
  0.784312;0.900799;,
  0.770116;0.900799;,
  0.752739;0.900799;,
  0.865561;0.927976;,
  0.855295;0.927976;,
  0.855295;0.961326;,
  0.841098;0.927976;,
  0.841098;0.976511;,
  0.826902;0.927976;,
  0.826902;0.982630;,
  0.812705;0.927976;,
  0.812705;0.984373;,
  0.798509;0.927976;,
  0.798509;0.982630;,
  0.784312;0.927976;,
  0.784312;0.976511;,
  0.770116;0.927976;,
  0.770116;0.961326;,
  0.755920;0.927976;,
  0.664933;0.086354;,
  0.664933;0.067703;,
  0.647539;0.063038;,
  0.647539;0.067688;,
  0.698503;0.181053;,
  0.698503;0.162403;,
  0.664933;0.181053;,
  0.664933;0.162403;,
  0.647539;0.162509;,
  0.647539;0.157737;,
  0.698503;0.143752;,
  0.698503;0.125101;,
  0.698013;0.108096;,
  0.738091;0.644500;,
  0.749017;0.644500;,
  0.713635;0.644500;,
  0.689179;0.644500;,
  0.664723;0.644500;,
  0.640267;0.644500;,
  0.628529;0.644500;,
  0.647539;0.143752;,
  0.664933;0.125101;,
  0.673812;0.103507;,
  0.689179;0.590522;,
  0.664723;0.590522;,
  0.689179;0.523936;,
  0.664723;0.526874;,
  0.738091;0.590522;,
  0.713635;0.590522;,
  0.738582;0.528997;,
  0.713635;0.526874;,
  0.747175;0.590522;,
  0.752186;0.528027;,
  0.640267;0.590522;,
  0.623021;0.590522;,
  0.641605;0.530924;,
  0.621242;0.532102;,
  0.664933;0.030401;,
  0.647539;0.049052;,
  0.674188;0.010215;,
  0.647539;0.086354;,
  0.647539;0.181053;;
 }
}
