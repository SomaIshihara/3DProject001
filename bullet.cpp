//==========================================
//
//�e�\���v���O����[bullet.cpp]
//Author:�Ό��D�n
//
//==========================================
#include "main.h"
#include "bullet.h"
#include "shadow.h"
#include "wall.h"
#include "player.h"
#include "object.h"

//�}�N��
#define MAX_BULLET				(128)	//�e�̍ő吔
#define BULLET_TEXSIZE_WIDTH	(12)	//�e�̃T�C�Y�i���j
#define BULLET_TEXSIZE_HEIGHT	(12)	//�e�̃T�C�Y�i�����j

//��
#define POS0	D3DXVECTOR3(-100.0f,0.0f,100.0f)
#define POS1	D3DXVECTOR3(100.0f,0.0f,100.0f)

//�e�\���̂̒�`
typedef struct
{
	D3DXVECTOR3 pos;	//�ʒu
	D3DXVECTOR3 posOld;	//�O��̈ʒu
	D3DXVECTOR3 move;	//�ړ���
	D3DXCOLOR col;		//�e�̐F
	int nLife;			//����
	int nIdxShadow;		//�e�ԍ�
	bool bUse;			//�g���Ă��邩�ǂ���
} Bullet;

void CollisionWallBullet(int nCount);
void CollisionObjBullet(int nCount);

LPDIRECT3DTEXTURE9 g_pTextureBullet;	//�e�N�X�`���|�C���^
LPDIRECT3DVERTEXBUFFER9 g_pVtxbuffBullet;	//���_�o�b�t�@�|�C���^
D3DXMATRIX g_mtxWorldBullet[MAX_BULLET];	//���[���h�}�g���b�N�X
Bullet g_aBullet[MAX_BULLET];			//�e�\����

//========================
//�e����������
//========================
void InitBullet(void)
{
	LPDIRECT3DDEVICE9 pDevice;	//�f�o�C�X�̃|�C���^
	int nCntBullet;				//�J�E���^

	pDevice = GetDevice();	//�f�o�C�X�̎擾

	//�e�N�X�`���ǂݍ���
	D3DXCreateTextureFromFile(pDevice,
		"data\\TEXTURE\\bullet000.png",
		&g_pTextureBullet);

	//�e�\���̂̒��g������
	for (nCntBullet = 0; nCntBullet < MAX_BULLET; nCntBullet++)
	{
		g_aBullet[nCntBullet].pos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
		g_aBullet[nCntBullet].posOld = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
		g_aBullet[nCntBullet].move = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
		g_aBullet[nCntBullet].nLife = 100;
		g_aBullet[nCntBullet].nIdxShadow = -1;
		g_aBullet[nCntBullet].bUse = false;
	}

	//���_�o�b�t�@�̐���
	pDevice->CreateVertexBuffer(sizeof(VERTEX_3D) * 4 * MAX_BULLET,
		D3DUSAGE_WRITEONLY,
		FVF_VERTEX_3D,
		D3DPOOL_MANAGED,
		&g_pVtxbuffBullet,
		NULL);

	VERTEX_3D *pVtx;

	//�o�b�t�@���b�N
	//���_�o�b�t�@�̃��b�N�ƒ��_���ւ̃|�C���^���擾
	g_pVtxbuffBullet->Lock(0, 0, (void **)&pVtx, 0);

	for (nCntBullet = 0; nCntBullet < MAX_BULLET; nCntBullet++,pVtx += 4)
	{
		//���_���W�i���΍��W�j
		pVtx[0].pos = D3DXVECTOR3(-2.0f, 2.0f, 0.0f);
		pVtx[1].pos = D3DXVECTOR3(2.0f, 2.0f, 0.0f);
		pVtx[2].pos = D3DXVECTOR3(-2.0f, -2.0f, 0.0f);
		pVtx[3].pos = D3DXVECTOR3(2.0f, -2.0f, 0.0f);

		//�@���x�N�g��
		pVtx[0].nor = D3DXVECTOR3(0.0f, 0.0f, -1.0f);
		pVtx[1].nor = D3DXVECTOR3(0.0f, 0.0f, -1.0f);
		pVtx[2].nor = D3DXVECTOR3(0.0f, 0.0f, -1.0f);
		pVtx[3].nor = D3DXVECTOR3(0.0f, 0.0f, -1.0f);

		//�J���[
		pVtx[0].col = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);
		pVtx[1].col = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);
		pVtx[2].col = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);
		pVtx[3].col = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);

		//�e�N�X�`�����W
		pVtx[0].tex = D3DXVECTOR2(0.0f, 0.0f);
		pVtx[1].tex = D3DXVECTOR2(1.0f, 0.0f);
		pVtx[2].tex = D3DXVECTOR2(0.0f, 1.0f);
		pVtx[3].tex = D3DXVECTOR2(1.0f, 1.0f);
	}

	//���_�o�b�t�@���A�����b�N
	g_pVtxbuffBullet->Unlock();
}

