Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C4A1BF3F
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 08:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713083846; cv=none; b=HT0GY1qtdmrgIdH/7DiVFG4FtsfW6Ch12mJigrbLRGDSvXlyh93Tupz8T+ix2Pw3HKAEizhGwFKYLYTtfR/YheC2M59RRt59N+jWiPtv3blrkiGJxz43XHmElvYmoFTGUlnG71Kwf3zOwXXk6SYvahs2jwaPJqODljHIC6QGnlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713083846; c=relaxed/simple;
	bh=dUEPoTSwcP6GLQ1rIkREYpPxT+593t6g75U4lEr7yT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D289XV5VQex9LKnHxT4urYqdEhiHFvDSWQE4bD6c62tp/xtFwzkO8q6sNKIcmHHKpkooyBZSaeNpOrUNt9+WefUiiIuAUpqHMdGEgmhFcur/4huZznDjBYfvjEo54ERmePOvycHrBjBsbXKVAzUdHYuS3q5m60P0JUWjdyZz67U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=aqEb2Cre; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZMvE0+RB; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="aqEb2Cre";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZMvE0+RB"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 855A01380128;
	Sun, 14 Apr 2024 04:37:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 14 Apr 2024 04:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1713083844; x=
	1713170244; bh=GO3LxtM2ypeap3UmifGOvcYwW9kxCez1M29XI0VYkXo=; b=a
	qEb2Cre1gcIFZXjXDvlIU89/3Xq+gMMN0zhnPCYZcUaBJPuOcFFzlJkn2dxEHD5y
	9pDTdsA0xKDaWcFGk/DXr0vxoOLsUe/leMpW9PJzpKB85RPWYJSCPu4HAfsiuD8s
	3sUGpVTDMm57+ynBA9WKpmRqFH3AJm7WR10Lmkw0H/OTAsR2fLrFbqRX7tdff3fx
	9Dr32kRd2F9k5WKGGLcauJEWp+XAqvo0JAPtq0ibGi1lZ/QxLMXkhWTia3xZtobv
	4xn541zQIZjd2PjbMaruladdUjVbj4F+O97oKdRUQWupPt6YFNGIKh2EjyOxwsy8
	+Bp7TyfbVEvSijpnMDSRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1713083844; x=
	1713170244; bh=GO3LxtM2ypeap3UmifGOvcYwW9kxCez1M29XI0VYkXo=; b=Z
	MvE0+RBMiv+SEmX7wg+ncBiAanOxzwOZjop69uYGNvYVklhF1+5+f/IeoqOVUwIm
	jDYfJPSC8QU2G69etNGsUHNyYCWaHVC6R5qecC7R48l3EJ9d+qGbKQUECj/va4yv
	IUoKQCobsX7IcKJGgedIEGoH3FKkSPCmWEEudOW/rZtlBYdzlPbKB+f8O6MZ5xx9
	/+lFMQxKgSHN9EI334psI7D5STNpkWOcMPWKizfEN5dj6vodQp4MZIVAyDsl88Am
	x8DTnWgYPsi86GqPeh/plxt6yH2/JXQVBhtisXtKwyXDgRz4r74M2MCE3/xN6IV2
	msuaLs7vQ5SmbMSE+t5Sg==
X-ME-Sender: <xms:w5UbZn5vaiBUqw5iy5aFOWKKksMIpRMIuiKIa_0_rnfVRljV6VL70w>
    <xme:w5UbZs7ImsHbdiOcXj-b1HNtnRKE0AZ3XxEvJcXn7qCjyZv7PNkfoyEqdtDyYU3im
    ZK1VbNsMlU3e2z4Cw>
X-ME-Received: <xmr:w5UbZufrmDjI1o33XbKSIwzP0XRZLDbaD1SCcCjpROkzM00S5yGB5qkdtnIYZnlVeIKfoSRbpH-Edqc3V-RDHOKHGAU3QVu2CK1sovAdeEA_c2v7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeiledgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:w5UbZoJn5Yww6F3MPGKV8LTFQf67Qw62HhPxgowHr3l0P-F0OUg2tw>
    <xmx:w5UbZrKix3xgIovgyWTjA1X1yrZclsCAuWg3Zvm5_B6xXFO3WKM_aA>
    <xmx:w5UbZhzOKlbnIkjsA9AsLLEFeKBAtrdSfGn0mXf_BPXaTwkfGdJ_-g>
    <xmx:w5UbZnJ71OFUgMXDH7Os4NpXmS5zFpPdnbzavjKKSC8-9Yp4ZddiMQ>
    <xmx:xJUbZtyfwFm_jj5k1lxH4jhNyeoBVlWGtGPGPa5WdVx3eSu3EkNLIWe8>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Apr 2024 04:37:20 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 4/4] arm64: dts: allwinner: h700: Add RG35XX-H DTS
Date: Sun, 14 Apr 2024 20:33:48 +1200
Message-ID: <20240414083347.131724-7-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240414083347.131724-2-ryan@testtoast.com>
References: <20240414083347.131724-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ryan Walklin <ryan@testtoast.com>

The RG35XX-H adds thumbsticks, a stereo speaker, and a second USB port
to the RG35XX-Plus, and has a horizontal form factor.

Enabled in this DTS:
- Thumbsticks
- Second USB port

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../sun50i-h700-anbernic-rg35xx-h.dts         | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
new file mode 100644
index 000000000000..5b7de7bfc458
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2024 Andre Przywara <andre.przywara@arm.com>.
+ * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
+ * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
+ */
+
+
+/dts-v1/;
+#include "sun50i-h700-anbernic-rg35xx-plus.dts"
+
+/ {
+    model = "Anbernic RG35XX H";
+    compatible = "anbernic,rg35xx-h", "allwinner,sun50i-h700";
+
+    gpio-keys: gpio-keys-thumb {
+       compatible = "gpio-keys";
+
+        keyThumbLeft {
+            label = "GPIO Thumb Left";
+            gpios = <&pio 4 8 GPIO_ACTIVE_LOW>; /* PE8 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_THUMBL>;
+        };
+
+        keyThumbRight {
+            label = "GPIO Thumb Right";
+            gpios = <&pio 4 9 GPIO_ACTIVE_LOW>; /* PE9 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_THUMBR>;
+        };
+    };
+};
+
+&usbotg {
+    dr_mode = "peripheral";
+    status = "okay";
+};
-- 
2.44.0

