Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4288328F50C
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649368; cv=none; b=BCAWq1Q7ceMMaRjfgZccbUUAl6+NML0aQS/X/W8JbR9OZ8TscSFSgf1b+KqZlALmQK3gi+sN3GN0dDACcYdvaXCm+xKPKB98gILkB7kJu/LLCYsv06GlgEQDxhPwJ3n1gkf+HTdtC8G2T0nc6qQJHRAvkC0+1Xn7m8PwJ6ZbFGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649368; c=relaxed/simple;
	bh=9DaiIhuT05anulPNoShPYKhxsY4puRsUVmB+KkjMsF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLLYEFt41jPgAn05tt2s4b44KRDhfLokOkcmdV+lUrI+XPhNqpysfYc73ZEjecA3Q7jCIKtnM7kdNUcU2c2ckcoTB8VnzdYEY57dSub33ftJDVZtqoYHUP14cwOifUY14anfftGQONt5p1RJnCP7QKBlawiJlZkJVgNAZugCx5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdVhOhZB; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdVhOhZB"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-731e277a6b0so189148a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649364; x=1747254164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dceCEKVUOKGa77JloXxMoEjB3aM9WeA8fBzF7lUwBv4=;
        b=MdVhOhZBX2Ne4I6oyh3dBXlrTbENctI6tB2zBmbNV1MfJnAnv7EWYXJHldDopUuH/i
         RDmW/0TqxQAF2G8tUeLgWAERAryuKE+JmJICoDzvZTLZlAJhb/IxIze10btAOmeSkbnp
         qQIwwfUmDeGek3sDTsD2dSFiys93gZoPTn5jQ8Pdf3i7WM7pzfQYwkY54Q06ySbb5seG
         87yYZvPX2Fj78WeCyFel6Rjli17TerfKEIh4J0sa2A5z8d1M4xrP1Uwrdtnam0puHRfq
         zp7lthxSt8hconV7dnU6XuZvBJcleRxJxX03k+Ye1tlBzhBaqUE1CJZfTH1fbh2udBD4
         1ThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649364; x=1747254164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dceCEKVUOKGa77JloXxMoEjB3aM9WeA8fBzF7lUwBv4=;
        b=dx+FPBkeD5sRu98fDppWaoU9vUg7niRvoOqVK7+JORK6rPLgi0Kfq++fUsrqilCzs6
         ww5vgXjwLzkPFtLYA9ZtyosQ52PrvNvo/iUTKuJCiSsR0QEtnW1aC5dDqsym92daTEHZ
         rzXm8FlzrGcV2jMc+ywydHnUUvvGxo+VH+606FLF0cFw3g1/Ze/lVnpwvPDPecfA1vNv
         tq6Q3w/hZxLqfKxiBcGxNPBtxul5ZJ8X4+p4SAVuXkdld28RelhVxzqZx3ke6si7ZBIG
         wGvw8mnRB+/qD27FBu39qH4ABzqK75YyM94vHRcd8GiiFg62qb1ivzaI2+NkjLj8DQwL
         Oj5Q==
X-Gm-Message-State: AOJu0YxU0hdeUOk8Us3EdHbzDJ9PzPBNeWa2qFmpRcGh+L1oXaXAEV7Z
	X0lKyGyo/B98D2RjU0ehi8vAt4GJkijkIpKp0xMJq428prQcfPIqU773Ow==
X-Gm-Gg: ASbGnctLrj/VIp/kzNwLlPoPsgSYiJpmWNNe8CJ83Q5OBVXPyIecK5CzeJZTd8EPJff
	euH74bv61G+V80SRNO0GmtJ7EA710Y9/vjIjc9ljx2ze05/8SVt4pLL9sGliXZQgFBjK1wmUb4i
	lKkiJSfdPYG1QzjfMOPeGCo2SQFZ5cNOJPLPg1Ge59uA/BvY+q1F9O4z3j1P+42fvHxaH4AiQdb
	oe4ZNNWLzLQFM7WhgTfAyPP/ZJadk5nnsr/Z925T6kZGsd8eRCca16xDfT6loQ3CeBOMQhMw8J6
	eic/zHQ6CUMCDRIo1T9lVBYQQ6pOd+neXoEbqo1KBw0xxDFs7UrdgWQuCQzU
X-Google-Smtp-Source: AGHT+IHzDb7Qz5DZFiGSa6Z3lnHv+87ODFBjRHAjTiD7jtWVu9q1Y73F4kwu/+T85cIKLmYaJUt5FA==
X-Received: by 2002:a05:6830:25d4:b0:727:2f79:ce33 with SMTP id 46e09a7af769-7321c949800mr404858a34.28.1746649364088;
        Wed, 07 May 2025 13:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:43 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: [PATCH V9 22/24] arm64: dts: allwinner: h616: add LCD and LVDS pins
Date: Wed,  7 May 2025 15:19:41 -0500
Message-ID: <20250507201943.330111-23-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner H616 (and its H618, H700 and T507 package variants with
the same die) have 28 video output pins for RGB/SPI and LVDS display.
These are in GPIO Bank D and are multiplexed.

In RGB mode, pins PD0-PD23 are for 24-bit RGB pixel output, pins
PD24-PD27 are for clock, DE, HSYNC and VSYNC.

In LVDS mode, pins PD0-PD9 are for LVDS0 and LVDS1, and can be
configured by the H616 display engine for either one high-resolution
(dual link) or two low resolution displays.

Add device tree nodes for the LCD, LVDS0, and LVDS1 pins.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 129ce78ae5f3..3d8b412afb88 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -325,6 +325,32 @@ ir_rx_pin: ir-rx-pin {
 				function = "ir_rx";
 			};
 
+			/omit-if-no-ref/
+			lcd0_rgb888_pins: lcd0-rgb888-pins {
+				pins = "PD0", "PD1", "PD2", "PD3",
+				       "PD4", "PD5", "PD6", "PD7",
+				       "PD8", "PD9", "PD10", "PD11",
+				       "PD12", "PD13", "PD14", "PD15",
+				       "PD16", "PD17", "PD18", "PD19",
+				       "PD20", "PD21", "PD22", "PD23",
+				       "PD24", "PD25", "PD26", "PD27";
+				function = "lcd0";
+			};
+
+			/omit-if-no-ref/
+			lvds0_pins: lvds0-pins {
+				pins = "PD0", "PD1", "PD2", "PD3", "PD4",
+				       "PD5", "PD6", "PD7", "PD8", "PD9";
+				function = "lvds0";
+			};
+
+			/omit-if-no-ref/
+			lvds1_pins: lvds1-pins {
+				pins = "PD10", "PD11", "PD12", "PD13", "PD14",
+				       "PD15", "PD16", "PD17", "PD18", "PD19";
+				function = "lvds1";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";
-- 
2.43.0

