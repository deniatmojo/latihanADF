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
    implicit none
    integer :: i, j
    real :: x, y1, y2
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
    open(unit=10, file='quadratic_data.txt', status='replace')

    ! Tulis data ke dalam file
    do j = 8, 9 ! Variasi nilai j dari 8 ke 9
        do i = 1, n
            x = 0.1 * real(i)
            y1 = -x**2 + real(j)*x
            y2 = -x**2 + (real(j)-1)*x - 1
            write(10, *) x, y1, y2
        end do
    end do

    ! Tutup file
    close(unit=10)

    print *, 'Data telah berhasil dihasilkan.'

    ! Panggil Gnuplot untuk membuat grafik
    call execute_command_line('gnuplot plot_commands.plt')

    ! Tunggu masukan sebelum program selesai
    print *, 'Tekan Enter untuk menutup...'
    read(*,*)

end program ADF

