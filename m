Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EF037AA7D
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Oct 2026 02:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821490; cv=none; b=nAtrsTjMILAEQikR/gQ06Xg/X+fWlfh0tKvoY7S6PjCdyhgcVRQI94+SUdPUbdN3I/Ovmy94n85x2IJOitpWGWPwU72q6W89lPASDHcmJp3V7kkGsG9bhHnQVWQoeIfPoEisPMHrmjx+kal4jt6eitIuawbRatxqRv+7NlpMXZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821490; c=relaxed/simple;
	bh=OeSqZmhX2GeSBAZfyEhqUQJiD0Vs3BGdCEj0RuH2KlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7BQPBQlh2OHOLIN0SulQUTgOTvBCefDdQd09txNpGr0sSaCQklrQ2XWq6ekF4xnfzP0rlA6XamSAdxw+/JgJ8YwwSt2KTAobrL0IbeMENQJ5I0f+RBrTeNrj7mkbrLSkr+ODRskJiSZK8piasYjxvrwqh0zhYrQTvQ/pngckNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQtafpM6; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQtafpM6"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so2155396a91.1
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 19:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821488; x=1791426288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7mGoZW6rOuJjzujzCIVEJDchDchUE3FU7yafH4ekeM=;
        b=ZQtafpM6j12SJ1c/ZxRhScio38SWtRTauhfxGc5AqXt8wj9/3ks56aC+i4DcK7bL7p
         +q/A1UU5B+IsuD5aOkd9fPiw1k3tFMJTOU33u/PdQWZ1L6lrH4ZKlf5G1OU31Jiu5ZI2
         z0dW8d6IGqAAnZiXtQRe+khUH39rHjK85OIrKgJNh6YP/AqFgxTDVn8oDdILrg3Fc3G2
         8qFwftnZWVJgZiIBFEl6xSSNrEL22OlZ8stSLb7LMXvUgq9QWb00hH1Irz8ZzhOAHNdB
         lSfT5p94J5ynSylfC1A9fwCGKIBY0VWm/s3ZEiZtM7AmaUY4grA9couoz1HfY599dQdS
         PC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821488; x=1791426288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V7mGoZW6rOuJjzujzCIVEJDchDchUE3FU7yafH4ekeM=;
        b=inIE5w93Y3610ihe8WP+CZxnTX6XbRipXVflamlM9IJY+LecSHvttLNbPl2dVTfJap
         gbjczzZmT8Ud34GgW3uNeojmL2W/RV2ND2g5UWnrkSsTF6NeRSaxfZro21htwn4bw3Sp
         pKDjgSDrushuamZMx5NuNqM3g2gU5QtijgkjI6wnXXCXf8xcTTLSNNhN8DCh9hVQWj+H
         QyO94kKrfRGoxG36a7XJkDn2gQZMm8SJjTsiLmj5e+pfRFIvnzNxs0OoGS8nZGwsXpw5
         yncIQVaoVZwSBKj9YDgojjDuIplJPaXpYfLxCS9dgsBsYiEWw3aGSabj6bzPWyPS77lJ
         12pw==
X-Forwarded-Encrypted: i=1; AKwUvBx3gMCPkcI/HLFnAwGyHGxXLbFDPiecfpIZ49bCuXC/d0tg2IvIuXsBrwESqS2MXR2y2sg7ynbauaOu9A==@lists.linux.dev
X-Gm-Message-State: AFq9FYI3p+AM5jf1Hm0AqdxQ7T6/j+wAejYdkw81aLdzs/yY47EkQgE3
	q4M3tGgtpcxYFdWtoxUyirjL9LUVFoQXpeUXNh64s27CguGf0AxlJjC3
X-Gm-Gg: AYBFou0bMCAFjD8WNamoSC1dzQB0A14bsXHJx/+RpnKZg1OlV8KqgWm8S0CJgpClKx0
	6nRCvU/+J8qNkRn8R/bi1YMpL45ioNCMn47+8/K5DUF6NT1oEAHOJzT9ycjl721fo1crWQkzOvX
	HxmxQ94M7AdLW3uN33E1j2wmkPLn2l7gMFOKnmL1tZsvysGIzBYsrehgJLOhcw2UuB2Lk4h6vt4
	N0/0Ika6MG3G2b/ul3tVUUKvuIFA1OI2BaUzp6AJsOl8BTgkk0Ejx6UH+yY/PPHcIxrHgYfLOaq
	+ZvP2xDnCFDoUQhO+LXZb9UReHV7EgI3PEXuN87sGomZsZbuxC8wUrcx0D/k8LE34hp57dNJcak
	ugvtqZsYMKccNUXsyLTGL0b1Apne76IuOWt8rxgEmvcBlhczzI1PvhbFGyGP8f8COuPuhzSYpbC
	uuSDijXCl7GaPFy5j8JIaMB5vqSLIgkOIEFJ4JbdroZRzIPu3hchLz2ndOEpDZVLXPgtzj1q9e
X-Received: by 2002:a17:90b:3c4c:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3a4f2afacd2mr752019a91.2.1790821488332;
        Wed, 30 Sep 2026 19:24:48 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:47 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 3/4] arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
Date: Thu,  1 Oct 2026 10:24:14 +0800
Message-ID: <20261001022415.913959-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001022415.913959-1-iuncuim@gmail.com>
References: <20261001022415.913959-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the pin groups for the I2C0 (PH0/PH1) and I2C1 (PH2/PH3) controllers
that used on some A523 boards.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ff..0ec5d19f7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -147,6 +147,24 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			i2c0_pins: i2c0-pins {
+				pins = "PH0", "PH1";
+				function = "i2c0";
+				allwinner,pinmux = <2>;
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+
+			/omit-if-no-ref/
+			i2c1_pins: i2c1-pins {
+				pins = "PH2", "PH3";
+				function = "i2c1";
+				allwinner,pinmux = <2>;
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+
 			/omit-if-no-ref/
 			i2s2_pi_pins: i2s2-pi-pins {
 				pins = "PI2", "PI3", "PI4", "PI5";
-- 
2.55.0

