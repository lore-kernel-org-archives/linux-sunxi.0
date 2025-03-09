Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5044C79
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Mar 2025 06:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741501919; cv=none; b=R0d6Ivn9TXsUaPqKOpe3uofd3zlh6lf7wJa0/P6pEwjM6InyN5t/32FejMGdrNWZHfkWvLI3VlgAHMCwYv9xpsvzR65nW4kFbXvPAZwk0P4cf1PCui6WKwVtyJfzt0GuzZkBf5/yBi6YHSuBi0cpvt3u9d69gnjg6HrTScHEjaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741501919; c=relaxed/simple;
	bh=IPexaEZRFW25AhNVaQwaV0wnJhbT0jMo/cUTrBbF+c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nP9b3kTYVLmF4Kv+jFZ2Z52hQsCQf+ULvzb1yUZlXdWO4IPyob0Wg/NtPi+W9grSvpnoEzPocJPzW3RIHghYQzFNA4z9tvVBo09OjhalEX+V6+t7tRsnXth1WmioOb8Apkhgvn/vrTpA5Y6m2V6yn7ZWA5cfxQ12vr9S1voPcHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcWB0V5r; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcWB0V5r"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so388239a12.2
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Mar 2025 22:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741501916; x=1742106716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5CINmGC88mszs28hNlDu57B4wONVvupvbPkXeQoy5Q=;
        b=hcWB0V5rI869tXkKzLFX5Pk1UeVb/NIKqBxYRsCQ6nAT6odAjeMhJVTStKvZEc9Ug9
         jh/CvGYC6r6MKYPwDbXRB9X1OQKjb26otn4e5QrFVuwqq1V0XkPlR/cFP7XyF9Eg8/R+
         NNvEKyEKemjC1Zx7w7+ntqFOHlxP2d2zD+viLWnQsK2MofmxVzKhT6TIdoqgKaATErog
         1bs6Hzp2CIq25BrzCN0JynNaJWz9YyyEo2C3huXayuzIN+k8w0zPU/Cx7VscNArVQd4G
         JIG3d1WwzasW+u4KZNPDGd8k733yPhUDYJ2PPve+jcuyeiLsIcJKjO649bGdCC852ch6
         2sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741501916; x=1742106716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5CINmGC88mszs28hNlDu57B4wONVvupvbPkXeQoy5Q=;
        b=TxsJbQEUnlC+hsbfnRoGMMcmSWIqmXMj3p47nN0uxe8tPSQ0B2e1YCucqTL41GbKvj
         w/WrbHKE14JmXY2y3M9FClA3pr+bV3+b4ITMa2bakvLUhiR2UNO0PFmZs3Ven1CUnzhx
         xsBpg3PBs5U1RNuuSOIPuTT/rReWgv9ILw++gT8jOeHxTp063oGXUWUTZvjDA0kxeh6E
         mfavjKUc3gKDMNGc/sulKLZjA7JlyRQSf4LzRMjjjidcVKAFqPITSrzvjKFFIxgZV2Np
         G7E1x60upIiDzWM1W1TTbVHcBD/45BA/NKNnE/KdP7vDQ07mcT2BPOpZhCTaHDeVSBLj
         jiyw==
X-Forwarded-Encrypted: i=1; AJvYcCW7VSX6z2wktV6jf1r6Y4bKl5p3bHp/YkC0MMp8ArkxMKD8JAv+fpqWB+3nDdKWbXaQYJ0ga6zT24cHHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFgM7mQjck/9mJViTzQC1+A145SvUqfpyBc/hcZyhtvjtFEQ0k
	Z/56azIj50EBIwbpMor3OcJFGbrQar/DtqMaFk/i6Js10KWbUliH
