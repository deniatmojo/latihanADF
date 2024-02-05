program interpolasi_data
    implicit none
    integer :: n
    real :: x_interp, CL_interp, CD_interp

    ! Data polar untuk NACA 4412 Re 75.000
    real, dimension(13) :: alpha_data = (/0.0, 2.0, 3.7, 5.5, 8.0, 10.0, 11.0, 12.0, 12.8, 13.5, 14.8, 15.2, 16.8/)
    real, dimension(13) :: CL_data = (/0.29, 0.425, 0.56, 0.6725, 0.82, 0.955, 1.04, 1.105, 1.15, 1.175, 1.275, 1.3, 1.35/)
    real, dimension(13) :: CD_data = (/0.21, 0.21, 0.22, 0.24, 0.245, 0.275, 0.28, 0.295, 0.31, 0.3225, 0.3225, 0.325, 0.3425/)
    
    ! Memasukkan titik x yang akan diinterpolasi
    print *, "Masukkan alpha yang ingin diinterpolasi: "
    read *, x_interp

    ! Melakukan interpolasi linier
    call interpolate_linearCLCD(alpha_data, CL_data, CD_data, n, x_interp, CL_interp, CD_interp)
    !call interpolate_linear(alpha_data, CD_data, n, x_interp, CL_interp)

    ! Menampilkan hasil interpolasi
    print *, "Nilai CL pada alpha = ", x_interp, " adalah ", CL_interp
    print *, "Nilai CD pada alpha = ", x_interp, " adalah ", CD_interp
    read(*,*)

end program interpolasi_data

subroutine interpolate_linearCLCD(alpha_data, CL_data, CD_data, n, x_interp, CL_interp, CD_interp)
    implicit none
    real, intent(in) :: alpha_data(n), CL_data(n), CD_data(n), x_interp
    integer, intent(in) :: n
    real, intent(out) :: CL_interp, CD_interp
    integer :: i

    ! Mencari dua titik data terdekat
    do i = 1, n-1
        if (alpha_data(i) <= x_interp .and. alpha_data(i+1) >= x_interp) then
            ! Melakukan interpolasi linier
            CL_interp = CL_data(i) + (CL_data(i+1) - CL_data(i)) * (x_interp - alpha_data(i)) / (alpha_data(i+1) - alpha_data(i))
            CD_interp = CD_data(i) + (CD_data(i+1) - CD_data(i)) * (x_interp - alpha_data(i)) / (alpha_data(i+1) - alpha_data(i))
            return
        end if
    end do
    ! Handle jika titik x_interp di luar jangkauan data
    print *, "Peringatan: Titik x yang ingin diinterpolasi berada di luar jangkauan data."
    CL_interp = 0.0
    
end subroutine interpolate_linearCLCD


