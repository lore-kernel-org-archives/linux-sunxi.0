Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBCD1632F2
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 10:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737195755; cv=none; b=mAeo+nwuvoDi8/nPmOQWwRrn5h087Kro5Wj2ZLflOFBnuIC0si020UztLPDoKADLHwJZqQIMkWddrjeuPiRkzDx9Phg2EvSvCTXMhMaDnCrOFBAwz1/BCq/G6U3prFQnLB3KA2oTDl3RgHRL9kbJF95PzaXPXopsaIQg0YHKd4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737195755; c=relaxed/simple;
	bh=0kpmyPDKuYP8/NggsKLM73O6OPX421GcTtnh5Splohc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bgCtg505gazNgKXvJD0zTZwWNvqigJaWxxH+AKgIo7sHLFKLTCl7Y/aUGYnQY8vj7uuJosV95ayDcjd+7RKMl45dc9pT7dQFs6vi2pKXMPEu5WayPW3Q7hUyxpU27yrzsUqwfZXLHTOe4lprN1i1fqNeYzjkjg3J7k0MJsrHeQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IumVTswv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IumVTswv"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so28528265e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 02:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737195752; x=1737800552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiAkN9lM6+KhhfeepI/5N0TsoSs8qSwlei2DZBWENpE=;
        b=IumVTswvdWZpQ2fZk/SICt+EnUGTWapvxF/y3mjY1HIwQyZlP79jpXQiy/t8Aqj+kS
         1hZvRSibTDriEdQbUqQjLgK/RvJXmsZhgkvY2euhrOGxdwpFyy6yYyiY3GcR5SsX7dA9
         WHGlM85HjXWkILugvqsmFdqrJA9K4DJ6DBsMsOMD22cwC2eLJRUT3CcJtNbj784LNKO/
         hp14lf8ceAMWOSkYVMg9bjpgojG1vcAIgwa+dsR3G/hhaMWUYbClR2TNtu+K6sB49OvC
         USwYyBo+QrMnqQYXzW7aYeKLEGPW5wpyZAn7aAbUSTYCIJHKxHXYzL3E+F8gM9u0HIVL
         97ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737195752; x=1737800552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiAkN9lM6+KhhfeepI/5N0TsoSs8qSwlei2DZBWENpE=;
        b=hT2kYf912tJS5hCDC+NuDc6Y2b0Kb7193bAfaO96bmVeJmxM/fGQki60lcsEbXowLs
         TRdCsBbm3JL8MNczxRsXlIs4cWZnLNcSBHZlvxbPqK79bZKwV/FmF/ts+V852tYFv1wV
         aDkJPO6fMJNq0JkxwBNkeBx4U8J5dz1rPywDQxNS8ixuI2qlV/HFYlbpMX+0cT+HbUlm
         k0WTQjkTp4jro0fGQCiAZyMXKxXws1AtxFUnZkX3bWymiM5WotzoydjY51+ioTxl5Lu8
         GApyIRIvAKyicFk2uk7Wxlex2sbos8jd+Per+SDpeeW27YLWAdpzl8zNWACtAZc4UhdH
         /Gxw==
X-Forwarded-Encrypted: i=1; AJvYcCVAZvRrvZzN/0sEjzwvrEszn06WcsS3ZIg/HtPRfcpQ9adGtDcVIm5euZGoRh2dNh3xoQgUW3XuRc2jTA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8zeTm6Dc3e8DXue1Sqxwwd+XlynyeSbJL95MDtzF78aTgNS3J
	74Ov6D7Q/SuBBeUp59hq8rHgg0mQNFPogLd0qbzvT1jxCeneRbVT
X-Gm-Gg: ASbGncugyZDjMSN5EI3KP1JzVnsab85kHb2njcP8LlXbTVkYx93zAq5pKczubyuyOOs
	ujDsLxllK9xEIO7llPIAARbzvUhM+GfqOJQYsUKxoWEubBHT1LN1BelXI3Kxr9Ip7JNJKOyH1oD
	UlPU/Fql6twd3Tn5GYh+5MCmhNF116OyG8g7c4i8JcvvTJSho8Wrqjp0AbUG/iUIyEAIcENSOnN
	Vf33CtSPZgzy46bhnJVNcgtlH8Z3varNIhySeUuuDGshpc0s4b47pkSmR5g9hRjcgtDUJR4aVzD
	tSN5ztK9o9XFgNMx/LhhIuFoRccwh+kI4YMiTmC1ZLVpoBtsi0vTPngz
X-Google-Smtp-Source: AGHT+IEg75B51PBOkr41mFVL8S0eZZqlWUj0q/2aF0Yoeffu4iW9O1RDKnjkpOJD7XMKrnqAu7NcQg==
X-Received: by 2002:a05:600c:1c9d:b0:434:ffd7:6fd2 with SMTP id 5b1f17b1804b1-438913ca1ccmr55465325e9.7.1737195752087;
        Sat, 18 Jan 2025 02:22:32 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904625f5sm64954515e9.28.2025.01.18.02.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 02:22:31 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: [RFC PATCH 3/3] arm64: dts: allwinner: h700: Enable USB OTG
Date: Sat, 18 Jan 2025 11:22:06 +0100
Message-ID: <20250118102207.9339-3-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250118102207.9339-1-simons.philippe@gmail.com>
References: <20250118102207.9339-1-simons.philippe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RG35XX have a GPIO controlled regulator for phy0 vbus, add it.
Enable HCI0s controllers and otg for dr_mode.
Add phy0 properties to descrive id_det, external vbus, and internal vbus

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 80ccab7b5..5a6ae42de 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -175,6 +175,16 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	reg_usb0_vbus: regulator-usb0-vbus {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pio 8 16 GPIO_ACTIVE_HIGH>; /* PI16 */
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "usb0-vbus";
+		vin-supply = <&reg_boost>;
+	};
 };
 
 &cpu0 {
@@ -337,12 +347,23 @@ &uart0 {
 	status = "okay";
 };
 
-/* the AXP717 has USB type-C role switch functionality, not yet described by the binding */
+/* the AXP717 has USB type-C role switch functionality */
 &usbotg {
-	dr_mode = "peripheral";   /* USB type-C receptable */
+	dr_mode = "otg";   /* USB type-C receptable */
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ohci0 {
 	status = "okay";
 };
 
 &usbphy {
+	usb0_id_det-gpios = <&pio 8 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PI4 */
+	usb0_vbus_power-supply = <&usb_power>;
+	usb0_vbus-supply = <&reg_usb0_vbus>;
 	status = "okay";
 };
-- 
2.47.1

