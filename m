Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD33BA42
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Feb 2025 12:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759962; cv=none; b=ah4IHIogvQN/lZLcG3TX2a+0BjT5Nfbe/ZJjULB3p0TyeXaGmHXsC+8Tlj9eWZoCuDW93H6/WsAYWWm+nSpSPM+Jt/niz3vQ8tpiy/Lh68n8rTptt3ldlPL8u5Dk00eHlcSThxxRWcc2hpVksrthaBmXGRkkhisrYHNqmdDRaok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759962; c=relaxed/simple;
	bh=sNeUaSsNfk2mWBS/Z6Pa2pSYUp7Gc/6G9bD5NGx0EYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JFvOCaTp5RpxxASdaPSiRjtOB+xEjo1w7dI34GPKGASt7dyLbOrcVQWPelNhmjWx7SUTIhD8necPEIuPEQphzZm2IicP4qiaSuulAOLOxvWsq3X02BBB8SS7H8BOEWN8F7CzQbIKLHq9DusDE/H9ylwWuczLNB7Ra0fNDiKukT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4EdQyuA; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4EdQyuA"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso1383304866b.3
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Feb 2025 04:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759959; x=1739364759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEOAzVx6WPB9stA5mr4n7x/fL+LclH0gvOV71KsByXY=;
        b=Z4EdQyuAH1Rh5/+STr5QE7LlF7ZYHmMJDak/xAYWgq1Eosqf2M18kugc6NvZPiZPl9
         5dPuB0cnF7Mju+lSOuzUhT/wdwWid1phuBLI1KdpwWyzbrC10l2vh1puCuRz4JW+1IBw
         ftovv5662V1SpOIc3Mwx1LL7wJzfbSJt/eXbfXajXpA19U/xBUnmBh0H4fcfK0ptxGsU
         v2jN20dvrEqiJUwe+hUjhfYTV25bNdW7xXJ3nayv3VyiGdsRdyn8w5oRnLT0Jzl9Axhx
         KtRtIEA3QuXS3RbRfwik9G4u6tNVFvnx7rlgId/XuAjosMKUZ/ciAIHuxMqyIUxjvVaK
         bJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759959; x=1739364759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEOAzVx6WPB9stA5mr4n7x/fL+LclH0gvOV71KsByXY=;
        b=WHE5K93vPm+esPmUzME7tWDvUNo+n8D+5YgE951obq9rL2qoB3zzzf6tRjrt76rZC3
         0Kde7WlbB052msezwdy0N7B+vJb+9+XAJXzy71qpmfJKFr3eS6iWwTTA3UHF98nFqLky
         K1duaRGhVUEjUb2iPTW1I0my1xdAJWJGOvoyP8cBXEMnE6gPwnLluUo8IG+cwahm57MN
         7whEHNyv4+hgh3f59S7tHoIrqTMf88fMo3ui6wvu92fZEZW/d4N6lHMsNjpRjnTt3ySk
         +ZBXF6wZN83zp9U3dynWT7tx7v2g7w0vBHW8nSGJp258M1yySb4N0Vkh/kwG4P8GmYwO
         YADg==
X-Forwarded-Encrypted: i=1; AJvYcCVJP7ncdS6daLasYJlN1zUv0X14RZUv575JJmCIF1Vrf/fN3hTXIU1UW4tZC97DsBm3c487hWxnF4UxFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUBF6YHPWuP6EfDyFSklUeqDdN5QZeo33NQiOKcdhjvgnqxFxW
	TayhhlnwkU7b+myhndWcATJDvQjbpuODhkf26qf1no2kly0eCfNA
X-Gm-Gg: ASbGncvH7lqDzpYTNZFCmp5PBiiIq5gnaVJ/Ay3EaYAXaXfQGYfakuCHHdNAkw0FbQ7
	jE0CVYRVERbP1qxhjveRm6KF3Otz68II/PHI4wve1rmv7QmQcbkuMNe4vjn7bvij6BHKYE/CtZe
	67dJW2f2xw+Rlh3DjDQ8OAggG1aDZUu1nxv2rOxBlz3z5BgbUeOSDAa3WO37ijXgY+7hstXoAhL
	jEFaDcdng83O7HALD1sjXk/zmUz/AdWJdNuulbqb2TZb4t6I24KBixgLCQMiQTu5/PHB3npe23m
	eHsgAowuryqWaROKnUpXqa0vXHS3AdWj8efuC7DYvBPSJQ==
X-Google-Smtp-Source: AGHT+IGXrMqsMiP0zkOFbpXcUy0rvilFMJQHNVAo7U33xcsXTT7GzHgk1vRH+nlowH9w2lytesYKDg==
X-Received: by 2002:a17:907:3fa1:b0:aaf:86a2:651f with SMTP id a640c23a62f3a-ab75e2fc295mr281783466b.38.1738759958692;
        Wed, 05 Feb 2025 04:52:38 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:38 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 06/10] pmdomain: sunxi: add V853 ppu support
Date: Wed,  5 Feb 2025 13:52:21 +0100
Message-Id: <20250205125225.1152849-7-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V853 has a similar ppu like Allwinner D1, add compatible and the available pd names.

Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
---
 drivers/pmdomain/sunxi/sun20i-ppu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pmdomain/sunxi/sun20i-ppu.c b/drivers/pmdomain/sunxi/sun20i-ppu.c
index 8700f9dd5f75..9f002748d224 100644
--- a/drivers/pmdomain/sunxi/sun20i-ppu.c
+++ b/drivers/pmdomain/sunxi/sun20i-ppu.c
@@ -182,11 +182,26 @@ static const struct sun20i_ppu_desc sun20i_d1_ppu_desc = {
 	.num_domains	= ARRAY_SIZE(sun20i_d1_ppu_pd_names),
 };
 
+static const char *const sun8i_v853_ppu_pd_names[] = {
+	"RISCV",
+	"NPU",
+	"VE",
+};
+
+static const struct sun20i_ppu_desc sun8i_v853_ppu_desc = {
+	.names		= sun8i_v853_ppu_pd_names,
+	.num_domains	= ARRAY_SIZE(sun8i_v853_ppu_pd_names),
+};
+
 static const struct of_device_id sun20i_ppu_of_match[] = {
 	{
 		.compatible	= "allwinner,sun20i-d1-ppu",
 		.data		= &sun20i_d1_ppu_desc,
 	},
+	{
+		.compatible	= "allwinner,sun8i-v853-ppu",
+		.data		= &sun8i_v853_ppu_desc,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun20i_ppu_of_match);
-- 
2.39.5

