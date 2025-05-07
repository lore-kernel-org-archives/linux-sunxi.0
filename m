Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE76228F506
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649366; cv=none; b=aO2fX88D3NpupD8boLO5gCpbLc/6d331QgKzl3znRQl92exnygwsXH6cQ9p11+WL+C+YfLQn64siREMqB6mxpIUcB50cAUuu628Ybi+wikEEZ7IZKi8QBcFmcVXVAypvcrn9mc1t2TkCx4FDb8xWtSSiC0iR+wdtVxLwqZeXoEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649366; c=relaxed/simple;
	bh=IAr6kTxXJCgUz2ugWDrBl/lZUdq4SDIyDLw5leirmvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqV4LhKXwHGPUcXDBTNULCb/aLxsuhAZIm5NiAjk8pXZu/SEM6YJV4j61broOwUtmQdjU4MJtNHe4tGGwGpcXI0mSBEae9d4fZVS1Y35NyoAFZxz6tykURQ5qEbBXz5CnFO264Ysxy73z7RQvVGeuBMrCViG5MS3YX3BqluQezs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMR9XVFH; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMR9XVFH"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72bc3987a05so188931a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649362; x=1747254162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9qj4UpUWDjLwg05OrZxsWUBu7HdjL4SGnQbRsqq/XY=;
        b=QMR9XVFHXjD26Sq/yk5FNuJzUc95DbxRu/kMQe5KzWYSjglJ01qZWpIxZScQ1h6stQ
         tFWB142l/xDKzpbnREcthGXWI7yw661XNSR8e22e+HX/CEcXGc77GLmirhcHKx0Ek+Ah
         uvbKamfn5kIPVrsQz195VTIiEs411Dj6qklK0600D33MdGXwozXyKuVqInRDtl8hFu1x
         ckKwKxZtsITCCKukNhSmrox03MgKt8VpZ56cWAHkh/Z3yecHcJMJtEz14TBjcGVVic14
         6o9l3a5jeY/AYXCGz5Tq/ee23dDiN4z9H/hFqyw85M2fShFIeUCv2dW53oFmDRIFxnPK
         Ok5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649362; x=1747254162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9qj4UpUWDjLwg05OrZxsWUBu7HdjL4SGnQbRsqq/XY=;
        b=xKEWM3xpSI8nCP7wgCg119LfuxIL+awdxZmYLFyky78J3amxc4r7ZBxuWR+E6TRP9V
         h1p9mQaDWqFlPfSFQ4ISxNQdzxm6sklIUNm8F4YrlmCBiy8UHgbDRYOcQ5QrY3tcxFE8
         u+wu1agPSY2O9tOn9D365pB04bxgQZATXWcCZeHCGsxzT0AOvH7GKAvy2HUu50AgweYI
         S4+FngFVTNDtoDiEFimgQZvW4ZyHpicgTSJyZkx7p39m8ho6sdlrEkxzEqNjysYi5Xin
         okw6m8IQh246YO955CIyfZPZlHkqY4smQHOT3rX261a2a/527Ttczvg7X4BILW882n0X
         MFMQ==
X-Gm-Message-State: AOJu0YyB22TXeiGLvJTp6FisccCrb6hdx5cWp6BjYxzyKrXCMFaQYQeO
	3s1264gKwmkcqP/O5C8g94pnHI/N0PqghiW5IxUA5HjgtVniBlWyDbM3yg==
X-Gm-Gg: ASbGncvDxoDnrorATjiO1bUx+gMAX0ueEBAekABe2kSsb4ZKR8cqJhzK6q79R+vdMuo
	vSQLZRZE0VE1mTu2v/mdZXI/TycLDNlYbvC/FblV6pd/vi7ohz6fXggOWXSDfujv1dAQ2hzEHPg
	bj7G6h87QG+S6c6wI4Ry/xaDrCSxx2p+lX9hoc3eARX3I9rssEtAWnY9IZG7JoJQ5tLdCRh76Pl
	yaXpnfbRwhRjl1kAkA3fGoie+BBZ/C2Tf1lczpBtg6PxXymTl6YvIRt2hoiyomIIw7JzM6BKJBV
	SRaKmOu8hVqRIUbUSqNGeIHBQFjfkJ6yPKRYkHp2H3R10p6KaxlpY3NeBuGiS0Sk4XcUD7k=
