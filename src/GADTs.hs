{-# language GADTs #-}

module GADTs where

data F a where
    F :: Show a => a -> F a

data G a where
    G :: Show a => {
        name :: a,
        age :: Int
    } -> G a

data NoShow = NoShow

-- wontCompile :: F NoShow
-- wontCompile = F NoShow

testIt :: G Int
testIt = G { name = 3, age = 4 }

