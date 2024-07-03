Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B2A155A39
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000235; cv=none; b=CzEkXzCwOSK98opXooBCfghVFXAQ6DB8H1MqYZqQ4XpiTbDOIhZcS9nLoPy924+O1QwAVgp8qiSiuMd1OC+Ny3uUkpMqT2IZZS6T1acHz997Q7ioVAO0Z7tLTAonAJhgFGO9+YR0zt7IdhD4AEiRYyLJMvXPuZh9PdF8tj+9ctE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000235; c=relaxed/simple;
	bh=87EEyGDhqMM4XSc2dnrLtfdRuLpnYLj4dPXzZjLB2bE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=itYbCUJWY6LeEtc75gFQuvi7nJe76wXBHj3lzG43I4hUME5BkaGgy5zutTABcuU6y9+2TTsK4phEe2v2gPOK9ZH2nYs2UXqOMBfksFgi7dYFdiqp62m9u3N3ZFwsODOLX3J7bm/ZGJlQO24K2uuUpIK12Tzl5Y/tsr7YDk1Dmdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzsnMq9c; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzsnMq9c"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111b0so1819990a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jul 2024 02:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000232; x=1720605032; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kd/sgJHBXOe9fs3qrhdvMpUQXrTXNMFaR6+MycDuFVo=;
        b=TzsnMq9czmwxx2+lV5s2B1seEJIMnJ76SYQlA+49iqYPPj+JvPbzlF9skX8yBM9iIh
         VITB6VyyWQTIP5QBx2qDrUJYY5AwUyGsYuqg9t9IGssmcVtFBTMXpjMlKhw8q8obUzwJ
         skYACS90NeY1DUlJmv5NKttKctMhuWrawZcDHH0WyHsOJTR7Q0EnLgutvM7j3sw4+q7n
         sD/YBY2f+sN9s2hYAHEES3bdstxWAc54gahmrTS8F3lm6X5fFdH29dWdw1KD8vO3fHt+
         tvcOmArulZ1us34zgFlHzJLWnB0u13otyf5J2TCTRGJAoD/9Qh4gQYMCW+oVbFlFB2Rz
         VIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000232; x=1720605032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kd/sgJHBXOe9fs3qrhdvMpUQXrTXNMFaR6+MycDuFVo=;
        b=ezzlqrSAc1rKUn9gyuHzFsr4N6kJd5jLlnm4jRK/vGTKExBI4uCHo7uKXVa+FewPNo
         vXIROEh76RpFD4ogQCdrYmAGkcPDBA2O2agvvxdWCHdQS8eEDzTHT1DRJTVHM9ryYErV
         KvaV0kutMKDp/rlbA7eT9IyUJ3T+PC1ZK22cjY/73zDLv9l4N3pwLZurPZMtP0/orxsf
         9kdJUPhy63r8wQ84QflwUxm49+zvVrsDhv0y3/fTHbuqIzsPIu7nuMUxrgrV1TjG2cT+
         ZTHNEqNX2z5EpwNc1xOCMBzO375uoY/YjqXtfbtsdSIoJU/xvuld2RFsU+AryxAljwXS
         +4lA==
X-Forwarded-Encrypted: i=1; AJvYcCW+IAinZUR4JE0P21N7VP4ocAyIEp3FyODxfT32ggbiIfjlhBh8r8ibBqd2ygpJo5mgaK+ZRLPnfcGxeoc4l2tJhecN+2JMtvh/s/Y=
X-Gm-Message-State: AOJu0YxMs5f1jBT4zUGxaWVM88RCqMLR9ShG18zrB+FYLPV5KDPRzSvb
	zSGcXQerNJ2RLGrFZ30XMW3uXMnX0pIHdzjP3pDditmmO7QEdhP5
X-Google-Smtp-Source: AGHT+IGs/WDtbZIXTR4T3vygKaznx3++FpGKeIUBPGN/fnT9vd+Uc+Jd45wPLlvNWdhc0V3hB+BFGQ==
X-Received: by 2002:a05:6402:1cc1:b0:57c:7c44:74df with SMTP id 4fb4d7f45d1cf-587a0822c1dmr7791768a12.29.1720000232375;
        Wed, 03 Jul 2024 02:50:32 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:31 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:17 +0200
Subject: [PATCH 04/10] clk: meson: c3: pll: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-4-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=745;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=87EEyGDhqMM4XSc2dnrLtfdRuLpnYLj4dPXzZjLB2bE=;
 b=RRDOpnPm8XSIvDMG7UScdHDXqikzkMcrNLmY1ueozOmyEoM6oRCDBKdS0sxGWYXstfh9vXJrP
 yRZGKhFD/fLAt32CCD3d5+xukZJvqb/EN1KQc39Rdh40+W9lXA4SAtY
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`clkc_regmap_config` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/c3-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
index 6d5271c61d14..f09f4f7b46fe 100644
--- a/drivers/clk/meson/c3-pll.c
+++ b/drivers/clk/meson/c3-pll.c
@@ -678,7 +678,7 @@ static struct clk_regmap *const c3_pll_clk_regmaps[] = {
 	&mclk1,
 };
 
-static struct regmap_config clkc_regmap_config = {
+static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.40.1