X-Google-Smtp-Source: AGHT+IH2oJBKfv/nX9XV+zQRIfTXfUhPN5oWVBe/V5dWv4ffki8mMMLkvqKCrOJpZoakFoKnhSq/+g==
X-Received: by 2002:a05:6830:46:b0:72c:4023:aa19 with SMTP id 46e09a7af769-7321b400a55mr605713a34.7.1746649362625;
        Wed, 07 May 2025 13:22:42 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:42 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: [PATCH V9 20/24] arm64: dts: allwinner: h616: add display engine, bus and mixer nodes
Date: Wed,  7 May 2025 15:19:39 -0500
Message-ID: <20250507201943.330111-21-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner H616 and variants (H618, H700 and T507) have a new display
engine variant (DE33). Support has been added to the existing DE2/DE3
sun4i driver in a previous patch series (x). The variant is selected via
the appropriate mixer device tree compatible string.

Add the respective device-tree nodes for the DE, bus, clock and mixer to
the H616 DTSI, and the matching SRAM section for the DE.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index cdce3dcb8ec0..542d129da9c3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -94,6 +94,13 @@ l2_cache: l2-cache {
 		};
 	};
 
+	de: display-engine {
+		compatible = "allwinner,sun50i-h616-display-engine",
+			     "allwinner,sun50i-h6-display-engine";
+		allwinner,pipelines = <&mixer0>;
+		status = "disabled";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -150,6 +157,52 @@ soc {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		bus: bus@1000000 {
+			compatible = "allwinner,sun50i-h616-de33",
+				     "allwinner,sun50i-a64-de2";
+			reg = <0x1000000 0x400000>;
+			allwinner,sram = <&de33_sram 1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x1000000 0x400000>;
+
+			display_clocks: clock@8000 {
+				compatible = "allwinner,sun50i-h616-de33-clk";
+				reg = <0x8000 0x100>;
+				clocks = <&ccu CLK_BUS_DE>, <&ccu CLK_DE>;
+				clock-names = "bus", "mod";
+				resets = <&ccu RST_BUS_DE>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			mixer0: mixer@100000 {
+				compatible = "allwinner,sun50i-h616-de33-mixer-0";
+				reg = <0x100000 0x100000>,
+				      <0x8100 0x40>,
+				      <0x280000 0x20000>;
+				reg-names = "layers", "top", "display";
+				clocks = <&display_clocks CLK_BUS_MIXER0>,
+					 <&display_clocks CLK_MIXER0>;
+				clock-names = "bus", "mod";
+				resets = <&display_clocks RST_MIXER0>;
+				iommus = <&iommu 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					mixer0_out: port@1 {
+						reg = <1>;
+
+						mixer0_out_tcon_top_mixer0: endpoint {
+							remote-endpoint = <&tcon_top_mixer0_in_mixer0>;
+						};
+					};
+				};
+			};
+		};
+
 		crypto: crypto@1904000 {
 			compatible = "allwinner,sun50i-h616-crypto";
 			reg = <0x01904000 0x800>;
@@ -173,6 +226,12 @@ sram_c: sram@28000 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				ranges = <0 0x00028000 0x30000>;
+
+				de33_sram: sram-section@0 {
+					compatible = "allwinner,sun50i-h616-sram-c",
+						     "allwinner,sun50i-a64-sram-c";
+					reg = <0x0000 0x1e000>;
+				};
 			};
 		};
 
-- 
2.43.0

