!=======================================================================
! Program     : Analisis Ducted Fan
! Nama		  : Deni Atmojo
! NIM		  : 13619041
! Deskripsi   : Program ini merupakan program sederhana yang digunakan
!               untuk menghitung pengaruh dari distribusi sudut serang
!               pada airfoil di ductedfan
! Pembuat     : Deni Atmojo
! Versi       : 1.0
! Tanggal     : [4 Februari 2024]
! Ini adalah file di lokal AMD Ryzen
!=======================================================================
program keluarmasuk
	! Disini perlu deskripsi variable yang digunakan
    implicit none
   
    ! Header Program Exe
    print *, '======================================================================='
    print *, 'Program     = ADF - Analisis Ducted Fan'
    print *, 'Deskripsi   = Program ini untuk menganalisis pengaruh distribusi sudut serang'
    print *, '              pada airfoil ducted fan'
    print *, 'Pembuat     = Deni Atmojo'
    Print *, 'NIM         = 13619041'
    Print *, 'Version     = 1.0'
    Print *, 'Tanggal     = [4 Februari 2024]'
    Print *, 'Pembaharuan = Belum ada pembaharuan'
    print *, '======================================================================='
    print *, ''
    print *, ''
    print *, ''
    
    do  ! Loop utama untuk program ADF
    
    ! Memanggil subroutine untuk menjalankan tugas
    call welcome
    
    end do


end program keluarmasuk

subroutine welcome
    implicit none
    
    print *, 'Welcome Berhasil'
    print *, ''
    print *, ''
    
    do
    
    call verifikasi
    
    end do

end subroutine welcome

subroutine verifikasi
    implicit none
    character :: input_char
    
    
    do
    
    call option(input_char)
    
    ! Periksa masukan pengguna
    if (input_char == 'y' .or. input_char == 'Y') then
        ! Jika masukan adalah 'y' atau 'Y', ulangi program dari awal
        print *, ''
        print *, ''
        call welcome
    else if (input_char == 'n' .or. input_char == 'N') then
        ! Jika masukan adalah 'n' atau 'N', tutup program
        stop
    else
        ! Jika masukan tidak valid, tampilkan pesan kesalahan
        print *, 'Masukan tidak valid!'
        print *, ''
        call option(input_char)
        
    end if
    
    end do


end subroutine verifikasi

subroutine option(input_char)
    ! Disini perlu deskripsi variable yang digunakan
    implicit none
    character :: input_char
    
    ! Tanyakan kepada pengguna apakah ingin mengulang program
    print *, 'Tekan "y" untuk mengulang program, atau "n" untuk menutup...'
    read(*, '(A)') input_char

end subroutine option
