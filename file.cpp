//==========================================
//
//�t�@�C���ǂݍ��݃v���O����[file.cpp]
//Author:�Ό��D�n
//
//==========================================
#include "main.h"
#include "file.h"
#include "object.h"
#include <stdio.h>
#include <assert.h>

//�}�N��
//�}�b�v
#define MODELVIEWERDATA_PATH	"data\\model.txt"	//���f���r���[���[�̃f�[�^�̃p�X

//�Z�[�u�f�[�^
//�ق��ق�

//�R�[�h�֌W
#define CODE_LENGTH	(128)

//�ǂݎ���ԗ�
typedef enum
{
	READSTAT_NONE = 0,
	READSTAT_CAMERASET,
	READSTAT_LIGHTSET,
	READSTAT_SKYSET,
	READSTAT_MOUNTAINSET,
	READSTAT_FIELDSET,
	READSTAT_WALLSET,
	READSTAT_MODELSET,
	READSTAT_BILLBOARDSET,
	READSTAT_PLAYERSET,
	READSTAT_MAX
} READSTAT;

//�O���[�o��
bool g_bSkipCr;
READSTAT g_readStat = READSTAT_NONE;

//�擾��������
int g_nType = 0;
D3DXVECTOR3 g_pos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
D3DXVECTOR3 g_rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
int g_nState = 0;
bool g_bUseCollision = true;	//�f�t�H���g��true
bool g_bUseShadow = true;		//�f�t�H���g��true

//========================
//�t�@�C������������
//========================
void InitFile()
{
	
}

//========================
//�t�@�C���I������
//========================
void UninitFile(void)
{
	//��U�Ȃ�
}

//========================
//�t�@�C���X�V����
//========================
void UpdateFile(void)
{
	//��U�Ȃ�
}

