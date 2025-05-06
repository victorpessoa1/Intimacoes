BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Login] (
    [colaborador_uuid] NVARCHAR(1000) NOT NULL,
    [autorizado] BIT NOT NULL,
    [email] NVARCHAR(1000) NOT NULL,
    [senha] NVARCHAR(1000) NOT NULL,
    [acesso] NVARCHAR(1000) NOT NULL,
    [created_at] DATETIME2 NOT NULL CONSTRAINT [Login_created_at_df] DEFAULT CURRENT_TIMESTAMP,
    [updated_at] DATETIME2 NOT NULL,
    CONSTRAINT [Login_pkey] PRIMARY KEY CLUSTERED ([colaborador_uuid]),
    CONSTRAINT [Login_email_key] UNIQUE NONCLUSTERED ([email])
);

-- AddForeignKey
ALTER TABLE [dbo].[Login] ADD CONSTRAINT [Login_colaborador_uuid_fkey] FOREIGN KEY ([colaborador_uuid]) REFERENCES [dbo].[Colaborador]([uuid]) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
