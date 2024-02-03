program data_pengguna
    implicit none
    character(len=100) :: nama_lengkap, file_name
    integer :: ios

    ! Meminta input dari pengguna
    print *, 'Masukkan Nama Lengkap Anda:'
    read(*,'(A100)') nama_lengkap

    ! Membuat nama file menggunakan input pengguna
    ! Dibawah ini adalah fungsi untuk membuat nama file nya
    file_name = trim(nama_lengkap) // '.txt'

    ! Menulis output ke file dengan nama yang ditentukan pengguna
    open(unit=10, file=file_name, status='unknown', action='write', iostat=ios)
    if (ios /= 0) then
        print *, 'Error saat membuka file.'
        stop
    end if
    write(10, '(A)') 'Nama: ' // trim(nama_lengkap)
    close(unit=10)

    print *, 'Data telah disimpan ke dalam file ', trim(file_name)

end program data_pengguna
