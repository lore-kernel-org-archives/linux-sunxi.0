Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA4313FEE
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 18:19:56 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1c11d53221cso2549607fac.2
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693246796; x=1693851596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOToEWW9oYkhmZvCwLkbRporhBTeE07PbdEwTviPJZQ=;
        b=UhoMcow9LlhFh6uIuldPYTlXXYwGhZi32OXNrhfshaLtJFlWYSPHMia58Cbf5ux9Xe
         oiTZbhRV9dldNk5hoG2jUFiEBsxZdGiwkcTjBYtlDi1Vhve7RoHon0X6h9Xd2RVZt1N/
         wi2AKLPSeLjVeGSeH+epPdujl1ZXai2jt9cG9SMFqzK7MM7SK3ll1saZzZd2Wr2g57F+
         3bw8Z55I240+8s9VQhLWFh4B/C2iUYVfa+j/t56nF5J4K8mz3d7A+U4MV6AyNBU+B43H
         Bc3vImiPjT0eRr2xiLCuHV1zxt8z6J0aQtiA2MiG2GzQ69Ody8plYCrZidYnmKrXJPaD
         qC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693246796; x=1693851596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOToEWW9oYkhmZvCwLkbRporhBTeE07PbdEwTviPJZQ=;
        b=GyHdC5OmnVWohm1nf5xNDtJumW32oI9nQJTmh03oVono+OMbzoVvWu8ocN1nTpUTv4
         4JF9vrSI7eYjmMMcBcYnXeP6V2sNVJXEp4ElKRJ/y41zKmJ+dRKktuiCOdM6bwABiWr6
         jjoUp8a4KX9O7nKNLUwu0qSv/sOgaXRevrra2hXBwv39pIjB+pWU8uoqx+ftqP6xSg0O
         ncUR3TGDs6CEHH9NCzAgQ8qUa36t71am8de9bzBK2NdNixOZKbO7IwBEbec+zX2WOAPU
         r6PaQTtRhVKe0JdYLtDyWpr78gQQxVJJInBTqYJlc6/lfMQJXC9UPHtypE9Dq6dQw0Ak
         sSZQ==
X-Gm-Message-State: AOJu0Yz00U0lFBm2zMc0apGG3JzLP6HFsRi9imscLWPIX0auyY2cyfOu
	47UJ/muMN0ir2YYb4dsQ8psT4HU9PZIPxA==
X-Google-Smtp-Source: AGHT+IGGnix0SZ9D+synGgsnmul+2HYw5rUR75ehPHwPEDjW3MsgSc4oJg+nBg2QAZXqKHd+oCvLHg==
X-Received: by 2002:a05:6870:8286:b0:1ba:ddf2:417f with SMTP id q6-20020a056870828600b001baddf2417fmr14158431oae.2.1693246795832;
        Mon, 28 Aug 2023 11:19:55 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id g10-20020a9d620a000000b006b99f66444bsm3695927otj.71.2023.08.28.11.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 11:19:55 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	airlied@gmail.com,
	andre.przywara@arm.com,
	conor+dt@kernel.org,
	daniel@ffwll.ch,
	heiko@sntech.de,
	jagan@edgeble.ai,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	noralf@tronnes.org,
	robh+dt@kernel.org,
	sam@ravnborg.org,
	samuel@sholland.org,
	uwu@icenowy.me,
	wens@csie.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V4 6/8] ARM: dts: sun8i: v3s: add EHCI and OHCI to v3s dts
Date: Mon, 28 Aug 2023 13:19:39 -0500
Message-Id: <20230828181941.1609894-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230828181941.1609894-1-macroalpha82@gmail.com>
References: <20230828181941.1609894-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the EHCI and OHCI controller to the Allwinner v3s to support using
USB in host mode.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index c87476ea31e2..e8a04476b776 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -319,6 +319,29 @@ usbphy: phy@1c19400 {
 			#phy-cells = <1>;
 		};
 
+		ehci: usb@1c1a000 {
+			compatible = "allwinner,sun8i-v3s-ehci", "generic-ehci";
+			reg = <0x01c1a000 0x100>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
+			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci: usb@1c1a400 {
+			compatible = "allwinner,sun8i-v3s-ohci", "generic-ohci";
+			reg = <0x01c1a400 0x100>;
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>,
+				 <&ccu CLK_USB_OHCI0>;
+			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		ccu: clock@1c20000 {
 			compatible = "allwinner,sun8i-v3s-ccu";
 			reg = <0x01c20000 0x400>;
-- 
2.34.1

