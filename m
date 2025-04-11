Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F11A1096F
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744388132; cv=none; b=M+iXDoVUey3xMUDEzAkFmLEFkFVZqiohI7u5OEBAFrRFG9A3IdDmdF9Nyw8vEMZ0zIPi+05BaVOH2olaE8O6Hl1ee5BmvRWult11jdtkkat21bqt9KYPfoo/xgtroXx84sf6F8oHJfzp9W5HvYxXv+By+gui5dpCofQBbnGtjKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744388132; c=relaxed/simple;
	bh=toJOm1KinlK3ozIvimwKaIuGAHvwvzYqwyNr6aQ2prg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j0nvlV25VlbQRY6Crd+Dn8LCegYS4QvzBU7Ox941Y5dlLKfleOGTbBnVuFOQbndIsjSSP4HpDYAoY23ZJf3mGKhq8GtuMg9hUGYq9JY+eHkybi692pSaaegG5R4RHrEaszfHfskgrwK5gf2twPtlApeCpvlpxsUyXmqm4dYr5Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHpbkzAL; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHpbkzAL"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso3748815a12.2
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 09:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744388129; x=1744992929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuEQ9yrSToLHvjKmbeRLo8fL3rTd0BkEIt0ruhnjGGA=;
        b=KHpbkzAL09WXSkSS6FcwFSn0uBZa4zIrDKuCjK54yvYItyZCxyeaY4MorZfpMqGM5y
         Gk6l63j/2gWwMIbDagMTb/Uyi4xrmxBB9ZPe733NM144M4nBYa6SlFBftBRczoSSK83y
         XMC+1NRYhB4QUptdSwss2nvD10SdDxxwDCXGahkDTgwfAORabqzqwTi9fAyuNXLE1i7I
         wQBsZ7pq8oZUmx30ydgie26wqQpfxjGwafUtzZgn5EbwW85/yVydPT6F7qmjEvt5Q4pk
         ZVzZyK0hWqLPR+5VNN7lS6odXJM12aaUs95jZu8mYme1wqjj2RkZazl4nIpm+WhLmG8w
         08jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744388129; x=1744992929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vuEQ9yrSToLHvjKmbeRLo8fL3rTd0BkEIt0ruhnjGGA=;
        b=aP/cBSgWYYTmL9Q0imo/N/LORYvj8GH8Wel5ITKnMsyYTP/lryt1usht0Xmdc3g6zo
         IJmeQcUjVQr50+J0ctJGabR9ngb5zHk8l8dealPk0nok+53aSzcjRahvR6NB5NHJWx9c
         wJvjL9yZVqufiz0FO87HgReT9ZA27c7SjHZwK+pcJNMISZJTPkJGTUVKV8wumHY22vtH
         gnjkHL431/aiJu4a4BS4/0zEkvLKUovmYx/psVaJcXUzY+gV9BozRn+J2r5eEUlZnskb
         Yy4Ac0VPZy3uNY98nGMr6i4w6AWjdinQTV9NO6XbWpcfShbQLi2NzBEgN9eBfHealPdi
         +mbA==
X-Forwarded-Encrypted: i=1; AJvYcCXN3+5I5KgDbxgMNkjJzB5kdCQpXjCmY49RG8fQyhCp6JnpTJiN7xw8tpxUD6TePZP2YFDYIdX9cBUJPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YySkm1F9G8I9+hty57JUyS4SG68uMO+AS5Yw06nSqMLK4rBQICw
	GIaXXOv9Omil+npoX0GnPD5K6xtf1qHJc45DakVpiuiK7f49yTXS
X-Gm-Gg: ASbGnctWarB9pIuUhkTng9GpmKTS3zCSeSJzgAGRkGwIPKQ0nnQ01hsilfdHlisTJeX
	iFRMxX3Sem/pS1gy53GOJG7IA3IR0wxThqaZBbTqRIgNHxegR34Qf9glhyZWVQsP2JZ0y/KD3ms
	TM/84zeETlm6T+eKwnGVKAf/52pXutxsxsjBqd0NTx983Lz5vIBe0cuxaNZpBOUu878yoEbG0YN
	g2LzUtnjsjrt7c2Uxds45gngIhlleJiiRQUbfIDBhWUBsqj+TufFlPE5QTRITfYo+hW2YIre1Im
	Z0PupuY2gvYBgXuKqW160xa1XRNtmEWAhj3TXx5EgOu4oBdrWNXlfTYtLw==
