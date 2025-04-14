export CUDA_VISIBLE_DEVICES=0,1

model_name=IRPA
seq_len=3600 #2880 is better

for pred_len in 96 192 336 720
do

python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/Solar/ \
  --data_path solar_AL.txt \
  --model_id solar_$seq_len'_'$pred_len \
  --model $model_name \
  --data Solar \
  --features M \
  --seq_len $seq_len \
  --label_len 48 \
  --pred_len $pred_len \
  --e_layers 2 \
  --enc_in 137 \
  --dec_in 137 \
  --c_out 137 \
  --des 'Exp' \
  --learning_rate 0.01 \
  --itr 1

done
