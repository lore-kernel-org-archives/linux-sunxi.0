Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7462EF9C7
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555604; cv=none; b=SN27Rp1w8gkN01SmLxirG8WpW17nhpc3C6Pg300x41a2Ao1z0Dl/3Z6ErAQVub2iWL+qWYx1sJCa9WGQaTijuo2SoZB4wEGWOLfVcPXMSHo7Lb313camEUDWOE83wAzsdj+1pCD3vhcQMW5yhsgW8uUVK7Gh8+B24R+evhTT+T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555604; c=relaxed/simple;
	bh=nv9OK1L0UQMxg74LXR+ORBLR37vlz1npBtTJKz/DTXg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQDHFR8FzcdVWKIhaDxnF5BJIzoUtv9s+2ukOnLItfv3b5VLdNZ6Nlehiinp9R/8l7VjEeIHNA9LCChExMNAtB394Z62jUOecNZRaXy4JVw32bbQphsdYx2pB7Lrj5BeTqmM2hwqX7OE2WeS7dwmyzcuhsruHOplypOWMiWq6xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GI3gH2lc; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GI3gH2lc"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5535652f42cso15380e87.2
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555601; x=1752160401; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/HlbY0O85zcixYzgYTA8H0Mdv+GR5C9KDIOJVQIiKc=;
        b=GI3gH2lcTM8zzPu+BtqBjhNMI6IthEPtwQqtWkQIBIAzufC/8F8Fzfa9/Ydw4gi+cx
         FF5I1p/IG17fH7fpYF0gFvl1pg6ZJdpz1NfgaYmMPVMsZdi9zvI3fTmG47WDEme7glbk
         QuRqEqJeu2SJtM6GaMKn9/KmrxMvLeVgjyYSgZuSmRx27ytjJse6ruDaME5Gt876WL5t
         2E57ccLO8IPJg+NuCgvQczvPN04yyJQNZoB440tUVGxAwZTj54op3GhJvY67C83kGZX8
         lTFZ2YliUYz2Cy/u/QX/SGeEZCZGQY9bbOcIXFFrQoYHptcvAzguTf8jcEjjngVUX0XA
         NekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555601; x=1752160401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/HlbY0O85zcixYzgYTA8H0Mdv+GR5C9KDIOJVQIiKc=;
        b=mg1DX5yaiGEaqqEuHNu69dWMCkETRxyAPIrjc31Z+sHDDdVqTq8e7RqiqbprPgfDs0
         QiydfpVKYcUzRLAoLtX8Dzf9i/T5XAjb/fcSqgQevOSZNL5Ku/B3x6DGPETXHKFv2+c2
         XeGqEAnhdfkSuYUNu8NAZb+yhgDLN+6U5ZIF2m24eB/qlzXvZkCZakoLfcEYawBTnAKS
         JiTBIIq1v3ecbBaSclI+Xkwrp4RU8AxlX9JAF8DYyBIs1mPXRKRiCjpFHIKc+EJm0E1K
         PMRUowieHcq0wvXlCL26DIf2it8QabZLcHNQ7Q6aE6Yj7kglvGqLTxAZ12U7c5Ly70dn
         J95g==
X-Forwarded-Encrypted: i=1; AJvYcCVXCb8/NV859KapzAMsb3PxiUHdVIf3L5vKGPaGAVGpWNH/mvC3gP8ehedCIMQwmdxLdehaMj7w9R+smA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe3Ki/mKlA3pKSZKBxmmSFq9SOF5U81CoEkhDjE+ExUODaLKsM
	ucJx3IaTRtEI/t7lWDJTe2P9IFsG7pqKCUkXque2DcKcEhf/Wf9I/GiA
X-Gm-Gg: ASbGncv1CfHPdtnZZSrm24OxefqLESy83fdvko7Or2s9gWPrCaVucTEAn8aIHhoNHJw
	LYmlopK+pZTNnzEOREjvsTCkyy6taLk/m/OJencZ1bsdLf25acC/kMFchn7EyDZcNg7EpaVq+QC
	fmdOuUYBGb8zL0jJfT7e+KO6GanHs5ucTLfUX3A6NgKI6Ua176LDbu47z2mAaU1NKl/StNULCTx
	BvUSg1yzDYiQDMdAhrFGuwjfDNdudvM8CMeE6UYnbUBrb/BSWH7vF7Kc1mAXrOv76mO9KTRut4X
	gcpXOef8X2mM7elw35iPxm4zaP3szyNdbjufa5o52Q56Nq/N2u7zAwCSCC4Kty7O6hDQLWw=
X-Google-Smtp-Source: AGHT+IFizivHRCGbn2xa6qy5KahETw6sFgoEVp5+fipVdvBjkYyulTltzT89w8oz7cos8x+uQdLuBg==
X-Received: by 2002:a05:6512:aca:b0:553:25e4:274b with SMTP id 2adb3069b0e04-55628344003mr2815796e87.41.1751555601020;
        Thu, 03 Jul 2025 08:13:21 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm725e87.178.2025.07.03.08.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:13:20 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 4/8] thermal/drivers/sun8i: replace devm_reset_control_get to devm_reset_control_get_shared_deasserted
Date: Thu,  3 Jul 2025 23:11:28 +0800
Message-ID: <20250703151132.2642378-5-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703151132.2642378-1-iuncuim@gmail.com>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has two temperature controllers, but they share a common
reset line. We can to use devm_reset_control_get_shared_deasserted() instead
of devm_reset_control_get(). This will simplify the driver.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 45aaf5348..bdd15ee45 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -344,11 +344,6 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
 	return ret;
 }
 
-static void sun8i_ths_reset_control_assert(void *data)
-{
-	reset_control_assert(data);
-}
-
 static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
 {
 	struct platform_device *sram_pdev;
@@ -391,19 +386,10 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 		return PTR_ERR(tmdev->regmap);
 
 	if (tmdev->chip->has_bus_clk_reset) {
-		tmdev->reset = devm_reset_control_get(dev, NULL);
+		tmdev->reset = devm_reset_control_get_shared_deasserted(dev, NULL);
 		if (IS_ERR(tmdev->reset))
 			return PTR_ERR(tmdev->reset);
 
-		ret = reset_control_deassert(tmdev->reset);
-		if (ret)
-			return ret;
-
-		ret = devm_add_action_or_reset(dev, sun8i_ths_reset_control_assert,
-					       tmdev->reset);
-		if (ret)
-			return ret;
-
 		tmdev->bus_clk = devm_clk_get_enabled(&pdev->dev, "bus");
 		if (IS_ERR(tmdev->bus_clk))
 			return PTR_ERR(tmdev->bus_clk);
-- 
2.49.0