X-Gm-Gg: ASbGncs6ZqMne3mOGO49menYyYgof+/dIM7JkJUTfJ+WM7gPBn+hxG0n1AxrektSt62
	KhH1boNEGBxDCUjb+LIXQaTNz3STrcjI6/Bhz3ZnuYxjPP2Ov4SvqKD9AEa5ZPGgc2XRg4P/mJ3
	MlRg+FJCm5D6jf+y7c+28QEA/7y3D0+eaB5rxc/ElQlDq8KeAbHdI/MsJcMD1NnbItT7kVDCHXK
	/EZqgQNSVoehu+5c+UJewVZoyNMuBc6NxpdlR3q/b1B3dBGhcSdH3siqEt3BS32fCO5hwZOk2Yy
	reRya6bBa2eIkfKjFrNkQpWbxiyLLC/t1G0OhqytOK+q2jNWwm9cIQZM/6+pHWpvgfznS5e9uOM
	=
X-Google-Smtp-Source: AGHT+IHBqVOgvCXwA9j35S72l6v7FHZCkL2seX5VXtOBX/sRh07uA7qpENS6jTqXYRKVIlrBBDDLyA==
X-Received: by 2002:a17:907:2d92:b0:ac2:2ba5:5471 with SMTP id a640c23a62f3a-ac252b3664bmr1116192566b.24.1741501915815;
        Sat, 08 Mar 2025 22:31:55 -0800 (PST)
Received: from localhost.localdomain ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239438fd1sm552978766b.18.2025.03.08.22.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:31:55 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com,
	trini@konsulko.com
Cc: macromorgan@hotmail.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] sunxi: h616: dram: Rework size detection
Date: Sun,  9 Mar 2025 07:31:42 +0100
Message-ID: <20250309063143.62859-2-jernej.skrabec@gmail.com>
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

Since there is quite a few possible DRAM configurations in terms of bus
width, rank and rows and columns count, size detection algorithm must be
very careful not to test combination which would be bigger than H616 is
actually capable of handling.

Ideally, we should always detect memory aliasing, even for 4 GB memory
size, which is the maximum amount of memory that H616 is capable of
handling. For this reason, we have to configure minimum amount of
supported rows when testing for columns and vice versa. This way test
code will never step out of 4 GB boundary.

While at it, check for 17 rows maximum. This aligns code with BSP DRAM
driver. There is probably no such configuration which would make sense
with 4 GB memory.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/dram_sun50i_h616.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index b3554cc64bf5..6f84e59e39cd 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -1363,7 +1363,7 @@ static void mctl_auto_detect_rank_width(const struct dram_para *para,
 static void mctl_auto_detect_dram_size(const struct dram_para *para,
 				       struct dram_config *config)
 {
-	unsigned int shift;
+	unsigned int shift, cols, rows;
 
 	/* max. config for columns, but not rows */
 	config->cols = 11;
@@ -1373,23 +1373,27 @@ static void mctl_auto_detect_dram_size(const struct dram_para *para,
 	shift = config->bus_full_width + 1;
 
 	/* detect column address bits */
-	for (config->cols = 8; config->cols < 11; config->cols++) {
-		if (mctl_mem_matches(1ULL << (config->cols + shift)))
+	for (cols = 8; cols < 11; cols++) {
+		if (mctl_mem_matches(1ULL << (cols + shift)))
 			break;
 	}
-	debug("detected %u columns\n", config->cols);
+	debug("detected %u columns\n", cols);
 
 	/* reconfigure to make sure that all active rows are accessible */
-	config->rows = 18;
+	config->cols = 8;
+	config->rows = 17;
 	mctl_core_init(para, config);
 
 	/* detect row address bits */
 	shift = config->bus_full_width + 4 + config->cols;
-	for (config->rows = 13; config->rows < 18; config->rows++) {
-		if (mctl_mem_matches(1ULL << (config->rows + shift)))
+	for (rows = 13; rows < 17; rows++) {
+		if (mctl_mem_matches(1ULL << (rows + shift)))
 			break;
 	}
-	debug("detected %u rows\n", config->rows);
+	debug("detected %u rows\n", rows);
+
+	config->cols = cols;
+	config->rows = rows;
 }
 
 static unsigned long mctl_calc_size(const struct dram_config *config)
-- 
2.48.1

