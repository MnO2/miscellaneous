====== �ɮ׻��� ======

+- dsp_hw1/
   +-  c_cpp/
   |     +-                    �@�� file I/O �����U�{��
   +-  matlab/                 ���ؿ��U��matlab��HMM�d��code
   |     +-                    �@�� file I/O �����U�{��
   +-  modellist.txt           �n�T�m��model�C��
   +-  model_init.txt          �i�ΰ���l�� HMM
   +-  seq_model_01~05.txt     training data observation
   +-  testing_data1.txt       testing data  observation
   +-  testing_answer.txt      answer for "testing_data1.txt"
   +-  testing_data2.txt       testing data without answer

====== �{������d�� ======

matlab:
 trainModel( $iter, 'model_init.txt', 'seq_model_01.txt', 'model_01.txt');
 trainModel( $iter, 'model_init.txt', 'seq_model_02.txt', 'model_02.txt');
 trainModel( $iter, 'model_init.txt', 'seq_model_03.txt', 'model_03.txt');
 trainModel( $iter, 'model_init.txt', 'seq_model_04.txt', 'model_04.txt');
 trainModel( $iter, 'model_init.txt', 'seq_model_05.txt', 'model_05.txt');
 testModel( 'modellist.txt', 'testing_data1.txt', 'result1.txt');
 testModel( 'modellist.txt', 'testing_data2.txt', 'result2.txt');

c/cpp:
 make
 ./train $iter model_init.txt seq_model_01.txt model_01.txt
 ./train $iter model_init.txt seq_model_02.txt model_02.txt
 ./train $iter model_init.txt seq_model_03.txt model_03.txt
 ./train $iter model_init.txt seq_model_04.txt model_04.txt
 ./train $iter model_init.txt seq_model_05.txt model_05.txt
 ./test modellist.txt testing_data1.txt result1.txt 
 ./test modellist.txt testing_data2.txt result2.txt 

�䤤 $iter ���@����ơA�N�� Baum-Welch algorithm �n�]�X�� iteration

====== ú�满�� ======

  1. �Ҧ��A�g���{���ɮ�  ( train.c, test.c, etc. or train.m, test.m, etc. )
  2. �V�m�X�Ӫ� HMM:    model_01.txt ~ model_05.txt
  3. result1.txt , result2.txt
  4. The accuracy of testing_data1.txt
  5. Document ( �е����Ǹ��m�W, �{������覡, ����, iteration�Ȫ��]�w, �H�Τ@�Ǥ߱o )

�Ҧ��ɮ����Y��P�@��Ƨ����A�H�A���Ǹ��R�W�A  e.g.    r99xxxxxx.zip
�H�q�l�l��H��: hpttw0608@gmail.com    �H��D���мg:   "[DSP] HW1 �m�W �Ǹ�"

