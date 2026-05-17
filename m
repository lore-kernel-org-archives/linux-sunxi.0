Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA203C5DD4
	for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 17:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038625; cv=none; b=aY8RukDLyci0OfKrbOLcbBLIgKl+Hc2M4fgJ1zT5f33qGrGha8gDNRPcXw0fGQYYMpC0n0f6D12Z1S5+u7pMcYHlgrSP1Pr28wUcX+pBlR70bzUlOYqZKa34TJzkhEq1Ee3oeZWv9QIVqMzVJvX5lQyJEHz0a5/hYEb0DGZaapE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038625; c=relaxed/simple;
	bh=w5oEMeftLT6dpjH4N6NKR2mi8NlY8HlAmFv9o+3dyb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GlK6qP9A44vTSMxO3nABidH39ZRUpZnFVMhb5iupA7S74aNhF9/WT9I6njWiyUCtPZ0tjkfGDdxW6gLRy9JOcItCDd39qqsFizYPIKPzjZacJqSVWtdq7RPW36tV/yHY/ndUAFgOKB4VMDevvo5QtIHzNW3fHX+luQSxroiAtuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 82C481F8004A
	for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 17:14:25 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id A1F09B407A2; Sun, 17 May 2026 17:14:24 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id CB7A8B4079C;
	Sun, 17 May 2026 17:14:06 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH] pinctrl: sunxi: Implement function_is_gpio
Date: Sun, 17 May 2026 19:14:05 +0200
Message-ID: <20260517171405.3697469-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function_is_gpio pinmux op allows the core to find out whether a
GPIO can be safely requested from a pinctrl property and requested as a
GPIO at the same time.

This is especially useful to request a GPIO with a particular drive
strength, which would otherwise not be possible.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index d3042e0c9712..6162f2d86723 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -821,6 +821,17 @@ static int sunxi_pmx_get_func_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static bool sunxi_pmx_function_is_gpio(struct pinctrl_dev *pctldev,
+				       unsigned function)
+{
+	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	if (!strncmp(pctl->functions[function].name, "gpio", 4))
+		return true;
+
+	return false;
+}
+
 static void sunxi_pmx_set(struct pinctrl_dev *pctldev,
 				 unsigned pin,
 				 u8 config)
@@ -952,6 +963,7 @@ static const struct pinmux_ops sunxi_pmx_ops = {
 	.get_functions_count	= sunxi_pmx_get_funcs_cnt,
 	.get_function_name	= sunxi_pmx_get_func_name,
 	.get_function_groups	= sunxi_pmx_get_func_groups,
+	.function_is_gpio	= sunxi_pmx_function_is_gpio,
 	.set_mux		= sunxi_pmx_set_mux,
 	.gpio_set_direction	= sunxi_pmx_gpio_set_direction,
 	.request		= sunxi_pmx_request,
-- 
2.54.0

