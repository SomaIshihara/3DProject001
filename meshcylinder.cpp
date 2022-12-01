//==========================================
//
//���b�V�����v���O����[meshcylinder.cpp]
//Author:�Ό��D�n
//
//==========================================
#include "main.h"
#include "meshcylinder.h"
#include "input.h"

//�}�N��
#define MESHCYLINDER_UDIVISION	(8)			//�c�̕�����
#define MESHCYLINDER_VDIVISION	(2)			//���̕�����
#define MESHCYLINDER_HEIGHT		(40.0f)		//����
#define MESHCILINDER_RADIUS		(50.0f)		//���a
#define MESHCYLINDER_IDXNUM		((MESHCYLINDER_UDIVISION + 1) * 2)
#define MESHCYLINDER_POLYNUM	(MESHCYLINDER_IDXNUM - 2)
#define MESHCYLINDER_NORVECTER	(1)		//�@���̌����i1�ŕ\�E-1�ŗ��j

//�v���g
WORD *SetIdxSwaingCylinder(int nCntWidth, WORD *pIdx);

//�O���[�o���ϐ�
LPDIRECT3DVERTEXBUFFER9 g_pVtxbuffMeshCylinder;	//���_�o�b�t�@�|�C���^
LPDIRECT3DTEXTURE9 g_pTextureMeshCylinder;		//�e�N�X�`���|�C���^
LPDIRECT3DINDEXBUFFER9 g_pIdxBuffMeshCylinder = NULL;	//�C���f�b�N�X�o�b�t�@
D3DXVECTOR3 g_posMeshCylinder;					//�ʒu
D3DXVECTOR3 g_rotMeshCylinder;					//����
D3DXMATRIX g_mtxWorldMeshCylinder;				//���[���h�}�g���b�N�X
D3DCULL g_cullMode = D3DCULL_CCW;				//�J�����O���[�h

//========================
//����������
//========================
void InitMeshCylinder(void)
{
	LPDIRECT3DDEVICE9 pDevice = GetDevice();	//�f�o�C�X�̎擾

	//�e�N�X�`���ǂݍ���
	D3DXCreateTextureFromFile(pDevice,
		"data\\TEXTURE\\field000.jpg",
		&g_pTextureMeshCylinder);

	//���_�o�b�t�@�̐���
	pDevice->CreateVertexBuffer(sizeof(VERTEX_3D) * 4 * 18,	//18��
		D3DUSAGE_WRITEONLY,
		FVF_VERTEX_3D,
		D3DPOOL_MANAGED,
		&g_pVtxbuffMeshCylinder,
		NULL);

	//�C���f�b�N�X�o�b�t�@�̐���
	pDevice->CreateIndexBuffer(sizeof(WORD) * MESHCYLINDER_IDXNUM,
		D3DUSAGE_WRITEONLY,
		D3DFMT_INDEX16,
		D3DPOOL_MANAGED,
		&g_pIdxBuffMeshCylinder,
		NULL);

	//�ϐ�������
	g_posMeshCylinder = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	g_rotMeshCylinder = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	g_cullMode = D3DCULL_CCW;

	VERTEX_3D *pVtx;

	//�o�b�t�@���b�N
	//���_�o�b�t�@�̃��b�N�ƒ��_���ւ̃|�C���^���擾
	g_pVtxbuffMeshCylinder->Lock(0, 0, (void **)&pVtx, 0);

	//���_���W+�e�N�X�`�����W
	for (int nCntHeight = 0; nCntHeight < MESHCYLINDER_VDIVISION + 1; nCntHeight++)
	{
		for (int nCntDivision = 0; nCntDivision < MESHCYLINDER_UDIVISION + 1; nCntDivision++, pVtx++)
		{
			//�v�Z�p
			float fAngle = fmodf(((float)nCntDivision / (MESHCYLINDER_UDIVISION / 2) * D3DX_PI) + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
			D3DXVECTOR3 nor;

			//���_���W�i���΍��W�j
			pVtx->pos = D3DXVECTOR3(sinf(fAngle) * MESHCILINDER_RADIUS, (MESHCYLINDER_HEIGHT / MESHCYLINDER_VDIVISION) * (MESHCYLINDER_VDIVISION - nCntHeight), -cosf(fAngle) * MESHCILINDER_RADIUS);

			//�@���x�N�g��
			nor = pVtx->pos;	//���_�ʒu���
			nor.y = 0.0f;		//y�͂���Ȃ��̂�0
			nor.x *= MESHCYLINDER_NORVECTER;
			nor.z *= MESHCYLINDER_NORVECTER;	//xz�͕\���w��
			D3DXVec3Normalize(&nor, &nor);		//���K��
			pVtx->nor = nor;					//���_���ɑ��

			//�J���[
			pVtx->col = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);

			//�e�N�X�`�����W
			pVtx->tex = D3DXVECTOR2((float)(nCntDivision % (MESHCYLINDER_UDIVISION + 1)), (float)(nCntHeight / MESHCYLINDER_VDIVISION));
		}
	}

	//���_�o�b�t�@���A�����b�N
	g_pVtxbuffMeshCylinder->Unlock();

	//�C���f�b�N�X�o�b�t�@�ݒ�
	WORD *pIdx;	//�C���f�b�N�X���ւ̃|�C���^
	int nCntWidth = 0;	//�C���f�b�N�X�J�E���^

	//�o�b�t�@���b�N
	g_pIdxBuffMeshCylinder->Lock(0, 0, (void **)&pIdx, 0);

	for (nCntWidth = 0; nCntWidth < MESHCYLINDER_VDIVISION - 1; nCntWidth++)
	{
		//�O�l�O�l�p�[�g
		pIdx = SetIdxSwaingCylinder(nCntWidth, pIdx);
		
		//�`�����ł�����p�[�g
		//�Ō�̃C���f�b�N�X�������̂ɂ������
		*pIdx = MESHCYLINDER_VDIVISION + (MESHCYLINDER_VDIVISION + 1) * nCntWidth;
		pIdx++;

		//���̎��̂Ɏ��̃��[�v�ōŏ��ɓ��鐔��������
		*pIdx = (MESHCYLINDER_VDIVISION + 1) + (MESHCYLINDER_VDIVISION + 1) * (nCntWidth + 1);
		pIdx++;
	}

	//�Ō�̃O�l�O�l�p�[�g
	SetIdxSwaingCylinder(nCntWidth, pIdx);
	
	//�o�b�t�@�A�����b�N
	g_pIdxBuffMeshCylinder->Unlock();
}

