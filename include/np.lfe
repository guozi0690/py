;;;; The functions wrapped in this inlcude are from the following sources:
;;;;
;;;;  * http://docs.scipy.org/doc/numpy/reference/routines.array-creation.html
;;;;  *
(eval-when-compile

  (defun get-np-create-funcs ()
    '(;; Array creation routines - Ones and zeros
      (empty 1) (empty 2) (empty 3)
      (empty_like 1) (empty_like 2) (empty_like 3) (empty_like 4)
      (eye 1) (eye 2) (eye 3) (eye 4)
      (identity 1) (identity 2)
      (ones 1) (ones 2) (ones 3)
      (ones_like 1) (ones_like 2) (ones_like 3) (ones_like 4)
      (zeros 1) (zeros 2) (zeros 3)
      (zeros_like 1) (zeros_like 2) (zeros_like 3) (zeros_like 4)
      (full 2) (full 3)
      (full_like 2) (full_like 3) (full_like 4) (full_like 5)
      ;; Array creation routines - From existing data
      (array 1) (array 2) (array 3) (array 4) (array 5) (array 6)
      (asarray 1) (asarray 2) (asarray 3)
      (asanyarray 1) (asanyarray 2) (asanyarray 3)
      (ascontiguousarray 1) (ascontiguousarray 2)
      (asmatrix 1) (asmatrix 2)
      (copy 1) (copy 2)
      (frombuffer 1) (frombuffer 2) (frombuffer 3) (frombuffer 4)
      (fromfile 1) (fromfile 2) (fromfile 3) (fromfile 4)
      (fromfunction 2) (fromfunction 3)
      (fromiter 2) (fromiter 3)
      (fromstring 1) (fromstring 2) (fromstring 3) (fromstring 4)
      (loadtxt 1) (loadtxt 2) (loadtxt 3) (loadtxt 4) (loadtxt 5) (loadtxt 6)
      (loadtxt 7) (loadtxt 8) (loadtxt 9)
      ;; Array creation routines - Creating record arrays
      ;; Array creation routines - Creating character arrays
      ;; Array creation routines - Numerical ranges
      ;; Array creation routines - Building matrices
      ;; Array creation routines - The Matrix class
      ;; Array manipulation routines - Changing array shape
      ;; Array manipulation routines - Transpose-like operations
      ;; Array manipulation routines - Changing number of dimensions
      ;; Array manipulation routines - Changing kind of array
      ;; Array manipulation routines - Joining arrays
      ;; Array manipulation routines - Splitting arrays
      ;; Array manipulation routines - Tiling arrays
      ;; Array manipulation routines - Adding and removing elements
      ;; Array manipulation routines - Rearranging elements
      )))

(defmacro generate-np-create-api ()
  `(progn ,@(lsci-util:make-funcs (get-np-create-funcs) 'numpy)))

(generate-np-create-api)

(defun loaded ()
  "This is just a dummy function for display purposes when including from the
  REPL (the last function loaded has its name printed in stdout).
  This function needs to be the last one in this include."
  'loaded)