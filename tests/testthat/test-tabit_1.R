test_that(
  "tabit_1",
  {
    expect_true(
      nrow(tabit_1(1)) == 2
    )

    expect_true(
      nrow(
        tabit_1(1, useNA = "no")
      ) == 1
    )

    expect_true(
      nrow(
        tabit_1(1, useNA = NULL)
      ) == 1
    )

    expect_true(
      nrow(
        tabit_1(NA, useNA = NULL)
      ) == 0
    )

    expect_true(
      nrow(
        tabit_1(list(), useNA = NULL)
      ) == 0
    )

    expect_true(
      ncol(
        tabit_1(list(), useNA = NULL)
      ) == 5
    )

    expect_true(
      is.null(
        ncol(
          tabit_1(list(), useNA = NULL, as_df  = FALSE)
        )
      )
    )

    expect_true(
      ncol(
        tabit_1(data.frame(a = 1:10, b = 0))
      ) == 5
    )
  }
)
