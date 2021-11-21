Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1068
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Nov 2021 11:50:07 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id k37-20020a05600c1ca500b00330cb84834fso14277163wms.2
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Nov 2021 03:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AQmd9SukAAF43qeHe/hCA71TFxm5LvRKe4XmZtcUxKc=;
        b=RDBLjNI76TODJM5qgyUj027n20BGoY1WOj3Sk4nSnC6FBvtLMT33IwaMDmdfTDYFk2
         5gZrxAkjvuSPuGCqJOWY5SMu0IqlALluQyjPAehA5A1MXs9pSrbScBUDV05crA0YqeLp
         yJHH2utY3c7U/Mlrf347VYeNpa11wGoCGqA/jY7c8nWwAc2gM5Nmc1pyKXzRGgSn9Z0w
         YiyniT8plYjOUsC1pjJWPW1KgxJ8am5hcXNIg/IRA87P0vwOtpDbGNVsWfsgVO1c4OpL
         Z4Tji7oXKQoGU7+/Ky+YIiquaU1bNobwpqc0LwP75b8qeI5w35E3L13iGnr49J6u3UdC
         p9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AQmd9SukAAF43qeHe/hCA71TFxm5LvRKe4XmZtcUxKc=;
        b=O8uN8W+TABhlricWScUpD+LS+68VRMJ/pnFdRMElajypnukpJ0/uQYxe3F69neoBLc
         0dVLyPUymA6nmsMyRuL5rxNnI0T04CgPYBJAEQm9i+4Tp5UzNZD5jL1Njp05e2PdwxFr
         eBPcHwxSGLcffZCDIJEM7yf/i+WIwI1Ov4qOmxCBTF/E1rB4EyB4o+3hEl+H72aqmNdg
         Eyep0n4uOBYirD7WfS3b8a3UUcTpy0RdF9NjESTsDeqbYVhh5u/Vkp4oEHFjOujcXKf1
         Hd/pZO5NhNG4oWB7FqrxE2r3/8io+TgSmBAb9EF/H+rD/dvrkIoyayjJHy7pujd+BFHw
         SOZQ==
X-Gm-Message-State: AOAM530VpPW6q2n2xX7/7esFWOGvNuhxIqA4D5XtU4jltQNxNvE87GJb
	Std9riWcsj16v5fnmbSFbjg=
X-Google-Smtp-Source: ABdhPJzkhFF5ybtUoDP7TCWR73DLqGOFVRq0CK/YuNI+VJs8DFIFv3aOv6EVyx43I5Ml2MGHzwWBtA==
X-Received: by 2002:a1c:488:: with SMTP id 130mr19311234wme.157.1637495405798;
        Sun, 21 Nov 2021 03:50:05 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id m36sm6575118wms.25.2021.11.21.03.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 03:50:05 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: h6: tanix-tx6: Add I2C node
Date: Sun, 21 Nov 2021 12:50:02 +0100
Message-Id: <20211121115002.693329-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tanix TX6 has a LED display driven by FD650.

Currently there is no Linux driver nor any binding for it. However, we
can at least provide I2C node in DT, so user space scripts or programs
can manually control it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
index 6c10ff7f4b1c..7c37aa4c60cb 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
@@ -32,6 +32,14 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	/* used for FD650 LED display driver */
+	i2c {
+		compatible = "i2c-gpio";
+		sda-gpios = <&pio 7 6 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; /* PH6 */
+		scl-gpios = <&pio 7 5 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; /* PH5 */
+		i2c-gpio,delay-us = <5>;
+	};
+
 	reg_vcc1v8: regulator-vcc1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc1v8";
-- 
2.34.0

