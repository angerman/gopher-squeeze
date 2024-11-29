{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE CApiFFI #-}

module Gopher (squeeze) where

import Foreign.C.String

-- Define the foreign import using capi
foreign import capi "libgopher.h squeeze" c_gopher_squeeze :: IO CString

-- Wrapper to convert CString to Haskell String
squeeze :: IO String
squeeze = c_gopher_squeeze >>= peekCString