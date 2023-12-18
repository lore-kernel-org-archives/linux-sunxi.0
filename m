Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D133B1A27A
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/Fkb1RC"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50bf3efe2cbso2966720e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 03:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702897622; x=1703502422; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SZpEgDuZF0Kd57Q/v4Kq9sCIukMURy5kzt0ohYZmr8=;
        b=O/Fkb1RC3k/en9GJQgk74D4eyL4V4iyZyXhZCWBoHuxD+rTzDDgYTosICssiLrbdAa
         sT/uSVf9/LDZrmvZlBx9STBKxRVMCa82N2JvOAhXn1gtMYXB2elZ0GMhJaw3NgUe0llz
         BvlkVbRoasWwLPOCkXvHhjYUvMT3PuzCmTOAHN+HKU6d8q/Z489RX/cyuv/azuXe+1mG
         m6r2h5SYAdXg6lKdbmtXDQFMhWw9Mfbi4jYT68Xjl/aOJi28vsd1MFKTlD+QKNQ/EVzs
         aK9w2FQhxQK3Q9O1MOw5ArPuKcGtV72aS3QmxoaACE+EkGK3GuPICMxDobrefr8/uyNm
         sk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702897622; x=1703502422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SZpEgDuZF0Kd57Q/v4Kq9sCIukMURy5kzt0ohYZmr8=;
        b=PiOnLCToJ1J3LVQNUkruWZC9PR/LmbwnFV5OIKE099J7kjhS/+X+URR1IxOojFgpxC
         Pzwp2dynWt+Nc0Yd+QVt9Iu966wrGAj4lyTX0W+WZm+xjqHruduMDcOn5O8owOnG+uyK
         8/Lv20Ewx2cwZ7AtGnuP06rkciav7XmucSOCB7Ohs4DKphAqtZFOwKiiP7nGihdaavli
         uv1qxTLtCzuvn1utA58rhRD4lVa7a+PvTDjL0BPtMnmUXJT44YFmU5HkxoXoMJCf8w+/
         0+OSBB6kw/lrDsL6I4c8HAQiB4wp/3pbxPBswjrxg4Q+L8gMWOd089X/c5Q2ZCCm2cI7
         vhEw==
X-Gm-Message-State: AOJu0YxWm3IZFkU+LYjQdjF23rx/jTCOEyblem4O4UmjIrTyl1NlP7ur
	shI8dQ53+uAJYCgBP2aTYRQ=
X-Google-Smtp-Source: AGHT+IEEPpv4PbOGki1wpFYE/FNbr0LMBpvRkHRipU02IysiUzOQcuXrBHqB/ytN1/Alf/94bokq8Q==
X-Received: by 2002:ac2:4d12:0:b0:50e:3dc2:ad16 with SMTP id r18-20020ac24d12000000b0050e3dc2ad16mr142258lfi.232.1702897621400;
        Mon, 18 Dec 2023 03:07:01 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.164])
        by smtp.gmail.com with ESMTPSA id pj4-20020a170906d78400b00a2353af1f7bsm1406769ejb.92.2023.12.18.03.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 03:07:00 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH v2 4/5] cpufreq: dt-platdev: Blocklist allwinner,sun20i-d1 SoC
Date: Mon, 18 Dec 2023 12:05:42 +0100
Message-Id: <20231218110543.64044-5-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231218110543.64044-1-fusibrandon13@gmail.com>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner D1 uses H6 cpufreq driver. Add it to blocklist
so the "cpufreq-dt" device is not created twice.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bd1e1357c..2febcfc2c 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -104,6 +104,7 @@ static const struct of_device_id allowlist[] __initconst = {
  */
 static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "allwinner,sun50i-h6", },
+	{ .compatible = "allwinner,sun20i-d1", },
 
 	{ .compatible = "apple,arm-platform", },
 
-- 
2.30.2

