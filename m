Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3569C354AC9
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Nov 2025 19:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456116; cv=none; b=WjKwMpro3WxpxjoMmKeEDP/oVBOgrqLXShQGsMUJa31osLXdqdLCc1XrOSAZDCFsihg5YYhFxX56MH3SnLL/E0e77kcJ9PKJ/4/4WXs/45Bj9kEDjJhLHy7KU/Z96xvra1mwFGPt93ltJil88PVUplv3GDv2UDDZctSTOlr2dLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456116; c=relaxed/simple;
	bh=HOTpv8E7M3Z9++7bQRRNeja2y7FI7o/hDZwnKU6ywmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lWwh8SHcc/t+rt07FAUFJwEW3/L879bZ4V2pGGwbTaoaNPeDCgaJR2dWn96No1qOC6J5cQl/79L6BnaXG9aEREwoNz08li+kPZqekQ8ECkiGPKKLs80CTxssCc2FwqatwToY3hqtVIgbq8EkDCp9iiE19bMSt6vPvFpaY/oxWu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lDAwBQQx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lDAwBQQx"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-633b4861b79so268891a12.1
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Nov 2025 11:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456111; x=1763060911; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=;
        b=lDAwBQQxbqZPTWuOtUalW1LX7lZze3Y0bCLUqWU5Odw2dcai3NbzqG0VcBlisRMs2+
         xH0/B+uYJP+yWjc9GpX3kdc5UlmzPYceQtaO9z0Oahpou5Ntu6U4KLNZBzgYN7Dyseen
         sHPPv36YRM3nAjhX3NWMTX3Vkok8VLJWpcy5SpThfiW5fFCZSPNt2NzhFBUhTMu+mOzb
         iq0SVIZB9shKKSB7VFEqCMg7z/VwcChIQHk/pc1UoP0m+DTAL2vz2cAO2hqCqYo5ms8v
         7dKkaj0FxmSx6oIxix4yN6fX6hwNLTB9cf01BEQf99AqxdGbdl19cSnvWcAxDm0g72GO
         mJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456111; x=1763060911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=;
        b=pJtYzQfe4wkwqJNJpvRimsOdAAU+fb0aa6Y5+cSoHAj5Z6tapY9PQfKvb3JdoYBSPa
         f5m4jfKzOv2FKmuacMhjR7JO3DnP1ZMdNQwFsZ+chPahhtEXlV+9SzRvUyVmcJZ/Jx1F
         ++RLh3KLG2oS2oErabgwqYtfXa6s2eu11p3Muv5A8atgdo9j3YtBnGNNBpLHGjg5yw2I
         PnhtvXnhYf0Atl9DZn8k5xj1ljZkqEb9PCnIlp34OEpJml/h7CN69frDDWQHNlbR++b8
         e9s4aQ2mf4TdKYqyxrd9K4qcXQnXbroUSca0tdQBe/WxNOXIgWeBLIsK59F8fDAIuOfX
         I3qA==
X-Forwarded-Encrypted: i=1; AJvYcCUqw8GgtPf+RNJ04FHyNryWVOqRybuMhOLKrujujYyrjuBTiuL4h/67zQa/YzSdjusn3Cq1DlaugF13Fg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNSzR+KQOir4cBmUqbFCuzJW2/9tkbYP/SiZsZIK0HAhyfdKgX
	wwgzI8Kwo3P8TjVIQyqMLEsYLtxSk9uX83heh+jy18770GbGKlxU36IV4QWA2BaynDI=
X-Gm-Gg: ASbGncv93nUt9EhNSt7UPQEGyQH/NowGhgFWGilpck1RHgzUX0PJgZXBH7/Ke2NMudk
	X+Th7fTT4nf+Bq6xbNXZYWlG3LpzxV7jP8FYDqSH0fDf643rP36MCjCr7uMIHzRxAVKQxDc9zOW
	T+yxM7ogm6mHrss50Pn6oma2VWot5ZmNhmeuEY1p2yese+iYD+9KBuF4MsUg47Tq/h9g+24OxFf
	KA5IWKlj63ffJsVHXl4baSNf0bz+sPj0shBh0n53+rnJ1cOXGQH5aAfDE1ou2roCU117n3SGea1
	bhEmiO0FdP9sReMJ0453Lf7N2pxFqSb7ccm/cW98hUltaCvPMdAFDdtL18LL1z9dMvX2NmQ9mqR
	ObCo2jo/dgXO2e6LS1GOVJ2aKGM9YjMtAwYLc15NyvPvhx+pBIxaQdOTJl9yoTsq5zSOiZLTLWR
	PVtYVAMZXY+KaKQhEU
