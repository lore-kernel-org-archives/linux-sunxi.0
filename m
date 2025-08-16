Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ECE23B604
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755334076; cv=none; b=l2sS8CpJG9TVizv3pZJTFHOpHW7/kfMrofPBTrcSja0YL0WtlhtfShhkLEsoiMRaT53+whEUegSZduACaegp8wCVZ3Fff8P2cHyvETV3uDyh9H/4Y331126uW23tq3zVyi570nH6IfNMn89wQFu8Sq2BgDAg0CwHeQI070upDQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755334076; c=relaxed/simple;
	bh=YhnsWfnst8CACf6PQAROgdhIAFBdYvfImQU33bmRVoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtvDT+xZoExTpzvS9XLr2f4xQHJV3rzwh1o8zXf+8QuHKKhNeCwUNZsZxy4a+HkchSMm4Xsx6k7AO2tgAfvvrZr+TYTmaAl54qbJlmvwZbceW/DnPV09gujL7VVWLY0lKCNZ5owSFppEkhcPLboOgaQuSVvn0Jl2WwWDdQu/db4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOMaFOFz; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOMaFOFz"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b47174c3b3fso1652631a12.2
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 01:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334074; x=1755938874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50Ntk2ae5CUZ3DU9PEgu24q2kwxt9HUqPcFOtly0Sk4=;
        b=hOMaFOFzQTY55ujwffIM8paN6nwYxLC5nCiwzKLuTemPDs7CKaaegRTH9J8zfpo2HB
         37GIQ6wKY68CGEHUY6yCe0ZLb/srQljiCE4wuP6+FMBSd4yGuqQEjEnI61PZJgvWd9TL
         iBTTXxi8UHUDve1jUHvbcPm0tggdIpRAFOPvJufZkmvSV+qrb0SbFz6a5VvbURwbD1G/
         4G89jgG7jkGwST29YFHFp40UDqWEt8qq3kUyMijje822pPEy1fAy5PhQ2/ytgWHtZ63D
         WCPNM6wXhsr/fqhd83qllBx4X7DuF9Eq+l46YsSAE0iHjrn6kDnh339XG1OJNYrBqsnZ
         DKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334074; x=1755938874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50Ntk2ae5CUZ3DU9PEgu24q2kwxt9HUqPcFOtly0Sk4=;
        b=Jr7lAOAel/SycF0mkhSZAGHSPNH81YHHgJJ4/fB+3m6aKwHAhI69GjppVzOi3qKDj2
         wfHQC6wafWf7JyU+VS/wT0Y5UB+qJDb7pzzCSv4ak3PhZEJ4rMubY1nApil2XYJ3XIBc
         F66lfzk+g5TtZSIicSVyu7JmLwabzgrIGIgLJwqky7ps35PqR//SZtIs8ipTPSTcxFwu
         oAedRa4Qw4yEYQdfGcZC9UCTXu5gmlxXWTRFln9JbL53SNL9/UY81dAT+f3u8g60svbs
         l3XRXSu0VQC51MmPSNcXAvzLBTcmRw3kMj89zj3uLI2iNhFz3l1jENAljY2cRkO+r+up
         0AFA==
X-Forwarded-Encrypted: i=1; AJvYcCW7tVCv3ObqjJgicmjv79Cf1hFckmDR/BFOEcD6n4gggppDhYS5w7qi+NWnypwxS74o0FJS5bBGja6SMA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7bV2uQy+rbPWFGCkrdZGSKluht37y0n8CtYvPxWDgPmLwP35i
	RBaGbRkWTFDnh8ACj7eX2QMsoFPoimEB4YMMuO1W2NHqSDtUCNrSpprL
X-Gm-Gg: ASbGncuEPraGzuiDNdmyLNfsCUehvek8ZpblW8KtYb5HO28tchktvK4ufqeW2WGshO/
	APIHO1dyhXdojsNDaQMZakq82Bo219uM7/fNT779uE5dnsW6eH+qiiZf3+iLqWgd3pPzAjXXEIm
	xF9BLC34SqDx5FsH85Qt427qzXSLj83SrkVYvduaWahcXWHBeS/yhw2R3PXC9wgTfWiN2G124cU
	112ijAFPPAv/IKr8a0honBhBSuXjW6HRMH2/CvI1XlL23hCl0FUNjYZbH3CQiDnUskhSDTrQhQg
	ay3fvagN7zAD9G7Uq0vO3vWKIKZtP9kQmFbj6Y1ERSR2LkHjq7Vb6GG9welINxvcRbs2DDMTmBM
	LExuAMG+rN/Y=
X-Google-Smtp-Source: AGHT+IHH2hwegF/f0OgFPR9gVfjZpUsDlbhxI4wzUfEICoM2jQpliSfPj1xZkFqOfFWIa8JxKO9MuQ==
X-Received: by 2002:a17:902:c98b:b0:23f:f96d:7579 with SMTP id d9443c01a7336-2447900cf44mr20352345ad.37.1755334074401;
        Sat, 16 Aug 2025 01:47:54 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:47:54 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/7] phy: sun4i-usb: a523: add support for the USB2 PHY
Date: Sat, 16 Aug 2025 16:46:56 +0800
Message-ID: <20250816084700.569524-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816084700.569524-1-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Previously, USB PHY was compatible with D1 and did not require
separatedata options. But now we need to add a third PHY, which makes it
incompatible. The third PHY is used together with USB3/PCIe combophy with
DWC3 controller. In the BSP code, the third PHY requires a separate glue
driver, but it seems that it is not needed.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 8873aed3a..bb79339f2 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -1025,6 +1025,15 @@ static const struct sun4i_usb_phy_cfg sun50i_h616_cfg = {
 	.siddq_in_base = true,
 };
 
+static const struct sun4i_usb_phy_cfg sun55i_a523_cfg = {
+	.num_phys = 3,
+	.phyctl_offset = REG_PHYCTL_A33,
+	.dedicated_clocks = true,
+	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
+	.phy0_dual_route = true,
+	.siddq_in_base = true,
+};
+
 static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-usb-phy", .data = &sun4i_a10_cfg },
 	{ .compatible = "allwinner,sun5i-a13-usb-phy", .data = &sun5i_a13_cfg },
@@ -1041,6 +1050,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	  .data = &sun50i_a64_cfg},
 	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
 	{ .compatible = "allwinner,sun50i-h616-usb-phy", .data = &sun50i_h616_cfg },
+	{ .compatible = "allwinner,sun55i-a523-usb-phy", .data = &sun55i_a523_cfg },
 	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",
 	  .data = &suniv_f1c100s_cfg },
 	{ },
-- 
2.50.1

