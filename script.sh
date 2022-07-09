#!/bin/bash

set -e

#create directory
cd /home/$USER/
mkdir -p kyber_dilithium_gen/{kyber512+dilithium2,kyber768+dilithium3,kyber1024+dilithium5_aes}

#now just run the docker command
docker run -e TEST_TIME=5 -e KEM_ALG=kyber512 -e SIG_ALG=dilithium2 -v /home/$USER/kyber_dilithium_gen/kyber512+dilithium2:/opt/test/ -it openquantumsafe/curl:optimized perftest.sh

docker run -e TEST_TIME=5 -e KEM_ALG=kyber768 -e SIG_ALG=dilithium3 -v /home/$USER/kyber_dilithium_gen/kyber768+dilithium3:/opt/test/ -it openquantumsafe/curl:optimized perftest.sh

docker run -e TEST_TIME=5 -e KEM_ALG=kyber1024 -e SIG_ALG=dilithium5_aes -v /home/$USER/kyber_dilithium_gen/kyber1024+dilithium5_aes:/opt/test/ -it openquantumsafe/curl:optimized perftest.sh
echo
echo
echo
ls /home/$USER/kyber_dilithium_gen/
echo
echo
echo -e " \033[0;32m -----------SUCCESSFULLY BUILT-----------"
echo
echo
echo

