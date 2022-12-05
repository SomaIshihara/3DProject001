//==========================================
//
//���f���֌W�v���O����[model.cpp]
//Author:�Ό��D�n
//
//==========================================
#include "main.h"
#include "model.h"
#include "input.h"
#include "shadow.h"
#include "camera.h"
#include "bullet.h"

//�}�N��
#define MODEL_MOVE_SPEED	(1.0f)	//���f���ړ����x

//�O���[�o���ϐ�
LPD3DXMESH g_pMeshModel = NULL;			//���b�V���ւ̃|�C���^
LPD3DXBUFFER g_pBuffMatModel = NULL;	//�}�e���A���ւ̃|�C���^
DWORD g_dwNumMatModel = 0;				//�}�e���A����
D3DXVECTOR3 g_posModel;					//�ʒu
D3DXVECTOR3 g_rotModel;					//����
D3DXMATRIX g_mtxWorldModel;				//���[���h�}�g���b�N�X
LPDIRECT3DTEXTURE9 g_apTexturemodel[16] = {};	//�e�N�X�`���|�C���^
//int g_nIdxShadow = -1;

//========================
//����������
//========================
void InitModel(void)
{
	LPDIRECT3DDEVICE9 pDevice = GetDevice();	//�f�o�C�X�̎擾

	//�ϐ�������
	g_posModel = D3DXVECTOR3(0.0f, 10.0f, 0.0f);
	g_rotModel = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	//g_nIdxShadow = -1;

	//X�t�@�C���ǂݍ���
	D3DXLoadMeshFromX(
		"data\\MODEL\\car000.x",
		D3DXMESH_SYSTEMMEM,
		pDevice,
		NULL,
		&g_pBuffMatModel,
		NULL,
		&g_dwNumMatModel,
		&g_pMeshModel);

	//�i�{���͓ǂݍ��߂����`�F�b�N������j

	//�e�N�X�`���ǂݍ���
	D3DXMATERIAL *pMat;	//�}�e���A���|�C���^

	//�}�e���A�����ɑ΂���|�C���^�擾
	pMat = (D3DXMATERIAL *)g_pBuffMatModel->GetBufferPointer();

	for (int nCntTex = 0; nCntTex < (int)g_dwNumMatModel; nCntTex++)
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
	//g_nIdxShadow = SetShadow();
}

//========================
//�I������
//========================
void UninitModel(void)
{
	//���b�V���̔j��
	if (g_pMeshModel != NULL)
	{
		g_pMeshModel->Release();
		g_pMeshModel = NULL;
	}

	//�}�e���A���̔j��
	if (g_pBuffMatModel != NULL)
	{
		g_pBuffMatModel->Release();
		g_pBuffMatModel = NULL;
	}
}

//========================
//�X�V����
//========================
void UpdateModel(void)
{
	//���f���ړ�
	if (GetKeyboardPress(DIK_A) == true)
	{//-0.5pi[rad]
		g_posModel.x += -cosf(GetCamera()->rot.y) * MODEL_MOVE_SPEED;
		g_posModel.z += -sinf(GetCamera()->rot.y) * MODEL_MOVE_SPEED;
		g_rotModel.y = -(float)fmod(GetCamera()->rot.y - 0.5f * D3DX_PI + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
	}
	else if (GetKeyboardPress(DIK_D) == true)
	{//0.5pi[rad]
		g_posModel.x += cosf(GetCamera()->rot.y) * MODEL_MOVE_SPEED;
		g_posModel.z += sinf(GetCamera()->rot.y) * MODEL_MOVE_SPEED;
		g_rotModel.y = -(float)fmod(GetCamera()->rot.y + 0.5f * D3DX_PI + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
	}

	if (GetKeyboardPress(DIK_W) == true)
	{//1.0pi[rad]
		g_posModel.x += -sinf(GetCamera()->rot.y) * MODEL_MOVE_SPEED;
		g_posModel.z += cosf(GetCamera()->rot.y) * MODEL_MOVE_SPEED;
		g_rotModel.y = -(float)fmod(GetCamera()->rot.y + 1.0f * D3DX_PI + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
	}
	else if (GetKeyboardPress(DIK_S) == true)
	{//0.0pi[rad]
		g_posModel.x += sinf(GetCamera()->rot.y) * MODEL_MOVE_SPEED;
		g_posModel.z += -cosf(GetCamera()->rot.y) * MODEL_MOVE_SPEED;
		g_rotModel.y = -(float)fmod(GetCamera()->rot.y + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
	}

	if (GetKeyboardTrigger(DIK_SPACE) == true)
	{
		SetBullet(g_posModel, 5.0f, g_rotModel.y, D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
	}

	//�e�ʒu�ݒ�
	//SetPositionShadow(g_nIdxShadow, g_posModel);
}

//========================
//�`�揈��
//========================
void DrawModel(void)
{
	LPDIRECT3DDEVICE9 pDevice = GetDevice();	//�f�o�C�X�̎擾
	D3DXMATRIX mtxRot, mtxTrans;	//�v�Z�p
	D3DMATERIAL9 matDef;			//���݂̃}�e���A���ۑ��p
	D3DXMATERIAL *pMat;				//�}�e���A���f�[�^�ւ̃|�C���^

	//���[���h�}�g���b�N�X������
	D3DXMatrixIdentity(&g_mtxWorldModel);

	//�����𔽉f
	D3DXMatrixRotationYawPitchRoll(&mtxRot, g_rotModel.y, g_rotModel.x, g_rotModel.z);
	D3DXMatrixMultiply(&g_mtxWorldModel, &g_mtxWorldModel, &mtxRot);

	//�ʒu���f
	D3DXMatrixTranslation(&mtxTrans, g_posModel.x, g_posModel.y, g_posModel.z);
	D3DXMatrixMultiply(&g_mtxWorldModel, &g_mtxWorldModel, &mtxTrans);

	//���[���h�}�g���b�N�X�ݒ�
	pDevice->SetTransform(D3DTS_WORLD, &g_mtxWorldModel);

	//���݂̃}�e���A���擾
	pDevice->GetMaterial(&matDef);

	//�}�e���A���f�[�^�ւ̃|�C���^�擾
	pMat = (D3DXMATERIAL*)g_pBuffMatModel->GetBufferPointer();

	for (int nCntMat = 0; nCntMat < (int)g_dwNumMatModel; nCntMat++)
	{
		//�}�e���A���ݒ�
		pDevice->SetMaterial(&pMat[nCntMat].MatD3D);

		//�e�N�X�`���ݒ�
		pDevice->SetTexture(0, g_apTexturemodel[nCntMat]);

		//���f���`��
		g_pMeshModel->DrawSubset(nCntMat);
	}

	//�}�e���A����߂�
	pDevice->SetMaterial(&matDef);
}