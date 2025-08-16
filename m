Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50B023D29F
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 08:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755334103; cv=none; b=AR9iigks7o642/lreoknkdTlgwsDbOCZRgXESvTCQIvnKHr0ePmsqk4QI01vQE1kswGP/mc2sHGZbvmNucBWwDKm0QteHBKnxKgFUxf06RpKJGwb4jyeTWDuH5jlnSEmojLcLraGA1i6QjZ1PW3Tz6k6w40brJdO2nx7Sev33OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755334103; c=relaxed/simple;
	bh=ZiFEr88GKO2Hs9RHvAZKyj+tO8dqzvBWzvKcfZTtNF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LkmenMHo1B4KRPHVPRXEvBTDuNY1+o+qHSry18ssfZ/Qr8kXkVqkUYl+XXx8dXvA57ER6E6GF9piSHuWqjRxqw/lqEY6Y8SLdRCzD+izeAbXQfFb+e3wO20ELsg05bHmlvPhXPv1wtXYXWaE7KsCCvsQAKu0F/yD3TON398xgRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nT6uR2vW; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nT6uR2vW"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b47174beccfso2234747a12.2
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 01:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334101; x=1755938901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCmauNf7s5FntNtudgCLlOZcs3Emgfa8V1BlciZ5v+A=;
        b=nT6uR2vW9saEk4wPVkXIapuMNDViHovBnMl1Tw0a5UBdu6c2Gg2vbodHRUQ4cxVw7W
         AW83de2WaTsPDuyny7NO+OF2EVYXrvQ7xIwi22XtH65tf0L+bPh3kfJ9emXNE8HXMYlE
         IHDQSTvDRYLSrpodqnHV68oPxobP6VM8WHSNdWfSA/FLuxE8oH0pAimjhmLdpszBVgsi
         /SesZGQBnU2VscUvL9cZrRSaY0tDLiTXikffwSK+teVydu/7seNX0tzdo+EOjWg1COty
         4w8SPzyReVfdJpMh8TOqnJZ9axP2h25/wNEptcTm4fuPcsNWQLe25Vj8mCM+UT9Gb8NW
         fF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334101; x=1755938901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCmauNf7s5FntNtudgCLlOZcs3Emgfa8V1BlciZ5v+A=;
        b=pvR3BtkIjEBL+8+QkeVs1kB9dRPZJaTmidBqdoQCKT2spFnUrIF+ErjXUWF7yP4AmP
         +4os91NnXpubC3ulXs1vbYxiQP1N4/uj4rA6LFvdc90uIQocY1jCA5HVnKO8x2iCfEy5
         6LpWjKvYCJIGgxrRHtCfLP2jncLJSpTESEgnyH66NbKf6vtuioc2hksOgnYI/rSUNDZ0
         WOoGVSiYzwPk6fuhf9h6+t72po37V/s0W1y0Ec8m5A1vDGfvRIj6RqvFRPIzFiSH5sEo
         rtyKpMv9Xd6ZBYbOGA6bn99lHo4Uil6PCbqkUm8bpCf0vppAPpPBahJEUKBk8+oNvXNg
         ylCA==
X-Forwarded-Encrypted: i=1; AJvYcCWtUi2GPXnMcD+eP4H6GvVMqvS6x3jm914lecjkqZG07ZoqECYIF8aOaGRrH7f8pi2tsujxKkjI4Gg+eg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6Yl7uydTM1tFPZnzOidf06x2TM5osCi3rm01cjpfabk36ROOz
	0ugbQ3jRTePImhfJdrxmscB3z7qxdmIehpX9iJ1MxWuQrnPGjJ7lZyQH
X-Gm-Gg: ASbGncuMd5U5rs9+TO4MKmZLoL/vkObaMljS5jen1NQeawIzuOJG3FzNk5yauYjsJC0
	Jk/2aZT7TRcc0s7WZqF+WYwAkGtIw1cSjymlOa+sTxkbizBFk3zTAf7VcBvxyMEd22pyQBJSHPT
	BMq8OX8cS03oQcRjblE3Z9XKyFh/d/hP5T36FkWniGR4CInvUp+047wA/f9ZGAqgeEI0yGUCDBX
	zU3cOJWskSmoR/limb6CAIeHBBXhQHJ0FkXdT5vGkyyQuJTBceB+zsiGb/eYXp+tEJEltheZO0F
	pVW++GesFWHd7pwbpni0w8KA3STX0IX2cE4es6CJKFBS8WGtoPnPGalobftwDxb/j4wuh8Cz2yy
	4/006Lk9ciyw=
X-Google-Smtp-Source: AGHT+IGpbFzYzzfHGbiZJhEqwpiiL3XiXv/bsEZ7XwHQ7nIZIbLySNrguZk+IP+kgbrq8QPu+xMORg==
X-Received: by 2002:a17:902:dac1:b0:234:d778:13fa with SMTP id d9443c01a7336-2446d866269mr71913515ad.26.1755334100952;
        Sat, 16 Aug 2025 01:48:20 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:48:20 -0700 (PDT)
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
Subject: [PATCH 6/7] arm64: dts: allwinner: a523: add DWC3 USB3.0 node
Date: Sat, 16 Aug 2025 16:46:59 +0800
Message-ID: <20250816084700.569524-7-iuncuim@gmail.com>
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

After adding the phy bindings, we can also add dwc3 node, which uses the
previously added usbphy2 and part of usb3 from combophy.
All settings declared in dwc3 node are obtained from the x96qproplus' dtb.
BSP contains an additional glue driver for dwc3, but it seems that it is
not needed.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 233365496..ec170888a 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -606,6 +606,27 @@ mdio0: mdio {
 			};
 		};
 
+		dwc3: usb@4d00000 {
+			compatible = "snps,dwc3";
+			reg = <0x04d00000 0x100000>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "host";
+			clocks = <&ccu CLK_MBUS_USB3>, <&ccu CLK_USB3>,
+				 <&ccu CLK_USB2>, <&ccu CLK_USB3_SUSPEND>;
+			clock-names = "bus_clk", "ref_clk3", "ref_clk2", "suspend";
+			maximum-speed = "super-speed";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_rxdet_inp3_quirk;
+			phys = <&usbphy 2>, <&combophy>;
+			phy-names = "usb2-phy", "usb3-phy";
+			status = "disabled";
+		};
+
 		combophy: phy@4f00000 {
 			compatible = "allwinner,sun55i-a523-usb3-pcie-phy";
 			reg = <0x04f00000 0x100000>;
-- 
2.50.1

