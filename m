Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09CB2F80
	for <linux-sunxi@lists.linux.dev>; Sat, 22 May 2021 22:24:43 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id w12so19763221edx.1
        for <linux-sunxi@lists.linux.dev>; Sat, 22 May 2021 15:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ay0fHXYi3j26JAcF7k+JE+1+d8hSCbVyhFr9Uwv+K/0=;
        b=aLn2T/bJkR0axspuDRqa44wdxnX1774Vc4B3LSwj1+fW8zT7cDahWPvRBWM/tZeQ+G
         /FSdB/R1XKx0j3X4UTSDiMgUsRyKG1jXNH1WWauZGkpX5SG/JjsbYhns0Hasd0JUaU11
         8Lkmh9E9r2tKXEc5VMf/HwKBh5PXDozv7xpn33GAGxQicRauA1bbrIOvnEad4NuRPi3C
         iLp+WrIlI+MoD+9z9QAaxWx5ZG+3Ouu5M1bKSdoubissENdaBHF/CrPbpIhU+CZ2/fsX
         uirLQU8o3zZF4PsQ8RgUAZ1t7/hpfvm54X5B7x5XgAh9sItSPM4l9yhqGcT/D5zFJM9Y
         sHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ay0fHXYi3j26JAcF7k+JE+1+d8hSCbVyhFr9Uwv+K/0=;
        b=gjB1COkFjTucGk/LhyslHTkjvsnf9qSWDZnZPdr1kfLF1H44jSNNUWv1EfQU6i3zzG
         3lUKDeOUZc2UGMEfk6q026jj8dq6mRX47mB7KOMMJNo75rZcG+VVYzYXJBU0zo5EzzZz
         GrMOFIFTqv9Vx+C1p+GWur2FiX3mfTSqaz2HB9Dm9ekgfyDIfFO7TIl7rmAeNiLsZICT
         77XP6cww2YCO08Xig7rv75QOf+PKUtPo+Woh0ThBJPwbPoNomnjN5DwE+q6CBiFclJE6
         JPRBkYMQQHT1cmgPnrFOvat8ZavDrUJNOQZyzxEf6pz55osRyUmn6xqgnKobKyw+glWR
         n9HA==
X-Gm-Message-State: AOAM531cMwr49KO3PoGG4E/GSyqqh1vNVFuwdvJSpvRJ/Qtaa5fbDIFC
	Ce5Ku1JpRsdl4Il2TvYtKKg=
X-Google-Smtp-Source: ABdhPJxsKrjbyPZNIBL8uFm1Xv7UWH3qH4UOXl7xjRcH21qYYuIvLAxvkTqsZ94LncPazGo2gq9yIA==
X-Received: by 2002:aa7:c349:: with SMTP id j9mr17938313edr.135.1621722282075;
        Sat, 22 May 2021 15:24:42 -0700 (PDT)
Received: from flex-5.fritz.box (dynamic-077-012-139-231.77.12.pool.telefonica.de. [77.12.139.231])
        by smtp.gmail.com with ESMTPSA id ju17sm5869508ejc.72.2021.05.22.15.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 15:24:41 -0700 (PDT)
From: Andreas Rehn <rehn.andreas86@gmail.com>
To: mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andreas Rehn <rehn.andreas86@gmail.com>
Subject: [PATCH v2] ARM: dts: sun8i: v3s: enable emac for zero Dock
Date: Sun, 23 May 2021 00:23:29 +0200
Message-Id: <20210522222329.192367-1-rehn.andreas86@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210522205039.179486-1-rehn.andreas86@gmail.com>
References: <20210522205039.179486-1-rehn.andreas86@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dwmac-sun8i supports v3s and
Licheepi-zero Dock provides an ethernet port

Signed-off-by: Andreas Rehn <rehn.andreas86@gmail.com>
---
Changes in v2:
	- add ethernet0 alias.

 arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
index db5cd0b8574b..4d564028f286 100644
--- a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
+++ b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
@@ -49,6 +49,10 @@ / {
 	compatible = "licheepi,licheepi-zero-dock", "licheepi,licheepi-zero",
 		     "allwinner,sun8i-v3s";
 
+	aliases {
+		ethernet0 = &emac;
+	};
+
 	leds {
 		/* The LEDs use PG0~2 pins, which conflict with MMC1 */
 		status = "disabled";
@@ -94,3 +98,8 @@ button-800 {
 		voltage = <800000>;
 	};
 };
+
+&emac {
+	allwinner,leds-active-low;
+	status = "okay";
+};
-- 
2.25.1

