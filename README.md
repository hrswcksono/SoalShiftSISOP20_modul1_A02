Kelompok A02

Muhamad Haris Wicaksono   (05111840000029)

Muhammad Rivadhli Purnomo (05111840000128)

## SoalShiftSISOP20_modul1_A02


**Soal 1**

Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “ Sample-Superstore.csv” . Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :

a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit

b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a

c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b

**Soal 2**

Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan. Idenya adalah kalian 

(a) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. 

(b) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet .

(c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘ bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z , akan kembali ke a , contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b. ) dan 

(d) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.

Jawab :

**- soal2.sh**

```javascript
#!/bin/bash

read input

touch a.sh

tgl=$(date +%H)

output=$(echo $input | sed 's/[^a-zA-Z]//g')

cat /dev/urandom| tr -dc '0-9a-zA-Z'|head -c 28 > "$output".txt
```

```javascript
touch a.sh
```
membuat file a.sh yang waktu pembuatannya sama dengan file password acak agar pada saat melakukan perubahan nama yang dipengaruhi waktu dan waktunya tidak berubah

```javascript
output=$(echo $input | sed 's/[^a-zA-Z]//g')
```
memfilter masuknya karakter selain a-z dan A-Z tidak bisa

```javascript
cat /dev/urandom| tr -dc '0-9a-zA-Z'|head -c 28 > "$output".txt
```
menggenerate character random dan disimpan pada file

**- soal2_coba.sh**
```javascript
for input in $@;do

tgl=$(date -r a.sh +"%H")

dual=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
mono=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

string1="${input%.*}"

newphrase=$(echo $string1 | tr "${dual:0:26}" "${dual:${tgl}:26}" | tr "${mono:0:26}" "${mono:${tgl}:26}")

mv $string1.txt $newphrase.txt

done

```javascript
for input in $@;do
```
agar bisa input di samping bash

```javascript
tgl=$(date -r a.sh +"%H")
```
mengambil nilai jam pada file a.sh supaya tidak berubah waktunya saat melakukan dekripsi

```javascript
string1="${input%.*}"
```
mengambil character sebelum ada titik

```javascript
dual=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
tr "${dual:0:26}" "${dual:${tgl}:26}"
```
melakukan shift pada character menggunakan tr (tranform and delete)

```javascript
mv $string1.txt $newphrase.txt
```
ganti nama file

**- soal2_wadaw.sh**
```javascript
#!/bin/bash

for input in $@;do

nama_file="$input"

tgl=$(date -r a.sh +"%H")

dcrpt=$(($tgl*(-1)+26))

dual=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
mono=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

string1="${input%.*}"

newphrase=$(echo $string1 | tr "${dual:0:26}" "${dual:${dcrpt}:26}" | tr "${mono:0:26}" "${mono:${dcrpt}:26}") 

mv $string1.txt $newphrase.txt

done
```

```javascript
dcrpt=$(($tgl*(-1)+26))
```
dekripsi dengan melakukan shift sebanyak alphabet dikurangi banyaknya shift sebelumnya
