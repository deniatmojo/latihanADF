program reynolds_number_program
    implicit none
    real :: chord_length, velocity, density, viscosity, reynolds_number

    ! Input panjang chord line
    print *, 'Masukkan panjang chord line (meter): '
    read(*, *) chord_length

    ! Input kecepatan aliran udara (m/s)
    print *, 'Masukkan kecepatan aliran udara (m/s): '
    read(*, *) velocity

    ! Input kerapatan udara (kg/m^3)
    print *, 'Masukkan kerapatan udara (kg/m^3): '
    read(*, *) density

    ! Input viskositas dinamis udara (kg/m.s)
    print *, 'Masukkan viskositas dinamis udara (kg/m.s): '
    read(*, *) viscosity

    ! Hitung Reynolds number
    reynolds_number = (density * velocity * chord_length) / viscosity

    ! Output nilai Reynolds number
    print *, 'Nilai Reynolds number: ', reynolds_number

end program reynolds_number_program
