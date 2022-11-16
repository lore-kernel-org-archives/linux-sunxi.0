Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EA3D53E
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 19:31:35 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id k8so31642198wrh.1
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 11:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3cqBPNXFCPM9SPqErLl5EqPv8TqD4kJvo+8/hC/Kvc=;
        b=Ynri9fVx0vI5Lf+znhqrG0iR+yweHI2N2z+TchOnPi+rYb8P2px3K77Xwh0/l1DADz
         KnPlh+H+WqbGCSbGTQOaAM0hHFm3NN7CYcdx4NBKIKTZHT7dgzf0/CiT017fApLyqagX
         gSEc39/+sS4RNlMwyuT2FYFgDEeCdD34P5Ff7zITXMaWTAzRIScMQVPMMCdYyBmDRhfK
         ELlX74FnK45uhYSQqVkku4MPhiKvQLCkOmomsik0I4Wg1z9jZgRlg7w1QzQY03geTJUU
         P+YXXL88pUeGLQXOgQ//mrclw0YqMHJ95ytcAnxGYq8l9Js7K7rTQgof4vOwy2KOdUkk
         XeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3cqBPNXFCPM9SPqErLl5EqPv8TqD4kJvo+8/hC/Kvc=;
        b=A1Pzr9ccQ+sMa30NZbigwHNNGlNE0sAeEpPslCzzGih9BjEgPZfgA2F2//5g17GsNV
         jaaqE/ANrAwrkHZ87rT3j2eLP5Vigupb57r/s8LIIwvgUSMjYFlnl9reI2IvQHtXTUgJ
         QoC+xEvHvXthAq5RwyiauP+ZYjz5q+UHNS3hlpYw9BwXHlWfD4YYLeb0owsaUt3NuTM3
         p8zoAxAHjbmBa3KfHM9xz+rFVTAc8VMiHaArh+fmrrTsQ5TbZ21/4ar01sSPTsYChiY3
         qwkvR3Vuv/yM7FUXujcCmJjW8CGA8/c2joOfpGHYMHby2l4g9tkVNx/Bgc2wuDLF4Eg7
         PKrA==
X-Gm-Message-State: ANoB5pk68UszkhYDZx91uDDDVuS55j5wAbe7yCtuaL0UsfVi4fDDPxep
	tnb5SEH0GAxTRNbInJeWDcT9nQmKjSP5FA==
X-Google-Smtp-Source: AA0mqf63+xcPwKEqO/zJar4BIbUp0DRdWtaKQPwkXJ8MVR2/sFn3Mdf7EVbj3yozb2stn+TxPMySpA==
X-Received: by 2002:a5d:63c6:0:b0:235:e6a9:b492 with SMTP id c6-20020a5d63c6000000b00235e6a9b492mr15033159wrw.212.1668627093629;
        Wed, 16 Nov 2022 11:31:33 -0800 (PST)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id q125-20020a1c4383000000b003c6cd82596esm3044646wma.43.2022.11.16.11.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 11:31:33 -0800 (PST)
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
Subject: [PATCH 2/2] arm64: dts: allwinner: h6: Fix Cedrus IOMMU channels
Date: Wed, 16 Nov 2022 20:31:05 +0100
Message-Id: <20221116193105.363297-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116193105.363297-1-jernej.skrabec@gmail.com>
References: <20221116193105.363297-1-jernej.skrabec@gmail.com>
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

