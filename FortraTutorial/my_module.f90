module my_module
type person                        ! derived datatype
  character(len=10) :: name
  real              :: age
  integer           :: id
end type person
type (person), dimension(10) :: we ! array of structures

private             :: reset  ! The subroutine reset (defined
                              ! below after the "contains"
                              ! statement) is made private,
                              ! i.e. it is only accessible from
                              ! within the module

contains                      ! Subroutines and functions are
                              ! placed after the contains
                              ! statement

subroutine print(p)           ! subroutine contained in the
                              ! module
type(person)     :: p
write (*,'(a,a10,1x,f4.1,1x,i8)') 'Name, age, id : ', &
             p%name, p%age, p%id
end subroutine print

subroutine print_and_reset(p)
type(person)     :: p
write (*,'(a,a10,1x,f4.1,1x,i8)') 'Name, age, id : ', &
             p%name, p%age, p%id
call reset(p)
end subroutine print_and_reset

subroutine reset(p)           ! Private subroutine only
type(person)     :: p         ! accessible from within module
p%name = 'undef'
p%age  = -1.
p%id   = 0
end subroutine reset

end module my_module

