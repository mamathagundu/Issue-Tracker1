BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Issue] (
    [id] INT NOT NULL IDENTITY(1,1),
    [title] VARCHAR(255) NOT NULL,
    [description] TEXT NOT NULL,
    [status] NVARCHAR(1000) NOT NULL CONSTRAINT [Issue_status_df] DEFAULT 'OPEN',
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [Issue_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    CONSTRAINT [Issue_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Persons] (
    [PersonID] INT NOT NULL IDENTITY(1,1),
    [LastName] VARCHAR(255),
    [FirstName] VARCHAR(255),
    [Address] VARCHAR(255),
    [City] VARCHAR(255),
    CONSTRAINT [Persons_pkey] PRIMARY KEY CLUSTERED ([PersonID])
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
