/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [User].[dbo].[Page]
  WHERE id > 5 * (1 - '1') and id <= 5 * '1'