X-Google-Smtp-Source: AGHT+IGHQBesIrBvfkPJHNy1sRjkhZq8DAy9QsZvpZANVTHrrv6Bl1KbGqVeMrme9oojWix/Efa9UQ==
X-Received: by 2002:a05:6402:51ce:b0:5e7:5b30:3c4f with SMTP id 4fb4d7f45d1cf-5f36f77bab2mr2518097a12.14.1744388128650;
        Fri, 11 Apr 2025 09:15:28 -0700 (PDT)
Received: from localhost.localdomain ([80.90.89.143])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f526da3sm1136246a12.67.2025.04.11.09.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 09:15:28 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com
Cc: trini@konsulko.com,
	macromorgan@hotmail.com,
	uwu@icenowy.me,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 3/5] sunxi: H6: DRAM: Constify function parameters
Date: Fri, 11 Apr 2025 18:14:37 +0200
Message-ID: <20250411161439.4743-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411161439.4743-1-jernej.skrabec@gmail.com>
References: <20250411161439.4743-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Constify parameters for two reasons:
- Allow more compile time optimizations
- It will allow later sharing of common code with H616 (when it will be
  rearranged some more)

Commit does same kind of changes as 457e2cd665bd ("sunxi: H616: dram:
const-ify DRAM function parameters")

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/dram_sun50i_h6.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sunxi/dram_sun50i_h6.c
index 0adbda756639..24b2cb1579f4 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
@@ -34,13 +34,13 @@
  * similar PHY is ZynqMP.
  */
 
-static void mctl_sys_init(struct dram_para *para);
-static void mctl_com_init(struct dram_para *para);
-static bool mctl_channel_init(struct dram_para *para);
+static void mctl_sys_init(u32 clk_rate);
+static void mctl_com_init(const struct dram_para *para);
+static bool mctl_channel_init(const struct dram_para *para);
 
 static bool mctl_core_init(struct dram_para *para)
 {
-	mctl_sys_init(para);
+	mctl_sys_init(para->clk);
 	mctl_com_init(para);
 	switch (para->type) {
 	case SUNXI_DRAM_TYPE_LPDDR3:
@@ -150,7 +150,7 @@ static void mctl_set_master_priority(void)
 	MBUS_CONF(HDCP2,  true,    HIGH, 2,  100,   64,   32);
 }
 
-static void mctl_sys_init(struct dram_para *para)
+static void mctl_sys_init(u32 clk_rate)
 {
 	struct sunxi_ccm_reg * const ccm =
 			(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
@@ -171,7 +171,7 @@ static void mctl_sys_init(struct dram_para *para)
 
 	/* Set PLL5 rate to doubled DRAM clock rate */
 	writel(CCM_PLL5_CTRL_EN | CCM_PLL5_LOCK_EN |
-	       CCM_PLL5_CTRL_N(para->clk * 2 / 24), &ccm->pll5_cfg);
+	       CCM_PLL5_CTRL_N(clk_rate * 2 / 24), &ccm->pll5_cfg);
 	mctl_await_completion(&ccm->pll5_cfg, CCM_PLL5_LOCK, CCM_PLL5_LOCK);
 
 	/* Configure DRAM mod clock */
@@ -196,7 +196,7 @@ static void mctl_sys_init(struct dram_para *para)
 	writel(0x8000, &mctl_ctl->unk_0x00c);
 }
 
-static void mctl_set_addrmap(struct dram_para *para)
+static void mctl_set_addrmap(const struct dram_para *para)
 {
 	struct sunxi_mctl_ctl_reg * const mctl_ctl =
 			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
@@ -282,7 +282,7 @@ static void mctl_set_addrmap(struct dram_para *para)
 	mctl_ctl->addrmap[8] = 0x3F3F;
 }
 
-static void mctl_com_init(struct dram_para *para)
+static void mctl_com_init(const struct dram_para *para)
 {
 	struct sunxi_mctl_com_reg * const mctl_com =
 			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
@@ -352,7 +352,7 @@ static void mctl_com_init(struct dram_para *para)
 	}
 }
 
-static void mctl_bit_delay_set(struct dram_para *para)
+static void mctl_bit_delay_set(const struct dram_para *para)
 {
 	struct sunxi_mctl_phy_reg * const mctl_phy =
 			(struct sunxi_mctl_phy_reg *)SUNXI_DRAM_PHY0_BASE;
@@ -411,7 +411,7 @@ static void mctl_bit_delay_set(struct dram_para *para)
 	}
 }
 
-static bool mctl_channel_init(struct dram_para *para)
+static bool mctl_channel_init(const struct dram_para *para)
 {
 	struct sunxi_mctl_com_reg * const mctl_com =
 			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
-- 
2.49.0

