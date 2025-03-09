Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C144A482F2
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Mar 2025 06:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741501920; cv=none; b=uapvbk5qTKt7Cy6f22SBYF/qV/P629EhWFZFAN7ZzvQvAqOdaHt0jy2+SRncBQnjjOoZrb3JaSIFjO0Ved5kEyCLjbMxoG/Cs1cSapEIoQLv8lMUhbhBqjZK5HMvutvN9JOoL7GuAzVgUR0eXLN6dszJb2VDT+9B0E3JLlG1P/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741501920; c=relaxed/simple;
	bh=vLUQnVAx76cQHrPkU0P8UF9q1vqf4fVfJw21QrEFtiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mpPqWU6tQJslc/ypF+WZ2wkTn7Ss/ZLq7QbLF8as4G6XwtngkWdPClmrfRDZbwPOiBdLC9cnnZpDhUkPtFr1tkd3LiLN7husWZD3kvDmt5UK5cp04kGcEFRPsM5PSZ9b3oljXCWSu/3zvSaKdpsOINhBgL2jGUpoxrIEu/mcVus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6nZ5+Ak; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6nZ5+Ak"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so4859368a12.0
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Mar 2025 22:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741501917; x=1742106717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BueZoKAlsBuHXJlqKxHoFkSZF/xH9r9pbfT5RpwgsrA=;
        b=N6nZ5+AkDaDmlMdBbCgDwfWjLLC0os3KQBbThAfUEaOz/M3EYCKw48xzL0ci8gCOx9
         Azeux2WoOQspXiqeY522lDWEP/Mnr1cGP7jRBn5htinjXv7U6G9qk7BudaMappbWNXnf
         cP5liTGleVVVRpTQXwMWljzS5703BRt7BN/gnsnpddPOS1h14YgWZNop6hlzV1c1Qf54
         fyaHP+g0C7TWNWqCQJ3rZfa7gtKgvWbzon7f0GVPSvkpnaUU4GhFdZRGOibgmwBoZZky
         9KL5tUwOvNMwCZf4vlQHWWTbQgZWiKNv1jTc9YAwN3UDAag4sxnidOP2gylY2e/18eMu
         EwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741501917; x=1742106717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BueZoKAlsBuHXJlqKxHoFkSZF/xH9r9pbfT5RpwgsrA=;
        b=BlMCTXq8/vkGi/aQpI+e17ECaHBv2XQWiDvECN9ntiyRP/XOcfBhIElbsG4t1LYytB
         gNyJCn5BnIZXkKBPCQtZ8pZNp8v8Gg0SQkzsEWH10Uk2WxFWIPFBaEREcpMAaX4WOCWN
         b4yKvB3DLT7ezmFk5SmbtCDFhZ10m395F0fpRZxYW2n79r7F9xnzB/L3seG76Tzkzonn
         HLz/sl4OWnUr8vTzUJnh57w8wR68r6RzYOWaHvCiMaRChQJ0hFZSgBm21n4t+JRsDEcv
         bUD84y0Nf4jlEHkvc4RjdwFhyYFCXQsab6hnHfMxAiGERq7NnCx6NOV3oMQXZGlOyWE7
         uMrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaBNdw9/6FPZpEOTzJVdIALo5ioqvKTUbwVMFR1wSx3KDEPqhjehl3Xo6FfQxgICRCVqgTS037R5+AFw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxzf2Zsy+wCuhct8SuMcFYkMC3zW8ZvrWDwrSPYoOTt56Rektfz
	YjpwI3JSTr5uKizpvFE8qsrbmSjhMH8PmNV6tx8/YZMlT71xZ9x/
X-Gm-Gg: ASbGncv8g/80wP4wCJ6OYfxuq8HfDHrBJlRfSEawkL/S2EsuVhdj9StW0IjU2iCqppo
	Gr4EPa4folfmJr3kZ18URkmTz4GOGDbR+pLLifzGWNsFb7UQPq9U/uuj7iKyuZoH6UvrJNRU6yX
	h1Qfz3VOGiy6tNg3cR1aHCXJ1etKLVu6p09kpNyUPqvi7e5VOuM8030hUWbSzXLMnt40m5BRkN1
	d+WhmVN0OkMtV2bHqkYutjpp/VcFeYEcytJgkcjH2562p72CiW7tY1ZJoqhEJeLIUqnsRWW04DI
	UkDCHVhNcuW3CtONcTS/SITV6ZY5deVTX9WCxTxVSQxKESBqv8hDJtBMnV/inXTo
