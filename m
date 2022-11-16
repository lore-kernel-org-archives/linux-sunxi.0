Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8347512282
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 19:31:34 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d9so26891660wrm.13
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 11:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=supRVz4T52oVqFelsFhkEjn9HuP+OJvPsiaQRkXaSXY=;
        b=RuwduGQoL6RNZdNsCkvAs1s01RvLdNpuhqMxQcM5zQYPC05mFOSpK7h66qWpQM3Lqi
         679YLRtq9sU/uy08ZbP1DDSQ7PPiTxEHCN4OlRc5mpMv/F5NYMOvF0jlUjGvuSKl+2sg
         QQ12EX6uhHBWQIS/D9Gs4IDpTIZqq+2RRKGt9Y/aMhezL1HszIRZr1Y5yfrv4KYH1v2i
         KM/OS9f7jcSZ8l2xeyM5FizpK6PyBLZgrqth5uagibIBp3Heju7m69Ln22nWAEJwbZdn
         cqXKOS6Q4HyQNvH78lT/aqGYdTrsW/+/y3rU5AJKQER/3322TcYoNtMYz7Rxi5/2n7nu
         ecbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=supRVz4T52oVqFelsFhkEjn9HuP+OJvPsiaQRkXaSXY=;
        b=SoY8tRmFtefTqp+p8MZjUwFPlXIrFYCIOUVHMfPVbDZd5jN/ZyP45zSo29Y3v5xH/N
         c/AUhohNzwDSG/9WwCXI+rtrxAfVv818PFcQpO9NqZNpOFcbhyvbQNhhzhsKpxBpSw9q
         lKmK8rVJVkxmNeKHeul0etcHjDG6y79eIDsEqKNfgC/qxKtKHXcLmyZr2IKP62GQcGei
         UHdTs6HwJcVArFEagtrl1eqY138pMVcKNISuLa3POY5qHjc9Hvk95pL3rV9un7vZEPsi
         QMOqw59tWnOuDsK1mxQEqv6VSg/938x7YmWW8qKN1+evJIPTBDtzhz34ChDvy6BKteY1
         vbMw==
X-Gm-Message-State: ANoB5pnc0SDUUkJNmWXQ91WoJdyg8Jf+mSzMtOjPtoA88xSTVeMzQMgo
	n/UQpJVk9PYOHfe6hCdWwcc=
X-Google-Smtp-Source: AA0mqf4LY6JFZkmH5+c+/H2WjbTvikrkg74sq1CpTEgiQpUYahnaPsbCsrWLj1aOUCvNV/AgTVS9aQ==
X-Received: by 2002:a5d:5741:0:b0:236:960f:161d with SMTP id q1-20020a5d5741000000b00236960f161dmr15517728wrw.376.1668627092709;
        Wed, 16 Nov 2022 11:31:32 -0800 (PST)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id q125-20020a1c4383000000b003c6cd82596esm3044646wma.43.2022.11.16.11.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 11:31:32 -0800 (PST)
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
Subject: [PATCH 1/2] media: dt-bindings: allwinner: video-engine: Fix number of IOMMU channels
Date: Wed, 16 Nov 2022 20:31:04 +0100
Message-Id: <20221116193105.363297-2-jernej.skrabec@gmail.com>
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

Cedrus (video engine) on Allwinner H6 actually uses two IOMMU channel,
not just one. However, Cedrus on SoCs like D1 only uses one channel.

Allow up to 2 IOMMU channels.

Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../bindings/media/allwinner,sun4i-a10-video-engine.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 541325f900a1..257bb372d166 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -55,7 +55,7 @@ properties:
     description: Phandle to the device SRAM
 
   iommus:
-    maxItems: 1
+    maxItems: 2
 
   memory-region:
     maxItems: 1
-- 
2.38.1

