//==========================================
//
//爆発表示プログラムのヘッダ[explosion.h]
//Author:石原颯馬
//
//==========================================
#ifndef _EXPLOSION_H_
#define _EXPLOSION_H_

#include "main.h"

//プロトタイプ宣言
void InitExplosion(void);
void UninitExplosion(void);
void UpdateExplosion(void);
void DrawExplosion(void);
void SetExplosion(D3DXVECTOR3 pos, D3DXCOLOR col);

#endif // !_BG_H_
