//==========================================
//
//���f���v���O�����̃w�b�_[model.h]
//Author:�Ό��D�n
//
//==========================================
#ifndef _MODEL_H_
#define _MODEL_H_

//�}�N��
#define EXITHUMAN_MODEL_NUM	(10)	//�����̐l�Ɏg���Ă��郂�f����
#define PUSHING_BACK		(1.0f)	//�I�u�W�F�N�g�ɓ����������̉����߂�

//�����̐l�̕�����
#define EXITHUMAN_WIDTH		(30.0f)
#define EXITHUMAN_HEIGHT	(30.0f)

//���f������
typedef enum
{
	MODELNAME_EXITHUMAN = 0,
	MODELNAME_MAX
} MODELNAME;

//���f���\����
typedef struct
{
	LPD3DXMESH pMesh;		//���b�V��
	LPD3DXBUFFER pBuffMat;	//�}�e���A���|�C���^
	DWORD dwNumMatModel;	//�}�e��
	D3DXVECTOR3 pos;		//�ʒu�i�I�t�Z�b�g�j
	D3DXVECTOR3 rot;		//����
	D3DXMATRIX mtxWorld;	//���[���h�}�g��
	LPDIRECT3DTEXTURE9 apTexture[16];	//�e�N�X�`���|�C���^
	int nIdxModelParent;	//�e���f���C���f�b�N�X
} Model;

//�v���g�^�C�v�錾
void InitModel(void);
void UninitModel(void);
void UpdateModel(void);
void DrawModel(void);
Model *GetModel(MODELNAME name);

#endif // !_MODEL_H_
