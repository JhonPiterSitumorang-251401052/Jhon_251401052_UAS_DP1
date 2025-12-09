program BioskopKopsekopsekop;
uses crt;

const
    hargaReguler = 35000;
    hargaVIP = 55000;

type // record
    Tiket = record
        film : string;
        kelas : string;
        harga : longint;
    end;

var
    daftarFilm: array[1..7] of string; // array 1
    pesanan: array[1..100] of Tiket; // array 2
    jumlahTiket: integer;
    jumlahBeli: integer;
    pilihanFilm, pilihanKelas: integer;
    lanjut: char;

procedure iniFilm(); // procedure untuk inisialisasi daftar film
begin
    daftarFilm[1] := 'Avenger : End Game';
    daftarFilm[2] := 'Naruto The Movie';
    daftarFilm[3] := 'One Piece Red';
    daftarFilm[4] := 'Aquaman 2';
    daftarFilm[5] := 'Kungfu Panda 5';
    daftarFilm[6] := 'Babys Day Out';
    daftarFilm[7] := 'Home Alone';
end;

procedure tampilMenuFilm(); // procedure menampilkan daftar film
var i: integer;
begin
    writeln('===== DAFTAR FILM =====');
    for i:=1 to 7 do
        writeln(i, '. ', daftarFilm[i]);
    writeln('=======================');
end;

procedure pilihFilm(); // procedure memilih film
begin
    repeat
        write('Pilih nomor film (1-7): ');
        readln(pilihanFilm);
    until (pilihanFilm >=1) and (pilihanFilm <=7);
end;

procedure pilihKelas(); // procedure memilih kelas tempat duduk
begin
    writeln('Pilih kelas tempat duduk: ');
    writeln('1. Reguler (Rp 35.000)');
    writeln('2. VIP (Rp 55.000)');
    repeat
        write('Kelas: ');
        readln(pilihanKelas);
    until (pilihanKelas = 1) or (pilihanKelas = 2);
end;

procedure inputPesanan(); // procedure input pesanan tiket
var i: integer;
begin
    clrscr;
    writeln('===== PEMESANAN TIKET =====');
    tampilMenuFilm();
    pilihFilm();
    pilihKelas();

    repeat
        write('Berapa tiket yang ingin dibeli? : ');
        readln(jumlahBeli);
    until (jumlahBeli > 0);

    for i := 1 to jumlahBeli do
    begin
        inc(jumlahTiket);
        pesanan[jumlahTiket].film := daftarFilm[pilihanFilm];

        if pilihanKelas = 1 then
        begin
            pesanan[jumlahTiket].kelas := 'Reguler';
            pesanan[jumlahTiket].harga := hargaReguler;
        end
        else
        begin
            pesanan[jumlahTiket].kelas := 'VIP';
            pesanan[jumlahTiket].harga := hargaVIP;
        end;
    end;

    writeln;
    writeln('>> ', jumlahBeli, ' tiket berhasil ditambahkan!');
    writeln('===========================');
    writeln;
end;

procedure strukPembelian(); // procedure menampilkan struk pembelian
var
    i: integer;
    total: longint;
begin
    clrscr;
    total := 0;

    writeln('=======================================');
    writeln('   STRUK PEMBELIAN - BIOSKOP KOPSEKOPSEKOP');
    writeln('=======================================');

    for i := 1 to jumlahTiket do
    begin
        writeln('Tiket ', i, ':');
        writeln('Film  : ', pesanan[i].film);
        writeln('Kelas : ', pesanan[i].kelas);
        writeln('Harga : Rp ', pesanan[i].harga);
        writeln;
        total := total + pesanan[i].harga;
    end;

    writeln('Total Pembayaran: Rp ', total);
    writeln('=======================================');
    writeln('Terima kasih telah membeli tiket!');
end;

// PROGRAM UTAMA
begin
    clrscr;
    jumlahTiket := 0;
    iniFilm(); 
    writeln('Selamat datang di BIOSKOP KOPSEKOPSEKOP');
    writeln('--------------------------------------');

    repeat
        inputPesanan();
        write('Pesan tiket lagi? (y/n) : ');
        readln(lanjut);
    until (lanjut) <> 'y';

    strukPembelian();
end.
