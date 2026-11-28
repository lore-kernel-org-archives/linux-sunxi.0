Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863748;
	b=tqZOwNcwXwoE0x+ZT01xVp3BQNLMOHvW3YcfvJDU+1pm0dWqkFFXQmZn04zaXh8RKs7m
	 f6MTnL0EJtihANMha/JZ3OhtEMtR+anbs77y/I/aSioTHOIrIUqSC/VNZryS4sR3hesQC
	 TDM2dAyMr53axeAlDQpXBEKuElQ49W+OqpOJZZgWZv8rGLwOgvo8fGa4Q+msVWlOIUyTO
	 yr2HfYUjnd8dy9KSYhj13OfWoT8rHYst9HRdw1PODCiMXgwWYJjX1Ca64qWuP7I67SqDc
	 nWr4K/COMNhiSaIJo1qH78g7z5ru99AccdROp71+3d6UTWkcyxeMJMaJOxzReVzGL6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863748;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=d4dDXttwlGHeRb7uEb4nDp+OKjr4bIrP/DgYATn9WDE=;
	b=gERtacOQJvg2/0geyD2NGkfwr9gAi4EC0dRh/BIRmoM1Xc612dF6G2eWxirGL/0Whpg+
	 5SNT4VURqevNwen3+ganOtLcN5yrOHyigpXv4luo49MEbXkMSxqJ2JD8B5QwRdaWbkerd
	 jxTVbNo2iTPwPQOWMiN5fbiFi3qodO4PK1vV/z30j2Tkv3/dvjvMwTyOevHrlNdZ2WSnZ
	 oG/ET3yd8DCYjZSwGbhADfuXgVADXW6IdPzcfntSV6GJ+wPfvUvSps9HQx4iEkZxMQyl/
	 rci9z/ZZRGAO6wfICJVQJQS8hJkzitio1U7iou5DxerEPFR+SmodkYIaSL5djxHWfUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="e/YDwsZ7";
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93BE606A323
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Nov 2026 11:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E93BE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=e/YDwsZ7
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652a8;
	Sat, 28 Nov 2026 19:02:23 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: ulfh@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH] pmdomain: sunxi: Unregister D1 PPU domains on driver removal
Date: Sat, 28 Nov 2026 19:02:22 +0800
Message-Id: <20261128110222.875356-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa221d20bc903a2kunme53ad92e3cbc59
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ0xOVkwaSU1PTElOHkxOGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=e/YDwsZ7WDymsmTSH2Qcs6s1zuicC05BI3FDN8QvlURXCtUACudjai744dRShqDhOu+FBBkkMfzVo0zpDL+qxih9QaIOtGwBOrSpDkojYdu0n+YnKYliTdgpxRtQSmM206N6moYsFwK5SgVua3C8OL3NJ14btuOLwhwazxmbCYo=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=d4dDXttwlGHeRb7uEb4nDp+OKjr4bIrP/DgYATn9WDE=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The D1 PPU driver leaves its provider and power domains registered on
module unload. Delete the provider and remove each domain that was
initialized. Also unwind these domains if provider registration fails.

This issue was found by our static analysis tool under development.

Fixes: 0e30ca5ab0a8 ("soc: sunxi: Add Allwinner D1 PPU driver")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pmdomain/sunxi/sun20i-ppu.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/sunxi/sun20i-ppu.c b/drivers/pmdomain/sunxi/sun20i-ppu.c
index 6af1dcad4a76..7a539e09f614 100644
--- a/drivers/pmdomain/sunxi/sun20i-ppu.c
+++ b/drivers/pmdomain/sunxi/sun20i-ppu.c
@@ -99,6 +99,19 @@ static int sun20i_ppu_pd_power_off(struct generic_pm_domain *genpd)
 	return sun20i_ppu_pd_set_power(pd, false);
 }
 
+static void sun20i_ppu_remove_domains(struct genpd_onecell_data *ppu)
+{
+	for (unsigned int i = 0; i < ppu->num_domains; i++)
+		if (ppu->domains[i])
+			pm_genpd_remove(ppu->domains[i]);
+}
+
+static void sun20i_ppu_remove(struct platform_device *pdev)
+{
+	of_genpd_del_provider(pdev->dev.of_node);
+	sun20i_ppu_remove_domains(platform_get_drvdata(pdev));
+}
+
 static int sun20i_ppu_probe(struct platform_device *pdev)
 {
 	const struct sun20i_ppu_desc *desc;
@@ -164,10 +177,12 @@ static int sun20i_ppu_probe(struct platform_device *pdev)
 	}
 
 	ret = of_genpd_add_provider_onecell(dev->of_node, ppu);
-	if (ret)
+	if (ret) {
 		dev_warn(dev, "Failed to add provider: %d\n", ret);
+		sun20i_ppu_remove_domains(ppu);
+	}
 
-	return 0;
+	return ret;
 }
 
 static const char *const sun20i_d1_ppu_pd_names[] = {
@@ -224,6 +239,7 @@ MODULE_DEVICE_TABLE(of, sun20i_ppu_of_match);
 
 static struct platform_driver sun20i_ppu_driver = {
 	.probe	= sun20i_ppu_probe,
+	.remove	= sun20i_ppu_remove,
 	.driver	= {
 		.name			= "sun20i-ppu",
 		.of_match_table		= sun20i_ppu_of_match,

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

