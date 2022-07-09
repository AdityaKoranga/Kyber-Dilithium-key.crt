# Kyber-Dilithium-key.crt
This is how you generate key and certificate using different versions of kyber and dilithium by just a single docker command.

## Prerequisite:
* **Docker should be installed on your system.**


## **IMPORTANT NOTE: BE ON THE MAIN DIRECTORY i.e.**
```
cd /home/$USER/
```
Let's Start

## Two methods:

### Method 1: Using script file

* **Firstly clone the github repo**

```
git clone https://github.com/AdityaKoranga/Kyber-Dilithium-key.crt.git
```
* **Change the directory and the script file**

```
cd Kyber-Dilithium-key.crt/
bash script.sh
```
* **A directory with the name `kyber_dilithium_gen` will be created. Check this by running the following command:**
```
cd ..
ls
ls kyber_dilithium_gen/
```

### Method 2: Running it manually

* **Run the following command. This will make a directory where we will store the keys and certificates after running the docker command.**
```
mkdir -p kyber_dilithium_gen/{kyber512+dilithium2,kyber768+dilithium3,kyber1024+dilithium5_aes}
```
* **Now just run the docker commands. Note that kyber and dilithium have different version:**
* For Kyber512 and Dilithium2:
```
docker run -e TEST_TIME=5 -e KEM_ALG=kyber512 -e SIG_ALG=dilithium2 -v /home/$USER/kyber_dilithium_gen/kyber512+dilithium2:/opt/test/ -it openquantumsafe/curl:optimized perftest.sh
```
* For Kyber768 and Dilithium3:
```
docker run -e TEST_TIME=5 -e KEM_ALG=kyber768 -e SIG_ALG=dilithium3 -v /home/$USER/kyber_dilithium_gen/kyber768+dilithium3:/opt/test/ -it openquantumsafe/curl:optimized perftest.sh
```
* For Kyber1024 and Dilithium5_aes:
```
docker run -e TEST_TIME=5 -e KEM_ALG=kyber1024 -e SIG_ALG=dilithium5_aes -v /home/$USER/kyber_dilithium_gen/kyber1024+dilithium5_aes:/opt/test/ -it openquantumsafe/curl:optimized perftest.sh
```
* Now do `ls` and a directory with the name  `kyber_dilithium_gen` will be available and it is where our keys and certificates ar stored.





