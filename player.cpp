//==========================================
//
//�v���C���[�v���O����[player.cpp]
//Author:�Ό��D�n
//
//==========================================
#include "main.h"
#include "player.h"
#include "input.h"
#include "shadow.h"
#include "camera.h"
#include "bullet.h"
#include "wall.h"
#include "object.h"
#include "debugproc.h"
#include <assert.h>

//�}�N��
#define PLAYER_MOVE_SPEED	(5.0f)	//�v���C���[�ړ����x
#define DUMP_COEF			(0.4f)	//�����W��

//��
#define PLAYER_WIDTH		(20.0f)
#define PLAYER_DEPTH		(15.0f)

//����
#define ROT_WA	(-0.75f * D3DX_PI)	//����
#define ROT_WD	(0.75f * D3DX_PI)	//�E��
#define ROT_SA	(-0.25f * D3DX_PI)	//����
#define ROT_SD	(0.25f * D3DX_PI)	//�E��
#define ROT_W	(1.0f * D3DX_PI)	//��
#define ROT_A	(-0.5f * D3DX_PI)	//��
#define ROT_S	(0.0f * D3DX_PI)	//��
#define ROT_D	(0.5f * D3DX_PI)	//�E

//�v���g
void CollisionWallPlayer(int nNumber);
void CollisionObjPlayer(void);

//�O���[�o���ϐ�
LPD3DXMESH g_pMeshPlayer = NULL;			//���b�V���ւ̃|�C���^
LPD3DXBUFFER g_pBuffMatPlayer = NULL;		//�}�e���A���ւ̃|�C���^
DWORD g_dwNumMatPlayer = 0;					//�}�e���A����
Player g_player;
D3DXMATRIX g_mtxWorldPlayer;				//���[���h�}�g���b�N�X
LPDIRECT3DTEXTURE9 g_apTexturemodel[16] = {};	//�e�N�X�`���|�C���^
int g_nIdxShadow = -1;

//========================
//����������
//========================
void InitPlayer(void)
{
	LPDIRECT3DDEVICE9 pDevice = GetDevice();	//�f�o�C�X�̎擾

	//�ϐ�������
	g_player.pos = D3DXVECTOR3(0.0f, 10.0f, 0.0f);
	g_player.posOld = D3DXVECTOR3(0.0f, 0.0f, 0.0f);

	g_player.summitOld[0] = g_player.pos + D3DXVECTOR3(-PLAYER_WIDTH / 2, 0.0f, PLAYER_DEPTH / 2);
	g_player.summitOld[1] = g_player.pos + D3DXVECTOR3(PLAYER_WIDTH / 2, 0.0f, PLAYER_DEPTH / 2);
	g_player.summitOld[2] = g_player.pos + D3DXVECTOR3(-PLAYER_WIDTH / 2, 0.0f, -PLAYER_DEPTH / 2);
	g_player.summitOld[3] = g_player.pos + D3DXVECTOR3(PLAYER_WIDTH / 2, 0.0f, -PLAYER_DEPTH / 2);

	g_player.move = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	g_player.rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	g_nIdxShadow = -1;

	//�Ίp���̒����E�p�x
	g_player.fLength = sqrtf(PLAYER_WIDTH * PLAYER_WIDTH + PLAYER_DEPTH * PLAYER_DEPTH) * 0.5f;
	g_player.fAngle = atan2f(PLAYER_WIDTH, PLAYER_DEPTH);

	//X�t�@�C���ǂݍ���
	D3DXLoadMeshFromX(
		"data\\MODEL\\car000.x",
		D3DXMESH_SYSTEMMEM,
		pDevice,
		NULL,
		&g_pBuffMatPlayer,
		NULL,
		&g_dwNumMatPlayer,
		&g_pMeshPlayer);

	//�i�{���͓ǂݍ��߂����`�F�b�N������j

	//�e�N�X�`���ǂݍ���
	D3DXMATERIAL *pMat;	//�}�e���A���|�C���^

	//�}�e���A�����ɑ΂���|�C���^�擾
	pMat = (D3DXMATERIAL *)g_pBuffMatPlayer->GetBufferPointer();

	for (int nCntTex = 0; nCntTex < (int)g_dwNumMatPlayer; nCntTex++)
	{
		if (pMat[nCntTex].pTextureFilename != NULL)
		{
			//�e�N�X�`���ǂݍ���
			D3DXCreateTextureFromFile(pDevice,
				pMat[nCntTex].pTextureFilename,
				&g_apTexturemodel[nCntTex]);
		}
	}

	//�e�ݒ�
	g_nIdxShadow = SetShadow();
}

