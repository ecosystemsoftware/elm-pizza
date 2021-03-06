module TestCeil exposing (ceilTest)

import Test exposing (..)
import Expect exposing (equal)

import TestFunction exposing (testFunction)
import Round

data =
  [(0,"0","0.0","0.00")
  ,(0,"0","0.0","0.00")
  ,(0,"0","0.0","0.00")
  ,(0,"0","0.0","0.00")
  ,(0,"0","0.0","0.00")
  ,(99,"99","99.0","99.00")
  ,(9.9,"10","9.9","9.90")
  ,(0.99,"1","1.0","0.99")
  ,(0.099,"1","0.1","0.10")
  ,(0.0099,"1","0.1","0.01")
  ,(-99,"-99","-99.0","-99.00")
  ,(-9.9,"-9","-9.9","-9.90")
  ,(-0.99,"0","-0.9","-0.99")
  ,(-0.099,"0","0.0","-0.09")
  ,(-0.0099,"0","0.0","0.00")
  ,(1,"1","1.0","1.00")
  ,(1.1,"2","1.1","1.10")
  ,(1.01,"2","1.1","1.01")
  ,(1.001,"2","1.1","1.01")
  ,(-1,"-1","-1.0","-1.00")
  ,(-1.1,"-1","-1.1","-1.10")
  ,(-1.01,"-1","-1.0","-1.01")
  ,(-1.001,"-1","-1.0","-1.00")
  ,(213,"213","213.0","213.00")
  ,(213.1,"214","213.1","213.10")
  ,(213.01,"214","213.1","213.01")
  ,(213.001,"214","213.1","213.01")
  ,(-213,"-213","-213.0","-213.00")
  ,(-213.1,"-213","-213.1","-213.10")
  ,(-213.01,"-213","-213.0","-213.01")
  ,(-213.001,"-213","-213.0","-213.00")
  ,(5.5,"6","5.5","5.50")
  ,(5.55,"6","5.6","5.55")
  ,(5.555,"6","5.6","5.56")
  ,(5.5555,"6","5.6","5.56")
  ,(-5.5,"-5","-5.5","-5.50")
  ,(-5.55,"-5","-5.5","-5.55")
  ,(-5.555,"-5","-5.5","-5.55")
  ,(-5.5555,"-5","-5.5","-5.55")
  ,(5.5,"6","5.5","5.50")
  ,(5.51,"6","5.6","5.51")
  ,(5.501,"6","5.6","5.51")
  ,(5.5001,"6","5.6","5.51")
  ,(-5.5,"-5","-5.5","-5.50")
  ,(-5.51,"-5","-5.5","-5.51")
  ,(-5.501,"-5","-5.5","-5.50")
  ,(-5.5001,"-5","-5.5","-5.50")
  ,(4.9,"5","4.9","4.90")
  ,(4.99,"5","5.0","4.99")
  ,(4.999,"5","5.0","5.00")
  ,(4.9999,"5","5.0","5.00")
  ,(-4.9,"-4","-4.9","-4.90")
  ,(-4.99,"-4","-4.9","-4.99")
  ,(-4.999,"-4","-4.9","-4.99")
  ,(-4.9999,"-4","-4.9","-4.99")
  ]

ceilTest : Test
ceilTest =
  testFunction "ceiling" Round.ceiling data

