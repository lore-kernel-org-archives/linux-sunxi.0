Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6410B4070F6;
	Tue, 24 Mar 2026 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370645; cv=none; b=mlTFJNR8yilpHhM82rcNmRXyMlte7lTj38hPB1dfJtsH5rM4no4rl4vA8wqMuRJa1/Q1XCsQUkkNkw6XiTUc5vimNJeA2X7ycmcrtlEsRr/jnm7BlZ9VApheJA4h4rs/ypLeIwNj5oX9aw37sjzmSmb7Lbx0/kJTAaHyVfN9xfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370645; c=relaxed/simple;
	bh=QYFXFUR/8WwRSwrV3QqrRDABUI+S+t3w7aA/W4XCZ70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t50WywW+D4UMts7t2lOe+eabfp/VYaTEck2k5ysL4JZWUW+zCBn3P15YJ5CNSW2A19Hy36S6m3WnR8N1Z0e8ASNrjm0tyZqq7XnOQJdVbeGbn0a0qk1ZJ/3lOPPWGaCTRgMO42lDUHu+N/Z/UFeuEh7d3hwsV2gic4f8oKtE+c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=trMKu6dh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="trMKu6dh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55AAC2BC9E;
	Tue, 24 Mar 2026 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370645;
	bh=QYFXFUR/8WwRSwrV3QqrRDABUI+S+t3w7aA/W4XCZ70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=trMKu6dhD9+hUG8hyWqzyKsWtEjf8n4BKqDA5IXDjOt3J3V4NLJOdBbOavv9Ta7J2
	 5vtjU80y72ml+oAes8iOCC/QmiN5hvLumBE6ixJROD+Lapsurrrf48s83cRgZ/kReb
	 SuaWQDtpVT//zX/TNFffVfZNkKrujd3jsQo34CsMUvA6aZpFaIsKTS+DEFa+tCBj2D
	 4RoRIZgT3Zekvxuvv96wX1Gjvgk9Oj5paQvB8Btm/yYmKxwX15VdybgaoMVpDC6A9L
	 7npZKoOJPuDa67EAevfO1TbQgGWGResDtaqq1U+l/5ZD7+Atb0RnPFolase33cFNT/
	 NREQu9xJFR6CQ==
Received: by wens.tw (Postfix, from userid 1000)
	id E6C8A60003; Wed, 25 Mar 2026 00:44:00 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] soc: sunxi: sram: Add H616 SRAM regions
Date: Wed, 25 Mar 2026 00:43:54 +0800
Message-ID: <20260324164357.1607247-7-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324164357.1607247-1-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 has two switchable peripheral SRAM regions:

- The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
  to this region is enabled by default. CPU access can be disabled,
  after which reads will show the same stale value for all addresses,
  while writes are ignored.

  The mux value for this region is different from previous generations.

- The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
  KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
  CPU access is disabled, the whole region reads as zero, while writes
  are ignored.

  The mux value for this region is the same as on the A64 and H6.

Add data for the VE SRAM. The register values were taken from the BSP
vendor kernel.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/soc/sunxi/sunxi_sram.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 4d81897179e7..2ccaeacf8c70 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -83,6 +83,12 @@ static struct sunxi_sram_desc sun50i_a64_sram_c = {
 				  SUNXI_SRAM_MAP(0, 1, "de2")),
 };
 
+static struct sunxi_sram_desc sun50i_h616_ve_sram = {
+	.data	= SUNXI_SRAM_DATA("VE", 0x0, 0, 1,
+				  SUNXI_SRAM_MAP(1, 0, "cpu"),
+				  SUNXI_SRAM_MAP(0, 1, "ve")),
+};
+
 static const struct of_device_id sunxi_sram_dt_ids[] = {
 	{
 		.compatible	= "allwinner,sun4i-a10-sram-a3-a4",
@@ -100,6 +106,10 @@ static const struct of_device_id sunxi_sram_dt_ids[] = {
 		.compatible	= "allwinner,sun50i-a64-sram-c",
 		.data		= &sun50i_a64_sram_c.data,
 	},
+	{
+		.compatible	= "allwinner,sun50i-h616-ve-sram",
+		.data		= &sun50i_h616_ve_sram.data,
+	},
 	{}
 };
 
-- 
2.47.3

