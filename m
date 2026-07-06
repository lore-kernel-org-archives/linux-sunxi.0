Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B1342A79F
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 09:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330362; cv=none; b=VSD3L0Q4sllubG668NP/LNs8D1U4EV6215OdnJC+kW0HtyjBqwQO+GAa8Wdke3ooTVQLSC75Mt46BFykjoOJbo3D1d82Hk7rsFpdxbu/XOOJqWP5kDbQZ2svH49eAMUh7SYaoCQBwePimqIUoZlxlbjmEjENzt37pvjmuZqERe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330362; c=relaxed/simple;
	bh=0uBL/FtS3qxYddEpWPm85zwv8RTdX1Kl9yqgj170ams=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jbju4MGoAXL8f4tUH+so5C6i9310NxCm4e8d5vm6ghDwNKS//wNToDwkSLrsPMCdMg3HCL7JZhFZP2hfopFsEfiLiOrw6F/ACpA2UJrTsflIDeTCIVvlFDRgJluyrt2tV/GyJozLQByi/RNd5AqCb+OgLxi7nhmaDMLTSm9+Fvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=f8LIfJW3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="f8LIfJW3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so10801875e9.2
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330355; x=1783935155; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QZ/tzJaIkMNpKGsZtD20B+8zLkYYTOKlJtJuY0qjaA=;
        b=f8LIfJW3PhY3PpDZ85Ae0/ERMGdu8aE29g7Gsx4v2cu0EF23mp0dKqZyuJMkmaEOKM
         z1QLWLveaoXJsX07kPmB1RDMWaAVTjR+ZBvs15elzTyDW8h0RUiujQikUOrP0+UB1NsI
         yjAgBIxB6NqMYiqWU+qvKH8GqV2/4JG19XHOLFgTxlWu3M3nco7zhkX5gCJAjbijt67A
         TdHCbrESDcZouKCLJZC+NXDx0hrGVSNn86sZQ4h7DCybVlwAd1/SXjOZcvQ0IkLhKj5a
         qNyyHVUI07Kgf5AACRLDAq6EF9GovFDTck24UXIBxfwk7waF/N6I15iNLU2eAofmTJZf
         oMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330355; x=1783935155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1QZ/tzJaIkMNpKGsZtD20B+8zLkYYTOKlJtJuY0qjaA=;
        b=Syp0S+KswDiUHtCqrMbMvrCp058B70oQT3B0b9uzoRUXjn+ZzqjIRbwbA3wOZTIdRQ
         cSKD9mJrUVwVNEKi6oWprYJp4rMftiM65S2IP44OxsETQpK73hy9CjDBAN5Zkze+7zzm
         gJo1rEht/lwyQmN3n1MCBK+o9vIbFGEXZukn+QOR0dgM39Z6uQzkoOyKrUoaRZVdXPZc
         DHLzwTPSYxQt1EHE4iKASZDjR4g8lbdNi9Aqt8XHgwCagzRrQcIGGkRt15uWWJbU1ZSM
         1smedVUXdBMMcKnNxlLjyk9kFXVAUe6FMScuAYKc+IDuOl9HbOMq62DEl5ulE9oxQo+M
         DhTA==
X-Forwarded-Encrypted: i=1; AHgh+Rru8ySCzs9Lp53zhj/nlXzM28wzqLrAA+XuiXP265SBY8QXcbtQi2xFlrV8avFFxspjao/Pasl9hLpcKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPzMJ+krZ1nYCPnnmt2hZCyllGj81UTUINGGTImVYGNWIwlfF9
	AaU8vzRfPHeZoBf9w/mwH3yDjl8s33unF1Al/nqrDUueEBXj2lb7oSEzTG/+1bD5114Rl7DsGkn
	n3wdP
X-Gm-Gg: AfdE7cnmu0JB4vaJuD79pBEIvGk2Xps2W0X2akOLuHIu6zh/da1QyZwPn6rcvqxPy8f
	UqjpbPbJ/WESQ9TXlv1/gcM2YKmlMBqZJo/y+SwdSp4nsfgfch+7xJOCAzNTruVU8HcOM4NytQc
	uwG8pUNGRriU5Anybpw/J8z+fKFlXA/BcTolo8MlfICiigBUGWS8hKiRePBy7w8vQNjJBFcaeWl
	Cf7MBB4NX1/fyRwRDCu/zukmjPkxeZlove+mvuV3f2PMjVdTUKYHA8SuweimE3plpXpGYNDnkr3
	Nni1M2NNQIQQU8nCEzptsP5oYNelzIvb/JriaOzc2/lO2uWsCPOO5D/LvWOusCX2RciA/fynHyZ
	gyPWwRL14Q2Ei0KfMxiRV5z3bc11v0mlMRAa5irpCsyhx/O4GjUw9ReonmbPBlxz99cbfvH7MC7
	lquWyHnDDa+s8=
