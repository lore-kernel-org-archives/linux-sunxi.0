Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A265D29CA
	for <linux-sunxi@lists.linux.dev>; Sat, 20 Nov 2021 07:34:55 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id b184-20020a1c1bc1000000b0033140bf8dd5so9177947wmb.5
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Nov 2021 23:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AdnhaQhzfGCZNq/tu9wW0n+da9d5ZXWaDiFgN3D1ig0=;
        b=AML7rh3/uPAl+zqRmG7YQFDf8fuylqlF2+YRC/reS0GFrRBeIoRh+pbHtlUIOgdR21
         Bh0fWatFQZWjahSp26vrv6Li6jSTZwMdSHwLi52m91rPaP4H0dhr/tJF0jojow6zohYW
         ipxtj3XuXQmXtG3AVwfWP2j3M4uz9vgipxbaVJBPVwbRrtj8ppOf+JcIvzAjBeEtN1Ch
         ujb3bCPNEbcKLhtv6kA2mGitKVvftvcOD711eTPVUfEzqkJnCq61+0vIv7iThvKbFgFY
         SH2ByDZfFqG8lGnbwAqHP9T4rHkOL9KdNsuhgHLLA6a4Tl7+nSsFl+iRXiThI/CFKwa0
         8OQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AdnhaQhzfGCZNq/tu9wW0n+da9d5ZXWaDiFgN3D1ig0=;
        b=sQxNeK9YtNCtpG7doO+BTbpbPWAstjf8giWukKdbvarsR7jqjff0CaJIMdunX+gB9u
         oTTFa63MigXi7liQiZuxkw1qWZPZ2v1f36MOivnYxWvYNBSLcebilBOFIzZfrE696V3c
         pEOX+TvDNBIfbl5P6JuptQ9dXIsM4VzFtwAdDLzgNSPS8+7mRWwifYN3EgZwPtfogQ7C
         BEVjCKp3is2buFOYMLwhUFFbLEX1Ucj6eP8WRilNennWdRT81b7GDoHdhHMo37h1b21o
         Po0c4LVk2ZrzZXG/SbE+ImS+voR375uMiiy/GC1RVtyf9A9Fg4ci5wHJ8fd4wy/BZQY7
         OMhQ==
X-Gm-Message-State: AOAM531vA5RrzImr0dqI/Wjgo4uS8mVgihrX8zFScYPYcXoq3EwI2dqU
	26Hc4OZUHwmLGyC7dr98Bms=
X-Google-Smtp-Source: ABdhPJw0EDXD2g6MUp3ag4xl2QcO+EC2a77rBd/hj6pxFRbbup6+sYCfeMb3J0ikgEdF4pjc9Exxhw==
X-Received: by 2002:a1c:f60a:: with SMTP id w10mr956018wmc.53.1637393694006;
        Fri, 19 Nov 2021 23:34:54 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id a141sm13776345wme.37.2021.11.19.23.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 23:34:53 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] arm64: dts: allwinner: a64: Add CEC clock to HDMI
Date: Sat, 20 Nov 2021 08:34:47 +0100
Message-Id: <20211120073448.32480-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211120073448.32480-1-jernej.skrabec@gmail.com>
References: <20211120073448.32480-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Experimentation determined that HDMI CEC controller inside DW HDMI block
depends on 32k clock from RTC. If this clock is tampered with, HDMI CEC
communication starts or stops working, depending on situation.

SoC user manual doesn't say anything about CEC, so this was overlooked.
Fix this by adding dependency to RTC 32k clock.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 5ba379078500..741bd19fa8ec 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -1220,8 +1220,8 @@ hdmi: hdmi@1ee0000 {
 			reg-io-width = <1>;
 			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_DDC>,
-				 <&ccu CLK_HDMI>;
-			clock-names = "iahb", "isfr", "tmds";
+				 <&ccu CLK_HDMI>, <&rtc 0>;
+			clock-names = "iahb", "isfr", "tmds", "cec";
 			resets = <&ccu RST_BUS_HDMI1>;
 			reset-names = "ctrl";
 			phys = <&hdmi_phy>;
-- 
2.34.0

