Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C853D0BF3
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jun 2026 11:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399913; cv=none; b=hDgEX/iHXnaxsf4RHOp8TUYs8KcjV0CMPIdQ2aAdBh8czwtDCrj1DYpM0H2IDPxOPtu70gxdhEYFTsbURaVhk0x+KX6yroPpWCIQ+0YUoYl4FSP7VfanVsKTSUlpCnTka/+whIFecgmVoUpKkNG7oU5lQGOebyXsPICRoRxa8Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399913; c=relaxed/simple;
	bh=y8QJMUL8+CtpEfhCqN4kGi8SafddGMRLyBk13xsuhPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XNpsT5oorMQwhRi/S08VOzqSmJD+7ki7Xv4vwAnwYCo+u2OlB8Sxt3Q6veShYIaTqgP0gY7WnvBwpL5ds3tvEniuH6/+BW2r1A7wnrSDCVHa5tKI8Hv4w09NPfWaFmjrr7MKcIquctfU38MuWariiFXMg2URUmJLQDerb+PCU28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJRjLdIb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJRjLdIb"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36bd175fdbaso2243812a91.0
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jun 2026 04:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780399911; x=1781004711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rVXTLc2CkVj0LT6iBpJofb0Ww2wTBXQmu/ysCtlatmY=;
        b=hJRjLdIb2wF+eeRWSKgD1aYr29rycJ8/+fWX/ZRwqavs9RwbZnSZ/DAtRiXhLnctUK
         GxGoa6L12h4kxZSFcQdYCy+aKEuEOAm515MltCuQ/t5HzfA9IVPRWkOsMWeVc2Gi0VVO
         xMdjbbK7iUGJ443RexCxDDthjJuZp3ItbbUV9BA5mUlJnRC5RUIMjXURSPiErw2rD1xc
         AJcrCf8JIHNcQgTmo4Kf6aOq2aZcZEpUsAQGtLzWk7lO5f18ave4ZnD13SfwPrDFnEdr
         vR/jjYNSCs3GO/D64y5x9eA3NXdiLLUQ/V/T591L5YpsdDsV05cMWtHjasF8LmRUQwoL
         YaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780399911; x=1781004711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVXTLc2CkVj0LT6iBpJofb0Ww2wTBXQmu/ysCtlatmY=;
        b=fu6xyJVIKJ1TaUT6YSvDitzg2vExEVAoQm8eQ2kOyHLbOrKUoTa8UIj7aLGSKhcoqF
         wFKxjQ+PCPK/+HNn5EWYzvOY1am5JDHVFI59vosuDFi2uxUKSKAbZP8i1wGWt2rEGqU2
         kqoZxaAK2OrgX8jYr0vpx+hlgg4OQqolcmkTn+qJ2rO/3IIg4PEYqDpqaXxdo5qB691F
         JC9yuXMkkdQy8+wos0rwGYzZpdVabCCNr0RLj5kZxRZvF+9erqgpUnEb/aNQtAleAEEf
         xqxKVAs4OvNMFCwTD77qzAXeYEXTzgwE9c5vsVntm+AD0EYaES/79gqz6ixfqvI8aSg3
         EOpg==
X-Forwarded-Encrypted: i=1; AFNElJ+ApY+DU8mIrsZrVPueEr1vOFEHUv6Eemw/8wko6yKobX9ao/tLV+YFyhBCjOupvDbaRbnx2a1S90ig8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxRnQOn7wrz0F+C/3e9r/LwVJeRi9TP28yDRqRJiTAdZpsexua
	RVcmv4gItvg5LUFHcxz+u52I9vU+IQuKmGMHoYOKcAol1uI6a0J55zJB
X-Gm-Gg: Acq92OFLlRPxQnfnwDCmPl/jqh7it53uN9ikwsbUdtnmYPLVPoqcO8brHq+FiDKI3ql
	NyR2f4UFqHKHDEk1l0NyjyNyGkzXuDdPn7W1PD3p+WzEqfuqsm0PH+ZZWGxdvzR42wiMSpZTC9S
	rF73yB5kl5PQ28NeMcW5sbKt5GS9oYvWRbAgMTyEP08ur9La9wcttwjLogdJ5Squh962KnsD9ON
	TD1m1Wr8gHwS0ga+Pd5i5Nw2TdLpR/HpuBhOmby6geHp2sReNVC8Voe/UeRrWM+gt5Dryn2zUkg
	OWFhPI0HcnHE8p5N5LDEgRaMD51U4HT6OLS8XdLWfmsnb8A4rjHgPlpcgVlgX/0cGhiK/Tj7YDm
	F/9ctdnntKngA/lL0kdA3CWjC6PX1JwJlGRI6kcRoYsI46PffEmvijAzT+Z9cVuqBJ1rCZaM517
	EynOZ9VhJ35dS8Q4rvjq6iEWErURW/RGT2Jb+joepah9+Jh6K5lzSx2dN96ApG8DcJ3hPQtTARW
	EDdIa4=
X-Received: by 2002:a17:90a:fc4c:b0:36b:e109:1e63 with SMTP id 98e67ed59e1d1-36c685a8f89mr15745380a91.27.1780399910741;
        Tue, 02 Jun 2026 04:31:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91820e6sm2617126a91.1.2026.06.02.04.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:31:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ban Tao <fengzheng923@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] ASoC: sunxi: sun50i-dmic: Reorder clock enable sequence
Date: Tue,  2 Jun 2026 18:31:36 +0700
Message-ID: <20260602113136.49494-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Reorder the runtime resume clock enable sequence to match the hardware
dependency and ensure symmetry with the suspend path.
The bus clock drives the register interface and must be enabled before
the DMIC module clock. This aligns the resume sequence to be the
exact reverse of the suspend sequence.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.
Changes in v2:
  - Clarify in the commit message that the resume sequence becomes the
    reverse of the suspend sequence.

 sound/soc/sunxi/sun50i-dmic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index eddfebe16616..7aff1afdf265 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -323,16 +323,16 @@ static int sun50i_dmic_runtime_suspend(struct device *dev)
 
 static int sun50i_dmic_runtime_resume(struct device *dev)
 {
-	struct sun50i_dmic_dev *host  = dev_get_drvdata(dev);
+	struct sun50i_dmic_dev *host = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(host->dmic_clk);
+	ret = clk_prepare_enable(host->bus_clk);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(host->bus_clk);
+	ret = clk_prepare_enable(host->dmic_clk);
 	if (ret) {
-		clk_disable_unprepare(host->dmic_clk);
+		clk_disable_unprepare(host->bus_clk);
 		return ret;
 	}
 
-- 
2.43.0

