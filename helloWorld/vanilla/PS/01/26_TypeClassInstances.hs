elem :: Eq a => a -> [a] -> Bool

data RGB = RGB Int Int Int

instance Eq RGB where
    (RGB r1 g1 b1) == (RGB r2 g2 b2) =
        (r1 ==  r2) && (g1 == g2) && (b1 == b2)

        