//========================
//�}�b�v�E�G�ǂݍ��ݏ����iCSV�j
//========================
void LoadMapFile(void)
{
	FILE *pFile;
	char aCode[CODE_LENGTH];
	char *pSprit;
	bool bRead = false;
	int nCntInit = 0;	//�������J�E���^

	//�ǂݍ��݃t�@�C���ݒ�
	pFile = fopen(MODELVIEWERDATA_PATH, "r");

	//�G�z�u�����擾
	if (pFile != NULL)
	{
		while (1)
		{
			fgets(&aCode[0], CODE_LENGTH, pFile);

			//�R�����g�A�E�g�`�F�b�N
			char *pCharPos = strchr(&aCode[0], '#');
			if (pCharPos != nullptr)
			{//strchr�̕Ԃ�l���ʂ�ۂł͂Ȃ�
				*pCharPos = '\0';
			}

			//�^�u����
			while (aCode[0] == '\t')
			{
				char aCodeBackup[CODE_LENGTH];
				strcpy(&aCodeBackup[0], &aCode[0]);
				strcpy(&aCode[0], &aCodeBackup[1]);
			}

			//������`�F�b�N
			if (strncmp(&aCode[0], CODE_SCRIPT, sizeof CODE_SCRIPT / sizeof(char) - 1) == 0)
			{//�ǂݎ��J�n
				bRead = true;
			}
			else if (strncmp(&aCode[0], CODE_END_SCRIPT, sizeof CODE_END_SCRIPT / sizeof(char) - 1) == 0)
			{//�ǂݎ��I��
				bRead = false;
				break;
			}
			else if (aCode[0] == EOF)
			{//EOF��������Ȃ�
				if (feof(pFile))
				{//����A�����EOF��
					bRead = false;
					break;
				}
			}
			else if (bRead == true)
			{//�ǂݎ��
				switch (g_readStat)
				{
				case READSTAT_NONE:	//�����擾
					if (strncmp(&aCode[0], CODE_CAMERASET, sizeof CODE_CAMERASET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_CAMERASET;
					}
					if (strncmp(&aCode[0], CODE_LIGHTSET, sizeof CODE_LIGHTSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_LIGHTSET;
					}
					if (strncmp(&aCode[0], CODE_SKYSET, sizeof CODE_SKYSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_SKYSET;
					}
					if (strncmp(&aCode[0], CODE_MOUNTAINSET, sizeof CODE_MOUNTAINSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_MOUNTAINSET;
					}
					if (strncmp(&aCode[0], CODE_FIELDSET, sizeof CODE_FIELDSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_FIELDSET;
					}
					if (strncmp(&aCode[0], CODE_WALLSET, sizeof CODE_WALLSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_WALLSET;
					}
					if (strncmp(&aCode[0], CODE_MODELSET, sizeof CODE_MODELSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_MODELSET;
					}
					if (strncmp(&aCode[0], CODE_BILLBOARDSET, sizeof CODE_BILLBOARDSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_BILLBOARDSET;
					}
					if (strncmp(&aCode[0], CODE_PLAYERSET, sizeof CODE_PLAYERSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_PLAYERSET;
					}
					break;
				case READSTAT_CAMERASET:	//�J�������擾
					if (strncmp(&aCode[0], CODE_END_CAMERASET, sizeof CODE_END_CAMERASET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_NONE;
					}
					else if (strncmp(&aCode[0], CODE_POS, sizeof CODE_POS / sizeof(char) - 1) == 0)
					{
						
					}
					else if (strncmp(&aCode[0], CODE_REF, sizeof CODE_REF / sizeof(char) - 1) == 0)
					{

					}
					break;
				case READSTAT_LIGHTSET:		//���C�g���擾
					if (strncmp(&aCode[0], CODE_END_LIGHTSET, sizeof CODE_END_LIGHTSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_NONE;
					}
					else if (strncmp(&aCode[0], CODE_DIRECTION, sizeof CODE_DIRECTION / sizeof(char) - 1) == 0)
					{
						
					}
					else if (strncmp(&aCode[0], CODE_DIFFUSE, sizeof CODE_DIFFUSE / sizeof(char) - 1) == 0)
					{

					}
					break;
				case READSTAT_SKYSET:		//����擾
					if (strncmp(&aCode[0], CODE_END_SKYSET, sizeof CODE_END_SKYSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_NONE;
					}
					else if (strncmp(&aCode[0], CODE_TEXTYPE, sizeof CODE_TEXTYPE / sizeof(char) - 1) == 0)
					{
						
					}
					else if (strncmp(&aCode[0], CODE_MOVE, sizeof CODE_MOVE / sizeof(char) - 1) == 0)
					{

					}
					break;
				case READSTAT_MOUNTAINSET:	//�R���擾
					if (strncmp(&aCode[0], CODE_END_MOUNTAINSET, sizeof CODE_END_MOUNTAINSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_NONE;
					}
					else if (strncmp(&aCode[0], CODE_TEXTYPE, sizeof CODE_TEXTYPE / sizeof(char) - 1) == 0)
					{

					}
					break;
				case READSTAT_FIELDSET:		//�����擾
					if (strncmp(&aCode[0], CODE_END_FIELDSET, sizeof CODE_END_FIELDSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_NONE;
					}
					else if (strncmp(&aCode[0], CODE_TEXTYPE, sizeof CODE_TEXTYPE / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_POS, sizeof CODE_POS / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_ROT, sizeof CODE_ROT / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_BLOCK, sizeof CODE_BLOCK / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_SIZE, sizeof CODE_SIZE / sizeof(char) - 1) == 0)
					{

					}
					break;
				case READSTAT_WALLSET:		//�Ǐ��擾
					if (strncmp(&aCode[0], CODE_END_WALLSET, sizeof CODE_END_WALLSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_NONE;
					}
					else if (strncmp(&aCode[0], CODE_TEXTYPE, sizeof CODE_TEXTYPE / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_POS, sizeof CODE_POS / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_ROT, sizeof CODE_ROT / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_BLOCK, sizeof CODE_BLOCK / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_SIZE, sizeof CODE_SIZE / sizeof(char) - 1) == 0)
					{

					}
					break;
				case READSTAT_MODELSET:		//���f�����擾
					if (strncmp(&aCode[0], CODE_END_MODELSET, sizeof CODE_END_MODELSET / sizeof(char) - 1) == 0)
					{
						SetObject((BLUEPRINTIDX)g_nType, g_pos, g_rot, false, 5);
						g_readStat = READSTAT_NONE;
					}
					else if (strncmp(&aCode[0], CODE_TYPE, sizeof CODE_TYPE / sizeof(char) - 1) == 0)
					{
						pSprit = strtok(&aCode[0], " =\n");	//�������e�̕�������

						//��ޓǂݎ��
						pSprit = strtok(NULL, " =\n");
						g_nType = atoi(pSprit);
					}
					else if (strncmp(&aCode[0], CODE_POS, sizeof CODE_POS / sizeof(char) - 1) == 0)
					{
						pSprit = strtok(&aCode[0], " =\n");	//�������e�̕�������

						//X���W�ǂݎ��
						pSprit = strtok(NULL, " =\n");
						g_pos.x = atof(pSprit);

						//Y���W�ǂݎ��
						pSprit = strtok(NULL, " =\n");
						g_pos.y = atof(pSprit);

						//Z���W�ǂݎ��
						pSprit = strtok(NULL, " =\n");
						g_pos.z = atof(pSprit);
					}
					else if (strncmp(&aCode[0], CODE_ROT, sizeof CODE_ROT / sizeof(char) - 1) == 0)
					{
						pSprit = strtok(&aCode[0], " =\n");	//�������e�̕�������

						//X���W�ǂݎ��
						pSprit = strtok(NULL, " =\n");
						g_rot.x = (atof(pSprit) / 180) * D3DX_PI;

						//Y���W�ǂݎ��
						pSprit = strtok(NULL, " =\n");
						g_rot.y = (atof(pSprit) / 180) * D3DX_PI;

						//Z���W�ǂݎ��
						pSprit = strtok(NULL, " =\n");
						g_rot.z = (atof(pSprit) / 180) * D3DX_PI;
					}
					else if (strncmp(&aCode[0], CODE_STATE, sizeof CODE_STATE / sizeof(char) - 1) == 0)
					{//��Ԏw��

					}
					else if (strncmp(&aCode[0], CODE_COLLISION, sizeof CODE_COLLISION / sizeof(char) - 1) == 0)
					{//0�Ȃ瓖���蔻�薳��
						
					}
					else if (strncmp(&aCode[0], CODE_SHADOW, sizeof CODE_SHADOW / sizeof(char) - 1) == 0)
					{//0�Ȃ�e���g�p���Ȃ�

					}
					break;
				case READSTAT_BILLBOARDSET:	//�r���{�[�h���擾
					if (strncmp(&aCode[0], CODE_END_BILLBOARDSET, sizeof CODE_END_BILLBOARDSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_NONE;
					}
					else if (strncmp(&aCode[0], CODE_TEXTYPE, sizeof CODE_TEXTYPE / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_POS, sizeof CODE_POS / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_SIZE, sizeof CODE_SIZE / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_ORIGIN, sizeof CODE_ORIGIN / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_BLEND, sizeof CODE_BLEND / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_SHADOW, sizeof CODE_SHADOW / sizeof(char) - 1) == 0)
					{

					}
					break;
				case READSTAT_PLAYERSET:	//�v���C���[���f�����擾
					if (strncmp(&aCode[0], CODE_END_PLAYERSET, sizeof CODE_END_PLAYERSET / sizeof(char) - 1) == 0)
					{
						g_readStat = READSTAT_NONE;
					}
					else if (strncmp(&aCode[0], CODE_MOTION_FILENAME, sizeof CODE_MOTION_FILENAME / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_POS, sizeof CODE_POS / sizeof(char) - 1) == 0)
					{

					}
					else if (strncmp(&aCode[0], CODE_ROT, sizeof CODE_ROT / sizeof(char) - 1) == 0)
					{

					}
					break;
				}
			}
		}
		
		//�t�@�C������
		fclose(pFile);
	}
	else
	{
		assert(pFile != NULL);
	}
}