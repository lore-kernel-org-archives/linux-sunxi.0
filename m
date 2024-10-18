Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C67202F6C
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 16:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729267727; cv=none; b=uKWb5+mUqhs35zYCFCW48JJEC8qecAcj06utDzNUYXyYJAVZflQ4/dmx4oepE8nukFKwbhNlZDl5J/pYEDhDqy4KJCZau6NHkafc4CVGHHTf1OeA2pMJol/BWmAuaZyg0GUZ/9UXybwLL513GgDOjkoJ+sSpJWEwh1yFGscAbeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729267727; c=relaxed/simple;
	bh=xraqAccI9artWrwaRZh4MU6AFyK+WqkuUop2ha/9yRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNGWjYyF1seYigdk0ykOkwRwQLa9rUFZGCTPaqsM+sPlJqGeydE+le4i65z57sTSJFR5nOgx6DoSNzq96Z2MxfSBQq/3TkGqpA9moEfY2tP5v0aOzsEUmkgx+Lk4Ji2Y53ZFrwU/gQ7Y/3fNeonmm19xb++XcDL6IEZmtknHbx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApIDwbxO; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApIDwbxO"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2887326be3dso1045448fac.1
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 09:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729267724; x=1729872524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZBgOs7gndVxY2K9bPnYQhdzvUk2WIcolOLAArh+X8o=;
        b=ApIDwbxO1kw9nN2j5nB/qRX7HDoC36d39uvE/a8/luzHoTIkPP/WLR2xQ/NTeruc3f
         HDs4lUTtUp85VFeIVzzozFifAxlb0kP5REJeawH2QpOCw705mEA51eriSrabxZi/JG/b
         JRWQACWtD2+581bqfMkT2KEHBhSFYNRyruKT/ia2WjDKX/2ZCpA4aziKfAt3FO0xMCR4
         Itp1NToT9FzdBD4STEWoxc72onVRw4inU7SS245auPQEymubKlj06+venGLJpyFY03uE
         dGeFWhF5MkalXhefVimlCIZwElK8imgVonctA4ZEagLtJ5+ksAp9yBMNz/BIBRhwSz5O
         1YvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729267724; x=1729872524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZBgOs7gndVxY2K9bPnYQhdzvUk2WIcolOLAArh+X8o=;
        b=iBEDvcc76ZXsl/1QMxu1Hc9DS3H4euxJpdC6ttUNE0A6ruWWo+xCg57+tk+GGtyugI
         gJDdvCxYd6BY0CEpb+Vo14tcg2DpRKSu9zTfxE6BqoBtfJ5bBZD+dC7shn/SXigJPf2i
         rh+7iVrjuthJSNzrnWtcKxn84P0mkxuoyIG1Ok9Hh7V63se8yfBxm1eugEhhCwMetXyf
         IrgEEVeIAX485ZxHrmBZL0XfmDra6JGD039LDL3cC8MsTgmkDa+xxJeGMy9blYs2Z/oL
         mZLR6njPN0xLpahAC9kHNkWfW+o5xyEqX/PRMMXQRQEh2e5vuL8bQd4d+Yztqkj/QddK
         8Mzw==
X-Gm-Message-State: AOJu0YxmcHuwTpjp8Y+E6ZzSHP6PZfdM4OkoVVrOlmvgJ9HwnBZ9YmKk
	v+RNgiiJ5O0cz7xoVk3bM9U3lZmkD5+jzjrCK0GlyG264SG7veqSdXDXjw==
X-Google-Smtp-Source: AGHT+IHblnU5+A+Nk05NuN5q/WEZ0TcOm9e5Bd+X/wO/YtePlWbz/GpFamcaOw/HPBiGS0GR6as1sA==
X-Received: by 2002:a05:6871:5823:b0:288:563b:e48d with SMTP id 586e51a60fabf-2892c24f4f8mr3037582fac.10.1729267724031;
        Fri, 18 Oct 2024 09:08:44 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2892afb01ebsm507350fac.50.2024.10.18.09.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:08:43 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 4/4] arm64: dts: allwinner: h700: Add USB Host for RG35XX-H
Date: Fri, 18 Oct 2024 11:06:17 -0500
Message-ID: <20241018160617.157083-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018160617.157083-1-macroalpha82@gmail.com>
References: <20241018160617.157083-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The RG35XX-H has a USB host port in addition to the USB OTG port used
for charging. The host port receives its power from two distinct GPIO
controlled regulators.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../sun50i-h700-anbernic-rg35xx-h.dts         | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
index ff453336eab1..e6dc29a38dd6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
@@ -71,6 +71,25 @@ gpio_mux: mux-controller {
 			    <&pio 8 2 GPIO_ACTIVE_LOW>;
 		#mux-control-cells = <0>;
 	};
+
+	reg_vcc3v8_usb: regulator-vcc3v8-usb {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pio 4 5 GPIO_ACTIVE_HIGH>; /* PE5 */
+		regulator-min-microvolt = <3800000>;
+		regulator-max-microvolt = <3800000>;
+		regulator-name = "vcc3v8-usb";
+	};
+
+	reg_vcc5v0_usb: regulator-vcc5v0-usb {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pio 8 7 GPIO_ACTIVE_HIGH>; /* PI7 */
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "vcc5v0-usb";
+		vin-supply = <&reg_vcc3v8_usb>;
+	};
 };
 
 &gpadc {
@@ -113,3 +132,7 @@ joy_mux_pin: joy-mux-pin {
 		function = "gpio_out";
 	};
 };
+
+&usbphy {
+	usb1_vbus-supply = <&reg_vcc5v0_usb>;
+};
-- 
2.43.0

