Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7B22F24
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Apr 2023 22:31:40 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-957dbae98b4so46779566b.1
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Apr 2023 15:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682116299; x=1684708299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHsoXDxz1/UTx6EBnwD4GozBhAQVv+WOC5RetDWcnZ4=;
        b=uHsMB7x0Xp2Q+ayCfEMDyPvNll3SI8+ipJ52v+0W/l6PZk6dTdooXFXz7/uSwn+gb7
         TGmOk+N5FQpWWnnVTFtrERp3aAELYIt5pO3/N8z0/qInvjfEW9+LXKZO1zATX1NTBK8K
         /w0m3FMltIhO7NGnlMFqDxTCO+G0J5FG+tjnvkS/+PXn/+nZd03zVwOpxUSdcEnOS1Pg
         c5zi5Kn2WvByRHRNogglHMlDIaBv0XY0+G3T2ZNmSO870iiGBPw3+/4oclcjlGgoigYk
         YxYcwFKCBzKnt9ULlO4qV/C8KhFfA9/ZfmPejU/H6ih4OFMYLYp77zCn3nYTUb/eZabQ
         JYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682116299; x=1684708299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHsoXDxz1/UTx6EBnwD4GozBhAQVv+WOC5RetDWcnZ4=;
        b=QFEvczUzAF5f/m7GyAiqfEyNMy2fcweSi4INyLFaJrtqW2K48cNfTGZyEOtOrbZAfx
         qyBLprFiJHgT3iE9A4Z9j7sZmf/vsM/GnQLKEXitvGTXBX9OPveWcfPXRr0mBPXUzR9P
         M/etKjmkk/op1L/tb+U6+kzVIc8gULND86y7erbDNfi0uPceF56tHAs4YqF0ZEqJ4zF4
         q6fF1iX2OB24XkrqYHVkZM9vrkz2Owdle+V0DSWCHY++OITfCLbsRnkxrL3S48Zc/1Jv
         Fhwysemisvj8Yav5w/Fx6XjEIDFK9y3whj5y3LXAr5y6bBK6K02xUiRJdbGwEoJaQ1jM
         CGWA==
X-Gm-Message-State: AAQBX9c+phR+5F1biYUE+tFmhaeWDMLbSULomkM9ZbjG0lnRruJe0eCN
	8935oGMtZ8WgVGVsxRpyZr792Q==
X-Google-Smtp-Source: AKy350Y2WtdIrB8KUkVxhNUfP+cw41JryLuepwl1MmDWr8r7jE/LiFDauoeJJ2LjhOQ/r86bda7hjg==
X-Received: by 2002:a17:906:b147:b0:933:868:413a with SMTP id bt7-20020a170906b14700b009330868413amr3914177ejb.15.1682116299030;
        Fri, 21 Apr 2023 15:31:39 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id sd22-20020a1709076e1600b009572bd99281sm1077677ejc.224.2023.04.21.15.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 15:31:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: allwinner: a64: add missing cache properties
Date: Sat, 22 Apr 2023 00:31:37 +0200
Message-Id: <20230421223137.115015-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As all level 2 and level 3 caches are unified, add required
cache-unified property to fix warnings like:

  sun50i-a64-pine64-lts.dtb: l2-cache: 'cache-unified' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Please take the patch via sub-arch SoC tree.
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 62f45f71ec65..a9c7f82c2c66 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -93,6 +93,7 @@ cpu3: cpu@3 {
 		L2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;
+			cache-unified;
 		};
 	};
 
-- 
2.34.1

