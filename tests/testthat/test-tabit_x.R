test_that(
  "tabit_x",
  {
    expect_error(
      tabit_x(1)
    )

    expect_error(
      tabit_x(matrix(1))
    )

    expect_true(
      nrow(
        tabit_x(data.frame(a=1))
      ) == 1
    )

    expect_true(
      nrow(
        tabit_x(data.frame(a=c(1, NA)))
      ) == 2
    )

    expect_true(
      nrow(
        tabit_x(data.frame(a = character()))
      ) == 0
    )

    expect_true(
      nrow(
        tabit_x(data.frame())
      ) == 0
    )

    expect_true(
      ncol(
        tabit_x(data.frame())
      ) == 1
    )

    expect_true(
      ncol(
        tabit_x(data.frame(a = integer(0)))
      ) == 2
    )


    expect_true(
        tabit_x(
          x = data.frame(a = c(1,2,2,3))
        )$.count[1] == 2
    )

    expect_true(
      tabit_x(
        x = data.frame(a = c(1,2,2,3)),
        sort = 0
      )$a[1] == 1
    )

    expect_true(
      tabit_x(
        x = data.frame(a = c(1,2,2,3)),
        sort = -1
      )$a[3] == 2
    )

    expect_true(
      tabit_x(
        x = data.frame(a = c(1,2,2,3)),
        sort = -1
      )$.count[3] == 2
    )

    expect_true(
      tabit_x(
        x = data.frame(a = c(1,2,2,3))
      )$a[1] == 2
    )

  }
)
