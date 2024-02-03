        Program Balok
        Real::p,l,t,volume,luas
77      Print *, 'masukkan nilai panjang'
        Read *, p
        Print *, 'masukan nilai lebar'
        Read *, l
        Print *, 'masukkan nilai tinggi'
        Read *, t
        volume=p*l*t
        luas=2*(p*l+p*t+l*t)

        Print *, 'volume balok ='
        Print *, volume
        Print *, 'luas balok'
        Print *, luas
        GOTO 77
        End Program Balok
