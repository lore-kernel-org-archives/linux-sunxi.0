Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B41A3BB665
	for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 09:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443667; cv=none; b=Y2Hgz5jJceo8S6pvKMRdNAo+7ArZllqphOOu0tSkwl3gwV9cw0AriC/goAeV/5o9uuKukaIb7rkAetI2R574DYnqI20L69IlPMju+Q3ZSnwoqLPbhhRRjVqpJOKBRK9j64wtNW38+x8uN78afSbytCX5k2REN27kXsgL31p9qyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443667; c=relaxed/simple;
	bh=hk+pW36En4Wy1AZ68b3gwc2MovHJXPl64J4AmrYmsEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGGCo2fzczuwsSaDxhCWjruHiP8O10ph4XSxVrkwZMdwTqr/0x9vMYe47c1gd3JAG2pHnJwLrLPZlBRcX2nodzPspZrN8+tVKjRu49CUvj0FM5BgFrmJ54GyhEoPTxtfkUaQ0WkJjE97/iqk2mVTHxBIKwctRMCBbjlJ1Kzma+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OufZPf+6; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OufZPf+6"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-83ea84df1d0so2372008b3a.2
        for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 02:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443665; x=1780048465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfxD9+jDbayH+o4mAO389jhPYWsWPPQA6d87WX8ntHs=;
        b=OufZPf+6IycKb2iNg+OdRzu8z1kYmJzIirCNaSpb9By79XN09eBOERUf2j7oYsVRzG
         EWfiX8t8byBBduAtbOj7ynGlh1LLSOsriBbMhE3PRbh7ArzjiGp5DA5X9t5vgm9fFbX7
         SC/tKc1qY7jC4Zx28MXaUC2N8GRCpdtu4386AjusC16IZRMCR5nodBtml0Yax5sVLAcO
         FpbQn0GWQyVXucXYG/SZinE7pcIIpAxTJakztDp5OZ6BzAmc45W8wio0zGLkOmce8NVc
         XrHrNYe7LSd7/dmNL37UXuuhWB2fs9o+LoPQ6187DBENsRB5NZuIvv8UWzFlaT1W85Mj
         YjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443665; x=1780048465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nfxD9+jDbayH+o4mAO389jhPYWsWPPQA6d87WX8ntHs=;
        b=j5/lxmRxG0OJCZZAckXUmVa1CGR/TWREMgRu7k5uMb94Ri0SMxtl2xmKYx2guFOE1D
         njUIZoLeMzQ/OfqAA+W/9gXASogZqpW1GPTv2cmOZBhsaqenZLDIg5xtnfUNRkB9lO7q
         rBEukBhZ62BA7hmpDaz37Ik+SxbgZAYIhyDJHSnQpSqc1GNjN5D4AeWPWNx1TydzZ0FM
         LKlVxkL2IKNb+eA7FIT8oKxoCiQwJD2kxJXpsU1QnhD1KGnvBQxAiIL6yo5M9d+CBoW/
         C/06QW9qE6LLJ4615cvht3CzAHKgmP8nqjhg9zavDtp51DHoW4cj0aqyaoPjdXCs8uW9
         Yn0A==
X-Forwarded-Encrypted: i=1; AFNElJ+AdQBkHGe4i6gn0TKvZAwfDZvcdTcZoaaHcSkPXuiJL/LzkE7N6E3ia0Uxs+SBd3YdVbXkjhpva0CrIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJeB+bahO8pKDQr5eB5/Sw66Jj0YxcXs2/iD1d8aLEvx1IABA2
	z0Kv83A/FuIanMpG0F0AF8OVr1HLx7LWOpyRCtuvIrjRLQ1YaIXeKDwu
X-Gm-Gg: Acq92OHjcYzMMr1ocNwqOtS8XzUEjjLAX9ElqfkPBbGUGgYRgKqrvr3a2kJlpJq6jTU
	me9B3IX62U0rmpFshl22rafchZkxzH2rZEZ0SuVK9fLjenGlv6wdOsR+G/tooZiYc11UIobbFTP
	xde7V/y+z4jyj87kMlgFJBnQEA1DGVyUYXcKVrZAFVE48VfTzNp46/A9trhYW+DALJE3KeOXs4R
	wiuhr33eYqfBi89etd+QXmnH1qFgD+xDzG5kCzZrdbHVTxPn1QQuIwgM7EtfZzJOt7lS+/hB0qD
	neZrSGiYX0UJxWSuwUsX2859Z4DRbttNohHfhK6W1RVehKlH8ehV3vbRPgGtzVUsZw+fThkiuOa
	rOduVrIHrqZ7qavKMP48SvmffLJ0jrVQ9JWhXnF126qezJXu760ThFJxynuWuygFXK5t3Uf8RsM
	OVqgXn0ZYZ81SJjfhy2M5vLkzu0nApjZn7dR78lLVU/EwcYD/dQOOCUSmzTw==
