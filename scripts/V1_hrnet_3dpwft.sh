TRAIN_CONFIGS='configs/v1_hrnet_3dpw_ft.yml'

GPUS=$(cat $TRAIN_CONFIGS | shyaml get-value ARGS.GPUS)
DATASET=$(cat $TRAIN_CONFIGS | shyaml get-value ARGS.dataset)
TAB=$(cat $TRAIN_CONFIGS | shyaml get-value ARGS.tab)

CUDA_VISIBLE_DEVICES=${GPUS} nohup python -u -m romp.train --gpu=${GPUS} --configs_yml=${TRAIN_CONFIGS} > 'log/'${TAB}'_'${DATASET}'_g'${GPUS}.log 2>&1 &