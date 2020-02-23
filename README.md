Kelompok A02

Muhamad Haris Wicaksono   (05111840000029)

Muhammad Rivadhli Purnomo (05111840000128)

## SoalShiftSISOP20_modul1_A02


Soal 1

Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “ Sample-Superstore.csv” . Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :
a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit
b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a
c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b

Soal 2 

Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan. Idenya adalah kalian 
(a) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. 
(b) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet .
(c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘ bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z , akan kembali ke a , contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b. ) dan 
(d) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.

Jawab :

#!/bin/bash

```bash
for input in $@;do
```
digunakan agar bisa langsung input saat perintah bash

```bash
string1="${input%.*}"
```
menghilangkan string setelah tanda titik terakhir

```bash
output=$(echo $string1 | sed 's/[^a-zA-Z]//g')
```
sed = memfilter string yang masuk

```bash
tgl=$(date +%H)
```
mgetahui sekarang jam berapa

```bash
dcrpt=$(($tgl*(-1)+26))
```
fungsi untuk mengebalikan deskripsi

```bash
dual=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
mono=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
```
character yang digunakan untuk shift

```bash
newphrase=$(echo $output | tr "${dual:0:26}" "${dual:${tgl}:26}" | tr "${mono:0:26}" "${mono:${tgl}:26}") 
#newphrase=$(echo $output | tr "${dual:0:26}" "${dual:${dcrpt}:26}" | tr "${mono:0:26}" "${mono:${dcrpt}:26}") 
```
tr = digunakan untuk melakukan shift pada langkah berapa kali

```bash
cat /dev/urandom| tr -dc '0-9a-zA-Z'|head -c 28 > "$newphrase".txt
```
membuat angka random

done

