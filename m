Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE55156237
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 08:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755334095; cv=none; b=OWUxG5LcGiUGU3h1luOA4F7fQf97f0vMIUa9e7P86WpI+n6lkmc7xAZjX8HVpukUmAG7mnHYtJ2sq2Kih+CJdqXKc5NHHwMZsa7WhYk1/zAqRqHfnw7xUwPCwjYGZnWO8HhJVVQTqUaRgQolGWZp3SaAFxiAUzYfJ2wiavm7vuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755334095; c=relaxed/simple;
	bh=3uKkcJFOXgYLabgZa+7XV2eGzSf6Ec9xtil3xuV0aXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JIVjPkFfhIHUtg7as5gGljoUtmQ9X7Co3SWoTbfOvlOnJiLPTdC7JcxevyDLA80rHVjNWCgce1ok/QlHulC2IWJq9YTWhyAQbIIcp7oiV/UPzwemoqQbmRRYoIb8OKSHMSXcl41mvtFFM/WqyoTV45Nq481CYD2ruOiQTXRfDsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3xY4i/I; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3xY4i/I"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76e1ff326bbso2859529b3a.1
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 01:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334093; x=1755938893; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZaUVKgFL1lunF4nMqIkLNfN3yrPrabF4vqHbgSjhvc=;
        b=Z3xY4i/IXzmG1dCNkuc5e/KJ1xdcUhG3TbIAkIiIXRoEseIUaPAX1wuNpQRd5p7XYK
         Rec5OB+0wPE3Ol482agxDqp2mrPAYEGjBDmY0uH6Axk94lnYC9yzsll8tHbmCVGPXeN3
         y8LmCuYhADpV9cIbYDdTv3h74N2uWfVRBWqnUfKJ/xZWte6+gOY2ZiqZkXRGiQGj2FSN
         mCWzDT1iI6j+pd22cmXU8Y/k/w8JfiunJm0blrJbhWXOqdO3dnh5UzAOYrc3yJRALj0b
         KWDK/+FQ2w9OoF0kNo1iKQimFk7YgM5PStAGVTndl05FlRpfNrT6DHxG2CzdBLJA/686
         kRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334093; x=1755938893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZaUVKgFL1lunF4nMqIkLNfN3yrPrabF4vqHbgSjhvc=;
        b=YddVIwlrgCku+SXCHbzLRJ6sSwkzx4PA0VacEDonnNanWroog8MkRvHcVRIh+jNYek
         sznuD08S3CQS/XVGs0LPuo19DQq1FKz0RXuX71mx3T9+46irlpNZAmtmLejIZ3oPyYq6
         uz7qI81u0cttKaaH36npfGYLbk+TANdaEkEbwRfNRyVo0yyjRDNV1s9duNYTbtu9+h56
         EKuy2MJNM+yHkD8+hbEmnknWe/eXJoBOyvpQgh9evfxjx1BzpslvByRez0oKxa+7MFMg
         aOhr/kJTj5IcWbbEnUmz28wttrm1NaQhuW5Wfx3Wap7xyiatQjtxfcY79K9rnF3q8GvM
         FJ5A==
X-Forwarded-Encrypted: i=1; AJvYcCVLGSqzItQaaG+X75nJpGWBkVUJVjlAkqy7WWvMGp6TnInZJ+kJbVvLmAd198QeDjW6Ce0X14JChElqlA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyU0bFc5G2h+uwruNiG/9neJ7iNlw50qp7fyDi3cDIgB4iHgQkQ
	iTjmzs4LOBh9oCCeQAlHP1Zl+3IIRu9wmRq3vQHZ28E7j0i4YT2Nmimv
X-Gm-Gg: ASbGnctgo9bga9QkOcfgrM7ehQeyy8xEFehD/XYKQ1OJDvDYjbWxVkjZLfHPbDzhdVu
	ToY5NGzj1Pxz4EkEtalQQfOcxUv6SP0Ul0j/a9o0M4+Lv82J3eJoWGwMJRPlmZYyqbfh7a12eK2
	+x3zaA5LJjhLta813uwSSelo9h21qTQdkknS/5iq+ye9Sp7ly65zXOMAxl6x11mzqWiHQrYJujI
	BW7JHi9VVSbAQiYwbRbrqPC/Aah/RSl9O2avnEC9IROSkqOmijJ47nGzCWFnFkzI1RpfSAJIjni
	wtKC/LxmeV/TOBbbm4L31ahr1NcE2EqPeO8IRMbhKVCTN61L0ARxyzVL0gHxoryp34WG91gYX5t
	OHPFb0182vEM=
X-Google-Smtp-Source: AGHT+IEeC7TzpwrnZ29EptzNFEC8zZV507GN6tiYHpU7eLNsZcGs71sZYOzt9Mx6896AVTDC5n+jJg==
X-Received: by 2002:a17:903:2d2:b0:23f:75d1:3691 with SMTP id d9443c01a7336-2446bdafa24mr79167475ad.15.1755334092874;
        Sat, 16 Aug 2025 01:48:12 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:48:12 -0700 (PDT)
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
Subject: [PATCH 5/7] arm64: dts: allwinner: a523: add USB3.0 phy node
Date: Sat, 16 Aug 2025 16:46:58 +0800
Message-ID: <20250816084700.569524-6-iuncuim@gmail.com>
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

After adding the phy driver, we can also add phy node. In addition to the
clk and reset lines, the power domain PD_PCIE is declared in this node
according to the bsp dtb. So let's mention it. 
Currently, phy driver does not support role selection and only works in
USB3.0 mode.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index e4ed4fa82..233365496 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -606,6 +606,16 @@ mdio0: mdio {
 			};
 		};
 
+		combophy: phy@4f00000 {
+			compatible = "allwinner,sun55i-a523-usb3-pcie-phy";
+			reg = <0x04f00000 0x100000>;
+			clocks = <&ccu CLK_USB3>;
+			resets = <&ccu RST_BUS_PCIE_USB3>;
+			#phy-cells = <0>;
+			power-domains = <&pck600 PD_PCIE>;
+			status = "disabled";
+		};
+
 		ppu: power-controller@7001400 {
 			compatible = "allwinner,sun55i-a523-ppu";
 			reg = <0x07001400 0x400>;
-- 
2.50.1

