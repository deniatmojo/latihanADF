program interpolasi_data
    implicit none
    integer :: n, i
    real :: x(100), y(100), x_interp, y_interp

    ! Memasukkan data yang akan diinterpolasi
    print *, "Masukkan jumlah data (maksimal 100): "
    read *, n

    print *, "Masukkan data x dan y (pisahkan dengan spasi): "
    do i = 1, n
        read *, x(i), y(i)
    end do

    ! Memasukkan titik x yang akan diinterpolasi
    print *, "Masukkan titik x yang ingin diinterpolasi: "
    read *, x_interp

    ! Melakukan interpolasi linier
    call interpolate_linear(x, y, n, x_interp, y_interp)

    ! Menampilkan hasil interpolasi
    
    print *, "Nilai y pada titik x = ", x_interp, " adalah ", y_interp
    read(*,*)

end program interpolasi_data

subroutine interpolate_linear(x, y, n, x_interp, y_interp)
    implicit none
    real, intent(in) :: x(n), y(n), x_interp
    integer, intent(in) :: n
    real, intent(out) :: y_interp
    integer :: i

    ! Mencari dua titik data terdekat
    do i = 1, n-1
        if (x(i) <= x_interp .and. x(i+1) >= x_interp) then
            ! Melakukan interpolasi linier
            y_interp = y(i) + (y(i+1) - y(i)) * (x_interp - x(i)) / (x(i+1) - x(i))
            return
        end if
    end do

    ! Handle jika titik x_interp di luar jangkauan data
    print *, "Peringatan: Titik x yang ingin diinterpolasi berada di luar jangkauan data."
    y_interp = 0.0
end subroutine interpolate_linear


