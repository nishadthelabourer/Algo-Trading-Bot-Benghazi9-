//+------------------------------------------------------------------+
//|                                                     Benghazi.mq4 |
//|    Copyright 24-10-2020, Bools AND Strings software Corporation. |
//|                                                      www.B&S.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 24-10-2020, Bools AND Strings software Corporation."
#property link      "www.B&S.com"
#property version   "1.00"
#property strict
#include<customfunction.mqh>
int orderID;
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
      if(!CheckIfOpenOrdersByMagicNB(2222))
      {
         double candlehigh = High[1];
         double candlelow = Low[1];
         double difference = NormalizeDouble((candlehigh - candlelow),Digits);   
         Alert("Difference between high and low of candle:" + difference);
         if( difference > 1.54 && Ask < candlelow)
         {
            double stoploss = High[1];
            double takeprofit = NormalizeDouble((candlelow - difference),Digits);
            Alert("Stoploss: " + stoploss);
            Alert("Takeprofit: " + takeprofit);
            orderID = OrderSend(NULL,OP_SELL,0.1,Ask,15,stoploss,takeprofit,NULL,2222);
            Alert("EntryPrice:" + Ask);
            if (orderID < 0) Alert("Order ID:" + GetLastError());
            else Alert("Order ID: " + OrderTicket());
         }
       }    
      
      
  }