//========================
//�e�I������
//========================
void UninitBullet(void)
{
	//�e�N�X�`���̔j��
	if (g_pTextureBullet != NULL)
	{
		g_pTextureBullet->Release();
		g_pTextureBullet = NULL;
	}

	//���_�o�b�t�@�̔j��
	if (g_pVtxbuffBullet != NULL)
	{
		g_pVtxbuffBullet->Release();
		g_pVtxbuffBullet = NULL;
	}
}

//========================
//�e�X�V����
//========================
void UpdateBullet(void)
{
	int nCntBullet;		//�J�E���^
	VERTEX_3D *pVtx;	//�ݒ�p�|�C���^

	//���_�o�b�t�@�̃��b�N�ƒ��_���ւ̃|�C���^���擾
	g_pVtxbuffBullet->Lock(0, 0, (void **)&pVtx, 0);

	for (nCntBullet = 0; nCntBullet < MAX_BULLET; nCntBullet++, pVtx += 4)
	{
		if (g_aBullet[nCntBullet].bUse)
		{//�e���g�p����Ă���
			//������ʒu��O��̈ʒu�ɂ���
			g_aBullet[nCntBullet].posOld = g_aBullet[nCntBullet].pos;

			//�ʒu�X�V
			g_aBullet[nCntBullet].pos += g_aBullet[nCntBullet].move;

			//�����蔻��
			CollisionWallBullet(nCntBullet);
			CollisionObjBullet(nCntBullet);

			//�e�ʒu�ݒ�
			SetPositionShadow(g_aBullet[nCntBullet].nIdxShadow, g_aBullet[nCntBullet].pos);

			g_aBullet[nCntBullet].nLife--;
			if (g_aBullet[nCntBullet].nLife <= 0)
			{//�����s����
				g_aBullet[nCntBullet].bUse = false;
				ReleaseIdxShadow(g_aBullet[nCntBullet].nIdxShadow);
			}
		}
	}

	//���_�o�b�t�@���A�����b�N
	g_pVtxbuffBullet->Unlock();
}

