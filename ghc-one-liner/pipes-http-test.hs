 import Pipes
 import Pipes.HTTP
 import qualified Pipes.ByteString as PB  -- from `pipes-bytestring`

 main = do
     req <- parseUrl "https://www.google.com"
     withManager tlsManagerSettings $ \m ->
         withHTTP req m $ \resp ->
             runEffect $ responseBody resp >-> PB.stdout
