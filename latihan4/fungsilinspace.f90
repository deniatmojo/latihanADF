program linspace_example
    implicit none
    integer :: num_elements, i
    real :: start_val, end_val, step
    real, dimension(:), allocatable :: alpha_variation

    ! Tentukan jumlah elemen dan nilai awal dan akhir
    num_elements = 10
    start_val = 6.0
    end_val = 10.0

    ! Hitung selisih antara nilai awal dan akhir
    step = (end_val - start_val) / real(num_elements - 1)

    ! Alokasikan array
    allocate(alpha_variation(num_elements))

    ! Isi array dengan nilai yang merata
    do i = 1, num_elements
        alpha_variation(i) = start_val + real(i - 1) * step
    end do

    ! Cetak hasil
    print *, "Array alpha_variation:"
    do i = 1, num_elements
        print *, alpha_variation(i)
    end do

    ! Bebaskan memori yang dialokasikan
    deallocate(alpha_variation)
    
    ! Tunggu masukan sebelum program selesai
    print *, 'Tekan Enter untuk menutup...'
    read(*,*)

end program linspace_example
