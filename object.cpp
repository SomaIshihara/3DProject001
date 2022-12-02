//==========================================
//
//���f���֌W�v���O����[object.cpp]
//Author:�Ό��D�n
//
//==========================================
#include "main.h"
#include "object.h"
#include "input.h"
#include "shadow.h"
#include "camera.h"
#include "bullet.h"

//�}�N��
#define OBJ_MOVE_SPEED	(1.0f)	//���f���ړ����x
#define OBJ_RED_ALPHA		(0.3f)	//�Ԃ���̕s�����x
#define OBJ_DAMAGE_TIME	(5)		//�_���[�W��Ԃɂ��鎞��(F)

//�O���[�o���ϐ�
Object g_aObject[MAX_OBJECT];

//�t�@�C���p�X
const char* c_apFilePathObject[] =
{
	"data\\MODEL\\obj_branco_01.x",
	"data\\MODEL\\takibi001.x"
};

//========================
//����������
//========================
void InitObject(void)
{
	LPDIRECT3DDEVICE9 pDevice = GetDevice();	//�f�o�C�X�̎擾
	D3DXMATERIAL *pMat;	//�}�e���A���|�C���^
	int nNumVtx;		//���_��
	DWORD dwSizeFVF;	//���_�t�H�[�}�b�g�̃T�C�Y
	BYTE *pVtxBuff;		//���_�o�b�t�@�|�C���^

	//�ϐ�������
	for (int nCntModel = 0; nCntModel < MAX_OBJECT && nCntModel < (sizeof c_apFilePathObject / sizeof(char *)); nCntModel++)
	{
		g_aObject[nCntModel].pos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
		g_aObject[nCntModel].rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
		g_aObject[nCntModel].state = OBJSTATE_MAX;
		g_aObject[nCntModel].nLife = 5;
		g_aObject[nCntModel].nCounterState = 0;

		//X�t�@�C���ǂݍ���		
		if (SUCCEEDED(D3DXLoadMeshFromX(
			c_apFilePathObject[nCntModel],
			D3DXMESH_SYSTEMMEM,
			pDevice,
			NULL,
			&g_aObject[nCntModel].pBuffMat,
			NULL,
			&g_aObject[nCntModel].dwNumMat,
			&g_aObject[nCntModel].pMesh)))
		{
			//���_�����擾
			nNumVtx = g_aObject[nCntModel].pMesh->GetNumVertices();

			//���_�t�H�[�}�b�g
			dwSizeFVF = D3DXGetFVFVertexSize(g_aObject[nCntModel].pMesh->GetFVF());

			//���_�o�b�t�@���b�N
			g_aObject[nCntModel].pMesh->LockVertexBuffer(D3DLOCK_READONLY, (void **)&pVtxBuff);

			//�ŏ������S�������
			D3DXVECTOR3 vtx = *(D3DXVECTOR3 *)pVtxBuff;

			g_aObject[nCntModel].vtxMax = vtx;
			g_aObject[nCntModel].vtxMin = vtx;

			pVtxBuff += dwSizeFVF;

			for (int nCntVtx = 1; nCntVtx < nNumVtx; nCntVtx++, pVtxBuff += dwSizeFVF)
			{
				D3DXVECTOR3 vtx = *(D3DXVECTOR3 *)pVtxBuff;

				if (g_aObject[nCntModel].vtxMax.x < vtx.x)
				{
					g_aObject[nCntModel].vtxMax.x = vtx.x;
				}
				if (g_aObject[nCntModel].vtxMax.z < vtx.z)
				{
					g_aObject[nCntModel].vtxMax.z = vtx.z;
				}
				if (g_aObject[nCntModel].vtxMin.x > vtx.x)
				{
					g_aObject[nCntModel].vtxMin.x = vtx.x;
				}
				if (g_aObject[nCntModel].vtxMin.z > vtx.z)
				{
					g_aObject[nCntModel].vtxMin.z = vtx.z;
				}
			}

			//���_�o�b�t�@�A�����b�N
			g_aObject[nCntModel].pMesh->UnlockVertexBuffer();

			//�e�N�X�`���ǂݍ���
			//�}�e���A�����ɑ΂���|�C���^�擾
			pMat = (D3DXMATERIAL *)g_aObject[nCntModel].pBuffMat->GetBufferPointer();

			for (int nCntTex = 0; nCntTex < (int)g_aObject[nCntModel].dwNumMat; nCntTex++)
			{
				if (pMat[nCntTex].pTextureFilename != NULL)
				{
					//�e�N�X�`���ǂݍ���
					D3DXCreateTextureFromFile(pDevice,
						pMat[nCntTex].pTextureFilename,
						&g_aObject[nCntModel].apTexture[nCntTex]);
				}
			}

			//�e�ݒ�
			g_aObject[nCntModel].nIdxShadow = SetShadow();

			//�\��
			g_aObject[nCntModel].bUse = true;
		}
		else
		{
			//��\��
			g_aObject[nCntModel].bUse = false;
		}
	}
	g_aObject[0].pos = D3DXVECTOR3(100.0f, 7.0f, 100.0f);
	g_aObject[1].pos = D3DXVECTOR3(-100.0f, 0.0f, 100.0f);
}

