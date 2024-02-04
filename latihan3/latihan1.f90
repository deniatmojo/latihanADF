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
program ADF
	! Disini perlu deskripsi variable yang digunakan
	implicit none
    real :: x, y
    integer :: i
    integer, parameter :: n = 100 ! Jumlah titik data
   
    ! Header Program Exe
    print *, '======================================================================='
    print *, 'Program     = ADF - Analisis Ducted Fan'
    print *, 'Deskripsi   = Program ini untuk menganalisis pengaruh distribusi sudut serang'
    print *, '              pada airfoil ducted fan'
    print *, 'Pembuat     = Deni Atmojo'
    Print *, 'NIM         = 13619041'
    Print *, 'Version     = 1.0'
    Print *, 'Tanggal     = [3 Februari 2024]'
    Print *, 'Pembaharuan = Belum ada pembaharuan'
    print *, '======================================================================='
    print *, ''
    print *, ''
    print *, ''

	! Buka file untuk menulis data
    open(unit=10, file='data.txt', status='replace')

    ! Tulis data ke dalam file
    do i = 1, n
        x = 0.1 * real(i)
        y = x ** 2 ! Fungsi yang digunakan sebagai contoh, ganti dengan fungsi Anda
        write(10, *) x, y
    end do

    ! Tutup file
    close(unit=10)

    print *, 'Data telah berhasil dihasilkan.'

    ! Panggil Gnuplot untuk membuat grafik
    call system('gnuplot -persist -e "plot ''data.txt'' with lines"')


end program ADF