X-Received: by 2002:a05:6a00:4b45:b0:827:3b1b:43e6 with SMTP id d2e1a72fcca58-8415f5ea4bbmr3190006b3a.21.1779443665338;
        Fri, 22 May 2026 02:54:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aed7c9sm1757366b3a.13.2026.05.22.02.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:54:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: codekipper@gmail.com,
	jernej.skrabec@gmail.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	nichen@iscas.ac.cn,
	perex@perex.cz,
	samuel@sholland.org,
	tiwai@suse.com,
	wens@kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/3] ASoC: sunxi: sun4i-spdif: Use guard() for spin locks
Date: Fri, 22 May 2026 16:53:59 +0700
Message-ID: <20260522095401.72915-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522095401.72915-1-phucduc.bui@gmail.com>
References: <20260522095401.72915-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Change in v2: 
 - Switched from using guard() to scoped_guard()

 sound/soc/sunxi/sun4i-spdif.c | 62 ++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index c2ec19437cd7..89eccc83a130 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -427,24 +427,21 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
-	unsigned long flags;
 	unsigned int reg;
 
-	spin_lock_irqsave(&host->lock, flags);
+	scoped_guard(spinlock_irqsave, &host->lock) {
+		regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
 
-	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
+		status[0] = reg & 0xff;
+		status[1] = (reg >> 8) & 0xff;
+		status[2] = (reg >> 16) & 0xff;
+		status[3] = (reg >> 24) & 0xff;
 
-	status[0] = reg & 0xff;
-	status[1] = (reg >> 8) & 0xff;
-	status[2] = (reg >> 16) & 0xff;
-	status[3] = (reg >> 24) & 0xff;
+		regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA1, &reg);
 
-	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA1, &reg);
-
-	status[4] = reg & 0xff;
-	status[5] = (reg >> 8) & 0x3;
-
-	spin_unlock_irqrestore(&host->lock, flags);
+		status[4] = reg & 0xff;
+		status[5] = (reg >> 8) & 0x3;
+	}
 
 	return 0;
 }
@@ -455,35 +452,32 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
-	unsigned long flags;
 	unsigned int reg;
 	bool chg0, chg1;
 
-	spin_lock_irqsave(&host->lock, flags);
-
-	reg = (u32)status[3] << 24;
-	reg |= (u32)status[2] << 16;
-	reg |= (u32)status[1] << 8;
-	reg |= (u32)status[0];
+	scoped_guard(spinlock_irqsave, &host->lock) {
+		reg = (u32)status[3] << 24;
+		reg |= (u32)status[2] << 16;
+		reg |= (u32)status[1] << 8;
+		reg |= (u32)status[0];
 
-	regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA0,
-				 GENMASK(31,0), reg, &chg0);
+		regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA0,
+					 GENMASK(31, 0), reg, &chg0);
 
-	reg = (u32)status[5] << 8;
-	reg |= (u32)status[4];
+		reg = (u32)status[5] << 8;
+		reg |= (u32)status[4];
 
-	regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA1,
-				 GENMASK(9,0), reg, &chg1);
+		regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA1,
+					 GENMASK(9, 0), reg, &chg1);
 
-	reg = SUN4I_SPDIF_TXCFG_CHSTMODE;
-	if (status[0] & IEC958_AES0_NONAUDIO)
-		reg |= SUN4I_SPDIF_TXCFG_NONAUDIO;
+		reg = SUN4I_SPDIF_TXCFG_CHSTMODE;
+		if (status[0] & IEC958_AES0_NONAUDIO)
+			reg |= SUN4I_SPDIF_TXCFG_NONAUDIO;
 
-	regmap_update_bits(host->regmap, SUN4I_SPDIF_TXCFG,
-			   SUN4I_SPDIF_TXCFG_CHSTMODE |
-			   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
-
-	spin_unlock_irqrestore(&host->lock, flags);
+		regmap_update_bits(host->regmap, SUN4I_SPDIF_TXCFG,
+				   SUN4I_SPDIF_TXCFG_CHSTMODE |
+				   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
+	}
 
 	return chg0 || chg1;
 }
-- 
2.43.0

