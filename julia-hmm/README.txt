====== 檔案說明 ======

+- dsp_hw1/
   +-  c_cpp/
   |     +-                    一些 file I/O 的輔助程式
   +-  matlab/                 此目錄下為matlab的HMM範例code
   |     +-                    一些 file I/O 的輔助程式
   +-  modellist.txt           要訊練的model列表
   +-  model_init.txt          可用做初始的 HMM
   +-  seq_model_01~05.txt     training data observation
   +-  testing_data1.txt       testing data  observation
   +-  testing_answer.txt      answer for "testing_data1.txt"
   +-  testing_data2.txt       testing data without answer

====== 程式執行範例 ======

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

其中 $iter 為一正整數，代表 Baum-Welch algorithm 要跑幾次 iteration

====== 繳交說明 ======

  1. 所有你寫的程式檔案  ( train.c, test.c, etc. or train.m, test.m, etc. )
  2. 訓練出來的 HMM:    model_01.txt ~ model_05.txt
  3. result1.txt , result2.txt
  4. The accuracy of testing_data1.txt
  5. Document ( 請註明學號姓名, 程式執行方式, 環境, iteration值的設定, 以及一些心得 )

所有檔案壓縮到同一資料夾內，以你的學號命名，  e.g.    r99xxxxxx.zip
以電子郵件寄到: hpttw0608@gmail.com    信件主旨請寫:   "[DSP] HW1 姓名 學號"