//========================
//�I������
//========================
void UninitPlayer(void)
{
	//���b�V���̔j��
	if (g_pMeshPlayer != NULL)
	{
		g_pMeshPlayer->Release();
		g_pMeshPlayer = NULL;
	}

	//�}�e���A���̔j��
	if (g_pBuffMatPlayer != NULL)
	{
		g_pBuffMatPlayer->Release();
		g_pBuffMatPlayer = NULL;
	}
}

//========================
//�X�V����
//========================
void UpdatePlayer(void)
{
	//���݂̈ʒu��O��̈ʒu�ɂ���
	g_player.posOld = g_player.pos;

	//�J���������ɉ����ăv���C���[�̌�������
	if (GetMouseClickPress(MOUSE_CLICK_LEFT) == true)
	{
		g_player.rot.y = -(float)fmod(GetCamera()->rot.y + 1.0f * D3DX_PI + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
	}

	//���f���ړ�
	if (GetKeyboardPress(DIK_W) == true)
	{
		if (GetKeyboardPress(DIK_A) == true)
		{
			g_player.rot.y = -(float)fmod(GetCamera()->rot.y + ROT_WA + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
			g_player.move.x = sinf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
			g_player.move.z = cosf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
		}
		else if (GetKeyboardPress(DIK_D) == true)
		{
			g_player.rot.y = -(float)fmod(GetCamera()->rot.y + ROT_WD + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
			g_player.move.x = sinf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
			g_player.move.z = cosf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
		}
		else
		{
			g_player.rot.y = -(float)fmod(GetCamera()->rot.y + ROT_W + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
			g_player.move.x = sinf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
			g_player.move.z = cosf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
		}
	}
	else if (GetKeyboardPress(DIK_S) == true)
	{
		if (GetKeyboardPress(DIK_A) == true)
		{
			g_player.rot.y = -(float)fmod(GetCamera()->rot.y + ROT_SA + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
			g_player.move.x = sinf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
			g_player.move.z = cosf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
		}
		else if (GetKeyboardPress(DIK_D) == true)
		{
			g_player.rot.y = -(float)fmod(GetCamera()->rot.y + ROT_SD + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
			g_player.move.x = sinf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
			g_player.move.z = cosf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
		}
		else
		{
			g_player.rot.y = -(float)fmod(GetCamera()->rot.y + ROT_S + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
			g_player.move.x = sinf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
			g_player.move.z = cosf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
		}
	}
	else if (GetKeyboardPress(DIK_A) == true)
	{
		g_player.rot.y = -(float)fmod(GetCamera()->rot.y + ROT_A + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
		g_player.move.x = sinf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
		g_player.move.z = cosf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
	}
	else if (GetKeyboardPress(DIK_D) == true)
	{
		g_player.rot.y = -(float)fmod(GetCamera()->rot.y + ROT_D + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
		g_player.move.x = sinf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
		g_player.move.z = cosf((float)fmod((g_player.rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * PLAYER_MOVE_SPEED;
	}

	//�{�^������ɉ����ăv���C���[�E�J�������_�E�����_�ړ�
	g_player.pos.x += g_player.move.x;
	g_player.pos.z += g_player.move.z;

	//�Ǔ����蔻��
	CollisionWallPlayer(0);

	//�I�u�W�F�N�g�����蔻��
	CollisionObjPlayer();

	GetCamera()->posV.x += g_player.pos.x - g_player.posOld.x;
	GetCamera()->posV.z += g_player.pos.z - g_player.posOld.z;
	GetCamera()->posR.x += g_player.pos.x - g_player.posOld.x;
	GetCamera()->posR.z += g_player.pos.z - g_player.posOld.z;

	//�ړ��ʌ���
	g_player.move.x += (0 - g_player.move.x) * DUMP_COEF;
	g_player.move.z += (0 - g_player.move.z) * DUMP_COEF;

	if (GetKeyboardTrigger(DIK_SPACE) == true)
	{
		SetBullet(g_player.pos, 5.0f, g_player.rot.y, D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
	}

	//�e�ʒu�ݒ�
	SetPositionShadow(g_nIdxShadow, g_player.pos);
}

//========================
//�`�揈��
//========================
void DrawPlayer(void)
{
	LPDIRECT3DDEVICE9 pDevice = GetDevice();	//�f�o�C�X�̎擾
	D3DXMATRIX mtxRot, mtxTrans;	//�v�Z�p
	D3DMATERIAL9 matDef;			//���݂̃}�e���A���ۑ��p
	D3DXMATERIAL *pMat;				//�}�e���A���f�[�^�ւ̃|�C���^

	//���[���h�}�g���b�N�X������
	D3DXMatrixIdentity(&g_mtxWorldPlayer);

	//�����𔽉f
	D3DXMatrixRotationYawPitchRoll(&mtxRot, g_player.rot.y, g_player.rot.x, g_player.rot.z);
	D3DXMatrixMultiply(&g_mtxWorldPlayer, &g_mtxWorldPlayer, &mtxRot);

	//�ʒu���f
	D3DXMatrixTranslation(&mtxTrans, g_player.pos.x, g_player.pos.y, g_player.pos.z);
	D3DXMatrixMultiply(&g_mtxWorldPlayer, &g_mtxWorldPlayer, &mtxTrans);

	//���[���h�}�g���b�N�X�ݒ�
	pDevice->SetTransform(D3DTS_WORLD, &g_mtxWorldPlayer);

	//���݂̃}�e���A���擾
	pDevice->GetMaterial(&matDef);

	//�}�e���A���f�[�^�ւ̃|�C���^�擾
	pMat = (D3DXMATERIAL*)g_pBuffMatPlayer->GetBufferPointer();

	for (int nCntMat = 0; nCntMat < (int)g_dwNumMatPlayer; nCntMat++)
	{
		//�}�e���A���ݒ�
		pDevice->SetMaterial(&pMat[nCntMat].MatD3D);

		//�e�N�X�`���ݒ�
		pDevice->SetTexture(0, g_apTexturemodel[nCntMat]);

		//���f���`��
		g_pMeshPlayer->DrawSubset(nCntMat);
	}

	//�}�e���A����߂�
	pDevice->SetMaterial(&matDef);
}

//========================
//�Ǔ����蔻�菈��
//========================
void CollisionWallPlayer(int nNumber)
{
	if (g_player.pos.x + PLAYER_WIDTH / 2 > WALL_WIDTH / 2)
	{
		g_player.pos.x = WALL_WIDTH / 2 - PLAYER_WIDTH / 2;
	}
	else if (g_player.pos.x - PLAYER_WIDTH / 2 < -WALL_WIDTH / 2)
	{
		g_player.pos.x = -WALL_WIDTH / 2 + PLAYER_WIDTH / 2;
	}

	if (g_player.pos.z + PLAYER_DEPTH / 2 > WALL_DEPTH / 2)
	{
		g_player.pos.z = WALL_DEPTH / 2 - PLAYER_DEPTH / 2;
	}
	else if (g_player.pos.z - PLAYER_DEPTH / 2 < -WALL_DEPTH / 2)
	{
		g_player.pos.z = -WALL_DEPTH / 2 + PLAYER_DEPTH / 2;
	}
}

//========================
//�I�u�W�F�N�g�����蔻�菈��
//========================
void CollisionObjPlayer(void)
{
	Object *obj = GetObj();

	for (int nCntObj = 0; nCntObj < MAX_OBJECT; nCntObj++, obj++)
	{
		if (obj->bUse == true)
		{
			if (g_player.pos.z >= obj->pos.z + obj->vtxMin.z && g_player.pos.z <= obj->pos.z + obj->vtxMax.z)
			{
				if (g_player.posOld.x <= obj->pos.x + obj->vtxMin.x && g_player.pos.x > obj->pos.x + obj->vtxMin.x)
				{
					g_player.pos.x = obj->pos.x + obj->vtxMin.x;
				}
				if (g_player.posOld.x >= obj->pos.x + obj->vtxMax.x && g_player.pos.x < obj->pos.x + obj->vtxMax.x)
				{
					g_player.pos.x = obj->pos.x + obj->vtxMax.x;
				}
			}

			if (g_player.pos.x >= obj->pos.x + obj->vtxMin.x && g_player.pos.x <= obj->pos.x + obj->vtxMax.x)
			{
				if (g_player.posOld.z <= obj->pos.z + obj->vtxMin.z && g_player.pos.z > obj->pos.z + obj->vtxMin.z)
				{
					g_player.pos.z = obj->pos.z + obj->vtxMin.z;
				}
				if (g_player.posOld.z >= obj->pos.z + obj->vtxMax.z && g_player.pos.z < obj->pos.z + obj->vtxMax.z)
				{
					g_player.pos.z = obj->pos.z + obj->vtxMax.z;
				}
			}
		}
	}
}

//========================
//�擾����
//========================
Player *GetPlayer(void)
{
	return &g_player;
}