X-Received: by 2002:a05:600c:811a:b0:493:bc92:ba9a with SMTP id 5b1f17b1804b1-493d11d7e5bmr93766755e9.13.1783330354669;
        Mon, 06 Jul 2026 02:32:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493be4a343csm317962395e9.0.2026.07.06.02.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:12 +0200
Subject: [PATCH v4 4/9] clk: sunxi-ng: sun6i-rtc: clean up DT usage
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-4-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2679; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0uBL/FtS3qxYddEpWPm85zwv8RTdX1Kl9yqgj170ams=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YjAlK/wAezwRG/Br2o9jTucmyJPFDAgWQJK
 NGnH+1LXpCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IwAKCRDm/A8cN/La
 heKGEACVs19xz8UT8PIIUFWAjitE9+NBDWhZaJDxvNcUM0SxaCYy96bafmU0d+a2rqtLufr//KC
 Z6WuhTQ7tHSglmlAJYJGPYFWh6rGPUtCTUvd6+nEaLUUGiCfk0VnOtJDTlgka/thanIyvG7C8Ib
 CnWqoMTk4qimPYytuWrTsIffWAuOUIrOsz3DfO3rvDqFU+n+PfI9lXD3+kAY4OLnh2iVuDKk3g+
 wOoaaCddMgxevDmh28+DckALZ5DPj8b4mmDtYdJBfeq+8wB8rH0oTYXMh2YvS6Il5dFLoEkTesb
 X4HEJd8dKaMDVGMIi6Sn+USIZuuIWRpydFCalXQxQhSz8AmNYW/nCF+Kv2J6olyH/yehTqdaqFZ
 RBfacTRrrZVF4K8KO7E1a2eCcFAlV/AXQqFKWqIw1Kljn6x0vMJm64IKq37s0/pMu/tFHpL1Mul
 /hdDazToGy9fdBo48oMitjchP2j3noiOnFZqGn2ZZuqc89RBwRcaiOaEiqxUfDo/74XQe7Z7xls
 cR1ohmd0I1POV7Gp+SKuS8PGZcKzfAISw3A1AnGb7pkYQCf8PsrpXM9ofPeLziH85FqvKJo++9c
 TDK8n6R4fNRVe3j3kH5AZRPFsgn4ijCQKyayBO9Ak2WcrTkCbVATnAi74NLyP+BzTG5fVygyNJe
 Ke9epCWPHbybvhA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

With sun6i-rtc compatible devices, the "ext-osc32k" clock input
is optional for the devices that support this input (r329 and onward).

Probably preparing for older SoC support, the driver does something funny
when parsing DT. It check if "ext-osc32k" is present in the clock-names and
if it is not, it uses the first clock as "ext-osc32k". This clock will
actually be the rtc bus clock so what the driver does is wrong.

At the moment, the driver does not support the older SoCs that would have
an external 32k clock provided on index #0 so just remove this quirk.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index f6bfeba009e8..0f528bfaed00 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -191,10 +191,8 @@ static struct ccu_common iosc_32k_clk = {
 					 CLK_GET_RATE_NOCACHE),
 };
 
-static const struct clk_hw *ext_osc32k[] = { NULL }; /* updated during probe */
-
-static SUNXI_CCU_GATE_HWS(ext_osc32k_gate_clk, "ext-osc32k-gate",
-			  ext_osc32k, 0x0, BIT(4), 0);
+static SUNXI_CCU_GATE_FW(ext_osc32k_gate_clk, "ext-osc32k-gate",
+			  "ext-osc32k", 0x0, BIT(4), 0);
 
 static const struct clk_hw *osc32k_parents[] = {
 	&iosc_32k_clk.hw,
@@ -352,7 +350,6 @@ MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
 int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 {
 	const struct sun6i_rtc_match_data *data;
-	struct clk *ext_osc32k_clk = NULL;
 	const struct of_device_id *match;
 
 	/* This driver is only used for newer variants of the hardware. */
@@ -363,21 +360,7 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 	data = match->data;
 	have_iosc_calibration = data->have_iosc_calibration;
 
-	if (data->have_ext_osc32k) {
-		const char *fw_name;
-
-		/* ext-osc32k was the only input clock in the old binding. */
-		fw_name = of_property_present(dev->of_node, "clock-names")
-			? "ext-osc32k" : NULL;
-		ext_osc32k_clk = devm_clk_get_optional(dev, fw_name);
-		if (IS_ERR(ext_osc32k_clk))
-			return PTR_ERR(ext_osc32k_clk);
-	}
-
-	if (ext_osc32k_clk) {
-		/* Link ext-osc32k-gate to its parent. */
-		*ext_osc32k = __clk_get_hw(ext_osc32k_clk);
-	} else {
+	if (!data->have_ext_osc32k) {
 		/* ext-osc32k-gate is an orphan, so do not register it. */
 		sun6i_rtc_ccu_hw_clks.hws[CLK_EXT_OSC32K_GATE] = NULL;
 		osc32k_init_data.num_parents = 1;

-- 
2.47.3

