vnTR=2
DsT="AUST--CRAF--TOS|--ABCD--ARKU--TILS"
--ID=os.getComputerID()
--ArkUtilsTR lib Begins Here

function AUmTR2(MG, TN, SC) -- DO NOT CALL ON IT'S OWN, WILL FAIL IF CALLED WITHOUT TOKEN
  
end

function AUmTR (MS, TK, S) --ArkUtils(main)Transmit
  if TK=="" then
    TK=DsT --WARNING!! THIS IS HIGHLY INSECURE
    print("Warning: ArkUtilsTR: 9: Using Default Token, Run AUaST(Token,0) or AUaST(AUaCT(1),1) to Resolve")
    AUmTR2(MS, TK, S)
  end
end

function AUmRC ()--Arkutils(main)Recieve
  
end

function AUaAU () --ArkUtils(Auth)Authenticate
  
end

function AUaST (TK, S) --ArkUtils(Auth)Set Token (NOTE: Standard token format is 6 4 character blocks separated by --, Alternatively, High Sec: 8 6 char blocks); set S to 1 for HS, 0 for std
  
end

function AUaDA () --ArkUtils(Auth)DeAuthenticate
end

function AUaUT (tk) --ArkUtils(Auth)Unset Token
AUmTR("Unset Token", tk)
end

function AUaCT (S) --ArkUtils(Auth)Create Token; Run as argument to AUaST, S will be 0 for std, and 1 for High Security
  C = {}
  B = os.time() 
  if S==0 then
      for A= 1, 6, 1 do
        B2 = B * A
        math.randomseed(B2)
        C[A] = math.random(1000, 9999)
      end
    D = C[1].."--"..C[2].."--"..C[3].."--"..C[4].."--"..C[5].."--"..C[6]
    E = string.format("%q", D)
    return E
  elseif S==1 then
      for A = 1, 8, 1 do
        B2 = B*A
        math.randomseed(B2)
        C[A] = math.random(100000, 999999)
      end
    D = C[1].."--"..C[2].."--"..C[3].."--"..C[4].."--"..C[5].."--"..C[6].."--"..C[7].."--"..C[8]
    E = string.format("%q", D)
    return E
  end
end
