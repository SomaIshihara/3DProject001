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
#include "meshfield.h"
#include "object.h"
#include "debugproc.h"
#include <assert.h>

//�}�N��
#define PLAYER_MOVE_SPEED	(7.0f)	//�v���C���[�ړ����x
#define DUMP_COEF			(0.4f)	//�����W��
#define BULLET_SPEED		(15.0f)	//�e�̑���

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
Player g_player;
int g_nIdxShadow = -1;

//�t�@�C����
const char *c_pFileNamePlayer[] =
{
	"data\\MODEL\\exithuman_x\\01_Body.x",
	"data\\MODEL\\exithuman_x\\02_Head.x",
	"data\\MODEL\\exithuman_x\\03_Left_Arm.x",
	"data\\MODEL\\exithuman_x\\04_Left_Hand.x",
	"data\\MODEL\\exithuman_x\\05_Right_Arm.x",
	"data\\MODEL\\exithuman_x\\06_Right_Hand.x",
	"data\\MODEL\\exithuman_x\\07_Left_Leg.x",
	"data\\MODEL\\exithuman_x\\08_Left_Foot.x",
	"data\\MODEL\\exithuman_x\\09_Right_Leg.x",
	"data\\MODEL\\exithuman_x\\10_Right_Foot.x"
};

//========================
//����������
//========================
void InitPlayer(void)
{
	LPDIRECT3DDEVICE9 pDevice = GetDevice();	//�f�o�C�X�̎擾

	//�ϐ�������
	g_player.pos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	g_player.posOld = D3DXVECTOR3(0.0f, 0.0f, 0.0f);

	g_player.move = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	g_player.rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	g_nIdxShadow = -1;

	for (int nCntInitModel = 0; nCntInitModel < EXITHUMAN_MODEL_NUM; nCntInitModel++)
	{
		g_player.aModel[nCntInitModel] = {};
	}
	g_player.nNumModel = 0;

	//�Ίp���̒����E�p�x
	g_player.fLength = sqrtf(PLAYER_WIDTH * PLAYER_WIDTH + PLAYER_DEPTH * PLAYER_DEPTH) * 0.5f;
	g_player.fAngle = atan2f(PLAYER_WIDTH, PLAYER_DEPTH);

	//X�t�@�C���ǂݍ���
	for (int nCntModel = 0; nCntModel < EXITHUMAN_MODEL_NUM; nCntModel++)
	{
		D3DXLoadMeshFromX(
			c_pFileNamePlayer[nCntModel],
			D3DXMESH_SYSTEMMEM,
			pDevice,
			NULL,
			&g_player.aModel[nCntModel].pBuffMat,
			NULL,
			&g_player.aModel[nCntModel].dwNumMatModel,
			&g_player.aModel[nCntModel].pMesh);

		//�e�N�X�`���ǂݍ���
		D3DXMATERIAL *pMat;	//�}�e���A���|�C���^

		//�}�e���A�����ɑ΂���|�C���^�擾
		pMat = (D3DXMATERIAL *)g_player.aModel[nCntModel].pBuffMat->GetBufferPointer();

		for (int nCntTex = 0; nCntTex < (int)g_player.aModel[nCntModel].dwNumMatModel; nCntTex++)
		{
			if (pMat[nCntTex].pTextureFilename != NULL)
			{
				//�e�N�X�`���ǂݍ���
				D3DXCreateTextureFromFile(pDevice,
					pMat[nCntTex].pTextureFilename,
					&g_player.aModel[nCntModel].apTexture[nCntTex]);
			}
		}
	}

	//�K�w�\���ݒ�
	//��
	g_player.aModel[0].nIdxModelParent = -1;
	g_player.aModel[0].pos = D3DXVECTOR3(0.0f, 35.0f, 0.0f);
	g_player.aModel[0].rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	//��
	g_player.aModel[1].nIdxModelParent = 0;
	g_player.aModel[1].pos = D3DXVECTOR3(0.0f, 10.0f, 0.0f);
	g_player.aModel[1].rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	//���r
	g_player.aModel[2].nIdxModelParent = 0;
	g_player.aModel[2].pos = D3DXVECTOR3(-5.0f, 7.0f, 0.0f);
	g_player.aModel[2].rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	//����
	g_player.aModel[3].nIdxModelParent = 2;
	g_player.aModel[3].pos = D3DXVECTOR3(-10.0f, 0.0f, 0.0f);
	g_player.aModel[3].rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	//�E�r
	g_player.aModel[4].nIdxModelParent = 0;
	g_player.aModel[4].pos = D3DXVECTOR3(5.0f, 7.0f, 0.0f);
	g_player.aModel[4].rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	//�E��
	g_player.aModel[5].nIdxModelParent = 4;
	g_player.aModel[5].pos = D3DXVECTOR3(10.0f, 0.0f, 0.0f);
	g_player.aModel[5].rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	//����
	g_player.aModel[6].nIdxModelParent = 0;
	g_player.aModel[6].pos = D3DXVECTOR3(-3.0f, -8.0f, 0.0f);
	g_player.aModel[6].rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	//����
	g_player.aModel[7].nIdxModelParent = 6;
	g_player.aModel[7].pos = D3DXVECTOR3(0.0f, -12.0f, 0.0f);
	g_player.aModel[7].rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	//�E��
	g_player.aModel[8].nIdxModelParent = 0;
	g_player.aModel[8].pos = D3DXVECTOR3(3.0f, -8.0f, 0.0f);
	g_player.aModel[8].rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	//�E��
	g_player.aModel[9].nIdxModelParent = 8;
	g_player.aModel[9].pos = D3DXVECTOR3(0.0f, -12.0f, 0.0f);
	g_player.aModel[9].rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);

	//�e�ݒ�
	g_nIdxShadow = SetShadow();
}

