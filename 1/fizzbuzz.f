
      program fizzbuzz

          integer i, finish
          i = 1
          finish = 100

          do while (i .LE. finish)
              if (MOD(i, 3) .EQ. 0 .OR. MOD(i, 5) .EQ. 0) then
                  if (MOD(i, 3) .EQ. 0) then
                      write(*, "(A)", advance="no") "Fizz"
                  endif
                  if (MOD(i, 5) .EQ. 0) then
                      write(*, "(A)", advance="no") "Buzz"
                  endif
                  write(*,"(A)") ""
              else
                  write(*,"(I0)") i
              endif
              i = i + 1
          enddo

          stop
          end
