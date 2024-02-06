program hitung_sudu
    implicit none
    integer :: j, num_elements
    real :: root_length, tip_length, r, dr, root_chord_length, taper_ratio, chord_length

    ! Parameter
    num_elements = 10
    root_length = 0.051
    tip_length = 0.0975
    root_chord_length = 0.08
    taper_ratio = 0.5 ! Misalnya, di sini saya asumsikan taper_ratio = 0.5

    ! Loop untuk menghitung r, dr, dan chord_length untuk setiap elemen sudu
    do j = 1, num_elements
        ! Hitung radius elemen sudu
        r = root_length + (tip_length - root_length) * real(j-1) / real(num_elements - 1)
        
        ! Hitung perubahan radius elemen sudu (dr)
        dr = (tip_length - root_length) / real(num_elements)

        ! Hitung panjang chord elemen sudu
        chord_length = root_chord_length * (1.0 - real(j-1) / real(num_elements - 1) * (1.0 - taper_ratio))
        
        ! Output hasil perhitungan untuk elemen sudu ke-j
        print '(A,I2)', 'Elemen sudu ke-', j
        print '(A,F10.4)', 'r = ', r
        print '(A,F10.4)', 'dr = ', dr
        print '(A,F10.4)', 'chord_length = ', chord_length
    end do
    read (*,*)

end program hitung_sudu
