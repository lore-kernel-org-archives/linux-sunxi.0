Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8578815C83
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 21:02:23 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id d26so33437128eje.10
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 13:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kQ9K8tYlbXLaQPRJ2lGK3SnOUicxnm8zJwkw6C7xPA=;
        b=T4l4qgQUH3GTNKB0fGSJMBZxv9l9NemWSa11NwVIsMKKcDAfAbxu3mJUmAxy1gUSda
         1mp5UEvokCOi0lBjTyYWcWZhl/u5LX06VpwEzGtZHtY7oyLnemUJKm5NRwdkAMAoL71k
         3tBjrAsydBFubbI5ExzbZWEAIO4RvUWdoMtxwT1HQk5/n91r98p5oclFJpNwv2pKvhse
         m4eK0r7wChA0v17elVgndJuhIWJI8jD1qrvqQul8iXl7qgnSF9itPqEhXvbLUtDSlplz
         LiqEFMYrsmwqKsi5z+jlBUFLNTCqnr8disjSaOORNRRU/vySgltEvzjm0kelSmgo2xOe
         SQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kQ9K8tYlbXLaQPRJ2lGK3SnOUicxnm8zJwkw6C7xPA=;
        b=pfmgcIfUsmaqyevnEdP89BdTrc1WVUIiMUSnDl5uWy6Ra4LwK0FIvZB/JrHHZ8NdGH
         shYEzv0H18y39Xs37NgZwPgyPuN9ta7hqVDHoP6bbfvj15Sc4W8EHPHG8rtAvWc5Z1Je
         gfxFZ9+mDXN1texCarfOM7KXnxkvFBMLxkBkSunYEaLv/cBrywiQ9iUxO7b7Rz5+uGiP
         oKa8WaCYS9FfFQxV5dqKnxSxk+qcSxbd2xjOmViK+4CyS2cz3CdDc8dcbAflqakwOz/U
         ltBDnjLW8RlizxzPfOw01/drzmPE9WLGwOwOLDMoP9BXM8sYOMiUM2+uRs8GusFa0Taj
         rlyA==
X-Gm-Message-State: ACrzQf2zFg0x1+o67EYunozgXymlCL41EeG2YhRM0hI4JXXeSi9jUQM/
	BPLXY1Q5FguAhynuy96sTD4=
X-Google-Smtp-Source: AMsMyM7LkvQGlGdAvT+O+T4AMciwWycd+BOpn2+3FhLN1jujd/qM/c4Ppj12xvqbMUxh9pW5/zkF1A==
X-Received: by 2002:a17:906:ae48:b0:7ae:1723:e8c3 with SMTP id lf8-20020a170906ae4800b007ae1723e8c3mr22584712ejb.603.1667854941832;
        Mon, 07 Nov 2022 13:02:21 -0800 (PST)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id k18-20020a05640212d200b0044ef2ac2650sm4638472edx.90.2022.11.07.13.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 13:02:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: h6: Add deinterlace node
Date: Mon,  7 Nov 2022 22:02:08 +0100
Message-Id: <20221107210208.284261-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107210208.284261-1-jernej.skrabec@gmail.com>
References: <20221107210208.284261-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

H6 has deinterlace core. Add a node for it.

Reviewed-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 0aa6dfafc197..badc6afd6941 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -154,6 +154,18 @@ mixer0_out_tcon_top_mixer0: endpoint {
 			};
 		};
 
+		deinterlace@1420000 {
+			compatible = "allwinner,sun50i-h6-deinterlace";
+			reg = <0x01420000 0x2000>;
+			clocks = <&ccu CLK_BUS_DEINTERLACE>,
+				 <&ccu CLK_DEINTERLACE>,
+				 <&ccu CLK_MBUS_DEINTERLACE>;
+			clock-names = "bus", "mod", "ram";
+			resets = <&ccu RST_BUS_DEINTERLACE>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&iommu 2>;
+		};
+
 		video-codec-g2@1c00000 {
 			compatible = "allwinner,sun50i-h6-vpu-g2";
 			reg = <0x01c00000 0x1000>;
-- 
2.38.1

