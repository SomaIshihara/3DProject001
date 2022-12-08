//==========================================
//
//�G�v���O�����̃w�b�_[enemy.h]
//Author:�Ό��D�n
//
//==========================================
#ifndef _ENEMY_H_
#define _ENEMY_H_

#include "main.h"
#include "model.h"

//�}�N��
#define MAX_ENEMY	(64)	//�G����

//�G�\����
typedef struct
{
	D3DXVECTOR3 pos;		//�ʒu
	D3DXVECTOR3 posOld;
	float fLength;
	float fAngle;
	D3DXVECTOR3 move;		//�ړ���
	D3DXVECTOR3 rot;		//����
	Model *pModel;			//�g�p���f���|�C���^
	int nNumModel;			//�p�[�c����
	D3DXMATRIX mtxWorld;	//���[���h�}�g��
	int nIdxShadow;			//�e�ԍ�
} Enemy;

//�v���g�^�C�v�錾
void InitEnemy(void);
void UninitEnemy(void);
void UpdateEnemy(void);
void DrawEnemy(void);
Enemy *GetEnemy(void);

#endif // !_ENEMY_H_
