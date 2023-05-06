Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452B61C26
	for <linux-sunxi@lists.linux.dev>; Sat,  6 May 2023 07:32:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f4000ec6ecso26353225e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 06 May 2023 00:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683358362; x=1685950362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+gJSA9KlwYKmHRtBzH4uVO77NzvF1saoblSPNiiNsM=;
        b=qA6gUHbwstdpIjn8F6SxFuw2gF8TnBRl6Utbnn5nKnIN1dc6yiW4Kggxs98iH2B2TI
         LIgMeQP0wpeR8uxOcHWEjOqO77jW8dOatD34+yk+VMpZcpGU/1coDkwpM1qXi5NcoaPw
         VfLOVfsZUEF2u+BG3NieHGrpjmKzmDwjn7mGfjfV8IVOChpF1/rxMRj4Gm3vY908feCA
         rl3hcqWY++Wx1lJjkJXwE+yzZMH/9xGkNTcbxMjLZUwflRdT/E70DUE1HsaQ2vO3NuFn
         i3LoscS9nH6gBh0ONq9B5djETjhbT62hU/7C53l3PWjKXHVH3ELC4cu4Ibnav2HpyVa6
         wN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683358362; x=1685950362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+gJSA9KlwYKmHRtBzH4uVO77NzvF1saoblSPNiiNsM=;
        b=AHEp8/oZj4oKwbtgZ+rFTqKu115I8wQitdTjwfs/TwGHtscZ8ZtvHv6J+TdlvpDntZ
         +TzDRRVKp/HZoXowJiy19/ZeHyG61SbSF9PUjKQGAbtrCBTorH8oB6EIDybGOkT10f8u
         TbIhJbLcwX0hRRM1CtyWIoNaoP0W5T/CyRwzoJ+C+rkFg7vh7qokQjknwGDHL4uQgHRs
         PwgU2p728vBqdGiLFnX44qq8c9RebIrpXIH6Z/YEXGOV5+k64HZt6GK/Cr7nc5bCVXRT
         1eYrdRiqMjom7ka4E611IMAf2/nGMcz3WO1i3F3X1KhIQoQnTMU67X7D+VKo7n8+wBuX
         mh1g==
X-Gm-Message-State: AC+VfDwgoNHWjbwPWPN2VjhJpuHx5EpS3ihBdhf/uCJBwYNI7dflrSmV
	Zb+oVOP0qyKLxa1kcexO7S4=
X-Google-Smtp-Source: ACHHUZ6VgW5RfMKlfXefD5nobAzpG2CP/3myjrgVEXnND0iEFu+mWT1BCJgrUUE+j5IM/f/vxmW0fg==
X-Received: by 2002:a7b:c8c3:0:b0:3f1:8aaa:c212 with SMTP id f3-20020a7bc8c3000000b003f18aaac212mr2828550wml.33.1683358362207;
        Sat, 06 May 2023 00:32:42 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id q14-20020a7bce8e000000b003f182a10106sm10071944wmj.8.2023.05.06.00.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 00:32:41 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 5/6] dt-bindings: spi: sun6i: add DT bindings for Allwinner D1/R528/T113s SPI
Date: Sat,  6 May 2023 10:30:13 +0300
Message-Id: <20230506073018.1411583-6-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506073018.1411583-1-bigunclemax@gmail.com>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner D1/R528/T113s SPI has the same as R329 controllers

Add compatible string for this controller

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index 2c1b8da35339..164bd6af9299 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -30,6 +30,10 @@ properties:
               - allwinner,sun50i-h616-spi
               - allwinner,suniv-f1c100s-spi
           - const: allwinner,sun8i-h3-spi
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-spi
+          - const: allwinner,sun50i-r329-spi
 
   reg:
     maxItems: 1
-- 
2.39.2

