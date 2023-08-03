#!/bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J maws_rna_pfoa
### -- ask for number of cores (default: 1) -- 
#BSUB -n 4 
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need 4GB of memory per core/slot -- 
#BSUB -R "rusage[mem=3GB]"
### -- specify that we want the job to get killed if it exceeds 3 GB per core/slot -- 
#BSUB -M 3GB
### -- set walltime limit: hh:mm -- 
#BSUB -W 24:00
### -- set the email address -- 
# please uncomment the following line and put in your e-mail address,
# if you want to receive e-mail notifications on a non-default address
##BSUB -u your_email_address
### -- send notification at start -- 
##BSUB -B 
### -- send notification at completion -- 
##BSUB -N 
### -- Specify the output and error file. %J is the job-id -- 
### -- -o and -e mean append, -oo and -eo mean overwrite -- 
#BSUB -o maws_rna_pfoa_%J.out 
#BSUB -e maws_rna_pfoa_%J.err 

# here follow the commands you want to execute with input.in as the input file

# Path to your Conda environment (replace with the actual path)
conda_env_path="/zhome/2e/2/164651/miniconda3/envs/maws_p2"

# Set environment variables to activate the Conda environment
export CONDA_PREFIX="$conda_env_path"
export PATH="$conda_env_path/bin:$PATH"
export PS1="($maws_p2) $PS1"

# Check it is using the conda env
result=$(which python)
echo "$result"

# Run MAWS
python MAWS2017.py -p pfoa.pdb -n maws_pfoa_aptamer -t 30