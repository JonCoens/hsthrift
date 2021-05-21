-----------------------------------------------------------------
-- Autogenerated by Thrift
--
-- DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
--  @generated
-----------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BangPatterns #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-overlapping-patterns#-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns#-}
{-# OPTIONS_GHC -fno-warn-incomplete-uni-patterns#-}
{-# LANGUAGE GADTs #-}
module Service.X.Service
       (XCommand(..), reqName', reqParser', respWriter', onewayFunctions')
       where
import qualified Control.Exception as Exception
import qualified Control.Monad.ST.Trans as ST
import qualified Control.Monad.Trans.Class as Trans
import qualified Data.ByteString.Builder as Builder
import qualified Data.Default as Default
import qualified Data.HashMap.Strict as HashMap
import qualified Data.Int as Int
import qualified Data.Proxy as Proxy
import qualified Data.Text as Text
import qualified Prelude as Prelude
import qualified Service.Types as Types
import qualified Thrift.Binary.Parser as Parser
import qualified Thrift.Codegen as Thrift
import qualified Thrift.Processor as Thrift
import qualified Thrift.Protocol.ApplicationException.Types
       as Thrift
import Control.Applicative ((<*), (*>))
import Data.Monoid ((<>))
import Prelude ((<$>), (<*>), (++), (.), (==))

data XCommand a where
  TestFunc :: XCommand Int.Int32

instance Thrift.Processor XCommand where
  reqName = reqName'
  reqParser = reqParser'
  respWriter = respWriter'
  onewayFns _ = onewayFunctions'

reqName' :: XCommand a -> Text.Text
reqName' TestFunc = "testFunc"

reqParser' ::
             Thrift.Protocol p =>
             Proxy.Proxy p -> Text.Text -> Parser.Parser (Thrift.Some XCommand)
reqParser' _proxy "testFunc"
  = ST.runSTT
      (do Prelude.return ()
          let
            _parse _lastId
              = do _fieldBegin <- Trans.lift
                                    (Thrift.parseFieldBegin _proxy _lastId _idMap)
                   case _fieldBegin of
                     Thrift.FieldBegin _type _id _bool -> do case _id of
                                                               _ -> Trans.lift
                                                                      (Thrift.parseSkip _proxy _type
                                                                         (Prelude.Just _bool))
                                                             _parse _id
                     Thrift.FieldEnd -> do Prelude.pure (Thrift.Some TestFunc)
            _idMap = HashMap.fromList []
          _parse 0)
reqParser' _ funName
  = Prelude.errorWithoutStackTrace
      ("unknown function call: " ++ Text.unpack funName)

respWriter' ::
              Thrift.Protocol p =>
              Proxy.Proxy p ->
                Int.Int32 ->
                  XCommand a ->
                    Prelude.Either Exception.SomeException a ->
                      (Builder.Builder,
                       Prelude.Maybe (Exception.SomeException, Thrift.Blame))
respWriter' _proxy _seqNum TestFunc{} _r
  = (Thrift.genMsgBegin _proxy "testFunc" _msgType _seqNum <>
       _msgBody
       <> Thrift.genMsgEnd _proxy,
     _msgException)
  where
    (_msgType, _msgBody, _msgException)
      = case _r of
          Prelude.Left _ex | Prelude.Just
                               _e@Thrift.ApplicationException{} <- Exception.fromException _ex
                             ->
                             (3, Thrift.buildStruct _proxy _e,
                              Prelude.Just (_ex, Thrift.ServerError))
                           | Prelude.otherwise ->
                             let _e
                                   = Thrift.ApplicationException (Text.pack (Prelude.show _ex))
                                       Thrift.ApplicationExceptionType_InternalError
                               in
                               (3, Thrift.buildStruct _proxy _e,
                                Prelude.Just (Exception.toException _e, Thrift.ServerError))
          Prelude.Right _result -> (2,
                                    Thrift.genStruct _proxy
                                      [Thrift.genFieldPrim _proxy "" (Thrift.getI32Type _proxy) 0 0
                                         (Thrift.genI32Prim _proxy)
                                         _result],
                                    Prelude.Nothing)

onewayFunctions' :: [Text.Text]
onewayFunctions' = []