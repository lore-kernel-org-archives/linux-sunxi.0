Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF87F72
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Nov 2021 14:02:30 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id b15so11625446edd.7
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Nov 2021 06:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=48jpMjB7ikIGAY5IH4NRA+sLzh4QPo/RYNwFWYqiuv4=;
        b=dUS2SR7j0B4r/3q4ToNQmhhGg4WvoE5bfUdVO+ewVd2u5prBQdg4PikCaa9edENq8W
         WA3abYUryvhuFfX9eG/Bk60UNOiZyY/kymMokjqyBSLSIxftr3B4KwOpjaL4oMYZtowk
         V8eZLDBK8lvp+BVx2loNqo5JryZzLrYEpVkuqN+cu16sHJ4B94TVyWeNSnr1F6u2swOh
         ngug0eihvoNMHEjgawDVduGZxAqviQw5BaeCtNtjO9jJIWbZ+BXrnQYq9b484MBqZlvu
         b/j9CBI0EbYdcAJ4ToeKQp71xUoW8UMAInLAzS0U6ArqCQRTt6HWuOXTGHT3ffzJ3pKz
         +kZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=48jpMjB7ikIGAY5IH4NRA+sLzh4QPo/RYNwFWYqiuv4=;
        b=mK230HmOlbGEGxKLnjw3uFiOj3zTIc6Ksh++LXUNw85VUvl7xfketBfoqkR4FccygH
         bkLZTlfYRMYkb3QNmysF3xD41Pk1QtL7paVEqwmE1EEIcBxqg1Zc+VG2hXU1sXCwtpui
         oeXsFK58jtsgRAlg1G0YZTMW5VmAgsMatbH+Pqs66MeL9CScY0fbnkixdiJVtRT4ZLxy
         3wLi4piklR20O+eHiho7Q4jR0Es2ZjkIfP+DoU42Noa7kW6H1QXNlUi8E058Xs5h7W4v
         5Wwb2M6aUzrpm0Da9uYWdgoD4SD+5+xE02b4ch/JQSl8QOeLfLBQ1CJ3Ej+EGN6T2jPc
         LlDg==
X-Gm-Message-State: AOAM533UjMdEOWfE0IT/ggZpYZf8kUpVKcGoKAoTy+Fd6halMc1HvwZd
	HecqLcbuDCholVpfCcydpIwIsA==
X-Google-Smtp-Source: ABdhPJx98JoRl+qaja/gfMY6n9+koVO1zpPmRMUeZF13GS79wlEvIe00MnF0trXn+b5HYmtnQQvQbw==
X-Received: by 2002:a17:907:c0c:: with SMTP id ga12mr23434041ejc.417.1637157748723;
        Wed, 17 Nov 2021 06:02:28 -0800 (PST)
Received: from fedora.. (dh207-98-180.xnet.hr. [88.207.98.180])
        by smtp.googlemail.com with ESMTPSA id qw27sm10725963ejc.101.2021.11.17.06.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 06:02:28 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh+dt@kernel.org,
	mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	hauke@hauke-m.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robert.marko@sartura.hr>,
	Ron Goossens <rgoossens@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2] arm64: dts: allwinner: orangepi-zero-plus: fix PHY mode
Date: Wed, 17 Nov 2021 15:02:22 +0100
Message-Id: <20211117140222.43692-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Orange Pi Zero Plus uses a Realtek RTL8211E RGMII Gigabit PHY, but its
currently set to plain RGMII mode meaning that it doesn't introduce
delays.

With this setup, TX packets are completely lost and changing the mode to
RGMII-ID so the PHY will add delays internally fixes the issue.

Fixes: a7affb13b271 ("arm64: allwinner: H5: Add Xunlong Orange Pi Zero Plus")

Tested-by: Ron Goossens <rgoossens@gmail.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Tested-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
index d13980ed7a79..7ec5ac850a0d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
@@ -69,7 +69,7 @@ &emac {
 	pinctrl-0 = <&emac_rgmii_pins>;
 	phy-supply = <&reg_gmac_3v3>;
 	phy-handle = <&ext_rgmii_phy>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	status = "okay";
 };
 
-- 
2.33.1

