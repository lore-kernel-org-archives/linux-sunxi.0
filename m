Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F6742AA9
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Jun 2026 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781793459; cv=none; b=TFY2xQvnoYsZweQEUFPWM/RQapxt89QQcYd2KqumbV9bQuWxiwpVW0eMTUOIP3Gw5Ix6uH1UhxGuheimQD4eYyklu1EOcgEdwgF0/SXOoPoaGPwhbWb2eEJeSqD0CMpSJDlH2CxDRCCu31YV5ArMywzJ7ABJdBRevihsPKxCvbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781793459; c=relaxed/simple;
	bh=3RrLXo8g5qNVx7ZmgCg1GjrH6fG8zBsnfo5ZLbth0eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bqnfgk4pKZVd+P5cBjLNKzTAnsKkSZTLl1grswyuYiA4mpKUtlLnJNjeksoPPu6VgnGs1azvqlaqzql0YaS59aJoiR4kvlb5zRM4IyGQ+JJCWljTtSn9C3MOsjm/zbmAX52Ema3OwlFRgkBuaOkdMchN5CZFQoRKgCVT5SpAtoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qwWClK1S; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qwWClK1S"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c3546924so9025375ad.3
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Jun 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781793457; x=1782398257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWNFSAoF1QlxpTcEDqHs6xokC99S7BGwHt6RGWcEFBE=;
        b=qwWClK1Sn1jbo1Q5ctiGC2wk9t/+Mby4P2aO55tNPLDy9hjzqT2G1jNOwzi42myUd/
         meQoXM5dKjUs7uXWPMMFaQ0zWeJNJq/CfYAbOkKI8QbyT3MWkrwS6El+xJ9y5MllfDPr
         Jq4GI5nTNhIYGilKrfA8sSxkcCrTSW/snKm+ii2sxHn/Si2ydqOJ2yddbxR8Kif474pa
         D9TsF9puWNP07zMlxSb57zjz8XKtCNX66Y0lrWo9SVwbc0DUfMvfNm/Aa+SCbSXwjxgx
         8yB7heBz21ow72Bkp1Z8ubCRQ6NLXY1NQtEJr/hnFTWoC1RjW0TXnXNmKtED6BEB+KH7
         o52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781793457; x=1782398257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWNFSAoF1QlxpTcEDqHs6xokC99S7BGwHt6RGWcEFBE=;
        b=EGsIa5J2eH3C1B+X9ivKBK/3d/AFdy6kAWtEtyeYztexCFQHdjNZo2TTIbmCVpgJ07
         dnxkAdhG4pSeeDyyK31OBT0LYc7VB0sqGOIuIo8+C6+G98b5xFTe8+i9O5Y75L6Eh5FR
         xI0ewP8+Yfwu27hOjDCyxLLahzwbHGTLb+9e3hjO8CB9fDOaUnXabrbNjLOq2+5UwbDY
         iYFwf+wmPhXE8wWaSfrtLWK8HyETuZ43XxT2bzwPKMs4WvUKTtClZSztiDW7ezfgCO1Y
         HC42/SRrvm9P74Gt173WFepgG9irGklwDXTXaFYHOtEFS3b8lWL62pB94lA8YqoBqfgX
         rP3A==
X-Forwarded-Encrypted: i=1; AFNElJ9kaK0SsikCib4J1hflrV4bOoXeuMjP/3rmT0WfmhcyD4tSwBcZY7Jjgit9IsWyn8SobxK0QRpTM50yFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMXlBrbqOuCEtTDDgfa+CgjfKhralEOCL59PQ+wauDLsD0pXs3
	+d4ahEVr9zce60QzqBfEKfMFWMyjwuyWZlZhfM90zLeU17BMXZ8b41to
X-Gm-Gg: AfdE7cl/nssrb3eLq09Bf5QrazathskaeFIzkk9qe17U8kYKl3SyBljFD9G6HYCvqwa
	boVcE/0xdaUCPYnuvw1Fzr5Av6+hhMSblLztGbaxq+nXxrF4w5zlpQr4M1dgRc6XY+Qr35QYFFS
	VFmMnWS6gAYPgxjPOwF6ebfIqYcibe1D7w/HchHFuNINXV/sF4YrrdZapbtcu7CcJ3ngeFsXMZd
	8OWZR8upWLQcMmNYiE3j0qEhN+81arUA+duBRKB093T0HgknJ0mCpWV62ckIjPNk82XEDadrVIE
	6yPL2HzkLEaOPWFrZWo75ljaaq63TQhq9gni0pQi845c0raaft0w+dumSPornMJqXstO9fTOTMJ
	iOc1bdTmsWXzYd26FVYj7QgXZTolJVuPHE5EJCYeTnsWRIN+8YN+91v1SYt5LyZw3mTRjeSRS8S
	tPp9ij5qplXt4tEAx3du6ivXTQA0aKF1ejhoXq7ZC8sA==
X-Received: by 2002:a17:902:f64d:b0:2bf:1e59:d99 with SMTP id d9443c01a7336-2c6e47253b2mr49138885ad.8.1781793457447;
        Thu, 18 Jun 2026 07:37:37 -0700 (PDT)
Received: from steellegend.taila75641.ts.net ([2409:40c4:35e:20d7:2ccf:7534:4b88:ba43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6f9aec764sm22554115ad.2.2026.06.18.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 07:37:36 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH v3] i2c: sun6i-p2wi: Fix device node reference leak in p2wi_probe
Date: Thu, 18 Jun 2026 20:07:27 +0530
Message-ID: <20260618143727.18534-1-udaykhare77@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In p2wi_probe(), the device node reference obtained via
of_get_next_available_child() is stored in childnp. This reference is
never released, causing a device node reference leak.

Fix this by calling of_node_put(childnp) on both the error and success
paths.

Fixes: 3e833490fae5 ("i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
v3:
- Revert back to manual of_node_put() because the function uses goto-based
  error handling, and mixing the two styles is discouraged (reported by
  Sashiko-bot).
v2:
- Use __free(device_node) and include <linux/cleanup.h> to automate the device
  node reference cleanup instead of manually calling of_node_put() on error and
  success paths (suggested by Chen-Yu Tsai).

 drivers/i2c/busses/i2c-sun6i-p2wi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index dffbe776a195..7c0239f8937e 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -184,7 +184,6 @@ static int p2wi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *childnp;
 	unsigned long parent_clk_freq;
 	u32 clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
 	struct p2wi *p2wi;
@@ -217,14 +216,19 @@ static int p2wi_probe(struct platform_device *pdev)
 	 * In this case the target_addr is set to -1 and won't be checked when
 	 * launching a P2WI transfer.
 	 */
+	struct device_node *childnp;
+
 	childnp = of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
-		if (ret)
+		if (ret) {
+			of_node_put(childnp);
 			return dev_err_probe(dev, -EINVAL,
 					     "invalid target address on node %pOF\n", childnp);
+		}
 
 		p2wi->target_addr = target_addr;
+		of_node_put(childnp);
 	}
 
 	p2wi->regs = devm_platform_ioremap_resource(pdev, 0);
-- 
2.54.0

