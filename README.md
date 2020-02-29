Kelompok A02

Muhamad Haris Wicaksono   (05111840000029)

Muhammad Rivadhli Purnomo (05111840000128)

## SoalShiftSISOP20_modul1_A02


**Soal 1**

Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “ Sample-Superstore.csv” . Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :

a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit

b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a

c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b


'Soal a'

    awk -F'\t' '{ if($13 == "West") a+=$21; else if($13 == "East") b+=$21; else if($13 == "Central") c+=$21; else if($13 == "South") d+=$21;} END {if(a<b && a<c && a<d) print "West"; else if(b<a && b<c && b<d) print "East"; else if(c<a && c<b && c<d) print "Central"; else if(d<a && d<b && d<c) print "South"}' Sample-Superstore.tsv

```awk -F'\t' ```

untuk menghilangkan fungsi tab pada datanya.

```if($13 == "West") a+=$21; else if($13 == "East") b+=$21; else if($13 == "Central") c+=$21; else if($13 == "South") d+=$21```

membuat kondisi untuk mengecek daerah mana yangmempunyai profit yang sesuai. 

```if(a<b && a<c && a<d) print "West"; else if(b<a && b<c && b<d) print "East"; else if(c<a && c<b && c<d) print "Central"; else if(d<a && d<b && d<c) print "South"```

untuk menampilkan bagian mana yang memiliki profit terendah.

'Soal b'

    awk -F '\t' '$13 ~/Central/ {iter[$11]+=$21} END {for(hasil in iter) {print iter[hasil]" "hasil}}' Sample-Superstore.tsv | sort -g | head -2

```awk -F '\t' ```

untuk menghilangkan fungsi tab pada datanya.

 ```$13 ~/Central/ {iter[$11]+=$21}```
 
 menentukan negara yang memilik profit terrendah yang berada di Central.
 
 ```for(hasil in iter) {print iter[hasil]" "hasil}}```
 
 fungsi untuk menampilkan profit dan negara dengan profit terrendah.
 
``` | sort -g | head -2```

 melakukan sorting dengan menggunakan bilangan general dan mengambil 2 teratas.
 
'Soal c'

    awk -F'\t' '$13 ~/Central/ {if($11 == "Texas" || $11 == "Illinois") iter[$17]+=$21} END {for(hasil in iter) {print iter[hasil]" "hasil}}' Sample-Superstore.tsv | sort -g | head -10
    
```awk -F '\t' ```

untuk menghilangkan fungsi tab pada datanya.

```$13 ~/Central/ {if($11 == "Texas" || $11 == "Illinois") iter[$17]+=$21}```

menentukan barang dagangan yang memilik profit terrendah yang berada di negara Texas dan Illinois yang berada di Central.

```for(hasil in iter) {print iter[hasil]" "hasil}}```

fungsi untuk menampilkan profit dan negara dengan profit terrendah.

```| sort -g | head -10```

melakukan sorting dengan menggunakan bilangan general dan mengambil 10 teratas.

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

if [[ $input =~ ^[A-Za-z_]+$ ]]; then

  touch a.sh
  flag=1;
  while [ $flag -gt 0 ]
  do
     a=$(cat /dev/urandom| tr -dc '0-9a-zA-Z'|head -c 28)
     if [[ "$a" =~ [[:upper:]] && "$a" =~ [[:lower:]] && "$a" =~ [[:digit:]] ]]; then
      echo "$a" >> "$input".txt
      flag=0
     fi 
  done 
else
  echo "salah"
fi
```

```javascript
touch a.sh
```
membuat file a.sh yang waktu pembuatannya sama dengan file password acak agar pada saat melakukan perubahan nama yang dipengaruhi waktu dan waktunya tidak berubah

```javascript
if [[ $input =~ ^[A-Za-z_]+$ ]]
```
cek input harus berupa huruf alphabet

```javascript
$(cat /dev/urandom| tr -dc '0-9a-zA-Z'|head -c 28)
```
menggenerate character random dan disimpan pada file 

```javascript
if [[ "$a" =~ [[:upper:]] && "$a" =~ [[:lower:]] && "$a" =~ [[:digit:]] ]]
```
mengecek hasil random harus terdiri dari huruf besar, huruf kecil, dan angka

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

**Soal 3**

1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing. 

[a] Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari" https://loremflickr.com/320/240/cat " menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file "wget.log" . Karena kalian gak suka ribet, kalian membuat penjadwalan untuk
menjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan

[b] setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi. 

[c] Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di current directory , maka lakukan backup seluruh log menjadi ekstensi ".log.bak" . Hint : Gunakan wget.log untuk membuat location.log yang isinya merupakan hasil dari grep "Location". *Gunakan Bash, Awk dan Crontab

**- soal3.sh**
```javascript
#!/bin/bash

i=1
while (($i<=28))
do
	wget "https://loremflickr.com/320/240/cat" -a "wget.log" -O "pdkt_kusuma_$i"
	i=$((i+1))
done
```

```javascript
wget
```
fungsi download pada bash script

```javascript
-a "wget.log"
```
-a menyimpan log download pada file wget.log

```javascript
-O "pdkt_kusuma_$i"
```
-O menyimpan file dengan nama berbeda

**- soal3_dupken.sh**
```javascript
#!/bin/bash

if [ ! -d duplicate ]; then  
    mkdir duplicate
fi
if [ ! -d kenangan ]; then
    mkdir kenangan
fi

grep 'Location' wget.log > location.log

readarray arr < location.log

for ((a=0; a<28; a++));
do
#d=0
e=0
for ((c=a+1; c<28; c++));
do
     #d=$((a+1))
     e=$((c+1))
     if [[ "${arr[$a]}" == "${arr[$c]}" ]] 
     then
	mv pdkt_kusuma_"$e" duplicate/duplicate_"$e" 
     fi
done
done

for ((c=1; c<29; c++));
do
     if [ -f pdkt_kusuma_"$c" ]; then
  	 mv pdkt_kusuma_"$c" kenangan/kenangan_"$c"
     fi
done

mv wget.log "wget $(date).bak.log"
```

```javascript
if [ ! -d duplicate ]; then  
    mkdir duplicate
fi
if [ ! -d kenangan ]; then
    mkdir kenangan
fi
```
mengecek apakah ada direktori, kalau tidak ada maka buat direktori

```javascript
grep 'Location' wget.log > location.log
```
menyimpan baris yang ada tulisannya 'Location' disimpan pada file location.log

```javascript
readarray arr < location.log
```
membaca file location.log sebagai array

```javascript
for ((a=0; a<28; a++));
do
#d=0
e=0
for ((c=a+1; c<28; c++));
do
     #d=$((a+1))
     e=$((c+1))
     if [[ "${arr[$a]}" == "${arr[$c]}" ]] 
     then
	mv pdkt_kusuma_"$e" duplicate/duplicate_"$e" 
     fi
done
done
```
mengecek berdasarkan log file apakah ada file yang duplikat atau tidak, kalau ada dipindah ke folder 'duplicate' dan ganti nama 'duplicate_n'

```javascript
for ((c=1; c<29; c++));
do
     if [ -f pdkt_kusuma_"$c" ]; then
  	 mv pdkt_kusuma_"$c" kenangan/kenangan_"$c"
     fi
done
```

mengecek apakah file masih ada atau tidak, jika masih ada dipindah ke folder 'kenangan' dan ganti nama dengan 'kenangan_n'

