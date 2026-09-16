Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9133B9D80
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 03:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528110; cv=none; b=F/g4RRrwdVlL8LGM9rDlNKMnfTPg8G04oObzUIvJ0CUxWr9PhaTNAdFNhycj073o7pqo1JwCgxgLQYuzh+5AYDn4mxg47tUB8eZQALiZBdHHI7eL0kSP2DSNCinrwuGnt2jt3+iR4lYpDJTflit9GpJM686psGxFGkwvyJpzz5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528110; c=relaxed/simple;
	bh=BzeM2wwKwRHzaqQoq07OCW4sqSwwDLJ+43BF/yaIJkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kU2oFSDKRWSOLCa40DA7UgbVbRVoR85oSB8XkaKJ5RpxxOXG+lqte+YkgGtoVbKrVVYLEW+2deD6amBfmL8L0zpI6LNtDmPSymwgHMSgSkFu1mGzuSSmwmRt8TqCLmM7ZFXPyQUDQulzzdt5PG3HwhrIDGK44qP2vOGnL6mBBrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZk8K2aW; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZk8K2aW"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6c24d19ebcfso249328eaf.3
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 20:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528107; x=1790132907; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxECogFnkMA6SSiFQYeE519yjpa6TKSl2zEHDB706vw=;
        b=lZk8K2aWLFOyyOxmkeMXnNanFVVcvOuqCR1mCUhEhD5mZADwNV97aCzJd0Mq6LVMcf
         +8LHLFrrGYbpqJPXWpHjYhlF0Wwu1FLXXuzgHE3fwqiTPvzHAcKnuplASFTjKnCjgWYQ
         pIkmFaKxUAB1zT9RyCQsOeM6AO6mVXj5eVOQRioclPYAy11roVoTzv2S1SBZurnaaGR/
         cCtA2aSJNw8XASe2gOT/ZmWH+/9Dapu48u7XY8RUMnkmRld6ARXx6/wV7SC3zalHoAUs
         U45noXMZzRgbFR/YWMcZiVS4DnxZmam9tmp47iKjN+zKURIyU5hruZwJpdiODLx/bjI1
         GW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528107; x=1790132907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AxECogFnkMA6SSiFQYeE519yjpa6TKSl2zEHDB706vw=;
        b=ytN9WDAkvsTvLX2Oce2rOY/59+sIMsThChNHIDCwbsKYgnGt8syPvDiN/nAi3fScuj
         v8uMLIbj+h35CkFeTK6rBcclpZsXoSa4FtwlYAYb3nN485UD5hi9hw5b3h+TNSbd3Ha3
         3jB2Q5cqvDJTF1m30/xkgJfxAQ3qhMjrk9HBsgwkxGwHi7AutlDSV9oI8GSwwZcr6sMw
         WfZTl9e0K4I06YGAcuSePGSWPTLxTqJbTAK6zMoYqZeWrPVCS3er1ypI8EsogHRFmW59
         Ficu7IP4Wlz4m9zQ250pFpOflsuG7MgyY7pDtsFRQ+gRcSWZ6VyzbyLwktUIBx8e8GRV
         NOgg==
X-Forwarded-Encrypted: i=1; AKwUvByikhF5u+dCOCxVzqtRm8r+wKsa3XOLQwDwP6WGq54bFWouazSFcN3IsUqag2BXRMCZIB6Y1YrSpeGt6g==@lists.linux.dev
X-Gm-Message-State: AFuF++mq/BL4K3QeU0ctGNppula55bLxUFg0sOInU2xMm0Jb5Ovg+qht
	VJ2N9EYUhuG2qopphHWVd7eQlxoxDFmsays5SX+YGK4ZPsCg5N9i4dpn
