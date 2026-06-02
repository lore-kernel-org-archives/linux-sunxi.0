Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6DC3DA5C0
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jun 2026 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400703; cv=none; b=VE/41aVaaZrtE4op192tvHs1pQiAlD+IDwclAy8LzTOU87qDCeVuoTWHFAXfk7QRI94wJtoOajr/jBOss6bg3dqX/eL+dUnbDHKQpCem58UV9BHgyYhjWMorbOtSllYi2x/2d6ahvXQkxvDm+eX1Em2D4TztraUnGbMK3P8nNyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400703; c=relaxed/simple;
	bh=ues6/VOUWZmjMAGbuVCi5NdprQzYdw/UbUKF+QEzg/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ofskt+H5ci+BiO7sJK4/rhbtW5L1r6jEJI7IAJb0cSDpUTZ/Rz7jydG0NhNRVO2unihNmp+VzROyxSFg7ZixoYpGMOIvkboIETFk7YlC7UTCKp5LyjBYRI7rB1/wSRCZsOC2ovZlI1CqfcF5ztMEZUCYQJFHceo+UqGO43VhvxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7IpazlQ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7IpazlQ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8423610ec93so2031423b3a.2
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jun 2026 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400700; x=1781005500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmC4zYF7/VSFzDxDUcysEBlqEWK3sw1salrmEASv0aE=;
        b=I7IpazlQaeaDvt3td/YnX1a0fzhe3FflLzKeTMH0xRNQgecS79IXh1fdqjfYcPN7oC
         XfvoSud+zR2ZaAM4e0wDepDDPuzzHU4LSZv9Uq3k9KifBtBu0OpUyKHvVx7zUvBGXDyh
         Rn0GQ5Mlh6ez6VTvTC86ObTMsY4zu5wNatpTwOEmtZTiJhSUAQNOJ45NhBKaDZB53HMm
         Bb58rMoLhEjcM+n2cfILlEv11O2GXiUjeCvWswgxIRJ1/cxLIjiAlUAASTAwYLLRX+L8
         0406h3A6vGqgTD8o3rt6q96EVZp+Z13rnWdCfoyn1O0IyBc0/6MqsEnkPXPqU5rrVvBZ
         7QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400700; x=1781005500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TmC4zYF7/VSFzDxDUcysEBlqEWK3sw1salrmEASv0aE=;
        b=b3Apn8qehHtJgNulHOzexnT0icBv+xhs4dNtwsewiqdjTfhhnVdXitLdsn1l0sXSX8
         Wp9QSSZX9Ygf7azqED637dVshsrNWZ1qjisDbRWu+PJqtMoOL5en9TOEtUDd1KESzxMF
         dK1472hLeuFxCd7QAFQlMZE95mQ96WlYHzMiJ7zreLOuSKgNwwh796c0Gm+IVvi5hCHQ
         PRIDU2DUCU6iLkpLfW4BTXfnhhVvf6kqvB/iQqdeYpKEiqTCYbkwkfT/XHRtj8AsvyHg
         W+uyPGbCVp6Q87w/488IkQ/3VCnR2d1MZtQERmskF7fnx4yLSOvlNIVQOJcBytJJPKAh
         GUoQ==
X-Forwarded-Encrypted: i=1; AFNElJ978MbUlnHbGnGA0C4VVYC+qWCk4ZdrpY9iv/WqjJWxS/kH7nD47k/7RvfoEOogspjqcQr/GuYvKI2zmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgF5u4Ks6dp6PvUa41Dku2IunzVjl3JwycR9n6llV+2l0a+KOI
	2cv+bHLaSLXW9oEI1jBYgtFk0BRf4fW0AvqF6VKMlOAa4Na0UxoAc3pb
X-Gm-Gg: Acq92OEfnKWbizEGbQOfmSkWDPopEEPsr+sMcNzeUKxAmQ/1/rTrypYQxz0QLIaxejj
	eGYn1NIh9hAUkXEUUBguJhuJuKn+r/MkAUAHzW8Pq144zxBLSeReLqIY0sRqalfRy3q3fLB8Od2
	qTFyYCJJzV6Ez1gC8nZDj8qrphmK25elis91lM0lCpFr2tDyZaS0NpB3To9Yhm+h25/1wR52qNb
	t2aFtxoI8mha8Vv0b7RdXTYrFgtK6elj+QoILzuZHdxfm8I1CWEnmeTlaq5KgCCTiSY8nQkry4g
	6YrL6j9XrykzhTBTW8owKSdj1023UzdGW5QTWH44iXKdBihi0w6qMEco36cpp2h3n7DAhiZDyyl
	z96aIi7MDagLXVT+1pBlp4QYi7Qcd0dsoOjzSYJ9KTXOmdBMwHFgWXpvemKieYFk5aZ24kXwgK6
	XibziE5khvz0r95ETuYqHc340H0pziRVKfPSYSZS0enRtdBimt3fzfLvAHeuFHiJmdIwv6
X-Received: by 2002:aa7:88cb:0:b0:842:6d95:261e with SMTP id d2e1a72fcca58-8426d9538a9mr3400413b3a.41.1780400700453;
        Tue, 02 Jun 2026 04:45:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842263539a3sm12025224b3a.44.2026.06.02.04.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:44:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 1/3] ASoC: sunxi: sun4i-spdif: Use guard() for spin locks
Date: Tue,  2 Jun 2026 18:44:35 +0700
Message-ID: <20260602114437.50324-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602114437.50324-1-phucduc.bui@gmail.com>
References: <20260602114437.50324-1-phucduc.bui@gmail.com>
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

NOTE: This patch is compile-tested only.

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

