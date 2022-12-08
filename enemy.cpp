//==========================================
//
//�v���C���[�v���O����[enemy.cpp]
//Author:�Ό��D�n
//
//==========================================
#include "main.h"
#include "enemy.h"
#include "input.h"
#include "shadow.h"
#include "camera.h"
#include "bullet.h"
#include "wall.h"
#include "object.h"
#include "debugproc.h"
#include <assert.h>

//�}�N��
#define ENEMY_MOVE_SPEED	(5.0f)	//�v���C���[�ړ����x
#define DUMP_COEF			(0.4f)	//�����W��

//��
#define ENEMY_WIDTH		(20.0f)
#define ENEMY_DEPTH		(15.0f)

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
void CollisionWallEnemy(int nNumber);
void CollisionObjEnemy(void);

//�O���[�o���ϐ�
Enemy g_enemy[MAX_ENEMY];

//�t�@�C����
const char *c_pFileNameEnemy[] =
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
void InitEnemy(void)
{
	LPDIRECT3DDEVICE9 pDevice = GetDevice();	//�f�o�C�X�̎擾

	//�G�ɏ���ǉ�
	for (int nCntEnemy = 0; nCntEnemy < MAX_ENEMY; nCntEnemy++)
	{
		//�ϐ�������
		g_enemy[nCntEnemy].pos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
		g_enemy[nCntEnemy].posOld = D3DXVECTOR3(0.0f, 0.0f, 0.0f);

		g_enemy[nCntEnemy].move = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
		g_enemy[nCntEnemy].rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);

		//�g�p���f���擾
		g_enemy[nCntEnemy].pModel = GetModel(MODELNAME_EXITHUMAN);

		//�Ίp���̒����E�p�x
		g_enemy[nCntEnemy].fLength = sqrtf(ENEMY_WIDTH * ENEMY_WIDTH + ENEMY_DEPTH * ENEMY_DEPTH) * 0.5f;
		g_enemy[nCntEnemy].fAngle = atan2f(ENEMY_WIDTH, ENEMY_DEPTH);

		//�e�ݒ�
		g_enemy[nCntEnemy].nIdxShadow = SetShadow();
	}
}

//========================
//�I������
//========================
void UninitEnemy(void)
{
	for (int nCntModel = 0; nCntModel < EXITHUMAN_MODEL_NUM; nCntModel++)
	{
		//���b�V���̔j��
		if (g_enemy[].aModel[nCntModel].pMesh != NULL)
		{
			g_enemy[].aModel[nCntModel].pMesh->Release();
			g_enemy[].aModel[nCntModel].pMesh = NULL;
		}

		//�}�e���A���̔j��
		if (g_enemy[].aModel[nCntModel].pBuffMat != NULL)
		{
			g_enemy[].aModel[nCntModel].pBuffMat->Release();
			g_enemy[].aModel[nCntModel].pBuffMat = NULL;
		}
	}
}