//========================
//�e�`�揈��
//========================
void DrawBullet(void)
{
	int nCntBullet;				//�J�E���^
	LPDIRECT3DDEVICE9 pDevice = GetDevice();	//�f�o�C�X�̎擾
	D3DXMATRIX mtxTrans;	//�v�Z�p
	D3DXMATRIX mtxView;		//�r���[�}�g���擾�p

	//Z�e�X�g������
	pDevice->SetRenderState(D3DRS_ZFUNC, D3DCMP_ALWAYS);	//Z�e�X�g���s��Ȃ�
	pDevice->SetRenderState(D3DRS_ZWRITEENABLE, FALSE);	//Z�o�b�t�@�̗L���E�����ݒ�

	for (nCntBullet = 0; nCntBullet < MAX_BULLET; nCntBullet++)
	{
		if (g_aBullet[nCntBullet].bUse)
		{
			//���[���h�}�g���b�N�X������
			D3DXMatrixIdentity(&g_mtxWorldBullet[nCntBullet]);

			//�r���[�}�g���擾
			pDevice->GetTransform(D3DTS_VIEW, &mtxView);

			//�|���S�����J�����ɑ΂��Đ��ʂɌ�����
			D3DXMatrixInverse(&g_mtxWorldBullet[nCntBullet], NULL, &mtxView);
			//�C��
			g_mtxWorldBullet[nCntBullet]._41 = 0.0f;
			g_mtxWorldBullet[nCntBullet]._42 = 0.0f;
			g_mtxWorldBullet[nCntBullet]._43 = 0.0f;

			//�ʒu���f
			D3DXMatrixTranslation(&mtxTrans, g_aBullet[nCntBullet].pos.x, g_aBullet[nCntBullet].pos.y, g_aBullet[nCntBullet].pos.z);
			D3DXMatrixMultiply(&g_mtxWorldBullet[nCntBullet], &g_mtxWorldBullet[nCntBullet], &mtxTrans);
		}
	}

	//���_�o�b�t�@���f�[�^�X�g���[���ɐݒ�
	pDevice->SetStreamSource(0, g_pVtxbuffBullet, 0, sizeof(VERTEX_3D));

	//���_�t�H�[�}�b�g�̐ݒ�
	pDevice->SetFVF(FVF_VERTEX_3D);

	//�e�N�X�`���ݒ�
	pDevice->SetTexture(0, g_pTextureBullet);

	for (nCntBullet = 0; nCntBullet < MAX_BULLET; nCntBullet++)
	{
		if (g_aBullet[nCntBullet].bUse)
		{
			//���[���h�}�g���b�N�X�ݒ�
			pDevice->SetTransform(D3DTS_WORLD, &g_mtxWorldBullet[nCntBullet]);

			pDevice->DrawPrimitive(D3DPT_TRIANGLESTRIP, 4 * nCntBullet, 2);
		}
	}

	//Z�e�X�g�L����
	pDevice->SetRenderState(D3DRS_ZFUNC, D3DCMP_LESSEQUAL);	//Z�e�X�g���s��Ȃ�
	pDevice->SetRenderState(D3DRS_ZWRITEENABLE, TRUE);	//Z�o�b�t�@�̗L���E�����ݒ�
}

//========================
//�e�ݒ菈��
//========================
void SetBullet(D3DXVECTOR3 pos, float fSpeed,float fRot, D3DXCOLOR col)
{
	int nCntBullet;		//�J�E���^

	for (nCntBullet = 0; nCntBullet < MAX_BULLET; nCntBullet++)
	{
		if (!g_aBullet[nCntBullet].bUse)
		{
			//���W�i���S�j�ݒ�
			g_aBullet[nCntBullet].pos = pos;

			//�F�ݒ�
			g_aBullet[nCntBullet].col = col;

			//�ړ��ʌv�Z
			g_aBullet[nCntBullet].move.x = -sinf(fRot) * fSpeed;
			g_aBullet[nCntBullet].move.z = -cosf(fRot) * fSpeed;

			//�����ݒ�
			g_aBullet[nCntBullet].nLife = 1000;

			//�e�ԍ��ݒ�
			g_aBullet[nCntBullet].nIdxShadow = SetShadow();

			//�g�p���Ă��邱�Ƃɂ���
			g_aBullet[nCntBullet].bUse = true;

			//������
			break;
		}
	}
}

//========================
//�e�����蔻�菈��
//========================
void CollisionWallBullet(int nCount)
{
	Wall *wall = GetWall();
	D3DXVECTOR3 pos0, pos1;
	D3DXVECTOR3 vecLine;
	D3DXVECTOR3 vecToPos;

	for (int nCntWall = 0; nCntWall < MAX_WALL; nCntWall++, wall++)
	{
		//�g���Ă���Ƃ���������
		if (wall->bUse == true)
		{
			//�ʒu�v�Z
			pos0.x = wall->pos.x - (wall->fWidth / 2) * cosf(wall->rot.y);
			pos0.y = 0.0f;
			pos0.z = wall->pos.z + (wall->fWidth / 2) * sinf(wall->rot.y);

			pos1.x = wall->pos.x + (wall->fWidth / 2) * cosf(wall->rot.y);
			pos1.y = 0.0f;
			pos1.z = wall->pos.z - (wall->fWidth / 2) * sinf(wall->rot.y);

			vecLine = pos1 - pos0;	//���E���x�N�g��
			vecToPos = g_aBullet[nCount].pos - pos0;

			if ((vecLine.z * vecToPos.x) - (vecLine.x * vecToPos.z) <= 0)
			{
				g_aBullet[nCount].bUse = false;
				ReleaseIdxShadow(g_aBullet[nCount].nIdxShadow);
			}
		}
	}
}