//========================
//�I������
//========================
void UninitObject(void)
{
	for (int nCount = 0; nCount < MAX_OBJECT; nCount++)
	{
		//���b�V���̔j��
		if (g_aObject[nCount].pMesh != NULL)
		{
			g_aObject[nCount].pMesh->Release();
			g_aObject[nCount].pMesh = NULL;
		}

		//�}�e���A���̔j��
		if (g_aObject[nCount].pBuffMat != NULL)
		{
			g_aObject[nCount].pBuffMat->Release();
			g_aObject[nCount].pBuffMat = NULL;
		}
	}
}

//========================
//�X�V����
//========================
void UpdateObject(void)
{
	for (int nCount = 0; nCount < MAX_OBJECT; nCount++)
	{
		if (g_aObject[nCount].bUse == true)
		{
			//��Ԃɉ����ď���
			switch (g_aObject[nCount].state)
			{
			case OBJSTATE_NONE:
				break;
			case OBJSTATE_DAMAGE:
				g_aObject[nCount].nCounterState--;
				if (g_aObject[nCount].nCounterState <= 0)
				{
					g_aObject[nCount].state = OBJSTATE_NONE;
				}
				break;
			case OBJSTATE_BROKEN:
				break;
			}

			//�e�ʒu�ݒ�
			SetPositionShadow(g_aObject[nCount].nIdxShadow, g_aObject[nCount].pos);
		}
	}
}

//========================
//�`�揈��
//========================
void DrawObject(void)
{
	LPDIRECT3DDEVICE9 pDevice = GetDevice();	//�f�o�C�X�̎擾
	D3DXMATRIX mtxRot, mtxTrans;	//�v�Z�p
	D3DMATERIAL9 matDef;			//���݂̃}�e���A���ۑ��p
	D3DXMATERIAL *pMat;				//�}�e���A���f�[�^�ւ̃|�C���^

	//���݂̃}�e���A���擾
	pDevice->GetMaterial(&matDef);

	for (int nCount = 0; nCount < MAX_OBJECT; nCount++)
	{
		if (g_aObject[nCount].bUse == true)
		{
			//���[���h�}�g���b�N�X������
			D3DXMatrixIdentity(&g_aObject[nCount].mtxWorld);

			//�����𔽉f
			D3DXMatrixRotationYawPitchRoll(&mtxRot, g_aObject[nCount].rot.y, g_aObject[nCount].rot.x, g_aObject[nCount].rot.z);
			D3DXMatrixMultiply(&g_aObject[nCount].mtxWorld, &g_aObject[nCount].mtxWorld, &mtxRot);

			//�ʒu���f
			D3DXMatrixTranslation(&mtxTrans, g_aObject[nCount].pos.x, g_aObject[nCount].pos.y, g_aObject[nCount].pos.z);
			D3DXMatrixMultiply(&g_aObject[nCount].mtxWorld, &g_aObject[nCount].mtxWorld, &mtxTrans);

			//���[���h�}�g���b�N�X�ݒ�
			pDevice->SetTransform(D3DTS_WORLD, &g_aObject[nCount].mtxWorld);

			//�}�e���A���f�[�^�ւ̃|�C���^�擾
			pMat = (D3DXMATERIAL*)g_aObject[nCount].pBuffMat->GetBufferPointer();

			for (int nCntMat = 0; nCntMat < (int)g_aObject[nCount].dwNumMat; nCntMat++)
			{
				//�}�e���A���ݒ�
				D3DMATERIAL9 changeMat = pMat[nCntMat].MatD3D;
				//�_���[�W��ԂȂ�Ԓǉ�
				if (g_aObject[nCount].state == OBJSTATE_DAMAGE)
				{
					changeMat.Diffuse.r = 1.0f * OBJ_RED_ALPHA + pMat[nCntMat].MatD3D.Diffuse.r * (1.0f - OBJ_RED_ALPHA);
					changeMat.Diffuse.g = 0.0f * OBJ_RED_ALPHA + pMat[nCntMat].MatD3D.Diffuse.g * (1.0f - OBJ_RED_ALPHA);
					changeMat.Diffuse.b = 0.0f * OBJ_RED_ALPHA + pMat[nCntMat].MatD3D.Diffuse.b * (1.0f - OBJ_RED_ALPHA);
				}
				pDevice->SetMaterial(&changeMat);

				//�e�N�X�`���ݒ�
				pDevice->SetTexture(0, g_aObject[nCount].apTexture[nCntMat]);

				//���f���`��
				g_aObject[nCount].pMesh->DrawSubset(nCntMat);
			}
		}
	}
	
	//�}�e���A����߂�
	pDevice->SetMaterial(&matDef);
}

//========================
//�擾����
//========================
Object *GetObj(void)
{
	return &g_aObject[0];
}

//========================
//�����������̏���
//========================
void HitObj(int nNumObj)
{
	g_aObject[nNumObj].nLife--;
	if (g_aObject[nNumObj].nLife <= 0)
	{//�Ԃ�����[������
		DestroyObj(nNumObj);
		ReleaseIdxShadow(g_aObject[nNumObj].nIdxShadow);
	}
	else
	{
		g_aObject[nNumObj].state = OBJSTATE_DAMAGE;
		g_aObject[nNumObj].nCounterState = OBJ_DAMAGE_TIME;
	}
}

//========================
//�Ԃ�����[������
//========================
void DestroyObj(int nNumObj)
{
	g_aObject[nNumObj].bUse = false;
}