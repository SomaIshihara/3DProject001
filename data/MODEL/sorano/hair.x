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
 268;
 -7.07107;3.99613;-8.19258;,
 -3.80528;3.97900;-10.30171;,
 -3.49597;6.99324;-9.56153;,
 -6.45971;6.99324;-7.58122;,
 0.00000;3.96519;-11.09068;,
 0.00000;6.99324;-10.25692;,
 -2.93535;9.08889;-8.20808;,
 -5.42382;9.08889;-6.54534;,
 0.00000;9.08889;-8.79196;,
 -1.65590;11.23608;-5.11920;,
 -3.05969;11.23608;-4.18121;,
 0.00000;11.23608;-5.44858;,
 0.00000;11.80903;-1.12152;,
 5.42338;3.98464;-9.24963;,
 3.49597;6.99324;-9.56153;,
 3.76670;3.95076;-10.22707;,
 6.45971;6.99324;-7.58122;,
 5.42382;9.08889;-6.54534;,
 2.93535;9.08889;-8.20808;,
 3.05969;11.23608;-4.18121;,
 1.65590;11.23608;-5.11920;,
 -9.23880;3.99613;-4.94835;,
 -8.15493;3.99613;-6.57047;,
 -8.44001;6.99324;-4.61748;,
 0.00000;3.99613;8.87848;,
 -1.91342;3.99613;8.49788;,
 0.00000;6.99324;8.01389;,
 -3.82683;3.99613;8.11728;,
 -5.44895;3.99613;7.03341;,
 -3.49597;6.99324;7.31849;,
 -7.07107;3.99613;5.94955;,
 -8.15493;3.99613;4.32743;,
 -6.45971;6.99324;5.33819;,
 -9.23879;3.99613;2.70532;,
 -9.61940;3.99613;0.79190;,
 -8.44001;6.99324;2.37445;,
 -10.00000;3.99613;-1.12152;,
 -9.61940;3.99613;-3.03493;,
 -9.13540;6.99324;-1.12152;,
 -7.08657;9.08889;-4.05687;,
 -2.93535;9.08889;5.96505;,
 0.00000;9.08889;6.54892;,
 -5.42382;9.08889;4.30230;,
 -7.08656;9.08889;1.81383;,
 -7.67044;9.08889;-1.12152;,
 -3.99768;11.23608;-2.77741;,
 -1.65589;11.23608;2.87616;,
 0.00000;11.23608;3.20554;,
 -3.05969;11.23608;1.93817;,
 -3.99768;11.23608;0.53437;,
 -4.32706;11.23608;-1.12152;,
 -6.65387;0.99823;-9.59085;,
 -4.00102;1.89898;-10.74644;,
 -5.85511;2.13823;-9.74243;,
 -4.13789;0.44872;-10.71549;,
 -6.50931;-0.07034;-9.97224;,
 -0.07898;0.72367;-11.09777;,
 -0.03858;2.08455;-11.05228;,
 6.77960;1.14126;-9.07877;,
 6.11234;1.12140;-9.54069;,
 5.47907;0.26967;-9.92284;,
 3.06636;1.22558;-10.70401;,
 3.55966;2.26065;-10.63306;,
 5.42338;3.98464;-9.24963;,
 6.30954;3.00711;-9.04542;,
 7.07107;3.99613;-8.19258;,
 3.76670;3.95076;-10.22707;,
 0.00000;3.96519;-11.09068;,
 -3.80528;3.97900;-10.30171;,
 -7.07107;3.99613;-8.19258;,
 7.23356;2.96445;-8.31782;,
 6.43795;2.03827;-9.23490;,
 7.13751;2.08237;-8.67882;,
 4.63280;2.14592;-9.98464;,
 -7.23098;3.00200;-8.43026;,
 -7.33425;1.91611;-8.71099;,
 -7.24458;0.84333;-9.10102;,
 -6.71097;-0.26704;-9.87687;,
 5.65237;3.00507;-9.43408;,
 5.73229;2.07415;-9.64845;,
 5.67803;1.20551;-9.79782;,
 -8.71242;-7.85040;-8.43726;,
 -9.42752;-7.85040;-7.30720;,
 -10.06656;-11.31609;-7.46467;,
 -4.13307;-8.06620;7.91268;,
 -2.42108;-7.99120;8.63878;,
 -1.86987;-11.80903;11.09777;,
 -7.18115;-8.17862;7.34939;,
 -5.90151;-8.09039;8.25708;,
 -7.83880;-11.80903;10.61008;,
 -9.53653;-7.99120;3.36210;,
 -8.38659;-7.99120;5.31255;,
 -10.01213;-11.66310;5.88905;,
 -10.61183;-7.93010;-0.87060;,
 -10.60290;-7.99120;1.40998;,
 -12.10049;-10.88556;1.63110;,
 -10.17339;-7.66868;-4.84418;,
 -10.42151;-7.80596;-3.22127;,
 -11.96561;-11.02509;-2.81506;,
 -0.27995;-7.99120;9.09389;,
 -4.51890;-8.17811;9.26587;,
 -7.65384;-8.04105;6.50285;,
 -10.47477;-7.95060;2.65950;,
 -10.55342;-7.85271;-1.35130;,
 -10.11393;-7.65256;-5.84566;,
 -7.57670;0.15272;-8.39819;,
 -8.67351;0.15272;-6.71829;,
 -9.79992;-3.86275;-7.45962;,
 -8.86601;-3.86436;-8.71672;,
 -10.76231;-3.91928;-5.75968;,
 -9.35218;0.15272;-5.10559;,
 -9.35218;0.15272;-5.10559;,
 -9.68761;0.19938;-3.42461;,
 -11.13235;-3.98334;-3.70121;,
 -10.82766;-3.98334;-5.29968;,
 -11.40690;-4.07550;-1.26581;,
 -10.11062;0.15271;-1.31567;,
 -10.45077;0.14379;-1.14392;,
 -10.45250;0.15271;0.97622;,
 -11.03063;-3.95886;1.30423;,
 -11.41883;-3.99633;-0.94516;,
 -10.55709;-3.95886;2.96764;,
 -10.05103;0.15271;2.99453;,
 -9.57147;0.15271;2.84065;,
 -8.31390;0.15271;4.70558;,
 -8.36956;-3.98334;5.13144;,
 -9.73889;-3.93570;3.03690;,
 -7.51858;-3.98334;6.48414;,
 -7.33153;0.15271;6.24883;,
 -6.95148;0.10547;5.89825;,
 -5.25177;0.10502;7.02092;,
 -5.43637;-4.03218;7.47729;,
 -7.07409;-4.03218;6.40568;,
 -3.78008;-4.03218;8.59886;,
 -3.54072;0.10502;8.16420;,
 -3.43356;0.18834;8.37656;,
 -2.01832;0.15271;8.72011;,
 -2.13740;-3.98334;8.66568;,
 -3.41283;-4.01925;8.22042;,
 0.00000;-4.01858;9.09326;,
 -0.07031;0.15271;9.11493;,
 -7.07107;3.99613;-8.19258;,
 -8.15493;3.99613;-6.57047;,
 -9.23880;3.99613;-4.94835;,
 -9.23880;3.99613;-4.94835;,
 -9.61940;3.99613;-3.03493;,
 -10.00000;3.99613;-1.12152;,
 -10.00000;3.99613;-1.12152;,
 -9.61940;3.99613;0.79190;,
 -9.23879;3.99613;2.70532;,
 -9.23879;3.99613;2.70532;,
 -8.15493;3.99613;4.32743;,
 -7.07107;3.99613;5.94955;,
 -7.07107;3.99613;5.94955;,
 -5.44895;3.99613;7.03341;,
 -3.82683;3.99613;8.11728;,
 -3.82683;3.99613;8.11728;,
 -1.91342;3.99613;8.49788;,
 0.00000;3.99613;8.87848;,
 8.15493;3.99613;-6.57047;,
 7.07107;3.99613;-8.19258;,
 1.91342;3.99613;8.49788;,
 3.49597;6.99324;7.31849;,
 3.82683;3.99613;8.11728;,
 5.44895;3.99613;7.03341;,
 6.45971;6.99324;5.33819;,
 7.07107;3.99613;5.94955;,
 8.15493;3.99613;4.32743;,
 8.44001;6.99324;2.37445;,
 9.23879;3.99613;2.70532;,
 9.61940;3.99613;0.79190;,
 9.13540;6.99324;-1.12152;,
 10.00000;3.99613;-1.12152;,
 9.61940;3.99613;-3.03493;,
 8.44001;6.99324;-4.61748;,
 9.23880;3.99613;-4.94835;,
 7.08657;9.08889;-4.05687;,
 2.93535;9.08889;5.96505;,
 5.42382;9.08889;4.30230;,
 7.08656;9.08889;1.81383;,
 7.67044;9.08889;-1.12152;,
 3.99768;11.23608;-2.77741;,
 1.65589;11.23608;2.87616;,
 3.05969;11.23608;1.93817;,
 3.99768;11.23608;0.53437;,
 4.32706;11.23608;-1.12152;,
 8.71242;-7.85040;-8.43726;,
 10.06656;-11.31609;-7.46467;,
 9.42752;-7.85040;-7.30720;,
 9.53653;-7.99120;3.36210;,
 10.01213;-11.66310;5.88905;,
 8.38659;-7.99120;5.31255;,
 10.61183;-7.93010;-0.87060;,
 12.10049;-10.88556;1.63110;,
 10.60290;-7.99120;1.40998;,
 10.17339;-7.66868;-4.84418;,
 11.96561;-11.02509;-2.81506;,
 10.42151;-7.80596;-3.22127;,
 7.65384;-8.04105;6.50285;,
 10.47477;-7.95060;2.65950;,
 10.55342;-7.85271;-1.35130;,
 10.11393;-7.65256;-5.84566;,
 7.57670;0.15272;-8.39819;,
 8.86601;-3.86436;-8.71672;,
 9.79992;-3.86275;-7.45962;,
 8.67351;0.15272;-6.71829;,
 10.76231;-3.91928;-5.75968;,
 9.35218;0.15272;-5.10559;,
 9.35218;0.15272;-5.10559;,
 10.32031;-3.98334;-5.23018;,
 10.62500;-3.98334;-3.63171;,
 9.68761;0.19938;-3.42461;,
 10.89954;-4.07550;-1.19631;,
 10.11062;0.15271;-1.31567;,
 10.45077;0.14379;-1.14392;,
 11.07839;-4.02082;-0.66149;,
 10.90632;-3.98334;1.14819;,
 10.45250;0.15271;0.97622;,
 9.96556;-3.98334;2.88275;,
 10.05103;0.15271;2.99453;,
 9.57147;0.15271;2.84065;,
 9.73889;-3.93570;3.03690;,
 8.36956;-3.98334;5.13144;,
 8.31390;0.15271;4.70558;,
 7.51858;-3.98334;6.48414;,
 7.33153;0.15271;6.24883;,
 7.07107;3.99613;-8.19258;,
 8.15493;3.99613;-6.57047;,
 9.23880;3.99613;-4.94835;,
 9.23880;3.99613;-4.94835;,
 9.61940;3.99613;-3.03493;,
 10.00000;3.99613;-1.12152;,
 10.00000;3.99613;-1.12152;,
 9.61940;3.99613;0.79190;,
 9.23879;3.99613;2.70532;,
 9.23879;3.99613;2.70532;,
 8.15493;3.99613;4.32743;,
 7.07107;3.99613;5.94955;,
 3.95682;-8.09368;8.12725;,
 1.86987;-11.80903;11.09777;,
 2.42108;-7.99120;8.63878;,
 6.78458;-8.23784;6.82548;,
 6.65796;-11.88175;9.26447;,
 5.50494;-8.14961;7.73316;,
 0.27995;-7.99120;9.09389;,
 4.63260;-8.15007;8.60273;,
 6.95148;0.10547;5.89825;,
 7.07409;-4.03218;6.40568;,
 5.43637;-4.03218;7.47729;,
 5.25177;0.10502;7.02092;,
 4.23937;-4.03218;8.51711;,
 4.00001;0.10502;8.08246;,
 3.67424;0.24844;8.33305;,
 3.75290;-3.98663;8.37318;,
 2.13740;-3.98334;8.66568;,
 2.01832;0.15271;8.72011;,
 0.07031;0.15271;9.11493;,
 7.07107;3.99613;5.94955;,
 5.44895;3.99613;7.03341;,
 3.82683;3.99613;8.11728;,
 3.82683;3.99613;8.11728;,
 1.91342;3.99613;8.49788;,
 -10.82766;-3.98334;-5.29968;,
 -11.13235;-3.98334;-3.70121;,
 -11.13235;-3.98334;-3.69973;,
 -10.82766;-3.98334;-5.29819;,
 -11.40690;-4.07550;-1.26581;,
 -11.40690;-4.07550;-1.26432;;
 
 235;
 4;3,2,1,0;,
 4;2,5,4,1;,
 4;7,6,2,3;,
 4;6,8,5,2;,
 4;10,9,6,7;,
 4;9,11,8,6;,
 3;12,9,10;,
 3;12,11,9;,
 3;15,14,13;,
 4;4,5,14,15;,
 4;14,18,17,16;,
 4;5,8,18,14;,
 4;18,20,19,17;,
 4;8,11,20,18;,
 3;20,12,19;,
 3;11,12,20;,
 3;23,22,21;,
 3;26,25,24;,
 3;29,28,27;,
 3;32,31,30;,
 3;35,34,33;,
 3;38,37,36;,
 4;39,7,3,23;,
 4;41,40,29,26;,
 4;40,42,32,29;,
 4;42,43,35,32;,
 4;43,44,38,35;,
 4;44,39,23,38;,
 4;45,10,7,39;,
 4;47,46,40,41;,
 4;46,48,42,40;,
 4;48,49,43,42;,
 4;49,50,44,43;,
 4;50,45,39,44;,
 3;12,10,45;,
 3;12,46,47;,
 3;12,48,46;,
 3;12,49,48;,
 3;12,50,49;,
 3;12,45,50;,
 3;53,52,51;,
 3;55,52,54;,
 3;54,57,56;,
 3;60,59,58;,
 3;56,62,61;,
 3;65,64,63;,
 3;63,62,66;,
 3;62,57,66;,
 3;66,57,67;,
 3;57,52,67;,
 3;52,53,68;,
 3;68,53,69;,
 4;72,71,64,70;,
 4;58,59,71,72;,
 3;61,62,73;,
 3;56,57,62;,
 3;54,52,57;,
 4;75,74,69,53;,
 3;76,75,51;,
 3;76,51,77;,
 3;67,52,68;,
 3;64,78,63;,
 4;79,78,64,71;,
 4;80,79,71,59;,
 3;80,59,60;,
 3;73,62,63;,
 3;70,64,65;,
 3;52,55,51;,
 3;75,53,51;,
 3;83,82,81;,
 3;86,85,84;,
 3;89,88,87;,
 3;92,91,90;,
 3;95,94,93;,
 3;98,97,96;,
 3;99,85,86;,
 3;100,88,89;,
 3;101,91,92;,
 3;102,94,95;,
 3;103,97,98;,
 3;104,82,83;,
 4;108,107,106,105;,
 4;110,106,107,109;,
 4;114,113,112,111;,
 4;116,112,113,115;,
 4;120,119,118,117;,
 4;122,118,119,121;,
 4;126,125,124,123;,
 4;128,124,125,127;,
 4;132,131,130,129;,
 4;134,130,131,133;,
 4;138,137,136,135;,
 4;140,136,137,139;,
 4;105,106,142,141;,
 4;143,142,106,110;,
 4;111,112,145,144;,
 4;146,145,112,116;,
 4;117,118,148,147;,
 4;149,148,118,122;,
 4;123,124,151,150;,
 4;152,151,124,128;,
 4;129,130,154,153;,
 4;155,154,130,134;,
 4;135,136,157,156;,
 4;158,157,136,140;,
 4;81,82,107,108;,
 4;109,107,82,104;,
 4;96,97,113,114;,
 4;115,113,97,103;,
 4;93,94,119,120;,
 4;121,119,94,102;,
 4;90,91,125,126;,
 4;127,125,91,101;,
 4;87,88,131,132;,
 4;133,131,88,100;,
 4;84,85,137,138;,
 4;139,137,85,99;,
 3;160,16,159;,
 3;163,162,161;,
 3;166,165,164;,
 3;169,168,167;,
 3;172,171,170;,
 3;175,174,173;,
 4;16,17,176,174;,
 4;162,177,41,26;,
 4;165,178,177,162;,
 4;168,179,178,165;,
 4;171,180,179,168;,
 4;174,176,180,171;,
 4;17,19,181,176;,
 4;177,182,47,41;,
 4;178,183,182,177;,
 4;179,184,183,178;,
 4;180,185,184,179;,
 4;176,181,185,180;,
 3;19,12,181;,
 3;182,12,47;,
 3;183,12,182;,
 3;184,12,183;,
 3;185,12,184;,
 3;181,12,185;,
 3;188,187,186;,
 3;191,190,189;,
 3;194,193,192;,
 3;197,196,195;,
 3;191,198,190;,
 3;194,199,193;,
 3;197,200,196;,
 3;188,201,187;,
 4;205,204,203,202;,
 4;204,205,207,206;,
 4;211,210,209,208;,
 4;210,211,213,212;,
 4;217,216,215,214;,
 4;216,217,219,218;,
 4;223,222,221,220;,
 4;222,223,225,224;,
 4;227,205,202,226;,
 4;205,227,228,207;,
 4;230,211,208,229;,
 4;211,230,231,213;,
 4;233,217,214,232;,
 4;217,233,234,219;,
 4;236,223,220,235;,
 4;223,236,237,225;,
 4;204,188,186,203;,
 4;188,204,206,201;,
 4;210,197,195,209;,
 4;197,210,212,200;,
 4;216,194,192,215;,
 4;194,216,218,199;,
 4;222,191,189,221;,
 4;191,222,224,198;,
 3;160,14,16;,
 3;160,15,14;,
 3;160,13,15;,
 4;4,5,14,15;,
 4;14,18,17,16;,
 4;5,8,18,14;,
 4;18,20,19,17;,
 4;8,11,20,18;,
 3;20,12,19;,
 3;11,12,20;,
 4;3,2,1,0;,
 4;2,5,4,1;,
 4;7,6,2,3;,
 4;6,8,5,2;,
 4;10,9,6,7;,
 4;9,11,8,6;,
 3;12,9,10;,
 3;12,11,9;,
 3;240,239,238;,
 3;243,242,241;,
 3;240,244,239;,
 3;243,245,242;,
 4;249,248,247,246;,
 4;248,249,251,250;,
 4;255,254,253,252;,
 4;254,255,256,139;,
 4;258,249,246,257;,
 4;249,258,259,251;,
 4;261,255,252,260;,
 4;255,261,158,256;,
 4;248,243,241,247;,
 4;243,248,250,245;,
 4;254,240,238,253;,
 4;240,254,139,244;,
 3;16,174,159;,
 3;159,174,175;,
 3;173,171,172;,
 3;174,171,173;,
 3;171,168,170;,
 3;170,168,169;,
 3;168,165,167;,
 3;167,165,166;,
 3;164,162,163;,
 3;165,162,164;,
 3;161,26,24;,
 3;162,26,161;,
 3;27,25,29;,
 3;29,25,26;,
 3;30,28,32;,
 3;32,28,29;,
 3;33,31,35;,
 3;35,31,32;,
 3;36,34,38;,
 3;38,34,35;,
 3;21,37,23;,
 3;23,37,38;,
 3;0,22,3;,
 3;3,22,23;,
 3;13,16,160;,
 3;14,16,13;,
 4;265,264,263,262;,
 4;264,267,266,263;;
 
 MeshMaterialList {
  1;
  235;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
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
  223;
  -0.345268;0.424845;-0.836837;,
  0.002975;0.420805;-0.907146;,
  -0.265042;0.721334;-0.639867;,
  0.000000;0.721334;-0.692588;,
  -0.131460;0.939145;-0.317372;,
  -0.000000;0.939145;-0.343521;,
  -0.003936;0.172630;-0.984979;,
  -0.639713;0.258925;-0.723689;,
  -0.375938;0.263207;-0.888478;,
  -0.627129;0.406944;-0.664158;,
  -0.456781;0.720574;-0.521655;,
  -0.226742;0.938902;-0.258944;,
  0.000000;0.999701;-0.024459;,
  0.382550;0.384450;-0.840151;,
  0.265042;0.721334;-0.639867;,
  0.131460;0.939145;-0.317372;,
  0.627127;0.242056;-0.740352;,
  0.325158;0.186323;-0.927122;,
  0.616267;0.391588;-0.683281;,
  0.456781;0.720574;-0.521655;,
  0.226742;0.938902;-0.258944;,
  -0.919192;0.171011;-0.354740;,
  0.000000;0.171739;0.985142;,
  -0.383312;0.145978;0.912010;,
  -0.699742;0.156520;0.697039;,
  -0.901198;0.217425;0.374925;,
  -0.981439;0.190118;-0.025158;,
  -0.854326;0.380658;-0.353873;,
  0.000000;0.380657;0.924716;,
  -0.353874;0.380658;0.854326;,
  -0.653873;0.380657;0.653873;,
  -0.854326;0.380658;0.353874;,
  -0.924716;0.380658;-0.000000;,
  -0.639868;0.721333;-0.265042;,
  0.000000;0.721334;0.692588;,
  -0.265042;0.721334;0.639867;,
  -0.489733;0.721334;0.489733;,
  -0.639867;0.721334;0.265042;,
  -0.692588;0.721333;0.000000;,
  -0.317371;0.939145;-0.131460;,
  0.000000;0.939145;0.343520;,
  -0.131460;0.939145;0.317371;,
  -0.242906;0.939145;0.242906;,
  -0.317372;0.939145;0.131460;,
  -0.343521;0.939145;0.000000;,
  -0.655844;0.194485;-0.729413;,
  -0.382478;0.127385;-0.915141;,
  -0.158578;0.010073;-0.987295;,
  0.047184;0.025281;-0.998566;,
  0.540492;-0.024529;-0.840992;,
  0.511674;0.226898;-0.828678;,
  0.598354;0.161534;-0.784780;,
  0.507031;0.171055;-0.844784;,
  0.319185;0.058257;-0.945900;,
  0.032238;0.038602;-0.998735;,
  -0.290933;0.126377;-0.948360;,
  -0.511457;0.265142;-0.817381;,
  -0.602384;0.259417;-0.754875;,
  -0.572581;0.266019;-0.775490;,
  0.514322;-0.032613;-0.856977;,
  0.607526;0.213140;-0.765169;,
  0.581802;0.015132;-0.813190;,
  0.513141;0.057797;-0.856356;,
  -0.561983;0.230927;-0.794259;,
  -0.655995;0.201657;-0.727327;,
  0.544516;0.246016;-0.801859;,
  0.553500;0.166548;-0.816027;,
  0.548025;0.036516;-0.835664;,
  0.493576;0.251495;-0.832546;,
  0.316595;-0.086133;-0.944642;,
  -0.857047;0.179968;-0.482787;,
  -0.271664;0.493093;0.826473;,
  -0.453355;0.633153;0.627364;,
  -0.774469;0.417479;0.475299;,
  -0.885797;0.461817;0.045693;,
  -0.902703;0.423185;-0.077734;,
  -0.195933;0.187896;0.962448;,
  -0.548578;0.153037;0.821974;,
  -0.815513;0.200895;0.542752;,
  -0.955768;0.239765;0.170353;,
  -0.964791;0.179596;-0.192154;,
  -0.824165;0.208885;-0.526421;,
  -0.817154;0.113387;-0.565158;,
  -0.855158;0.113018;-0.505897;,
  -0.889150;0.112081;-0.443678;,
  -0.986135;0.062866;-0.153577;,
  -0.991202;0.054148;-0.120779;,
  -0.988429;0.025525;0.149521;,
  -0.976670;0.031184;0.212470;,
  -0.843231;0.043801;0.535763;,
  -0.845887;0.048342;0.531167;,
  -0.553586;0.166769;0.815923;,
  -0.555882;0.170391;0.813610;,
  -0.261256;-0.002462;0.965266;,
  0.000000;0.001667;0.999999;,
  -0.806838;0.222566;-0.547245;,
  -0.839504;0.218999;-0.497265;,
  -0.924622;0.203341;-0.322066;,
  -0.966548;0.182393;-0.180329;,
  -0.980214;0.176550;0.089503;,
  -0.972693;0.176348;0.150895;,
  -0.829033;0.077090;0.553860;,
  -0.833844;0.078818;0.546344;,
  -0.550817;0.043909;0.833470;,
  -0.553575;0.043601;0.831657;,
  -0.248870;0.016624;0.968394;,
  -0.223053;0.022097;0.974556;,
  -0.197091;0.027551;0.979998;,
  -0.833928;0.046152;-0.549940;,
  -0.864551;0.039057;-0.501026;,
  -0.982390;0.117170;-0.145536;,
  -0.986840;0.116531;-0.112105;,
  -0.985195;0.162870;0.053526;,
  -0.978306;0.183481;0.096189;,
  -0.833981;0.221367;0.505443;,
  -0.828941;0.224296;0.512394;,
  -0.531059;0.433767;0.727890;,
  -0.518731;0.436478;0.735122;,
  -0.372151;0.244705;0.895334;,
  -0.286036;0.259529;0.922404;,
  -0.196960;0.272254;0.941852;,
  -0.979895;0.071526;-0.186251;,
  -0.892319;0.031812;-0.450284;,
  -0.996155;0.019707;0.085368;,
  -0.969837;0.176493;-0.168124;,
  -0.990174;0.115757;-0.078458;,
  -0.840535;0.039257;0.540334;,
  -0.961439;0.175469;0.211770;,
  -0.969286;0.203454;0.138171;,
  -0.551276;0.163145;0.818216;,
  -0.838587;0.080540;0.538782;,
  -0.823843;0.227200;0.519291;,
  -0.321817;-0.006551;0.946779;,
  -0.556327;0.043294;0.829835;,
  -0.506323;0.439092;0.742183;,
  0.919192;0.171011;-0.354740;,
  0.824165;0.208885;-0.526421;,
  0.854326;0.380658;-0.353873;,
  0.194894;0.188063;0.962626;,
  0.394952;0.152168;0.906012;,
  0.353874;0.380658;0.854326;,
  0.557765;0.157373;0.814943;,
  0.699742;0.156520;0.697039;,
  0.653873;0.380658;0.653873;,
  0.815513;0.200895;0.542752;,
  0.901198;0.217425;0.374925;,
  0.854326;0.380658;0.353874;,
  0.955768;0.239765;0.170353;,
  0.981439;0.190118;-0.025158;,
  0.924716;0.380658;-0.000000;,
  0.964791;0.179596;-0.192154;,
  0.639868;0.721333;-0.265042;,
  0.265042;0.721334;0.639867;,
  0.489733;0.721334;0.489733;,
  0.639867;0.721334;0.265042;,
  0.692588;0.721333;0.000000;,
  0.317371;0.939145;-0.131460;,
  0.131460;0.939145;0.317371;,
  0.242906;0.939145;0.242906;,
  0.317372;0.939145;0.131460;,
  0.343521;0.939145;0.000000;,
  0.833928;0.046152;-0.549940;,
  0.864551;0.039057;-0.501026;,
  0.857047;0.179968;-0.482787;,
  0.833981;0.221367;0.505443;,
  0.828941;0.224296;0.512394;,
  0.774469;0.417479;0.475299;,
  0.981509;0.188383;0.033939;,
  0.969506;0.217044;0.113799;,
  0.885797;0.461817;0.045693;,
  0.972774;0.183573;-0.141462;,
  0.977206;0.182373;-0.108670;,
  0.902703;0.423185;-0.077734;,
  0.823843;0.227200;0.519291;,
  0.950584;0.243880;0.192127;,
  0.980572;0.180969;-0.075682;,
  0.892319;0.031812;-0.450284;,
  0.806838;0.222566;-0.547245;,
  0.839504;0.218999;-0.497265;,
  0.855158;0.113018;-0.505897;,
  0.817154;0.113387;-0.565158;,
  0.889150;0.112081;-0.443678;,
  0.930234;0.175258;-0.322413;,
  0.975093;0.126405;-0.182251;,
  0.985757;0.072751;-0.151629;,
  0.979756;0.082144;-0.182564;,
  0.990688;0.063285;-0.120548;,
  0.977902;0.120301;-0.170984;,
  0.986570;0.147118;0.070970;,
  0.975541;0.140274;0.169241;,
  0.982542;0.021763;0.184762;,
  0.998744;0.015824;0.047545;,
  0.947825;0.027252;0.317625;,
  0.954774;0.131998;0.266427;,
  0.829033;0.077090;0.553860;,
  0.833844;0.078818;0.546344;,
  0.843231;0.043801;0.535763;,
  0.840535;0.039257;0.540334;,
  0.845887;0.048342;0.531167;,
  0.838587;0.080540;0.538782;,
  0.286006;0.241721;0.927239;,
  0.241746;0.257284;0.935609;,
  0.242386;0.500362;0.831196;,
  0.562136;0.260755;0.784863;,
  0.616659;0.263815;0.741710;,
  0.583351;0.456001;0.672134;,
  0.196960;0.272254;0.941852;,
  0.668095;0.265595;0.695060;,
  0.550817;0.043909;0.833470;,
  0.589105;0.048420;0.806605;,
  0.610803;0.088046;0.786872;,
  0.554960;0.084981;0.827525;,
  0.663723;0.090691;0.742460;,
  0.626081;0.052823;0.777967;,
  0.206024;0.029123;0.978114;,
  0.201560;0.028337;0.979066;,
  0.212141;-0.002900;0.977235;,
  0.224548;-0.007433;0.974435;,
  0.197091;0.027551;0.979998;,
  0.000000;-1.000000;0.000000;,
  0.161222;-0.986918;-0.000000;,
  0.318227;-0.948015;-0.000000;,
  -0.166694;0.953928;0.249468;;
  235;
  4;9,0,8,7;,
  4;0,1,6,8;,
  4;10,2,0,9;,
  4;2,3,1,0;,
  4;11,4,2,10;,
  4;4,5,3,2;,
  3;12,4,11;,
  3;12,5,4;,
  3;17,13,50;,
  4;6,1,13,17;,
  4;13,14,19,18;,
  4;1,3,14,13;,
  4;14,15,20,19;,
  4;3,5,15,14;,
  3;15,12,20;,
  3;5,12,15;,
  3;27,81,21;,
  3;28,76,22;,
  3;29,77,23;,
  3;30,78,24;,
  3;31,79,25;,
  3;32,80,26;,
  4;33,10,9,27;,
  4;34,35,29,28;,
  4;35,36,30,29;,
  4;36,37,31,30;,
  4;37,38,32,31;,
  4;38,33,27,32;,
  4;39,11,10,33;,
  4;40,41,35,34;,
  4;41,42,36,35;,
  4;42,43,37,36;,
  4;43,44,38,37;,
  4;44,39,33,38;,
  3;12,11,39;,
  3;12,41,40;,
  3;12,42,41;,
  3;12,43,42;,
  3;12,44,43;,
  3;12,39,44;,
  3;56,55,63;,
  3;46,55,47;,
  3;47,54,48;,
  3;49,67,61;,
  3;48,53,69;,
  3;16,65,50;,
  3;50,53,17;,
  3;53,54,17;,
  3;17,54,6;,
  3;54,55,6;,
  3;55,56,8;,
  3;8,56,7;,
  4;51,66,65,60;,
  4;61,67,66,51;,
  3;69,53,59;,
  3;48,54,53;,
  3;47,55,54;,
  4;57,58,7,56;,
  3;64,57,63;,
  3;64,63,45;,
  3;6,55,8;,
  3;65,68,50;,
  4;52,68,65,66;,
  4;62,52,66,67;,
  3;62,67,49;,
  3;59,53,50;,
  3;60,65,16;,
  3;55,46,63;,
  3;57,56,63;,
  3;70,109,108;,
  3;71,119,118;,
  3;72,117,116;,
  3;73,115,114;,
  3;74,113,112;,
  3;75,111,110;,
  3;120,119,71;,
  3;134,117,72;,
  3;131,115,73;,
  3;128,113,74;,
  3;125,111,75;,
  3;122,109,70;,
  4;82,83,96,95;,
  4;97,96,83,84;,
  4;121,85,98,97;,
  4;124,98,85,86;,
  4;123,87,100,99;,
  4;127,100,87,88;,
  4;126,89,102,101;,
  4;130,102,89,90;,
  4;129,91,104,103;,
  4;133,104,91,92;,
  4;132,93,106,105;,
  4;107,106,93,94;,
  4;95,96,81,7;,
  4;21,81,96,97;,
  4;97,98,80,21;,
  4;26,80,98,124;,
  4;99,100,79,26;,
  4;25,79,100,127;,
  4;101,102,78,25;,
  4;24,78,102,130;,
  4;103,104,77,24;,
  4;23,77,104,133;,
  4;105,106,76,23;,
  4;22,76,106,107;,
  4;108,109,83,82;,
  4;84,83,109,122;,
  4;110,111,85,121;,
  4;86,85,111,125;,
  4;112,113,87,123;,
  4;88,87,113,128;,
  4;114,115,89,126;,
  4;90,89,115,131;,
  4;116,117,91,129;,
  4;92,91,117,134;,
  4;118,119,93,132;,
  4;94,93,119,120;,
  3;16,18,136;,
  3;139,140,138;,
  3;142,143,141;,
  3;145,146,144;,
  3;148,149,147;,
  3;135,137,150;,
  4;18,19,151,137;,
  4;140,152,34,28;,
  4;143,153,152,140;,
  4;146,154,153,143;,
  4;149,155,154,146;,
  4;137,151,155,149;,
  4;19,20,156,151;,
  4;152,157,40,34;,
  4;153,158,157,152;,
  4;154,159,158,153;,
  4;155,160,159,154;,
  4;151,156,160,155;,
  3;20,12,156;,
  3;157,12,40;,
  3;158,12,157;,
  3;159,12,158;,
  3;160,12,159;,
  3;156,12,160;,
  3;162,163,161;,
  3;165,166,164;,
  3;168,169,167;,
  3;171,172,170;,
  3;165,173,166;,
  3;168,174,169;,
  3;171,175,172;,
  3;162,176,163;,
  4;178,179,180,177;,
  4;179,178,182,181;,
  4;183,184,185,182;,
  4;184,183,187,186;,
  4;189,190,191,188;,
  4;190,189,193,192;,
  4;195,196,197,194;,
  4;196,195,199,198;,
  4;136,178,177,16;,
  4;178,136,135,182;,
  4;150,183,182,135;,
  4;183,150,148,187;,
  4;147,189,188,148;,
  4;189,147,145,193;,
  4;144,195,194,145;,
  4;195,144,142,199;,
  4;179,162,161,180;,
  4;162,179,181,176;,
  4;184,171,170,185;,
  4;171,184,186,175;,
  4;190,168,167,191;,
  4;168,190,192,174;,
  4;196,165,164,197;,
  4;165,196,198,173;,
  3;16,13,18;,
  3;16,17,13;,
  3;222,222,222;,
  4;6,1,13,17;,
  4;13,14,19,18;,
  4;1,3,14,13;,
  4;14,15,20,19;,
  4;3,5,15,14;,
  3;15,12,20;,
  3;5,12,15;,
  4;9,0,8,7;,
  4;0,1,6,8;,
  4;10,2,0,9;,
  4;2,3,1,0;,
  4;11,4,2,10;,
  4;4,5,3,2;,
  3;12,4,11;,
  3;12,5,4;,
  3;201,202,200;,
  3;204,205,203;,
  3;201,206,202;,
  3;204,207,205;,
  4;209,210,211,208;,
  4;210,209,213,212;,
  4;215,216,217,214;,
  4;216,215,218,94;,
  4;141,209,208,142;,
  4;209,141,139,213;,
  4;138,215,214,139;,
  4;215,138,22,218;,
  4;210,204,203,211;,
  4;204,210,212,207;,
  4;216,201,200,217;,
  4;201,216,94,206;,
  3;18,137,136;,
  3;136,137,135;,
  3;150,149,148;,
  3;137,149,150;,
  3;149,146,147;,
  3;147,146,145;,
  3;146,143,144;,
  3;144,143,142;,
  3;141,140,139;,
  3;143,140,141;,
  3;138,28,22;,
  3;140,28,138;,
  3;23,76,29;,
  3;29,76,28;,
  3;24,77,30;,
  3;30,77,29;,
  3;25,78,31;,
  3;31,78,30;,
  3;26,79,32;,
  3;32,79,31;,
  3;21,80,27;,
  3;27,80,32;,
  3;7,81,9;,
  3;9,81,27;,
  3;50,18,16;,
  3;13,18,50;,
  4;219,220,220,219;,
  4;220,221,221,220;;
 }
 MeshTextureCoords {
  268;
  0.799010;0.199840;,
  0.834270;0.222620;,
  0.837610;0.214620;,
  0.805620;0.193240;,
  0.875360;0.231130;,
  0.875360;0.222130;,
  0.843670;0.200010;,
  0.816800;0.182060;,
  0.875360;0.206310;,
  0.857480;0.166660;,
  0.842320;0.156530;,
  0.875360;0.170220;,
  0.875360;0.123500;,
  0.933640;0.210970;,
  0.913100;0.214620;,
  0.916030;0.221810;,
  0.945100;0.193240;,
  0.933920;0.182060;,
  0.907050;0.200010;,
  0.908390;0.156530;,
  0.893240;0.166660;,
  0.775610;0.164820;,
  0.787310;0.182330;,
  0.784240;0.161240;,
  0.875360;0.015530;,
  0.854700;0.019640;,
  0.875360;0.024870;,
  0.834040;0.023750;,
  0.816530;0.035450;,
  0.837610;0.032380;,
  0.799010;0.047160;,
  0.787310;0.064670;,
  0.805620;0.053760;,
  0.775610;0.082180;,
  0.771500;0.102840;,
  0.784240;0.085750;,
  0.767390;0.123500;,
  0.771500;0.144160;,
  0.776730;0.123500;,
  0.798850;0.155190;,
  0.843670;0.046990;,
  0.875360;0.040680;,
  0.816800;0.064940;,
  0.798850;0.091810;,
  0.792540;0.123500;,
  0.832200;0.141380;,
  0.857480;0.080340;,
  0.875360;0.076780;,
  0.842320;0.090470;,
  0.832200;0.105620;,
  0.828640;0.123500;,
  0.776290;0.291640;,
  0.816190;0.278090;,
  0.788300;0.274490;,
  0.814140;0.299900;,
  0.778460;0.307710;,
  0.875190;0.295770;,
  0.875800;0.275300;,
  0.978370;0.289490;,
  0.968330;0.289790;,
  0.958800;0.302600;,
  0.922510;0.288220;,
  0.929930;0.272650;,
  0.958350;0.246540;,
  0.971300;0.261420;,
  0.982750;0.246540;,
  0.933040;0.247220;,
  0.876380;0.247000;,
  0.819140;0.246800;,
  0.770010;0.246540;,
  0.985200;0.262060;,
  0.973230;0.275990;,
  0.983750;0.275330;,
  0.946070;0.274370;,
  0.767610;0.261490;,
  0.766050;0.277830;,
  0.767400;0.293970;,
  0.775430;0.310670;,
  0.961410;0.261450;,
  0.962610;0.275450;,
  0.961800;0.288520;,
  0.985680;0.905760;,
  0.936940;0.905760;,
  0.936940;0.988620;,
  0.985680;0.905760;,
  0.936940;0.905760;,
  0.936940;0.988620;,
  0.985680;0.905760;,
  0.936940;0.905760;,
  0.936940;0.988620;,
  0.985680;0.905760;,
  0.936940;0.905760;,
  0.936940;0.988620;,
  0.985680;0.905760;,
  0.936940;0.905760;,
  0.936940;0.988620;,
  0.985680;0.905760;,
  0.936940;0.905760;,
  0.936940;0.988620;,
  0.888200;0.905760;,
  0.888200;0.905760;,
  0.888200;0.905760;,
  0.888200;0.905760;,
  0.888200;0.905760;,
  0.888200;0.905760;,
  0.985680;0.729020;,
  0.936940;0.729020;,
  0.936940;0.818780;,
  0.985680;0.818780;,
  0.888200;0.818780;,
  0.888200;0.729020;,
  0.985680;0.729020;,
  0.936940;0.729020;,
  0.936940;0.818780;,
  0.985680;0.818780;,
  0.888200;0.818780;,
  0.888200;0.729020;,
  0.985680;0.729020;,
  0.936940;0.729020;,
  0.936940;0.818780;,
  0.985680;0.818780;,
  0.888200;0.818780;,
  0.888200;0.729020;,
  0.985680;0.729020;,
  0.936940;0.729020;,
  0.936940;0.818780;,
  0.985680;0.818780;,
  0.888200;0.818780;,
  0.888200;0.729020;,
  0.985680;0.729020;,
  0.936940;0.729020;,
  0.936940;0.818780;,
  0.985680;0.818780;,
  0.888200;0.818780;,
  0.888200;0.729020;,
  0.985680;0.729020;,
  0.936940;0.729020;,
  0.936940;0.818780;,
  0.985680;0.818780;,
  0.888200;0.818780;,
  0.888200;0.729020;,
  0.985680;0.645600;,
  0.936940;0.645600;,
  0.888200;0.645600;,
  0.985680;0.645600;,
  0.936940;0.645600;,
  0.888200;0.645600;,
  0.985680;0.645600;,
  0.936940;0.645600;,
  0.888200;0.645600;,
  0.985680;0.645600;,
  0.936940;0.645600;,
  0.888200;0.645600;,
  0.985680;0.645600;,
  0.936940;0.645600;,
  0.888200;0.645600;,
  0.985680;0.645600;,
  0.936940;0.645600;,
  0.888200;0.645600;,
  0.963400;0.182330;,
  0.951700;0.199840;,
  0.896020;0.019640;,
  0.913100;0.032380;,
  0.916670;0.023750;,
  0.934190;0.035450;,
  0.945100;0.053760;,
  0.951700;0.047160;,
  0.963400;0.064670;,
  0.966480;0.085750;,
  0.975110;0.082180;,
  0.979220;0.102840;,
  0.973990;0.123500;,
  0.983330;0.123500;,
  0.979220;0.144160;,
  0.966480;0.161240;,
  0.975110;0.164820;,
  0.951870;0.155190;,
  0.907050;0.046990;,
  0.933920;0.064940;,
  0.951870;0.091810;,
  0.958170;0.123500;,
  0.918520;0.141380;,
  0.893240;0.080340;,
  0.908390;0.090470;,
  0.918520;0.105620;,
  0.922080;0.123500;,
  0.985680;0.905760;,
  0.936940;0.988620;,
  0.936940;0.905760;,
  0.985680;0.905760;,
  0.936940;0.988620;,
  0.936940;0.905760;,
  0.985680;0.905760;,
  0.936940;0.988620;,
  0.936940;0.905760;,
  0.985680;0.905760;,
  0.936940;0.988620;,
  0.936940;0.905760;,
  0.888200;0.905760;,
  0.888200;0.905760;,
  0.888200;0.905760;,
  0.888200;0.905760;,
  0.985680;0.729020;,
  0.985680;0.818780;,
  0.936940;0.818780;,
  0.936940;0.729020;,
  0.888200;0.818780;,
  0.888200;0.729020;,
  0.985680;0.729020;,
  0.985680;0.818780;,
  0.936940;0.818780;,
  0.936940;0.729020;,
  0.888200;0.818780;,
  0.888200;0.729020;,
  0.985680;0.729020;,
  0.985680;0.818780;,
  0.936940;0.818780;,
  0.936940;0.729020;,
  0.888200;0.818780;,
  0.888200;0.729020;,
  0.985680;0.729020;,
  0.985680;0.818780;,
  0.936940;0.818780;,
  0.936940;0.729020;,
  0.888200;0.818780;,
  0.888200;0.729020;,
  0.985680;0.645600;,
  0.936940;0.645600;,
  0.888200;0.645600;,
  0.985680;0.645600;,
  0.936940;0.645600;,
  0.888200;0.645600;,
  0.985680;0.645600;,
  0.936940;0.645600;,
  0.888200;0.645600;,
  0.985680;0.645600;,
  0.936940;0.645600;,
  0.888200;0.645600;,
  0.985680;0.905760;,
  0.936940;0.988620;,
  0.936940;0.905760;,
  0.985680;0.905760;,
  0.936940;0.988620;,
  0.936940;0.905760;,
  0.888200;0.905760;,
  0.888200;0.905760;,
  0.985680;0.729020;,
  0.985680;0.818780;,
  0.936940;0.818780;,
  0.936940;0.729020;,
  0.888200;0.818780;,
  0.888200;0.729020;,
  0.985680;0.729020;,
  0.985680;0.818780;,
  0.936940;0.818780;,
  0.936940;0.729020;,
  0.888200;0.729020;,
  0.985680;0.645600;,
  0.936940;0.645600;,
  0.888200;0.645600;,
  0.985680;0.645600;,
  0.936940;0.645600;,
  0.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;1.000000;;
 }
}