-- CreateTable
CREATE TABLE "Log" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "method" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "headers" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "response" TEXT,
    "timestamp" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "AIConfiguration" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "provider" TEXT NOT NULL DEFAULT 'openai',
    "model" TEXT NOT NULL,
    "temperature" REAL,
    "maxTokens" INTEGER,
    "topP" REAL,
    "frequencyPenalty" REAL,
    "presencePenalty" REAL,
    "isDefault" BOOLEAN NOT NULL DEFAULT false,
    "apiKey" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "ModelCost" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "provider" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "inputTokenCost" REAL NOT NULL,
    "outputTokenCost" REAL NOT NULL,
    "validFrom" DATETIME NOT NULL,
    "validTo" DATETIME
);

-- CreateIndex
CREATE INDEX "Log_timestamp_idx" ON "Log"("timestamp");

-- CreateIndex
CREATE UNIQUE INDEX "AIConfiguration_name_key" ON "AIConfiguration"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ModelCost_provider_model_validFrom_key" ON "ModelCost"("provider", "model", "validFrom");
