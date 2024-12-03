Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F4C205E28
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Dec 2024 20:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733258331; cv=none; b=OAAFUXDk1KDkre+iNPW2gUn8814FY1nI8HW+fqAU/bi3k7NCJeMdHw1f27aHaUEc5VEx7PVtzcWNyVKpQvowlKE25Tt6ixT2D5UvY6/zFMDE+DrxvI7x3ImSGyaOlZoozJ2yYlKmZB4FPIubNh2h52ueCsuGi4fjhgtU7qNsM4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733258331; c=relaxed/simple;
	bh=Q02EZGTan8yKgqkTOT2L07J0GBNRMfk/qcvIL6ZIAdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YEqO+BQ0rlllHQr6Zn+xJI74Vc/bE2Xa60p/s7/7Xs5amNN5AGs5T2g8k6HK4eIAKACISmSvTzqkpGTCLoqzCIfNF5pk6Ox4NE+AATL0jN6JnWpxAAxoaTYmixm4mAm7jyjzdHn5xHaKR4K31uRe9DzcTRgeVXCLTpg+kt9IJlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPelWvA+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPelWvA+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a1639637so55723185e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Dec 2024 12:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733258328; x=1733863128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKcUXU+2AOUg6QNTCMofP8uzOqzKgrO59wIKpeJpBe8=;
        b=PPelWvA+96shza0ymfVfwDAX44keAWuFGCvixRU4kYqclZBHWmvcuNokO3tDYkmyMM
         NAxTpb8+Qk3qUfEWNJkL7G7RAcEKoAnYBCn9jZXgeEEadMQnQjWrem71Zt4qP15TtV8C
         +L4OKFvxEBamakXFyCxOf0NE56SlTrBryEeReUWKpDsd1Fu0uYBW/+libRvKAYb2i019
         fJIBb3b+F3obxwcllfp4bI4z+WMujrTKGXPGSkpryTRxHDEqFEiw3igTL0xHKe4ZtsYz
         rI76hxxIUvkkS5xdUdrgyaezWqi1RVjfgC1Us6Mhhmqucf6GWoPY+T1TA8i6x7N4ZEbu
         mZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733258328; x=1733863128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKcUXU+2AOUg6QNTCMofP8uzOqzKgrO59wIKpeJpBe8=;
        b=DfBLISt7rAzOe3h+f+u3bC3ZRLVo7lyXexy6R4X0XeXg/klaUHRb7sv7xIjMN8EwJh
         jT8BngucS3pAJ/lW7/EgJlEhARAbHV4Zbgmp1Y91an3c6DZh46I8qS9gtNOG1iIWx/Oq
         EJ1LodOqLwyYEPVbyjMKaDNdLfN8hMv1DlAh0pq6Gsi1OdRUAumkbc+CJQK9I8jf0Xop
         qlZkmLYtQW2ZfUm9GhAGWWjqBS8WoOe17sI9vVltnAdpeyudFJ42WUHOCZnJN/qjfmIz
         Q9E74BdPIHglet8yHbL0wd/Jc1YVEF+cGa43OOxT2POBqZZD5wlK0zFS7xSuen9uIIeU
         wB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQdj4XflkJ2iMOZyrxe7UqI8cS6oKC1DJnngFuLtjb8bfVBHaIPyk7w2YsVDxg2D/ZE/XkZzS2M4Kn5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyW6xNB97UJCHUeMHFrqHl6MKsJGJnnjU/XL1RXJuVQKan4KOJA
	6pYwJzNJo4x1zX+ZwvAIfFWi7YT5bc7qLT0BLN8LXhZwicjzFCr2
X-Gm-Gg: ASbGnctB62jDSIRowdjKM3w9EnaGYWUZYOcldo81baAqlOtjfSjo64bgLWpDmoREygq
	jYmOAM7MAvHtdAWZZsiUVTroBB4+n9Ny/gWhmRPLE7De8+uN19RHBN1FOliSDhiN+UzDhyZ8yMq
	qa9R9fjb+vb4742J8lChVBNBWqrBzkJ1YZye3tV2GM5NFdatF24PKeR8SAI+QjI7v39Z43AxHZw
	w7/nLW7LeS+S+hT+BnzdaUzibIuFGcrCnjro4qMgN+NNss500ExMguyoyGWSOPjtiF9m84bBpHw
	J2Ku+O8AECEeh4xqaUHcsRcZWMm+Sct9yRCjdJs=
X-Google-Smtp-Source: AGHT+IH9uBgSdnHGS6bnhvmeoiLM3AKdhhwAPsU89GFG9+bxT2CRResLtnMTRB1w5ZTJPgDgULimXA==
X-Received: by 2002:a05:600c:19cc:b0:434:9f0d:3823 with SMTP id 5b1f17b1804b1-434d09b65cdmr36523055e9.9.1733258328079;
        Tue, 03 Dec 2024 12:38:48 -0800 (PST)
Received: from localhost.localdomain (229.140-242-81.adsl-dyn.isp.belgacom.be. [81.242.140.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa763c50sm231266915e9.12.2024.12.03.12.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 12:38:47 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: h616: rg35xx add missing regulator-ramp-delay
Date: Tue,  3 Dec 2024 21:38:23 +0100
Message-ID: <20241203203824.23306-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AXP datasheet says that ramp delay is 15.625 us/step,
which is 10mV in our case.

add missing regulator-ramp-delay to dcdc regulators accordingly

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 80ccab7b5..b6e76a804 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -238,6 +238,7 @@ reg_dcdc1: dcdc1 {
 				regulator-always-on;
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1160000>;
+				regulator-ramp-delay = <640>;
 				regulator-name = "vdd-cpu";
 			};
 
@@ -245,6 +246,7 @@ reg_dcdc2: dcdc2 {
 				regulator-always-on;
 				regulator-min-microvolt = <940000>;
 				regulator-max-microvolt = <940000>;
+				regulator-ramp-delay = <640>;
 				regulator-name = "vdd-gpu-sys";
 			};
 
@@ -252,6 +254,7 @@ reg_dcdc3: dcdc3 {
 				regulator-always-on;
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
+				regulator-ramp-delay = <640>;
 				regulator-name = "vdd-dram";
 			};
 
-- 
2.47.1

