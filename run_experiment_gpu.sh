#!/bin/bash
#SBATCH --job-name=experimentation-stemgnn
#SBATCH --nodes=1
#SBATCH -o logs/experiments.%j.out
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=8G
#SBATCH --gpus=a40
#SBATCH --time=72:00:00

# Load the required modules
source /etc/profile

# Configure the environment
source /home/marlinbar/StemGNN/stemgnn-env/bin/activate
export PYTHONPATH=":/home/marlinbar/StemGNN/stemgnn-env/lib"
echo $PYTHONPATH

# Run the experiments script
python main.py --train True --evaluate True --dataset PeMS07 --window_size 12 --horizon 3 --norm_method z_score --train_length 7 --test_length 1 --device cuda:0