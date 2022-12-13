//==========================================
//
//�J�����֌W�v���O����[camera.cpp]
//Author:�Ό��D�n
//
//==========================================
#include "main.h"
#include "camera.h"
#include "input.h"
#include "player.h"
#include "debugproc.h"

//�}�N��
#define CAMERA_MOVE_SPEED	(1.0f)	//�J�����ړ����x
#define CAMERA_KEY_ROT_SPEED	(0.005f)	//�L�[�{�[�h���͂ł̉�]���x
#define CAMERA_MOU_ROT_SPEED	(0.003f)	//�}�E�X�ړ��ł̉�]���x
#define CAMERA_LENGTH		(5200.0f)		//�J������������ő勗��

//�v���g
void FixPosV(void);
void FixPosR(void);
void FixRot(void);

//�O���[�o���ϐ�
Camera g_camera;	//�J�������
LPD3DXFONT g_pFontCamera = NULL;	//�t�H���g�ւ̃|�C���^
bool g_bDebugCamera = false;			//�J�[�\���\����\���؂�ւ�

//========================
//����������
//========================
void InitCamera(void)
{
	LPDIRECT3DDEVICE9 pDevice = GetDevice();

	//�f�o�b�O�\���p�t�H���g����
	D3DXCreateFont(pDevice, 18, 0, 0, 0, FALSE,
		SHIFTJIS_CHARSET, OUT_DEFAULT_PRECIS, DEFAULT_QUALITY, DEFAULT_PITCH,
		"Terminal", &g_pFontCamera);

	g_camera.posV = D3DXVECTOR3(0.0f, 50.0f, -100.0f);
	g_camera.posR = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	g_camera.vecU = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	g_camera.rot = D3DXVECTOR3(-0.5f, 0.0f, 0.0f);
	g_camera.fLength = 200.0f;
	FixPosV();
}

//========================
//�I������
//========================
void UninitCamera(void)
{
	//��
}

//========================
//�X�V����
//========================
void UpdateCamera(void)
{
	if (GetKeyboardTrigger(DIK_F2) == true)
	{
		g_bDebugCamera = g_bDebugCamera ? false : true;
	}
	//���_
	if (g_bDebugCamera == true)
	{
		//���_�ݒ�
		g_camera.rot.y -= GetMouseMove().x * CAMERA_MOU_ROT_SPEED;
		g_camera.rot.x -= GetMouseMove().y * CAMERA_MOU_ROT_SPEED;
		FixRot();
		g_camera.vecU.x = sinf(g_camera.rot.x) * sinf(g_camera.rot.y);
		g_camera.vecU.y = cosf(g_camera.rot.x);
		g_camera.vecU.z = sinf(g_camera.rot.x) * cosf(g_camera.rot.y) * -1;
		D3DXVec3Normalize(&g_camera.vecU, &g_camera.vecU);
		FixPosV();

		//�J�[�\��������
		SetShowCursor(false);

		//�J�[�\�������̈ʒu�ɖ߂�
		POINT setCursorpos;
		setCursorpos.x = SCREEN_WIDTH / 2;
		setCursorpos.y = SCREEN_HEIGHT / 2;
		ClientToScreen(FindWindowA(CLASS_NAME, nullptr), &setCursorpos);
		SetCursorPos(setCursorpos.x, setCursorpos.y);
	}
	else
	{
		//�J�[�\����������
		SetShowCursor(true);
	}

#if 0
	//�����_
	if (GetKeyboardPress(DIK_Q) == true)
	{//-
		g_camera.rot.y -= CAMERA_KEY_ROT_SPEED * D3DX_PI;
		FixRot();
		FixPosR();
	}
	else if (GetKeyboardPress(DIK_E) == true)
	{//+
		g_camera.rot.y += CAMERA_KEY_ROT_SPEED * D3DX_PI;
		FixRot();
		FixPosR();
	}
#endif
#if 0
	//���_
	if (GetKeyboardPress(DIK_Z) == true)
	{//-
		g_camera.rot.y += CAMERA_KEY_ROT_SPEED * D3DX_PI;
		FixRot();
		FixPosV();
	}
	else if (GetKeyboardPress(DIK_C) == true)
	{//+
		g_camera.rot.y -= CAMERA_KEY_ROT_SPEED * D3DX_PI;
		FixRot();
		FixPosV();
	}
#endif
#if 0
	//�ړ�
	if (GetKeyboardPress(DIK_A) == true)
	{
		g_camera.posV.x += -cosf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
		g_camera.posR.x += -cosf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
		g_camera.posV.z += -sinf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
		g_camera.posR.z += -sinf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
	}
	else if (GetKeyboardPress(DIK_D) == true)
	{
		g_camera.posV.x += cosf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
		g_camera.posR.x += cosf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
		g_camera.posV.z += sinf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
		g_camera.posR.z += sinf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
	}

	if (GetKeyboardPress(DIK_W) == true)
	{
		g_camera.posV.x += -sinf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
		g_camera.posR.x += -sinf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
		g_camera.posV.z += cosf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
		g_camera.posR.z += cosf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
	}
	else if (GetKeyboardPress(DIK_S) == true)
	{
		g_camera.posV.x += sinf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
		g_camera.posR.x += sinf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
		g_camera.posV.z += -cosf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
		g_camera.posR.z += -cosf(g_camera.rot.y) * CAMERA_MOVE_SPEED;
	}
#endif
}

