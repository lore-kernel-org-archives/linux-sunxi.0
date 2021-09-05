Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5998F72
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Sep 2021 19:26:35 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id g22so6309990edy.12
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Sep 2021 12:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qlez6w9+Xry8jtHHgqQjUNA5ndA2CrnxtsKlEHI62vo=;
        b=Kk/FIIAPqgwUFLerUyXZRmwCq/E48RR3rZJJbFMatB2+kiS55ufkQAFCmMyqCpJkN+
         pWbW/nF/nEG+jiOT71kb9y2VmCtYYrWYumDW2+MBaQtdXCX5wypLEWAp/tJHv+AFAYT/
         p4g2uJefZAs+3xUNfrNNByfmbZKDhLsS+Ugduj4XkEzM74NY+WIyNqLvgaJ9t26TlYsH
         nGtJO3ZuXY3c9AA7KNb+FFRJlFFSIiOXQbHqm4KHSablhtphox4wIMzvBoA1TcLHNazP
         1strZGPRX9ng9BBqe3Y7k15QMJBy2FMG9CTgc0YvU1KVWCMfJaRbhZlnZrzcW2qlxBnM
         ZiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qlez6w9+Xry8jtHHgqQjUNA5ndA2CrnxtsKlEHI62vo=;
        b=fc0tXS76pctOeZtyMNmCARzH6Zffjuq/7t2PnZsN+zzhnorGngwHF9qeBst2aLJXj+
         A8+xlC+6ED/NKU4mrGBhi8T/LnrGIPisSV9fqS6TjqoxpfH3XfSdDeLdacvz++ro0ja2
         d+uSj9v33sqfRFqDP8k1m+Ds/ohN+PWvgK0R0m9qmvw3GK0tg9zFptQk52toP+lZjGJi
         5w2K23xdt4QqdzlSY8ZzjeVJfDb2ozFVYrUKUI+YooslmPfjbt5FUleUWx7Wg2jNFIc8
         73qW4xmZmtAq0QxppDzKVrC1jqLDfsBM3cDReGDEClvYlZBhenbv62hUmmqzAkX9DDfC
         Ujxw==
X-Gm-Message-State: AOAM5331sZsnjI2AYAwMpxqyCYnC+PEVKswtYrUiMHy0WRDaBFnpbMvw
	+wAMaFm0I7vIIfi1syXGczE=
X-Google-Smtp-Source: ABdhPJwKkZh7U2OnpEzLD2FkeUDsXAtatl/gJKYiiF2lhr2i3q4HMdaUGKVSitTapNvRGbtX/oZvRA==
X-Received: by 2002:aa7:d99a:: with SMTP id u26mr10016178eds.297.1630869993740;
        Sun, 05 Sep 2021 12:26:33 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id n13sm3238992edq.91.2021.09.05.12.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 12:26:33 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	codekipper@gmail.com,
	peron.clem@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] arm: dts: sunxi: h3/h5: Fix I2S2 node
Date: Sun,  5 Sep 2021 21:26:28 +0200
Message-Id: <20210905192628.206061-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2S2 controller has RX DMA channel according to documentation.

Add it.

Fixes: cd7c897821a0 ("arm: dts: sunxi: h3/h5: Add I2S2 node")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index c7428df9469e..bd26f2059220 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -670,9 +670,9 @@ i2s2: i2s@1c22800 {
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2S2>, <&ccu CLK_I2S2>;
 			clock-names = "apb", "mod";
-			dmas = <&dma 27>;
+			dmas = <&dma 27>, <&dma 27>;
 			resets = <&ccu RST_BUS_I2S2>;
-			dma-names = "tx";
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.33.0

