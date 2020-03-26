#' @rdname tabit
#' @export
ti_tab1 <-
  function(...){
    .Deprecated("tabit_1/tabit_df")
    tabit(...)
  }

#' tabit
#'
#' @param ... parameters forwarded to tabit_1/tabit_df
#'
#' @export
#'
tabit <-
  function(...){
    if ( inherits(list(...)[[1]], "data.frame") ){
      return(tabit_x(...))
    } else {
     return(tabit_1(...))
    }
  }
