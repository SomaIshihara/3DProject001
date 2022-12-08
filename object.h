//==========================================
//
//���f���v���O�����̃w�b�_[object.h]
//Author:�Ό��D�n
//
//==========================================
#ifndef _OBJECT_H_
#define _OBJECT_H_

//�}�N��
#define MAX_BLUEPRINT			(16)
#define MAX_OBJECT				(128)
//�I�u�W�F�N�g��ԗ�
typedef enum
{
	OBJSTATE_NONE = 0,
	OBJSTATE_DAMAGE,
	OBJSTATE_BROKEN,
	OBJSTATE_MAX
} OBJSTATE;

//�݌v�}�̖��O
typedef enum
{
	BLUEPRINTIDX_BRANCO = 0,
	BLUEPRINTIDX_TAKIBI,
	BLUEPRINTIDX_JOBI,
	BLUEPRINTIDX_SUBWAYENTRANCE,
	BLUEPRINTIDX_MAX
} BLUEPRINTIDX;

//�I�u�W�F�N�g�\����
typedef struct
{
	//�I�u�W�F�N�g�����ڊ֌W
	LPD3DXMESH pMesh = NULL;				//���b�V���ւ̃|�C���^
	LPD3DXBUFFER pBuffMat = NULL;			//�}�e���A���ւ̃|�C���^
	DWORD dwNumMat = 0;						//�}�e���A����
	LPDIRECT3DTEXTURE9 apTexture[16] = {};	//�e�N�X�`���|�C���^
	D3DXVECTOR3 vtxMin, vtxMax;				//���������_�E�傫�����_
} BluePrint;

//�\���I�u�W�F�N�g�\����
typedef struct
{
	//�݌v�}��
	BLUEPRINTIDX bpidx;

	//�ʒu�֌W
	D3DXVECTOR3 pos;		//�ʒu
	D3DXVECTOR3 rot;		//����
	D3DXMATRIX mtxWorld;	//���[���h�}�g���b�N�X

	//�X�e�[�^�X�֌W
	int nLife;				//�̗�
	OBJSTATE state;			//���
	int nCounterState;		//��ԑJ�ڂ܂ł̎���

	//�\���֌W
	int nIdxShadow = -1;	//�e�ԍ�

	//�g�p�̗L��
	bool bUse;				//�g�p�̗L��
} Object;

//�v���g�^�C�v�錾
void InitObject(void);
void UninitObject(void);
void UpdateObject(void);
void DrawObject(void);
void SetObject(BLUEPRINTIDX bpidx, D3DXVECTOR3 pos, D3DXVECTOR3 rot, int nLife);
Object *GetObj(void);
BluePrint *GetBluePrint(void);
void HitObj(int nNumObj);
void DestroyObj(int nNumObj);

#endif // !_OBJECT_H_
