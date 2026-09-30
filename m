Received: from mail-pj2-f37.google.com (mail-pj2-f37.google.com [74.125.227.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BFB51118B
	for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 15:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783344; cv=none; b=CCiC46Tbqeiq0K7/tVBrWUe8XNDTXNbLik2azZwflQ2fTDu3WsPe/Bj/JRVLu0G8Qblpq5klgd2ZAEkCDEOVegfaCdFpc6ZpN9VcDMK4Etz/6hR4XVcU70V7HeXG+J29UjpWTqXIUa0MxSSIKyAweozJL6sG5L/PkERMgt95oAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783344; c=relaxed/simple;
	bh=QCdSHI2SuhoD7qC/wY8SB6ThI20K2KtGW46geTtY5QQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OnkCEB9/hacwQpSFgByA/cYmgwd6gK1oJPaTnkUV1U5ojw6wcAV6DvXWmK9q30WyAwgBZQ/LtIQcz6mGNXHMMZ8o7sgrZaZn+elndne2ST3bsEXA7azfCybBwLq0SUpXJZvZwfWH7Tmv8ZUdOYF2cAwAgvJvZTxyLiiciayeDt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=rVllSq4k; arc=none smtp.client-ip=74.125.227.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="rVllSq4k"
Received: by mail-pj2-f37.google.com with SMTP id 98e67ed59e1d1-3a4eda6744bso250586a91.1
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 08:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790783337; x=1791388137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y41Q9WFkOR6sDX/bibH4WaOpuLUrtGQ8SMNMm1pPqNc=;
        b=rVllSq4kiSSo39vrzxv0N14mX1+BbdhCTP4JoQ1expH5KFkx1kMwfvKtMXXpXsWbV1
         6E41tY83Cl8A+MNFntYP75apNe11PjnFy0byejGuFx+iGXr7fj3Sy8OUWSH94FsTZ87Q
         0pAOExDVG8m8A6wDZo3MAO4PbrBGTjaqM9sP/iSHdb1rvThmFeu6fanmwR6BJws2Lass
         R2sjJExyEZ/WC3NvYb0S407ijVMt0v97AWD5zHbUf/2w6kKZekVFWK4dmFJaN+IR4wSR
         wTvzbS8CliuLf5WRnLD3JWWZYKmMs71cNq6gcOK+XEhh903Jq1n+Pq2q74Dtnvr1kpzm
         xAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783337; x=1791388137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y41Q9WFkOR6sDX/bibH4WaOpuLUrtGQ8SMNMm1pPqNc=;
        b=K4g/HD9FtHf1hYpWbqnEo5tMCOpe0uu6OkjQj7VNKODH+3hiyazKthvk8h042OY0rN
         RAuTlSIAMoihn1hmQ8HqRKzg08uUTR4HJA/+m6r49pM6hmy9Z+6G1WsMj9BWhaQEnRuJ
         wHbEjn/TKG41Cw73Sa0eF2F51us43oryr/MnVvSM2aZaUdu4rFv419W7kvSKB9eJ2Oha
         9vFL6Hz694xIlOy9fsJNcZFnziDq+SPqcwtzu/Q1PcG8iHgYsdqOf+Xqny4pXhzjXMOD
         CheY75HHoH4zSGgRrDn3ktx3TtClPYUwo+wVAAz4DGzKO52zcKXcWYuFjY9r0WkXVLVj
         Kxwg==
X-Forwarded-Encrypted: i=1; AKwUvBxZCh3X5ai3D/aYiq3EicKL3qT6b5EwH8fwgL8+kbvZNVQB4+y5j9iMMUeputb80I8/oU/455epRzXy9Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYK+3DufI/8jM1acEWFLynvjlYv6wkBojNURP48OaJcd5gBGoUGn
	pPjyUeqsEBNgYzIj1u1eeFjN2hB9OMO19N5SFsv0lkBXhdjv3FnPnLCsm5Pz1yN6G7nM
X-Gm-Gg: AYBFou2iOR1N3HYHphCJvqqec1dHFACefC4J1e87YzhBaqi+PKur/VuJ0YSCnU9tfwB
	OPZDAGqhVo2PPcag/tG86SaV8Kk0OlYwzanjJ/vpQdg+Bsl1g2HqlT1T1c49fhZi6alMOiBhjOv
	wX77jgiZflwzXOQy7jW82GF2IezTBdJAlBySPKPltqc4zxzvF6nOJOc3NqkL89aC1/JRch+dQ0Y
	My707Rjt/rgcmmJ2r3zPWmlLzZIO+ceHRkkCNvX96VP2W45J7DKKMNBoezrbVWJn4pQyzfqWyY1
	zNuBEoc4J1/qibMV8GwRWgGuTBX8wOdAf/RCnXswCnWmnw+brNIOlk2SpiAOJ18ZngIZXmFjflr
	5mOt2Vsxc3oBZh23+nlwLW3GM1110lYbOKbJvklEdoPqkilTTjaoKYp9IpjJrF/LMVZNO9Dl4oA
	72sXKQnGWZnfKxBdiiLuxh35+fMr5GHoadNFBV6IMEO4FFWNHA7xD10I8f97Svp8HaFWI/Lxqq4
	Bx0TLqb
X-Received: by 2002:a17:90b:35c3:b0:3a0:ca03:3e1f with SMTP id 98e67ed59e1d1-3a4d154522bmr1584586a91.32.1790783337518;
        Wed, 30 Sep 2026 08:48:57 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ee4d0af2sm308136a91.2.2026.09.30.08.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:48:57 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] riscv: dts: allwinner: d1s-t113: Add the CSIC node
Date: Wed, 30 Sep 2026 22:48:35 +0700
Message-Id: <20260930154835.402684-4-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the CSIC node to the dtsi shared by the D1, D1s and T113, with the
pin groups of its parallel input. MCLK has its own group, for the sensor
node.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 13b1e57166..dd4c873457 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -70,6 +70,20 @@ clk_pg11_pin: clk-pg11-pin {
 				function = "clk";
 			};
 
+			/omit-if-no-ref/
+			csi0_8bit_pins: csi0-8bit-pins {
+				pins = "PE0", "PE1", "PE2", "PE4", "PE5",
+				       "PE6", "PE7", "PE8", "PE9", "PE10",
+				       "PE11";
+				function = "ncsi0";
+			};
+
+			/omit-if-no-ref/
+			csi0_mclk_pin: csi0-mclk-pin {
+				pins = "PE3";
+				function = "ncsi0";
+			};
+
 			/omit-if-no-ref/
 			dsi_4lane_pins: dsi-4lane-pins {
 				pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
@@ -997,6 +1011,23 @@ tcon_tv0_out_tcon_top_hdmi: endpoint {
 			};
 		};
 
+		csi: csi@5800000 {
+			compatible = "allwinner,sun20i-d1-csi";
+			reg = <0x5800000 0x400000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(95) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(96) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(100) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(106) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_CSI_TOP>,
+				 <&ccu CLK_MBUS_CSI>;
+			clock-names = "bus", "mod", "ram";
+			resets = <&ccu RST_BUS_CSI>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&csi0_8bit_pins>;
+			status = "disabled";
+		};
+
 		ppu: power-controller@7001000 {
 			compatible = "allwinner,sun20i-d1-ppu";
 			reg = <0x7001000 0x1000>;
-- 
2.34.1

