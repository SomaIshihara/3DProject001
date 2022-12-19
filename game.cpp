//==========================================
//
//�Q�[���v���O����[game.cpp]
//Author:�Ό��D�n
//
//==========================================
#include "main.h"
#include "game.h"
#include "result.h"
#include "wall.h"
#include "player.h"
#include "shadow.h"
#include "bullet.h"
#include "meshfield.h"
#include "sky.h"
#include "object.h"
#include "file.h"
#include "input.h"
#include "camera.h"

//�}�N��
#define GAME_CLEAR_TIME	(0 * 60)	//�Q�[���N���A�ɂ���܂ł�����؍ݎ���

//�O���[�o��
int g_nCnterSafeAreaTime;

//========================
//����������
//========================
void InitGame(void)
{
	//�ϐ�������
	g_nCnterSafeAreaTime = 0;

	//�I�u�W�F�N�g������
	InitSky();
	InitMeshfield();
	InitWall();
	InitBullet();
	InitShadow();
	InitPlayer();
	InitObject();

	//�ǐ���
	SetWall(D3DXVECTOR3(0.0f, 0.0f, 1120.0f), D3DXVECTOR3(0.0f, 0.0f * D3DX_PI, 0.0f), 2720.0f, 80.0f);		//�O
	SetWall(D3DXVECTOR3(0.0f, 0.0f, -1120.0f), D3DXVECTOR3(0.0f, 1.0f * D3DX_PI, 0.0f), 2720.0f, 80.0f);	//���
	SetWall(D3DXVECTOR3(-1360.0f, 0.0f, 0.0f), D3DXVECTOR3(0.0f, -0.5f * D3DX_PI, 0.0f), 2240.0f, 50.0f);	//��
	SetWall(D3DXVECTOR3(1360.0f, 0.0f, 0.0f), D3DXVECTOR3(0.0f, 0.5f * D3DX_PI, 0.0f), 2240.0f, 50.0f);		//�E

	//�t�@�C���ǂݍ��݁E�I�u�W�F�N�g����
	LoadMapFile();
}

//========================
//�I������
//========================
void UninitGame(void)
{
	//�I������
	UninitObject();
	UninitPlayer();
	UninitShadow();
	UninitBullet();
	UninitWall();
	UninitMeshfield();
	UninitSky();
}

//========================
//�X�V����
//========================
void UpdateGame(void)
{
	Player *pPlayer = GetPlayer();
	//�e
	UpdateShadow();

	//��
	UpdateSky();

	//���b�V���t�B�[���h
	UpdateMeshfield();

	//��
	UpdateWall();

	//�e
	UpdateBullet();

	//�v���C���[
	UpdatePlayer();

	//�I�u�W�F�N�g
	UpdateObject();

	//�Z�[�t�G���A�ɓ����Ă��邩�m�F
	if (pPlayer->bIntoSafeArea == true)
	{
		g_nCnterSafeAreaTime++;
		if (g_nCnterSafeAreaTime >= GAME_CLEAR_TIME)
		{
			SetResult(RESULT_CLEAR);
			SetMode(MODE_RESULT);
			ResetCamera(200.0f, D3DXVECTOR2(0.0f, 100.0f), D3DXVECTOR3(0.0f, 0.0f, 0.0f), D3DXVECTOR3(-0.5f, 0.0f, 0.0f));
		}
	}
	else
	{
		g_nCnterSafeAreaTime = 0;
	}

	//���U���g�ڍs
	if (GetKeyboardTrigger(DIK_F2) == true)
	{
		SetResult(RESULT_CLEAR);
		SetMode(MODE_RESULT);
		ResetCamera(200.0f, D3DXVECTOR2(0.0f, 100.0f), D3DXVECTOR3(0.0f, 0.0f, 0.0f), D3DXVECTOR3(-0.5f, 0.0f, 0.0f));
	}
	else if (GetKeyboardTrigger(DIK_F3) == true)
	{
		SetResult(RESULT_OVER);
		SetMode(MODE_RESULT);
		ResetCamera(200.0f, D3DXVECTOR2(0.0f, 100.0f), D3DXVECTOR3(0.0f, 0.0f, 0.0f), D3DXVECTOR3(-0.5f, 0.0f, 0.0f));
	}
}

//========================
//�`�揈��
//========================
void DrawGame(void)
{
	//��
	DrawSky();

	//���b�V���t�B�[���h
	DrawMeshfield();

	//��
	DrawWall();

	//�e
	DrawShadow();

	//�v���C���[
	DrawPlayer();

	//�I�u�W�F�N�g
	DrawObject();

	//�e
	DrawBullet();
}