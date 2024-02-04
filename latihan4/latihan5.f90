program BladeForces
    implicit none
    integer :: i, j, k
    integer, parameter :: num_blades = 12
    integer, parameter :: num_elements = 10
    real :: V, rho, root_length, tip_length, omega, twist_angle
    real :: root_chord_length, tip_chord_length, taper_ratio
    real :: alpha_data(13), CL_data(13), CD_data(13)
    real :: alpha_variation(num_elements * num_blades)
    real :: r, dr, chord_length, alpha_interp, CL, CD, phi
    real :: dA, dL, dD, dT, T
    character(len=100) :: output_filename

    ! Parameter NACA 4412
    V = 100.0              ! Kecepatan aliran udara (m/s)
    rho = 1.225            ! Kerapatan udara (kg/m^3)
    root_length = 0.051    ! Panjang dari root ke pusat rotor (m)
    tip_length = 0.0975    ! Panjang dari tip ke pusat rotor (m)
    omega = 1466.07        ! Kecepatan putaran rotor (rad/s)
    twist_angle = 0.0      ! Sudut twist sudu (degrees)
    root_chord_length = 0.08 ! Panjang chord elemen sudu di pangkal (meter)
    tip_chord_length = 0.04  ! Panjang chord elemen sudu di ujung (meter)
    taper_ratio = tip_chord_length / root_chord_length

    ! Data polar untuk NACA 4412 Re 75.000
    alpha_data = [0.0, 2.0, 3.7, 5.5, 8.0, 10.0, 11.0, 12.0, 12.8, 13.5, 14.8, 15.2, 16.8]
    CL_data = [0.29, 0.425, 0.56, 0.6725, 0.82, 0.955, 1.04, 1.105, 1.15, 1.175, 1.275, 1.3, 1.35]
    CD_data = [0.21, 0.21, 0.22, 0.24, 0.245, 0.275, 0.28, 0.295, 0.31, 0.3225, 0.3225, 0.325, 0.3425]

    ! Variasi sudut serang untuk setiap sudu dan elemen
    do i = 1, num_elements
        do j = 1, num_blades
            alpha_variation((j - 1) * num_elements + i) = 6.0 + real(i - 1) * 0.4
        end do
    end do
    
    print *, alpha_variation

    ! Inisialisasi total gaya angkat
    T = 0.0

    ! Tulis hasil ke dalam file
    open(unit=10, file='hasil.txt', status='replace', action='write')

    ! Loop untuk setiap bilah
    do i = 1, num_blades
        ! Loop untuk setiap elemen sudu
        do j = 1, num_elements

            ! Hitung radius elemen sudu dan lebar elemen sudu
            r = root_length + (tip_length - root_length) * real(j - 1) / real(num_elements - 1)
            dr = (tip_length - root_length) / real(num_elements)
            
            ! Hitung panjang chord berdasarkan taper ratio dan distribusi merata
            chord_length = root_chord_length * (1.0 - real(j - 1) / real(num_elements - 1) * (1.0 - taper_ratio))

            ! Pilih indeks data polar yang sesuai dengan sudut serang
            do k = 1, 13
                if (abs(alpha_data(k) - alpha_variation((i - 1) * num_blades + j)) < 1e-6) then
                    alpha_interp = alpha_variation((i - 1) * num_blades + j)
                    CL = CL_data(k)
                    CD = CD_data(k)
                    exit ! Keluar dari loop jika sudah ditemukan alpha yang cocok
                end if
            end do

            ! Variasi sudut serang untuk setiap sudu dan elemen
            phi = atan(V * (1.0 + 0.5 * chord_length * cos(twist_angle * acos(-1.0) / 180.0)) / (omega * r)) * 180.0 / acos(-1.0)

            ! Hitung elemen gaya angkat dan gaya drag
            dA = chord_length * dr ! Elemen luas
            dL = 0.5 * rho * V**2 * dA * CL
            dD = 0.5 * rho * V**2 * dA * CD
            
            ! Transformasikan elemen gaya angkat
            dT = dL * cos(phi * acos(-1.0) / 180.0) - dD * sin(phi * acos(-1.0) / 180.0)
            
            ! Akumulasikan gaya angkat dan gaya drag dari elemen sudu
            T = T + dT
            
            !print *, alpha_interp
            

        end do
    end do

    close(unit=10)
    ! Tunggu masukan sebelum program selesai
    print *, 'Tekan Enter untuk menutup...'
    read(*,*)
    
end program BladeForces
