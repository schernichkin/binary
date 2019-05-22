{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_binary (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,8,7,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/schernichkin/Projects/binary/.stack-work/install/x86_64-linux/lts-13.22/8.6.5/bin"
libdir     = "/home/schernichkin/Projects/binary/.stack-work/install/x86_64-linux/lts-13.22/8.6.5/lib/x86_64-linux-ghc-8.6.5/binary-0.8.7.0-BLOwEKiKlD84pHPCNhnRK5"
dynlibdir  = "/home/schernichkin/Projects/binary/.stack-work/install/x86_64-linux/lts-13.22/8.6.5/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/schernichkin/Projects/binary/.stack-work/install/x86_64-linux/lts-13.22/8.6.5/share/x86_64-linux-ghc-8.6.5/binary-0.8.7.0"
libexecdir = "/home/schernichkin/Projects/binary/.stack-work/install/x86_64-linux/lts-13.22/8.6.5/libexec/x86_64-linux-ghc-8.6.5/binary-0.8.7.0"
sysconfdir = "/home/schernichkin/Projects/binary/.stack-work/install/x86_64-linux/lts-13.22/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "binary_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "binary_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "binary_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "binary_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "binary_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "binary_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
