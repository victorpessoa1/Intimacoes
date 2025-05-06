/*
  Warnings:

  - You are about to drop the `Usuario` table. If the table is not empty, all the data it contains will be lost.

*/
BEGIN TRY

BEGIN TRAN;

-- DropTable
DROP TABLE [dbo].[Usuario];

-- CreateTable
CREATE TABLE [dbo].[Colaborador] (
    [uuid] NVARCHAR(1000) NOT NULL,
    [nome] NVARCHAR(1000) NOT NULL,
    [CPF] NVARCHAR(1000) NOT NULL,
    [email] NVARCHAR(1000) NOT NULL,
    [created_at] DATETIME2 NOT NULL CONSTRAINT [Colaborador_created_at_df] DEFAULT CURRENT_TIMESTAMP,
    [updated_at] DATETIME2 NOT NULL,
    CONSTRAINT [Colaborador_pkey] PRIMARY KEY CLUSTERED ([uuid]),
    CONSTRAINT [Colaborador_CPF_key] UNIQUE NONCLUSTERED ([CPF]),
    CONSTRAINT [Colaborador_email_key] UNIQUE NONCLUSTERED ([email])
);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
