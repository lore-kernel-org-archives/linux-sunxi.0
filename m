Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CAD2CA2
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Dec 2021 18:21:50 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id c6-20020a05600c0ac600b0033c3aedd30aso1815573wmr.5
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Dec 2021 10:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gfaLjrdMaBtEBA6gW3vzSiLmG5RGlxbWPlwFCA3b58U=;
        b=hjXRECTmt3QwxBwLLnhgBiEI0L5akGhC0tr7krj/gFDT22AYR2ULra1IoJgQMtMz7X
         YI331nOul8a+jDq0lt3YzzjizQQJ0IiB1XBfoewkHiqFbgtM8WIHhl1PNo7OnWhqvGrr
         yYbLWhx9KF8uESHrks2xTAQuq/r0oV+5OzcKGyuNpWorxB4QEqQaXIOmyPg7zB7euhBC
         6ZUSa0VyjBunzlnTxnnjetsAqOU1mF8KJAG4ZMPssfbO8xlKCBNPSXYUc2KaL4tQiCtM
         kt2TdIEE7Yu9oRbNWncLFwbksICPqb8R/K1AETHggO/Kgm+SDDy0vhfSZff2T5pBpBWG
         Ne1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gfaLjrdMaBtEBA6gW3vzSiLmG5RGlxbWPlwFCA3b58U=;
        b=zkVbrljL0v2f08WoVVqffCrG3GX+YH70+r4OCMITa0+DKVmqioEMWIofL7e1fYv56B
         WaLvtivhMynjftGgpy8GTZg89gEtqetDTe1gaq7geJAspfDv3GKAJW37YAKVdji2JbOW
         QQ6d+b0eJz2lVobt+uTIwD/Jr+V0WB0B7pJbhZWZ3EYY1Gk8QA6OOF0Ak9d2zJUc3b33
         VftAbbuR2g74FRaQbpVt+d+T2rifEiHc/Y81feAMPyQK5cUJ+gkYDdTMAkr9saEjWTHE
         mtI4uyJmyHz3A7uJo9d/yWMjyZm4ZXb7PBe5dH07NCpLZM4dwiD2+dK54ZMYXb1fPxjy
         NG6g==
X-Gm-Message-State: AOAM531AdPHMrm9DvyTZkQnXIr4dQvJOhdqqTPX4onagF43Hdh6S+33Q
	XPF+SPPVaoU84hGtxyN5QiW10hPMlpw=
X-Google-Smtp-Source: ABdhPJwHMXO+np1LQE1gqerHfoqcLb/cmi07fe92xjTe0mj3fR0IGiphnTzvbOkCTqi1e0kQCZqATw==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr8796600wmh.193.1638382908605;
        Wed, 01 Dec 2021 10:21:48 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id f7sm604705wri.74.2021.12.01.10.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 10:21:48 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 4/5] arm64: dts: allwinner: h6: tanix: Add MMC1 node
Date: Wed,  1 Dec 2021 19:21:17 +0100
Message-Id: <20211201182118.1213806-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211201182118.1213806-1-jernej.skrabec@gmail.com>
References: <20211201182118.1213806-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both, Tanix TX6 and Tanix TX6 mini, have SDIO wifi module, albeit
different. However, driver can be autoprobed via SDIO ID.

Add MMC1 node, so kernel can discover wifi module and load driver for
it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h6-tanix.dtsi      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index 166b6a7a586c..edb71e4a0304 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -75,6 +75,13 @@ spdif_out: spdif-out {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
 	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc 1>;
+		clock-names = "ext_clock";
+		reset-gpios = <&r_pio 1 3 GPIO_ACTIVE_LOW>; /* PM3 */
+	};
 };
 
 &cpu0 {
@@ -121,6 +128,15 @@ &mmc0 {
 	status = "okay";
 };
 
+&mmc1 {
+	vmmc-supply = <&reg_vcc3v3>;
+	vqmmc-supply = <&reg_vcc1v8>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+};
+
 &mmc2 {
 	vmmc-supply = <&reg_vcc3v3>;
 	vqmmc-supply = <&reg_vcc1v8>;
-- 
2.34.1

