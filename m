Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546F11D545
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 18:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710700901; cv=none; b=Ka9cNt8UXgp6Mk3JOSs7yPAZAD/fmiNmUGZK2G0jK3f+IltZxs3SBEXLkjLvylr0MUKR7uAkRqhTm4MmkG7nUASVOWbDWV1sx/4T5ey5zI37eJlb6/TwncaBBsieIT6VDTReZQcdmfO5dvUQdYXRFp1iGx9Gdgg4C6YdM25o//Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710700901; c=relaxed/simple;
	bh=Wu9Nd161FfGYTW3cdgUBizaowguROAhMQjD+83XddZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DHu94UwcY/5e9pS6JUU/0BdNixZQmu4lQlepf5I+DMJdmciUp8FWryYMcNhjHMCN/pbNTAdK+36HMbz2QjuDBe2iP/gPL/XACsgeZtf80BqhFVslQuFRg/Sb6fCAO37x0YDOsZ98oTq/NKYNH74EfFRqy4Sj765EvzYmrgVcSV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BE0qinSy; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BE0qinSy"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-568a53d2ce0so4054999a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 11:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710700898; x=1711305698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e14jYuFbqzpNdPgZtffp0K2rsnlvD+gHqPk0zI2q0lU=;
        b=BE0qinSysXeosXEkVWvflCCun+jALucakfqKld4Nv4KrHvRJFp/JRG5CRyYPdKvhBn
         tiqXNTsi0UX8ReTcb1yII7vA6Q9gt/9Bui9iiICVxOGyi9hBQL/ixrAo10nDmUhOzYRy
         eYO5WRIXNZQST5qQ6OqCXJscg4YdwWNZyeYHQQ+i7ydwa2QSWLLX9Z+dz7J0UR6PYdVJ
         kpCWNmeejcCGDib7bfo/5r919zlEfE9bJko0g9Bb1rRnfHR3BbfAXxdCvyvKDPJgkx0j
         0XEsEw+nU+3I42ciPQ57iL2T/BJyPav4wvNhToDMGeFFhafW+5hMhvgXaeljKWtqO32w
         +7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710700898; x=1711305698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e14jYuFbqzpNdPgZtffp0K2rsnlvD+gHqPk0zI2q0lU=;
        b=PmP1so/VkT3CJiRU0+u/b58e95nM+o3+yQgeWA8c0KHs5HSLiGb8bD5xksxUhBQtv0
         HQ1JkXON66oxEdlBBYDb6OEZDP2npybhkjrZFQYAdb+tUu2eKP+rx/OLWey5+hpkua7n
         Kmm4+ZOeEao251gmTAd0X0gENbfJlr55XrcAqm5KmWzWADHovOvaOz834gj6U+ZhDVO4
         rVekdyHtp/DGJIsmu5lYk4hE3ya6LbERjqnMKnPTS/+qlit7dxW8t9NRYnWpVJE+35k4
         26+wbqbiqRVk3cri5X3kbUboK8gbV8z+A6FYUXDLvOcK5nRjFqf7IW4RUrVsY2EB6t/I
         iyKg==
X-Forwarded-Encrypted: i=1; AJvYcCXEAF4y+HvBryway1g6skPA5ZfrTCyI4rY/QCOEbPGpOqjws97xHhCf9q41A2WSxAtfCsnNxYcPtW1C420sm0D0fu32D25wAd21BO8=
X-Gm-Message-State: AOJu0Ywu6dyCytt0DYLozepLjwu+lWqS+oCbTRk7P0i5YByMpBk/yCPa
	RDWjIZV+lhGdyqDxgRnPB9KRfecpR1vfRw9o2qHsBZIDDNQQclWn9m9zm2u4L33LFa7UQ6/6ST+
	R
X-Google-Smtp-Source: AGHT+IE+WEYLkK2Xr6I7GOUWRruUBNYvrXmePST78xe3ptjzIPZvGVaFGeYhPe/DfSzq69N+wowqiQ==
X-Received: by 2002:a05:6402:e9f:b0:566:44ca:9f5c with SMTP id h31-20020a0564020e9f00b0056644ca9f5cmr7622436eda.8.1710700897803;
        Sun, 17 Mar 2024 11:41:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id p5-20020aa7d305000000b0056a2b87787dsm242877edq.37.2024.03.17.11.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 11:41:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] arm64: dts: allwinner: Orange Pi: delete node by phandle
Date: Sun, 17 Mar 2024 19:41:29 +0100
Message-Id: <20240317184130.157695-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240317184130.157695-1-krzysztof.kozlowski@linaro.org>
References: <20240317184130.157695-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete node via phandle, not via full node path, to avoid easy mistakes
- if original node name changes, such deletion would be ineffective and
not reported by the dtc as error.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-r1.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-r1.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-r1.dts
index 3356f4210d45..067a2ecbc0a4 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-r1.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-r1.dts
@@ -43,11 +43,12 @@
 /* Orange Pi R1 is based on Orange Pi Zero design */
 #include "sun8i-h2-plus-orangepi-zero.dts"
 
+/delete-node/ &reg_vcc_wifi;
+
 / {
 	model = "Xunlong Orange Pi R1";
 	compatible = "xunlong,orangepi-r1", "allwinner,sun8i-h2-plus";
 
-	/delete-node/ reg_vcc_wifi;
 
 	/*
 	 * Ths pin of this regulator is the same with the Wi-Fi extra
-- 
2.34.1