X-Google-Smtp-Source: AGHT+IEpauUzy1DzEkjD40U/W3Gc3OkGrGojbrbJFfXcnarULonDTm8fzj054kPoTgG+82MUqJS83g==
X-Received: by 2002:a17:907:7213:b0:abf:3f82:1218 with SMTP id a640c23a62f3a-ac252fba0fdmr988506066b.46.1741501916999;
        Sat, 08 Mar 2025 22:31:56 -0800 (PST)
Received: from localhost.localdomain ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239438fd1sm552978766b.18.2025.03.08.22.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:31:56 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com,
	trini@konsulko.com
Cc: macromorgan@hotmail.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/2] sunxi: H616: dram: Improve address wrapping detection
Date: Sun,  9 Mar 2025 07:31:43 +0100
Message-ID: <20250309063143.62859-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309063143.62859-1-jernej.skrabec@gmail.com>
References: <20250309063143.62859-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It turns out that checking just one write is not enough. Due to
unexplained reasons scan procedure detected double the size. By making
16 dword writes and comparisons that never happens.

New procedure is also inverted. Instead of writing two different values
to base address and some offset and then reading both and comparing
values, simplify this by writing pattern at the base address and then
search for this pattern at some offset.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/dram_sun50i_h616.c | 58 +++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index 6f84e59e39cd..1e21f5dd451f 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -1360,38 +1360,92 @@ static void mctl_auto_detect_rank_width(const struct dram_para *para,
 	panic("This DRAM setup is currently not supported.\n");
 }
 
+static void mctl_write_pattern(void)
+{
+	unsigned int i;
+	u32 *ptr, val;
+
+	ptr = (u32 *)CFG_SYS_SDRAM_BASE;
+	for (i = 0; i < 16; ptr++, i++) {
+		if (i & 1)
+			val = ~(ulong)ptr;
+		else
+			val = (ulong)ptr;
+		writel(val, ptr);
+	}
+}
+
+static bool mctl_check_pattern(ulong offset)
+{
+	unsigned int i;
+	u32 *ptr, val;
+
+	ptr = (u32 *)CFG_SYS_SDRAM_BASE;
+	for (i = 0; i < 16; ptr++, i++) {
+		if (i & 1)
+			val = ~(ulong)ptr;
+		else
+			val = (ulong)ptr;
+		if (val != *(ptr + offset / 4))
+			return false;
+	}
+
+	return true;
+}
+
 static void mctl_auto_detect_dram_size(const struct dram_para *para,
 				       struct dram_config *config)
 {
 	unsigned int shift, cols, rows;
+	u32 buffer[16];
 
 	/* max. config for columns, but not rows */
 	config->cols = 11;
 	config->rows = 13;
 	mctl_core_init(para, config);
 
+	/*
+	 * Store content so it can be restored later. This is important
+	 * if controller was already initialized and holds any data
+	 * which is important for restoring system.
+	 */
+	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
+
+	mctl_write_pattern();
+
 	shift = config->bus_full_width + 1;
 
 	/* detect column address bits */
 	for (cols = 8; cols < 11; cols++) {
-		if (mctl_mem_matches(1ULL << (cols + shift)))
+		if (mctl_check_pattern(1ULL << (cols + shift)))
 			break;
 	}
 	debug("detected %u columns\n", cols);
 
+	/* restore data */
+	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
+
 	/* reconfigure to make sure that all active rows are accessible */
 	config->cols = 8;
 	config->rows = 17;
 	mctl_core_init(para, config);
 
+	/* store data again as it might be moved */
+	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
+
+	mctl_write_pattern();
+
 	/* detect row address bits */
 	shift = config->bus_full_width + 4 + config->cols;
 	for (rows = 13; rows < 17; rows++) {
-		if (mctl_mem_matches(1ULL << (rows + shift)))
+		if (mctl_check_pattern(1ULL << (rows + shift)))
 			break;
 	}
 	debug("detected %u rows\n", rows);
 
+	/* restore data again */
+	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
+
 	config->cols = cols;
 	config->rows = rows;
 }
-- 
2.48.1

