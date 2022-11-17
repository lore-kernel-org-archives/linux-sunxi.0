Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7939C17E0
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Nov 2022 06:07:13 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so1007141wmi.3
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 22:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYLz02viNCcZeuKJqkLZJicl/v6PrsUfH2KEY8TpF5c=;
        b=XAILsUAJagM8MUl29mV+63W7fYXbvVj1O6ywhS5MTgcLI3+dE+YuG2BgElNzv6qGWd
         MIZhedNEAN9eTFz/qYbXZx2SjfD70pLE01qrHOw3JGyBdYj6UsAcNBEtF2N5XvcmhAJ0
         WtWGTmDzYXmFJ7LNism80tQWa8NLSn2Qjmys/RmCnCbJ4moyDyZ4kNBacLPBepBvYcTa
         WP7rHuVe+fy4cFCCxUGZUGCtFHBL0EznaMPh+gxSyKLHaCq9rhNckWaf+qPIWNQ1G9rF
         pbxv3rI+yj4bcGOzQW/oH0Ug5kZ+MGSOaMSCMf7Rv198BUocjZaEy+Gb8hRpUYKFcrvn
         Rnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYLz02viNCcZeuKJqkLZJicl/v6PrsUfH2KEY8TpF5c=;
        b=8Do62yxyh5XzlsG8dkSnM1mkjLtg6SaPVQ9AFy8Z8UkIjzrnVBzMmhk8ceZLCE6Nsm
         6PHhdPX12ZYozFxgyYkghrvRGkNRP6Z9ehVJSobzRGPnPCdio4Bw4nikKRR7WmEokh0S
         1d3/Zvz0akbjRe24MJy8VOqrzOzNot139x73jTy+tI+z75UmB/+BRdAC5ULeuH84RBbg
         I6AwmUbWY5hlhUoN7sOyFQEC1Bkv4bZzamS6qgDnp8BO9Gu18totiF4Ii/YnvzJzLOoa
         dla0T7IDmvSWcifb7xwD0z6oANby5KH1Fy0ZpiyaO7nuHElRJFXeORD8GY5IIk6z8Ss+
         Oxrw==
X-Gm-Message-State: ANoB5pku3jMit6OXA8s+02ZliTgmgUVdjxlO5/eOLAw6w+v+ZOGX3CiQ
	tEYU3Rb38cszwUOGkACUiRs=
X-Google-Smtp-Source: AA0mqf7PN/VpawVglIwIn6auY2jtpRLyUWC/cyLwr5nNPze1Twrr1VtCbQ+ltxYbw0sQ6aJURe2Rag==
X-Received: by 2002:a05:600c:3b18:b0:3cf:6ab3:49ce with SMTP id m24-20020a05600c3b1800b003cf6ab349cemr538308wms.137.1668665231715;
        Wed, 16 Nov 2022 22:07:11 -0800 (PST)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id r11-20020a5d694b000000b0023691d62cffsm16542568wrw.70.2022.11.16.22.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 22:07:11 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mchehab@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	wens@csie.org,
	samuel@sholland.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: allwinner: h6: Fix Cedrus IOMMU channels
Date: Thu, 17 Nov 2022 07:07:04 +0100
Message-Id: <20221117060704.367945-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117060704.367945-1-jernej.skrabec@gmail.com>
References: <20221117060704.367945-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cedrus H6 actually uses two IOMMU channels. During development page
faults from both were observed. Documentation also lists both of them
to be connected to Cedrus, but it doesn't make clear which is used for
what.

Add second IOMMU channel.

Reviewed-by: Samuel Holland <samuel@sholland.org>
Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 53f6660656ac..7bff054a9bdf 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -172,7 +172,7 @@ video-codec@1c0e000 {
 			resets = <&ccu RST_BUS_VE>;
 			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 			allwinner,sram = <&ve_sram 1>;
-			iommus = <&iommu 3>;
+			iommus = <&iommu 1>, <&iommu 3>;
 		};
 
 		gpu: gpu@1800000 {
-- 
2.38.1

