Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714BC17E5
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Nov 2022 06:07:12 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so1019389wmg.2
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 22:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/4dSPCEiDUe3Xyt1vQbKBrfveGFoVaGx8ciHb9QLPU=;
        b=WUBVCwSUcsGVoF5A63XFfDYRW1n0W7vigFBveEkiddsyxkiK9JwbQ2C8nQfM6NuS8j
         1YiOGDJe/57NZX+qOTUggz6zwUvRm+U1wLbURpOIUesmnmvuK42IioAj0pWaJ8NqqT8L
         9+yLc1PiTJx3NP6rtLtzWC+Gnjx2593eesxm3O33ss8pcUZqy2mwMgNq7DRCJWgc1u30
         tbfRqwKb/anPwHPrrop0+4r6bcFvIgHRDb9ieqt45zUGDsyfgHbirdVGWZutcibNcqd9
         8aJ0T+3Cut4F3djKa7abbi2qEkD3OTGCRbO8L+xPzveL7/xciSYhx27Ccm4Ckn9sx9kU
         PswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/4dSPCEiDUe3Xyt1vQbKBrfveGFoVaGx8ciHb9QLPU=;
        b=htSGmus2hm9Wk9ZoJBmshZNTT3fKfNPQMQ+gmiFexgF/ODPEOSfzyW3xsHN0rIN0oF
         cppV9QkwZ9ouvXu5bhV3ww+gjdlT4KoA6bsWaR+SpCZMVU5wxKU9SpC5Yl+Z93zdQB9v
         +XKNvjQs/VtV8o3CWIiTH9Vc1i7DiQjRX/B4sNYHEuGmbcTh9mBehfprbKNrR5DG+30T
         toOkKvjneGpjdAyeZdacAA5cK6h98BjUN/HO0l8ZmFLuOo/6dOVOv7wKTK8q0ayRcw2O
         04pAbdy9/JD2rtAwNlNc565T2o6sYFKzruvWZVNWM6BLTGZUC0++ZEVcJFQzbrizagyz
         cJvg==
X-Gm-Message-State: ANoB5pntkawULhy2jBfg8utoKDj/eqTnWyui7vnSIdeU747nhEUyKl3q
	pwFMq5s/KWhjGCgAPWrhguM=
X-Google-Smtp-Source: AA0mqf6nbH1NYbfiNWEsx3ll18zbt1NmXbZvFY47Q26qtUlN3NrLlCKI8CekDyokCXbhnOmaguJOdg==
X-Received: by 2002:a05:600c:3c8a:b0:3cf:6fe0:b16a with SMTP id bg10-20020a05600c3c8a00b003cf6fe0b16amr4030910wmb.28.1668665230759;
        Wed, 16 Nov 2022 22:07:10 -0800 (PST)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id r11-20020a5d694b000000b0023691d62cffsm16542568wrw.70.2022.11.16.22.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 22:07:10 -0800 (PST)
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
Subject: [PATCH v2 1/2] media: dt-bindings: allwinner: video-engine: Fix number of IOMMU channels
Date: Thu, 17 Nov 2022 07:07:03 +0100
Message-Id: <20221117060704.367945-2-jernej.skrabec@gmail.com>
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

Cedrus (video engine) on Allwinner H6 actually uses two IOMMU channel,
not just one. However, Cedrus on SoCs like D1 only uses one channel.

Allow up to 2 IOMMU channels.

Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../bindings/media/allwinner,sun4i-a10-video-engine.yaml       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 541325f900a1..6446004d59d9 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -55,7 +55,8 @@ properties:
     description: Phandle to the device SRAM
 
   iommus:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   memory-region:
     maxItems: 1
-- 
2.38.1

