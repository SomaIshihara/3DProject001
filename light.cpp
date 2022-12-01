//==========================================
//
//���C�g�֌W�v���O����[light.cpp]
//Author:�Ό��D�n
//
//==========================================
#include "main.h"
#include "light.h"

//�v���g
D3DLIGHT9 g_light;	//���C�g���

//========================
//����������
//========================
void InitLight(void)
{
	LPDIRECT3DDEVICE9 pDevice = GetDevice();	//�f�o�C�X�̎擾
	D3DXVECTOR3 vecDir;	//�ݒ�p

	//���C�g���N���A
	ZeroMemory(&g_light, sizeof(D3DLIGHT9));

	//���C�g��ސݒ�
	g_light.Type = D3DLIGHT_DIRECTIONAL;

	//���C�g�g�U���ݒ�
	g_light.Diffuse = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);

	//���C�g�̕���
	//vecDir = D3DXVECTOR3(0.2f, -0.8f, -0.4f);
	vecDir = D3DXVECTOR3(0.0f, -1.5f, 0.5f);
	D3DXVec3Normalize(&vecDir, &vecDir);

	g_light.Direction = vecDir;

	//���C�g�ݒ�
	pDevice->SetLight(0, &g_light);

	//���C�g�L����
	pDevice->LightEnable(0, TRUE);
}

//========================
//�I������
//========================
void UninitLight(void)
{
	//��
}

//========================
//�X�V����
//========================
void UpdateLight(void)
{
	//��
}