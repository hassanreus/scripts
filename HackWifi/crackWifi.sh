sudo rm -rf reaver-1.4
sudo rm -rf reaver.tar.gz
sudo apt install curl -y
curl -o reaver.tar.gz "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/reaver-wps/reaver-1.4.tar.gz"
tar -xf reaver.tar.gz
sudo apt-get install libpcap-dev -y
sudo apt-get install libsqlite3-dev -y
cd reaver-1.4/src
sudo ./configure
sudo make
sudo make install
sudo apt-get install aircrack-ng -y