//========================
//�I������
//========================
void UninitPlayer(void)
{
	for (int nCntModel = 0; nCntModel < EXITHUMAN_MODEL_NUM; nCntModel++)
	{
		//���b�V���̔j��
		if (g_player.aModel[nCntModel].pMesh != NULL)
		{
			g_player.aModel[nCntModel].pMesh->Release();
			g_player.aModel[nCntModel].pMesh = NULL;
		}

		//�}�e���A���̔j��
		if (g_player.aModel[nCntModel].pBuffMat != NULL)
		{
			g_player.aModel[nCntModel].pBuffMat->Release();
			g_player.aModel[nCntModel].pBuffMat = NULL;
		}
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

	if (GetMouseClickTrigger(MOUSE_CLICK_LEFT) == true)
	{
		SetBullet(g_player.pos + D3DXVECTOR3(0.0f, 40.0f, 0.0f) , BULLET_SPEED, g_player.rot.y, D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
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

	//�v���C���[�ʒu�\��
	PrintDebugProc("Player.Pos = (x = %f, y = %f, z = %f)", g_player.pos.x, g_player.pos.y, g_player.pos.z);

	//"�v���C���[��"���[���h�}�g���b�N�X������
	D3DXMatrixIdentity(&g_player.mtxWorld);

	//�����𔽉f
	D3DXMatrixRotationYawPitchRoll(&mtxRot, g_player.rot.y, g_player.rot.x, g_player.rot.z);
	D3DXMatrixMultiply(&g_player.mtxWorld, &g_player.mtxWorld, &mtxRot);

	//�ʒu���f
	D3DXMatrixTranslation(&mtxTrans, g_player.pos.x, g_player.pos.y, g_player.pos.z);
	D3DXMatrixMultiply(&g_player.mtxWorld, &g_player.mtxWorld, &mtxTrans);

	//"�v���C���[��"���[���h�}�g���b�N�X�ݒ�
	pDevice->SetTransform(D3DTS_WORLD, &g_player.mtxWorld);

	//���݂̃}�e���A���擾
	pDevice->GetMaterial(&matDef);

	for (int nCntModel = 0; nCntModel < EXITHUMAN_MODEL_NUM; nCntModel++)
	{
		D3DXMATRIX mtxRotModel, mtxTransModel;	//�v�Z�p
		D3DXMATRIX mtxParent;					//�e�̃}�g��

		//"���f����"���[���h�}�g���b�N�X������
		D3DXMatrixIdentity(&g_player.aModel[nCntModel].mtxWorld);

		//�����𔽉f
		D3DXMatrixRotationYawPitchRoll(&mtxRotModel, g_player.aModel[nCntModel].rot.y, g_player.aModel[nCntModel].rot.x, g_player.aModel[nCntModel].rot.z);
		D3DXMatrixMultiply(&g_player.aModel[nCntModel].mtxWorld, &g_player.aModel[nCntModel].mtxWorld, &mtxRotModel);

		//�ʒu���f
		D3DXMatrixTranslation(&mtxTransModel, g_player.aModel[nCntModel].pos.x, g_player.aModel[nCntModel].pos.y, g_player.aModel[nCntModel].pos.z);
		D3DXMatrixMultiply(&g_player.aModel[nCntModel].mtxWorld, &g_player.aModel[nCntModel].mtxWorld, &mtxTransModel);

		//�p�[�c�̐e�}�g���ݒ�
		if (g_player.aModel[nCntModel].nIdxModelParent != -1)
		{
			mtxParent = g_player.aModel[g_player.aModel[nCntModel].nIdxModelParent].mtxWorld;
		}
		else
		{
			mtxParent = g_player.mtxWorld;
		}

		//�p�[�c�̃}�g���Ɛe�}�g�����������킹��
		D3DXMatrixMultiply(&g_player.aModel[nCntModel].mtxWorld, &g_player.aModel[nCntModel].mtxWorld, &mtxParent);

		//"�v���C���[��"���[���h�}�g���b�N�X�ݒ�
		pDevice->SetTransform(D3DTS_WORLD, &g_player.aModel[nCntModel].mtxWorld);

		//�}�e���A���f�[�^�ւ̃|�C���^�擾
		pMat = (D3DXMATERIAL*)g_player.aModel[nCntModel].pBuffMat->GetBufferPointer();

		for (int nCntMat = 0; nCntMat < (int)g_player.aModel[nCntModel].dwNumMatModel; nCntMat++)
		{
			//�}�e���A���ݒ�
			pDevice->SetMaterial(&pMat[nCntMat].MatD3D);

			//�e�N�X�`���ݒ�
			pDevice->SetTexture(0, g_player.aModel[nCntModel].apTexture[nCntMat]);

			//���f���`��
			g_player.aModel[nCntModel].pMesh->DrawSubset(nCntMat);
		}
	}

	//�}�e���A����߂�
	pDevice->SetMaterial(&matDef);
}

//========================
//�Ǔ����蔻�菈��
//========================
void CollisionWallPlayer(int nNumber)
{
	if (g_player.pos.x + PLAYER_WIDTH / 2 > MESHFIELD_WIDTH * MESHFIELD_LENGTH / 2)
	{
		g_player.pos.x = MESHFIELD_WIDTH * MESHFIELD_LENGTH / 2 - PLAYER_WIDTH / 2;
	}
	else if (g_player.pos.x - PLAYER_WIDTH / 2 < -MESHFIELD_WIDTH * MESHFIELD_LENGTH / 2)
	{
		g_player.pos.x = -MESHFIELD_WIDTH * MESHFIELD_LENGTH / 2 + PLAYER_WIDTH / 2;
	}

	if (g_player.pos.z + PLAYER_DEPTH / 2 > MESHFIELD_HEIGHT * MESHFIELD_LENGTH / 2)
	{
		g_player.pos.z = MESHFIELD_HEIGHT * MESHFIELD_LENGTH / 2 - PLAYER_DEPTH / 2;
	}
	else if (g_player.pos.z - PLAYER_DEPTH / 2 < -MESHFIELD_HEIGHT * MESHFIELD_LENGTH / 2)
	{
		g_player.pos.z = -MESHFIELD_HEIGHT * MESHFIELD_LENGTH / 2 + PLAYER_DEPTH / 2;
	}
}

//========================
//�I�u�W�F�N�g�����蔻�菈��
//========================
void CollisionObjPlayer(void)
{
	Object *obj = GetObj();
	BluePrint *pBPrint = GetBluePrint();

	for (int nCntObj = 0; nCntObj < BLUEPRINTIDX_MAX; nCntObj++, obj++)
	{
		if (obj->bUse == true)
		{
			if (g_player.pos.z >= obj->pos.z + (pBPrint + obj->bpidx)->vtxMin.z && g_player.pos.z <= obj->pos.z + (pBPrint + obj->bpidx)->vtxMax.z)
			{
				if (g_player.posOld.x <= obj->pos.x + (pBPrint + obj->bpidx)->vtxMin.x && g_player.pos.x > obj->pos.x + (pBPrint + obj->bpidx)->vtxMin.x)
				{
					g_player.pos.x = obj->pos.x + (pBPrint + obj->bpidx)->vtxMin.x;
				}
				if (g_player.posOld.x >= obj->pos.x + (pBPrint + obj->bpidx)->vtxMax.x && g_player.pos.x < obj->pos.x + (pBPrint + obj->bpidx)->vtxMax.x)
				{
					g_player.pos.x = obj->pos.x + (pBPrint + obj->bpidx)->vtxMax.x;
				}
			}

			if (g_player.pos.x >= obj->pos.x + (pBPrint + obj->bpidx)->vtxMin.x && g_player.pos.x <= obj->pos.x + (pBPrint + obj->bpidx)->vtxMax.x)
			{
				if (g_player.posOld.z <= obj->pos.z + (pBPrint + obj->bpidx)->vtxMin.z && g_player.pos.z > obj->pos.z + (pBPrint + obj->bpidx)->vtxMin.z)
				{
					g_player.pos.z = obj->pos.z + (pBPrint + obj->bpidx)->vtxMin.z;
				}
				if (g_player.posOld.z >= obj->pos.z + (pBPrint + obj->bpidx)->vtxMax.z && g_player.pos.z < obj->pos.z + (pBPrint + obj->bpidx)->vtxMax.z)
				{
					g_player.pos.z = obj->pos.z + (pBPrint + obj->bpidx)->vtxMax.z;
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