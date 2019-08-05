
      program fizzbuzz

          integer i, finish
          i = 1
          finish = 100

          do while (i .LE. finish)
              if (MOD(i, 3) .EQ. 0) then
                  write(*, "(A)", advance="no") "Fizz"
              endif
              if (MOD(i, 5) .EQ. 0) then
                  write(*, "(A)", advance="no") "Buzz"
              endif
              if (MOD(i, 3) .NE. 0 .AND. MOD(i, 5) .NE. 0) then
                  write(*,"(I0)", advance="no") i
              endif
              write(*,"(A)") ""
              i = i + 1
          enddo

          stop
          end
