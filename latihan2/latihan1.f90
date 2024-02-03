program data_pengguna
    implicit none
    character(len=100) :: nama_lengkap
    character(len=100) :: file_name
    integer :: ios

    ! Meminta input dari pengguna
    print *, 'Masukkan Nama Lengkap Anda:'
    read(*,'(A100)') nama_lengkap

    ! Menulis output ke file hasil.txt
    file_name = 'hasil.txt'
    open(unit=10, file=file_name, status='unknown', action='write', iostat=ios)
    if (ios /= 0) then
        print *, 'Error saat membuka file.'
        stop
    end if
    write(10, '(A)') 'Nama: ' // trim(nama_lengkap)
    close(unit=10)

    print *, 'Data telah disimpan ke dalam file hasil.txt'

end program data_pengguna