//========================
//�ݒ菈��
//========================
void SetCamera(void)
{
	LPDIRECT3DDEVICE9 pDevice = GetDevice();	//�f�o�C�X�̎擾

	//���𕶎��ɂ��đ���
	PrintDebugProc("posV = (x = %d, y = %d, z = %d)\nposR = (x = %d, y = %d, z = %d)\nvecU = (x = %f, y = %f, z = %f)\nRot = (x = %f, y = %f, z = %f)\n",
		(int)g_camera.posV.x, (int)g_camera.posV.y, (int)g_camera.posV.z,
		(int)g_camera.posR.x, (int)g_camera.posR.y, (int)g_camera.posR.z,
		g_camera.vecU.x, g_camera.vecU.y, g_camera.vecU.z,
		g_camera.rot.x, g_camera.rot.y, g_camera.rot.z);

	//�v���W�F�N�V�����}�g���b�N�X������
	D3DXMatrixIdentity(&g_camera.mtxProjection);

	//�쐬
	D3DXMatrixPerspectiveFovLH(&g_camera.mtxProjection, D3DXToRadian(45.0f), (float)SCREEN_WIDTH / (float)SCREEN_HEIGHT, 10.0f, CAMERA_LENGTH);

	//�ݒ�
	pDevice->SetTransform(D3DTS_PROJECTION, &g_camera.mtxProjection);

	
	//�r���[�}�g���b�N�X������
	D3DXMatrixIdentity(&g_camera.mtxView);

	//�쐬
	D3DXMatrixLookAtLH(&g_camera.mtxView, &g_camera.posV, &g_camera.posR, &g_camera.vecU);

	//�ݒ�
	pDevice->SetTransform(D3DTS_VIEW, &g_camera.mtxView);
}

//========================
//���_�C���i�����_���S�j
//========================
void FixPosV(void)
{
	g_camera.posV.x = g_camera.posR.x + cosf(g_camera.rot.x) * sinf(g_camera.rot.y) * g_camera.fLength;
	g_camera.posV.y = g_camera.posR.y - sinf(g_camera.rot.x) * g_camera.fLength;
	g_camera.posV.z = g_camera.posR.z - cosf(g_camera.rot.x) * cosf(g_camera.rot.y) * g_camera.fLength;
}

//========================
//�����_�C���i���_���S�j
//========================
void FixPosR(void)
{
#if 0
	g_camera.posR.x = g_camera.posV.x - sinf(g_camera.rot.y) * cosf(g_camera.rot.x) * g_camera.fLength;
	g_camera.posR.y = g_camera.posV.y - sinf(g_camera.rot.x) * cosf(g_camera.rot.y) * g_camera.fLength;
	g_camera.posR.z = g_camera.posV.z + cosf(g_camera.rot.y) * cosf(g_camera.rot.x) * g_camera.fLength;
#endif
	g_camera.posR.x = g_camera.posV.x - sinf(g_camera.rot.y) * cosf(g_camera.rot.x) * g_camera.fLength;
	g_camera.posR.z = g_camera.posV.z + cosf(g_camera.rot.y) * cosf(g_camera.rot.x) * g_camera.fLength;
}

//========================
//�p�x�C��
//========================
void FixRot(void)
{
	//�J����1���v�Z
	g_camera.rot.x = (float)fmod(g_camera.rot.x + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
	g_camera.rot.y = (float)fmod(g_camera.rot.y + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;
	g_camera.rot.z = (float)fmod(g_camera.rot.z + D3DX_PI + (D3DX_PI * 2), D3DX_PI * 2) - D3DX_PI;

	//[�J��������]x��]�̐���
	if (fabsf(g_camera.rot.x) >= 0.5f * D3DX_PI)
	{
		g_camera.rot.x = copysignf(0.5f * D3DX_PI, g_camera.rot.x);
	}
}

//========================
//�J�������擾
//========================
Camera *GetCamera(void) 
{
	return &g_camera;
}