X-Google-Smtp-Source: AGHT+IEGmqq9cm1Rvzfb24khZSYsFQ/PTegAXxlroACoBA1TR3Jjri85Sv8tMmwxWc3nu0kMo6BtTg==
X-Received: by 2002:a05:6402:3586:b0:640:be87:a86b with SMTP id 4fb4d7f45d1cf-6413f20751dmr291297a12.5.1762456111545;
        Thu, 06 Nov 2025 11:08:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:17 +0100
Subject: [PATCH 10/13] powercap: dtpm: Simplify with
 of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-10-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HOTpv8E7M3Z9++7bQRRNeja2y7FI7o/hDZwnKU6ywmQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIRDZSYvV0FBFCASolVOhNlK7njoQDy3PwX0
 i7RMv6QCVOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyEQAKCRDBN2bmhouD
 1wd5EACGaqsvVT3xObFDDX807YvuxJRMQZS0dyrF8dltJn/jHXr9MltK8ElySvuXxUPZVbULgd0
 le0nPfD5i+yDCZwLJWBEAZq8oTf6EHNCE3WgynJjTo4kFUGMXzSETGrx/kmGFxkBzQv1Dn39yxb
 vUWKEup8cvAG18aKjCULWPJ7aNkhz6kU0nHgpW66/doZbnzb6CqiEueH27bTlRCitUr3ep1Kuq5
 SuDr6N94nufPMfsdLhwTd12vj3PdSThfGyhNgaKf9HLXQn05wbhCI3BD7PoA0K89LaVpaOKa2rn
 DZxbnalo2fZ8Oeos8raJNEBXaIbomLAyUdLv4PNNcFRy2eScnYQ8W8RuChNnG/zq8i+qI5cFQaP
 6X3kIJ6Px5Emth9Y+nirUwVywykg7EijzEb2b5GTNElBqh1LyEz720BQvwNlJ7Wc09JThLyN+KT
 EpvtiQ/eUGsgDiS+iXiZ1Yv/bLr4x9nMh0SgD6IUrlAT3mrTozJV+Eibc2x/RSg9qpdQy0Cz2cb
 A/VqfFcyYGpOANT8Fz/xAH8Og2Qg7+WtHSgi4sTC07vITCQ5A/jtvoYERkc7BKZr6xmk4CRHmJm
 n4/r1xT3V8o33Zg5qyS5iv71pA04d89pkTmBVszpfDNqJgwVj9nH4c5hEyjkB4B2cxUd4vfgw1M
 WFbv0ljiRR0CwPA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/powercap/dtpm.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/powercap/dtpm.c b/drivers/powercap/dtpm.c
index f390665743c4..129d55bc705c 100644
--- a/drivers/powercap/dtpm.c
+++ b/drivers/powercap/dtpm.c
@@ -548,9 +548,7 @@ static int dtpm_for_each_child(const struct dtpm_node *hierarchy,
  */
 int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
 {
-	const struct of_device_id *match;
 	const struct dtpm_node *hierarchy;
-	struct device_node *np;
 	int i, ret;
 
 	mutex_lock(&dtpm_lock);
@@ -567,19 +565,7 @@ int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
 		goto out_pct;
 	}
 
-	ret = -ENODEV;
-	np = of_find_node_by_path("/");
-	if (!np)
-		goto out_err;
-
-	match = of_match_node(dtpm_match_table, np);
-
-	of_node_put(np);
-
-	if (!match)
-		goto out_err;
-
-	hierarchy = match->data;
+	hierarchy = of_machine_get_match_data(dtpm_match_table);
 	if (!hierarchy) {
 		ret = -EFAULT;
 		goto out_err;

-- 
2.48.1