//========================
//�X�V����
//========================
void UpdateEnemy(void)
{
	//���݂̈ʒu��O��̈ʒu�ɂ���
	g_enemy[].posOld = g_enemy[].pos;

	//�J���������ɉ����ăv���C���[�̌�������
	if (GetMouseClickPress(MOUSE_CLICK_LEFT) == true)
	{
		g_enemy[].rot.y = -(float)fmod(GetCamera()->rot.y + 1.0f * D3DX_PI + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
	}

	//���f���ړ�
	if (GetKeyboardPress(DIK_W) == true)
	{
		if (GetKeyboardPress(DIK_A) == true)
		{
			g_enemy[].rot.y = -(float)fmod(GetCamera()->rot.y + ROT_WA + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
			g_enemy[].move.x = sinf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
			g_enemy[].move.z = cosf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
		}
		else if (GetKeyboardPress(DIK_D) == true)
		{
			g_enemy[].rot.y = -(float)fmod(GetCamera()->rot.y + ROT_WD + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
			g_enemy[].move.x = sinf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
			g_enemy[].move.z = cosf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
		}
		else
		{
			g_enemy[].rot.y = -(float)fmod(GetCamera()->rot.y + ROT_W + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
			g_enemy[].move.x = sinf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
			g_enemy[].move.z = cosf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
		}
	}
	else if (GetKeyboardPress(DIK_S) == true)
	{
		if (GetKeyboardPress(DIK_A) == true)
		{
			g_enemy[].rot.y = -(float)fmod(GetCamera()->rot.y + ROT_SA + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
			g_enemy[].move.x = sinf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
			g_enemy[].move.z = cosf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
		}
		else if (GetKeyboardPress(DIK_D) == true)
		{
			g_enemy[].rot.y = -(float)fmod(GetCamera()->rot.y + ROT_SD + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
			g_enemy[].move.x = sinf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
			g_enemy[].move.z = cosf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
		}
		else
		{
			g_enemy[].rot.y = -(float)fmod(GetCamera()->rot.y + ROT_S + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
			g_enemy[].move.x = sinf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
			g_enemy[].move.z = cosf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
		}
	}
	else if (GetKeyboardPress(DIK_A) == true)
	{
		g_enemy[].rot.y = -(float)fmod(GetCamera()->rot.y + ROT_A + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
		g_enemy[].move.x = sinf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
		g_enemy[].move.z = cosf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
	}
	else if (GetKeyboardPress(DIK_D) == true)
	{
		g_enemy[].rot.y = -(float)fmod(GetCamera()->rot.y + ROT_D + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
		g_enemy[].move.x = sinf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
		g_enemy[].move.z = cosf((float)fmod((g_enemy[].rot.y + D3DX_PI) + (D3DX_PI + (D3DX_PI * 2)), D3DX_PI * 2) - D3DX_PI) * ENEMY_MOVE_SPEED;
	}

	//�{�^������ɉ����ăv���C���[�E�J�������_�E�����_�ړ�
	g_enemy[].pos.x += g_enemy[].move.x;
	g_enemy[].pos.z += g_enemy[].move.z;

	//�Ǔ����蔻��
	//CollisionWallEnemy(0);

	//�I�u�W�F�N�g�����蔻��
	CollisionObjEnemy();

	GetCamera()->posV.x += g_enemy[].pos.x - g_enemy[].posOld.x;
	GetCamera()->posV.z += g_enemy[].pos.z - g_enemy[].posOld.z;
	GetCamera()->posR.x += g_enemy[].pos.x - g_enemy[].posOld.x;
	GetCamera()->posR.z += g_enemy[].pos.z - g_enemy[].posOld.z;

	//�ړ��ʌ���
	g_enemy[].move.x += (0 - g_enemy[].move.x) * DUMP_COEF;
	g_enemy[].move.z += (0 - g_enemy[].move.z) * DUMP_COEF;

	if (GetMouseClickTrigger(MOUSE_CLICK_LEFT) == true)
	{
		SetBullet(g_enemy[].pos + D3DXVECTOR3(0.0f, 40.0f, 0.0f) , 5.0f, g_enemy[].rot.y, D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
	}

	//�e�ʒu�ݒ�
	SetPositionShadow(g_nIdxShadow, g_enemy[].pos);
}

//========================
//�`�揈��
//========================
void DrawEnemy(void)
{
	LPDIRECT3DDEVICE9 pDevice = GetDevice();	//�f�o�C�X�̎擾
	D3DXMATRIX mtxRot, mtxTrans;	//�v�Z�p
	D3DMATERIAL9 matDef;			//���݂̃}�e���A���ۑ��p
	D3DXMATERIAL *pMat;				//�}�e���A���f�[�^�ւ̃|�C���^

	//"�v���C���[��"���[���h�}�g���b�N�X������
	D3DXMatrixIdentity(&g_enemy[].mtxWorld);

	//�����𔽉f
	D3DXMatrixRotationYawPitchRoll(&mtxRot, g_enemy[].rot.y, g_enemy[].rot.x, g_enemy[].rot.z);
	D3DXMatrixMultiply(&g_enemy[].mtxWorld, &g_enemy[].mtxWorld, &mtxRot);

	//�ʒu���f
	D3DXMatrixTranslation(&mtxTrans, g_enemy[].pos.x, g_enemy[].pos.y, g_enemy[].pos.z);
	D3DXMatrixMultiply(&g_enemy[].mtxWorld, &g_enemy[].mtxWorld, &mtxTrans);

	//"�v���C���[��"���[���h�}�g���b�N�X�ݒ�
	pDevice->SetTransform(D3DTS_WORLD, &g_enemy[].mtxWorld);

	//���݂̃}�e���A���擾
	pDevice->GetMaterial(&matDef);

	for (int nCntModel = 0; nCntModel < EXITHUMAN_MODEL_NUM; nCntModel++)
	{
		D3DXMATRIX mtxRotModel, mtxTransModel;	//�v�Z�p
		D3DXMATRIX mtxParent;					//�e�̃}�g��

		//"���f����"���[���h�}�g���b�N�X������
		D3DXMatrixIdentity(&g_enemy[].aModel[nCntModel].mtxWorld);

		//�����𔽉f
		D3DXMatrixRotationYawPitchRoll(&mtxRotModel, g_enemy[].aModel[nCntModel].rot.y, g_enemy[].aModel[nCntModel].rot.x, g_enemy[].aModel[nCntModel].rot.z);
		D3DXMatrixMultiply(&g_enemy[].aModel[nCntModel].mtxWorld, &g_enemy[].aModel[nCntModel].mtxWorld, &mtxRotModel);

		//�ʒu���f
		D3DXMatrixTranslation(&mtxTransModel, g_enemy[].aModel[nCntModel].pos.x, g_enemy[].aModel[nCntModel].pos.y, g_enemy[].aModel[nCntModel].pos.z);
		D3DXMatrixMultiply(&g_enemy[].aModel[nCntModel].mtxWorld, &g_enemy[].aModel[nCntModel].mtxWorld, &mtxTransModel);

		//�p�[�c�̐e�}�g���ݒ�
		if (g_enemy[].aModel[nCntModel].nIdxModelParent != -1)
		{
			mtxParent = g_enemy[].aModel[g_enemy[].aModel[nCntModel].nIdxModelParent].mtxWorld;
		}
		else
		{
			mtxParent = g_enemy[].mtxWorld;
		}

		//�p�[�c�̃}�g���Ɛe�}�g�����������킹��
		D3DXMatrixMultiply(&g_enemy[].aModel[nCntModel].mtxWorld, &g_enemy[].aModel[nCntModel].mtxWorld, &mtxParent);

		//"�v���C���[��"���[���h�}�g���b�N�X�ݒ�
		pDevice->SetTransform(D3DTS_WORLD, &g_enemy[].aModel[nCntModel].mtxWorld);

		//�}�e���A���f�[�^�ւ̃|�C���^�擾
		pMat = (D3DXMATERIAL*)g_enemy[].aModel[nCntModel].pBuffMat->GetBufferPointer();

		for (int nCntMat = 0; nCntMat < (int)g_enemy[].aModel[nCntModel].dwNumMatModel; nCntMat++)
		{
			//�}�e���A���ݒ�
			pDevice->SetMaterial(&pMat[nCntMat].MatD3D);

			//�e�N�X�`���ݒ�
			pDevice->SetTexture(0, g_enemy[].aModel[nCntModel].apTexture[nCntMat]);

			//���f���`��
			g_enemy[].aModel[nCntModel].pMesh->DrawSubset(nCntMat);
		}
	}

	//�}�e���A����߂�
	pDevice->SetMaterial(&matDef);
}

//========================
//�Ǔ����蔻�菈��
//========================
void CollisionWallEnemy(int nNumber)
{
	if (g_enemy[].pos.x + ENEMY_WIDTH / 2 > WALL_WIDTH / 2)
	{
		g_enemy[].pos.x = WALL_WIDTH / 2 - ENEMY_WIDTH / 2;
	}
	else if (g_enemy[].pos.x - ENEMY_WIDTH / 2 < -WALL_WIDTH / 2)
	{
		g_enemy[].pos.x = -WALL_WIDTH / 2 + ENEMY_WIDTH / 2;
	}

	if (g_enemy[].pos.z + ENEMY_DEPTH / 2 > WALL_DEPTH / 2)
	{
		g_enemy[].pos.z = WALL_DEPTH / 2 - ENEMY_DEPTH / 2;
	}
	else if (g_enemy[].pos.z - ENEMY_DEPTH / 2 < -WALL_DEPTH / 2)
	{
		g_enemy[].pos.z = -WALL_DEPTH / 2 + ENEMY_DEPTH / 2;
	}
}

//========================
//�I�u�W�F�N�g�����蔻�菈��
//========================
void CollisionObjEnemy(void)
{
	Object *obj = GetObj();
	BluePrint *pBPrint = GetBluePrint();

	for (int nCntObj = 0; nCntObj < MAX_BLUEPRINT; nCntObj++, obj++)
	{
		if (obj->bUse == true)
		{
			if (g_enemy[].pos.z >= obj->pos.z + pBPrint->vtxMin.z && g_enemy[].pos.z <= obj->pos.z + pBPrint->vtxMax.z)
			{
				if (g_enemy[].posOld.x <= obj->pos.x + pBPrint->vtxMin.x && g_enemy[].pos.x > obj->pos.x + pBPrint->vtxMin.x)
				{
					g_enemy[].pos.x = obj->pos.x + pBPrint->vtxMin.x;
				}
				if (g_enemy[].posOld.x >= obj->pos.x + pBPrint->vtxMax.x && g_enemy[].pos.x < obj->pos.x + pBPrint->vtxMax.x)
				{
					g_enemy[].pos.x = obj->pos.x + pBPrint->vtxMax.x;
				}
			}

			if (g_enemy[].pos.x >= obj->pos.x + pBPrint->vtxMin.x && g_enemy[].pos.x <= obj->pos.x + pBPrint->vtxMax.x)
			{
				if (g_enemy[].posOld.z <= obj->pos.z + pBPrint->vtxMin.z && g_enemy[].pos.z > obj->pos.z + pBPrint->vtxMin.z)
				{
					g_enemy[].pos.z = obj->pos.z + pBPrint->vtxMin.z;
				}
				if (g_enemy[].posOld.z >= obj->pos.z + pBPrint->vtxMax.z && g_enemy[].pos.z < obj->pos.z + pBPrint->vtxMax.z)
				{
					g_enemy[].pos.z = obj->pos.z + pBPrint->vtxMax.z;
				}
			}
		}
	}
}

//========================
//�擾����
//========================
Enemy *GetEnemy(void)
{
	return &g_enemy[];
}