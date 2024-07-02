Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136941CD5BE
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jul 2024 19:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719949001; cv=none; b=upkITJZIcFNPaxpBU1S5UC50UIhqiD+c1l5Sh0oCfhAFPPQLmYt2RIqM6JiXqnMXCNxs4pMD1+DXQ8aSTtjeQdoDD2bfWZxZntEImXXuwHRNxJDMOaVsReBGTolcGEHR3xpoHgPHYYDKIo1fsojaWBIMo4q+GWscA1WCfY1thMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719949001; c=relaxed/simple;
	bh=63TtL8nRXaRCbUED+7bVm5uoPVZ6BzcC2EVycbQphU4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QJuQ1sTapOEIAiY6xQO1Z3IBDco2xwp7vXh/qcc5WH6c2xf/Sq8WSvlZRxZjbZ2ModS7cKvlDAhgR7Om7EthyH5QzWbz68e1mf02lIj8a5UkQkUR57Iw9Nn9i/jX8w8aYZLHoGDrv8I3JXqXiso65MzAueCs/JeCEPh+74Atmnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7ardpLi; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7ardpLi"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3cabac56b38so2800475b6e.3
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jul 2024 12:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719948999; x=1720553799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEkTrmrQHtrxef4UKwZhbXgIZTKdX9XoI2Y3fzoSjz0=;
        b=S7ardpLicn4uM7/6lg4/Y7E839cZlkvBSzX3PibmpiJntw9OOLlDzfxcsmrYOSKAec
         OKo6mvqopQRehhqnGq5c+UY0/5f3I2C93p2NaJNnCHRJRD30IlnhZgjMorhPAwr+4PBn
         cTX5wth5XX8Us3bACrfJ4t6oLyF9aacsWM/El2z/ReHncpG+hciKI7UIDgPGgYyNSK03
         YSlRx6EGu9KMiFrTR3pvCVfL9LAF9VoKnIA2KAbaSIHAWpy38uGF9HHif8u0MtoNpirz
         1G4olVl+qj7MzrijcBklYBQ7DKMiu3s5IAOYRlY+a9hl21qRp29jjeIrny4ntRJBvnw8
         yPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719948999; x=1720553799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEkTrmrQHtrxef4UKwZhbXgIZTKdX9XoI2Y3fzoSjz0=;
        b=pxcvrAoZxTLft1LAZl30Yv2CQEvLLNoB66/b8TkgWomX/puD2ypDT2FxbCctNMKLNH
         UlStdmPt5kP8AuSXEu/ryTL56+PPKO+NrFflqCm6DlvZYrDqgJYJWzhfj0hBuGW6wN2n
         xFbrXfpHqbaPmhfBuacW3Fiidr/7Yf1mvSmLrePzzpkQVjXwDNBy/LCJYVPlnfQ+immB
         FyEd/waP/XErVB6OTZgr8eAYdDGKsoNnTk1aDtNmUH1IMhQnNgLjuEghDVirzAdAyzJx
         bI+rxvqt6Fa+HIDwe9taBfOVzakw0yjW6wAjuCXsoa/YiYj/Y4bbfiSi3FkSlkPhA9cT
         xrHw==
X-Gm-Message-State: AOJu0Yx4CBNs2vQbrCrz7hs1Es7YlxOzuYhvm2b7pJltR8qk76Um41ON
	hb8Skco4sU3BSmj0A4Q8OXWVVkdMjXcq2G//q6fgj/WKHhtUPuGNke195w==
X-Google-Smtp-Source: AGHT+IFO629pYbLvXnkPLGjw7RgR+qhtRcxcv5sftgwI+IHKlieJYmLVyI5Lj8bkJDxiCn519Atv+w==
X-Received: by 2002:a05:6808:f07:b0:3d6:36ec:5c3e with SMTP id 5614622812f47-3d6b5689ee3mr13412382b6e.48.1719948998820;
        Tue, 02 Jul 2024 12:36:38 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62f83c92dsm1831335b6e.0.2024.07.02.12.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 12:36:38 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	ryan@testtoast.com,
	andre.przywara@arm.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 2/4] arm64: dts: allwinner: h616: Add r_i2c pinctrl nodes
Date: Tue,  2 Jul 2024 14:34:12 -0500
Message-Id: <20240702193414.57461-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240702193414.57461-1-macroalpha82@gmail.com>
References: <20240702193414.57461-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add pinctrl nodes for the r_i2c node. Without the pinmux defined the
r_i2c bus may fail to work, possibly if the bootloader uses rsb mode
for the PMIC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 921d5f61d8d6..e31945c3895e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -837,6 +837,8 @@ r_i2c: i2c@7081400 {
 			dmas = <&dma 48>, <&dma 48>;
 			dma-names = "rx", "tx";
 			resets = <&r_ccu RST_R_APB2_I2C>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&r_i2c_pins>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.34.1

