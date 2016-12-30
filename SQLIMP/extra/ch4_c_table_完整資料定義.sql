--顯示完整的資料表定義
--下列範例會顯示含有 AdventureWorks 資料庫中所建立的 PurchaseOrderDetail 資料表之所有條件約束定義的完整資料表定義。請注意，資料表結構描述會變更為 dbo，以執行範例。


CREATE TABLE [dbo].[PurchaseOrderDetail]
(
    [PurchaseOrderID] [int] NOT NULL
        REFERENCES Purchasing.PurchaseOrderHeader(PurchaseOrderID),
    [LineNumber]      [smallint] NOT NULL,
    [ProductID]       [int] NULL 
        REFERENCES Production.Product(ProductID),
    [UnitPrice]       [money] NULL,
    [OrderQty]        [smallint] NULL,
    [ReceivedQty]     [float] NULL,
    [RejectedQty]     [float] NULL,
    [DueDate]         [datetime] NULL,
    [rowguid]         [uniqueidentifier] ROWGUIDCOL  NOT NULL
        CONSTRAINT [DF_PurchaseOrderDetail_rowguid] DEFAULT (newid()),
    [ModifiedDate]    [datetime] NOT NULL 
        CONSTRAINT [DF_PurchaseOrderDetail_ModifiedDate] DEFAULT (getdate()),
    [LineTotal]       AS (([UnitPrice]*[OrderQty])),
    [StockedQty]      AS (([ReceivedQty]-[RejectedQty])),
       CONSTRAINT [PK_PurchaseOrderDetail_PurchaseOrderID_LineNumber]
    PRIMARY KEY CLUSTERED ([PurchaseOrderID], [LineNumber])
    WITH (IGNORE_DUP_KEY = OFF)
) 
ON [PRIMARY];