//========================
//�I������
//========================
void UninitMeshCylinder(void)
{
	//�e�N�X�`���̔j��
	if (g_pTextureMeshCylinder != NULL)
	{
		g_pTextureMeshCylinder->Release();
		g_pTextureMeshCylinder = NULL;
	}

	//���_�o�b�t�@�̔j��
	if (g_pVtxbuffMeshCylinder != NULL)
	{
		g_pVtxbuffMeshCylinder->Release();
		g_pVtxbuffMeshCylinder = NULL;
	}

	//�C���f�b�N�X�o�b�t�@�j��
	if (g_pIdxBuffMeshCylinder != NULL)
	{
		g_pIdxBuffMeshCylinder->Release();
		g_pIdxBuffMeshCylinder = NULL;
	}
}

//========================
//�X�V����
//========================
void UpdateMeshCylinder(void)
{
	//��
}

//========================
//�`�揈��
//========================
void DrawMeshCylinder(void)
{
	LPDIRECT3DDEVICE9 pDevice = GetDevice();	//�f�o�C�X�̎擾
	D3DXMATRIX mtxRot, mtxTrans;	//�v�Z�p

	//�J�����O�ݒ�
	pDevice->SetRenderState(D3DRS_CULLMODE, g_cullMode);

	//���[���h�}�g���b�N�X������
	D3DXMatrixIdentity(&g_mtxWorldMeshCylinder);

	//�����𔽉f
	D3DXMatrixRotationYawPitchRoll(&mtxRot, g_rotMeshCylinder.y, g_rotMeshCylinder.x, g_rotMeshCylinder.z);
	D3DXMatrixMultiply(&g_mtxWorldMeshCylinder, &g_mtxWorldMeshCylinder, &mtxRot);

	//�ʒu���f
	D3DXMatrixTranslation(&mtxTrans, g_posMeshCylinder.x, g_posMeshCylinder.y, g_posMeshCylinder.z);
	D3DXMatrixMultiply(&g_mtxWorldMeshCylinder, &g_mtxWorldMeshCylinder, &mtxTrans);

	//���[���h�}�g���b�N�X�ݒ�
	pDevice->SetTransform(D3DTS_WORLD, &g_mtxWorldMeshCylinder);

	//���_�o�b�t�@���f�[�^�X�g���[���ɐݒ�
	pDevice->SetStreamSource(0, g_pVtxbuffMeshCylinder, 0, sizeof(VERTEX_3D));

	//�C���f�b�N�X�o�b�t�@���f�[�^�X�g���[���ɐݒ�
	pDevice->SetIndices(g_pIdxBuffMeshCylinder);

	//���_�t�H�[�}�b�g�̐ݒ�
	pDevice->SetFVF(FVF_VERTEX_3D);

	//�e�N�X�`���ݒ�
	pDevice->SetTexture(0, g_pTextureMeshCylinder);

	//�|���S���`��i�C���f�b�N�X���ꂽ��j
	pDevice->DrawIndexedPrimitive(D3DPT_TRIANGLESTRIP, 0, 0, (MESHCYLINDER_UDIVISION + 1) * (MESHCYLINDER_VDIVISION + 1), 0, MESHCYLINDER_POLYNUM);

	//�J�����O�߂�
	pDevice->SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW);
}

//========================
//�O�l�O�l�C���f�b�N�X�ݒ菈��
//========================
WORD *SetIdxSwaingCylinder(int nCntWidth, WORD *pIdx)
{
	//�O�l�O�l�p�[�g
	for (int nCountHeight = 0; nCountHeight < (MESHCYLINDER_UDIVISION + 1) * 2; nCountHeight++, pIdx++)
	{
		*pIdx = (MESHCYLINDER_UDIVISION + 1) * ((nCountHeight % 2) ^ 0x1) + nCountHeight / 2 + (MESHCYLINDER_VDIVISION + 1) * nCntWidth;
	}
	return pIdx;
}