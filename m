Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5103F1EA65
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Jan 2026 03:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769485285; cv=none; b=Dn2WUBWFnfQTIcD5AdsVmxl5T9K8GQzk74HC8ZlXbIKuFVtS+Oz7PRUbjWvwQFTNIfxaNem63VSwma/xxEcIj3dYKN0cUUxzhK7zk+G1tH5yllwmIdr038vIRii+P+fMwl/SDVDjQoeYETbHMbC8MelrpKPssXw3BwImV3G5PMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769485285; c=relaxed/simple;
	bh=URI8vlChpX59IeF6XmaxVY2GasJDyQSzNbFDVES9K48=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pe7pmrapPag9aPWAHZWsrQVjiUGjbyq1xzWEg3RH7uSnKcv9prfWvMXvk/ybxrf3QU1A3jLQS25e5FxUPPOGFK2hGdXO83P2OFXbxpF16FpNFyJwZ22O4kpp6B4it/4zNBbCjg2K+1zq1PTQLDKqyozraH0q4GRhSNVaW+efTok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAAnDOPgM3hp1sXoBg--.10824S2;
	Tue, 27 Jan 2026 11:41:20 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	ckeepax@opensource.cirrus.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: sun4i-spdif: Add missing check for devm_regmap_init_mmio
Date: Tue, 27 Jan 2026 11:40:25 +0800
Message-Id: <20260127034025.2044669-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAnDOPgM3hp1sXoBg--.10824S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWDXFy5CF4ktrWfJr15XFb_yoWfJrc_X3
	ykuan5WFykKr9I9a4DJFZIyr48XF1vkFy7tr1UtFZxt34DGws5Z3y8AryrurWDX3y8CrWY
	vr1YvFZrA34agjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbf8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26rkl6F8dMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sR_EoGDUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Add check for the return value of devm_regmap_init_mmio() and return the
error if it fails in order to catch the error.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/sunxi/sun4i-spdif.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 1e755a716c63..65de03ca3ad2 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -684,6 +684,10 @@ static int sun4i_spdif_probe(struct platform_device *pdev)
 
 	host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 						&sun4i_spdif_regmap_config);
+	if (IS_ERR(host->regmap)) {
+		dev_err(&pdev->dev, "failed to initialise regmap.\n");
+		return PTR_ERR(host->regmap);
+	}
 
 	/* Clocks */
 	host->apb_clk = devm_clk_get(&pdev->dev, "apb");
-- 
2.25.1