X-Gm-Gg: AYBFou1JYRC4DRi+5XE2OHAqOeGuylfahzew6eO82XlDzIzTEQad3wrjzM7CuqTtRq3
	TBN8N4Dtz1QnXNvFQAKtDsopHr9g382P1BvxCXvv2RLDhRgSUS2PVLH1mFPbEMQ0A77ByzChppg
	1tE4X7NLzz8SzpDiNg6yV1x+Nh/F9C44gIOdcZx21oouSlHrHnkcPU+6X0unS6BvMvQiS3LLsby
	FzYMqIOLFZRWHn5nlNE91CXcqDxX8C0c7+B9AJq97NZMU1XXp/1wCqqSQ/b2osNMulshqVFAOyB
	U0CHEVo3AZKF8OZbchkud0/MMyFjoWxErzpi41mrFRmBrQY5wYUTTwIWzqAb5HZ7uiuCL/X0DiR
	TMCzNsuyv90c9C61uKwbnUcY0EKqTmxsTepZ/1Wa1ckUbFR2QXfy5K+gDgh3f8DxC1zU5MWlAcD
	NbMMhuyC3aDDGpu8E23j6a6LZ1SFYX08VMTHmRTmA0uaZp5c+HarLR02fsenKhtHoRqQ8z0PDYx
	pDjvoZoCKSs3MYFsDwR9z+T5GbtvtrkC9LrlyQkHGvWcUAG+eGM5P+tYaWeVo9OEmgHIeFUCQzT
	tmHk3WxhSQnaj0AGYPM6vwfFJjAD4KxDv1JA63I+00Jf6WnrffgbcNoNl+2GXXWmrFRdFqgbilJ
	fInnR3328FrPFewOfJ7uu3w0lLZwHLzJ5
X-Received: by 2002:a05:6820:f0c:b0:6b1:6636:e919 with SMTP id 006d021491bc7-6c7d1cc53f8mr2704731eaf.11.1789528106832;
        Tue, 15 Sep 2026 20:08:26 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c7a677b3bdsm1718078eaf.6.2026.09.15.20.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:08:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 21:07:41 -0600
Subject: [PATCH net-next v2 2/2] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-submit-h616-emac1-v1-v2-2-322b32e40eb9@gmail.com>
References: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. It connects internally to the
co-packaged AC200 or AC300 EPHY and has no external PHY pins.

Add an EMAC1 variant using the dedicated register and enable only RMII.
Leave PHY initialization to the PHY driver instead of using the H3
internal-PHY controls. No RX or TX clock delays are configured for this
RMII-only variant.

Co-developed-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..e8f86df50060 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -81,6 +81,13 @@ static const struct reg_field sun8i_syscon_reg_field = {
 	.msb = 31,
 };
 
+/* EMAC1 clock register @ 0x34 in the "system control" address range */
+static const struct reg_field sun8i_syscon_reg_field_emac1 = {
+	.reg = 0x34,
+	.lsb = 0,
+	.msb = 31,
+};
+
 /* EMAC clock register @ 0x164 in the CCU address range */
 static const struct reg_field sun8i_ccu_reg_field = {
 	.reg = 0x164,
@@ -143,6 +150,13 @@ static const struct emac_variant emac_variant_h6 = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_h616_emac1 = {
+	.syscon_field = &sun8i_syscon_reg_field_emac1,
+	/* The co-packaged AC200/AC300 PHY does not use the H3 PHY controls. */
+	.soc_has_internal_phy = false,
+	.support_rmii = true,
+};
+
 #define EMAC_BASIC_CTL0 0x00
 #define EMAC_BASIC_CTL1 0x04
 #define EMAC_INT_STA    0x08
@@ -1278,6 +1292,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
 		.data = &emac_variant_a64 },
 	{ .compatible = "allwinner,sun50i-h6-emac",
 		.data = &emac_variant_h6 },
+	{ .compatible = "allwinner,sun50i-h616-emac1",
+		.data = &emac_variant_h616_emac1 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_dwmac_match);

-- 
2.53.0

