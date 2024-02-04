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
    real :: x, y, z
    integer :: i, j
    integer, parameter :: nx = 100, ny = 100 ! Jumlah titik data
    character(len=100) :: gnuplot_command
   
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
    open(unit=10, file='contour_data.txt', status='replace')

    ! Tulis data ke dalam file
    do i = 1, nx
        do j = 1, ny
            x = 0.1 * real(i)
            y = 0.1 * real(j)
            z = sin(x) * cos(y) ! Fungsi yang digunakan sebagai contoh, ganti dengan fungsi Anda
            write(10, *) x, y, z
        end do
    end do

    ! Tutup file
    close(unit=10)

    print *, 'Data kontur telah berhasil dihasilkan.'

    ! Memanggil Gnuplot untuk membuat plot
    gnuplot_command = 'gnuplot -persist -e "splot ''contour_data.txt'' with lines"'
    call system(gnuplot_command)


end program ADF
