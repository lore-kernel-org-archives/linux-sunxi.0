Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CBB360EC0
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 05:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734125; cv=none; b=fIzheELJ643wnz2Yhml83VCLf8Q7Ltmgv1UNIA0lUm+F2QSppDQOef5QlD4SzYGgjBLn1akw9CPCFkMCnFgUelA8Xjka5FkptDGKETQQnlbUNepXLSoaKzcSZKKLZyl0LHVaL27RuIBEQFuWvy4EfUpicuTteIBXjGoxizSQVs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734125; c=relaxed/simple;
	bh=LuLd1Fgsqz/EvyuQmaammKLeRagaqJ0vM3tIyUpmvMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZC2ReVB3BkppNfdQ51LMGGkkOwkW3vhPCNFBj6uZvt7oTJ3uu4kfwOAW2Xu5+EWVMUmo8mUbaa9Tn+2VGofhhwDjeSnn5Dqy5jay4UteILBMKzlmX0VQ/BWSwlRtDhE+UdYNmji+QiwXvz7Yhxe+zg6VMt25DHaHNjzPD4ki310=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzq//8Gj; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzq//8Gj"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e6b554044fso2627193a34.0
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Aug 2026 22:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734123; x=1786338923; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlcJviNfe1A7bPODjwx5akEOsNAeWr5kscTUhAqnE8U=;
        b=nzq//8GjDezkf+Cr0hjKGKsQGz7qmrGz5sRAhHL7sbw1rd07JZrkUhzDJT4juBJINg
         T2aYSfu4U8DXdJz8ps9yYRRoeOuqvU6VCo7GRGYGsQ/mDqkQwUrNW8eBYChdMPHPGqnu
         dPi5OS1MofaXbfKZK2Iz/C3Ib2SEPRc2DE/G12H6dpZY1ilVbnvAXGp1hf/KELwp1Ui4
         j1RpNwVGR5sPPmEppCQnL6j+MzRRAqE/sntJEQpyqx5vgs4asWCxfYp+BfLt8FQDlpLH
         FBQgxOEnLAdQpvnKPUyDOCkrX8/zNFtVnQ/JzOgl5iCW3FuraXmETYtL72Q887AvI2Gb
         BTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734123; x=1786338923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlcJviNfe1A7bPODjwx5akEOsNAeWr5kscTUhAqnE8U=;
        b=P+In5otIodji5myhm9ZY5cRowCcm0c5x3zZOyR7yLv7P4610GcpC9F9UJkG2+OlwrI
         e7XjpL7T3c8AOP1kVzdwNc2iNHTN3OALwDHNYSUxHIIWxuN+3pxSpHOs9wIvJyQWbnWh
         qlpVdL2aSaCMQAVjp87xxWJACCFhWFqQ4rQ0BCOJ2E8QZO9OjzVQ7s/GZvtRQA2Fc4+N
         BJBwDwpVouFhclIakNH/hJEGehkInpNv17VcZBuuAsVqNtk6wbHnnLr6RDYCKCwCxpff
         wGrE6FgTDUHsAjXEZNht4yWp0TLAe5n8nYCzgvh5jVgihsg0UlegAAdKyG/ITyM0vXFJ
         6IqA==
X-Forwarded-Encrypted: i=1; AHgh+RpLkoG5vpQcQYaOy1PNGxEWM2lq2j0ex6SXXHx35bH1qnqLrKFzAvy4WDscKKUkVnn9ixKwNyFFwF7SCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfZahG7+AYddyOoijMS5jsXqr0e50uAXMD54+H01sajnNIKFyP
	skhxiUqMePbWmATKIltH8zCZTfUw6OAF54tIUIe0yHmKtwpJQ7QPGC0r
X-Gm-Gg: AR+sD11YuJRuL3+E1row8yLe6ayhMBMH8WaINIS4Y2pSdl9gBPTV8kbUYN5que+OHOe
	tr6QkVVtNx3P7bpJcOORw9+buPwjXwIznEorGhAjkDWofRgGb0klK/J9z8QDbflkMe3/Blkq1+7
	oVsJTzO+iqZfWfsx2P5F90SPUev+XtqIeDagqj33ncmuEK17z9XfSHvRfB9DX5tZC8MvO8FVWSh
	YckMUFoD+SJAbB6UpewjVhPjaYvcXexIsYJCduyOgxD8gnOyByi2EQiyP+40+ko6BDaKSm5xxZH
	RRRlYPBFxnASpFLPgc9I+oURiMOsjTeM4rgxBZX5qPjGSYjVe3ORXYtbx7ugFU14Oa5z4Tqppcx
	m7wsrrvJgHp5wIzqt03fiIs0tAQ2//QO1yW3X0ack4aIbgSaWQxc7TVsGJzPuoFUgUA4ViaxNM4
	nSZ+2LsqWxz5QFoLSXrh/AZVzpo8yO9DW3870RiRUbuTY6kV/piJaUVVuab7dLpk7DLNKVu7QjZ
	tLLebYsGJ8PZPSlKzv1tqmKOPY9WFPU9RCi3xF+uUzMDpwIBdSPi0Gaqc274CG9exsKAxJOIkmw
	If9M3/O920K6tIZw+UwjgkcmqGZcXAs/PQe+KepglOxfZdUD6wZyVUJNsqwJMfXbCSDiCytvlKD
	i4GT6ga2stBEdCrxj
X-Received: by 2002:a05:6830:211b:b0:7e9:c102:333d with SMTP id 46e09a7af769-7f196f8ad8cmr14493591a34.9.1785734122667;
        Sun, 02 Aug 2026 22:15:22 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:12 -0600
Subject: [PATCH 02/21] net: stmmac: sun8i: add support for Allwinner H616
 EMAC1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-2-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Its EPHY is provided by a
companion AC200 or AC300 package rather than an internal PHY block.

Add an EMAC1 variant using the dedicated register and mark the PHY as
external. The register retains the standard five-bit RX and three-bit TX
clock delay chains, so expose their supported ranges to the shared
syscon setup.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..fdc0c3384af8 100644
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
@@ -143,6 +150,18 @@ static const struct emac_variant emac_variant_h6 = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_h616_emac1 = {
+	.syscon_field = &sun8i_syscon_reg_field_emac1,
+	/*
+	 * The "internal PHY" is in a companion AC200 or AC300 package,
+	 * rather than on the H616 die.
+	 */
+	.soc_has_internal_phy = false,
+	.support_rmii = true,
+	.rx_delay_max = 31,
+	.tx_delay_max = 7,
+};
+
 #define EMAC_BASIC_CTL0 0x00
 #define EMAC_BASIC_CTL1 0x04
 #define EMAC_INT_STA    0x08
@@ -1278,6 +1297,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
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

