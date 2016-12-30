--��ܧ��㪺��ƪ�w�q
--�U�C�d�ҷ|��ܧt�� AdventureWorks ��Ʈw���ҫإߪ� PurchaseOrderDetail ��ƪ��Ҧ���������w�q�������ƪ�w�q�C�Ъ`�N�A��ƪ��c�y�z�|�ܧ� dbo�A�H����d�ҡC


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