//========================
//�e�����蔻�菈��
//========================
void CollisionObjBullet(int nCount)
{
	Object *obj = GetObj();
	D3DXVECTOR3 pos0x, pos1x, pos0z, pos1z;
	D3DXVECTOR3 vecLinex, vecToPosx, vecLinez, vecToPosz;
	D3DXVECTOR3 vecMove;
	float fAreaA, fAreaB;

	for (int nCntObj = 0; nCntObj < MAX_OBJECT; nCntObj++, obj++)
	{
		if (obj->bUse == true)
		{
			//�e2���_���߂�
			pos0x = obj->pos + D3DXVECTOR3(obj->vtxMin.x, 0.0f, 0.0f);
			pos1x = obj->pos + D3DXVECTOR3(obj->vtxMax.x, 0.0f, 0.0f);
			pos0z = obj->pos + D3DXVECTOR3(0.0f, 0.0f, obj->vtxMax.z);
			pos1z = obj->pos + D3DXVECTOR3(0.0f, 0.0f, obj->vtxMin.z);

			//�x�N�g�����߂�
			//move
			vecMove = g_aBullet[nCount].pos - g_aBullet[nCount].posOld;

			//X
			vecLinex = pos1x - pos0x;
			vecToPosx = g_aBullet[nCount].pos - pos0x;

			//Z
			vecLinez = pos1z - pos0z;
			vecToPosz = g_aBullet[nCount].pos - pos0z;

			//�����蔻��{��
			for (int nCount = 0; nCount < 2; nCount++)//��
			{
				//X
				//�ʐϋ��߂�
				fAreaA = (vecToPosx.z * vecMove.x) - (vecToPosx.x * vecMove.z);
				fAreaB = (vecLinex.z * vecMove.x) - (vecLinex.x * vecMove.z);

				//����AND�͈͓�
				if ((vecLinex.z * vecToPosx.x) - (vecLinex.x * vecToPosx.z) <= 0 && fAreaA / fAreaB >= 0.0f && fAreaA / fAreaB <= 1.0f)
				{
					g_aBullet[nCount].bUse = false;
					ReleaseIdxShadow(g_aBullet[nCount].nIdxShadow);
				}

				//Z
				//�ʐϋ��߂�
				fAreaA = (vecToPosz.z * vecMove.x) - (vecToPosz.x * vecMove.z);
				fAreaB = (vecLinez.z * vecMove.x) - (vecLinez.x * vecMove.z);

				//����AND�͈͓�
				if ((vecLinez.z * vecToPosz.x) - (vecLinez.x * vecToPosz.z) <= 0 && fAreaA / fAreaB >= 0.0f && fAreaA / fAreaB <= 1.0f)
				{
					g_aBullet[nCount].bUse = false;
					ReleaseIdxShadow(g_aBullet[nCount].nIdxShadow);
				}

				//�x�N�g�����]
				//X
				vecLinex.x *= -1.0f;
				vecLinex.y *= -1.0f;
				vecLinex.z *= -1.0f;
				vecToPosx.x *= -1.0f;
				vecToPosx.y *= -1.0f;
				vecToPosx.z *= -1.0f;

				//Z
				vecLinez.x *= -1.0f;
				vecLinez.y *= -1.0f;
				vecLinez.z *= -1.0f;
				vecToPosz.x *= -1.0f;
				vecToPosz.y *= -1.0f;
				vecToPosz.z *= -1.0f;
			}
		}
	}
}