program data_pengguna
    implicit none
    character(len=100) :: nama_lengkap, file_name
    integer :: ios
    character(len=100) :: dummy_line

    ! Meminta input dari pengguna
    print *, 'Masukkan Nama Lengkap Anda:'
    read(*,'(A100)') nama_lengkap

    ! Membuat nama file menggunakan input pengguna
    file_name = trim(nama_lengkap) // '_hasil.txt'

    ! Menulis output ke file dengan nama yang ditentukan pengguna
    open(unit=10, file=file_name, status='unknown', action='write', iostat=ios)
    if (ios /= 0) then
        print *, 'Error saat membuka file.'
        stop
    end if
    write(10, '(A)') 'Nama: ' // trim(nama_lengkap)
    close(unit=10)

    print *, 'Data telah disimpan ke dalam file ', trim(file_name)
    print *, 'Tekan tombol apa saja untuk keluar...'
    ! Menunggu pengguna menekan tombol
    read(*, '(A100)') dummy_line  ! Membaca input dari pengguna

end program data_pengguna
