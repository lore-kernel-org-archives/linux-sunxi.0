Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57A0351C25;
	Tue, 14 Jul 2026 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784028797; cv=none; b=XosFSu+NvVH4Cglh6eYFiL3Qj5ARnUaI6yOhExPnd7itHtbzBi0/fqTfZnqM/fnDHGhsUh95dzH/LqkU0PeiFoY1ThV3lxINPqbQd7wHy24PVDpiVydcJtf4jQy9No15GVARnFBCHn8Zz2Aufbb0mfUSrekRUultvw2zZUPqpzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784028797; c=relaxed/simple;
	bh=0tMUenJkq5HSDuiFlteWZA/CYZ6rEUbWgPCmBDzrPNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OhdrgX2MuPLx7Q0Tb6zpxKsf7Et5S8gXgDK+8kjWUyxIxfz0RtnwPPBBY6BObVHOki+BmxWAjVTgCFMDArVLG1Ij/MW1B81U9JHlbwcZVFjfwFb7oVM7vtTxJ6hW79NX/XyeVe9Ts/MJHnDETgwNas5Vol2tAv1QzUh7eqQqa6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEqokdIt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEqokdIt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9631F000E9;
	Tue, 14 Jul 2026 11:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784028796;
	bh=9oNdreHz/zJ196ou4ABQY3VD2bD24GH0lxFU+tXDweo=;
	h=From:To:Cc:Subject:Date;
	b=lEqokdIt7TWgJvetkIdsb80SJJMOdKq3R7I75YrtXo1sPpQPxlTcz9koLQGds5J5B
	 d4P5Q7nDo1yYT+9ScuQ19dnCprISxmB3eVATiXdzCyU7Pwyi5LHXPUCk0SoYFjQoJL
	 Cl/NgTyLCgcehzbOUOdRPV6MqUgwvYUGBVSHKmSO2TAGeMCL8VxPnJDWeo+F0gpfE0
	 pxTNID0F7opJDOACOSpsNDeuIM5sV6/woXPKpwsLQFCAP7fAFjQOGGtrg70jXbazsB
	 IRo5Z/fy7eR8QX+nHgK4xvbdxH6gVdoRTM2KvV2fF6LjQ2xCsNXiTbFG+j54/fcgo8
	 nFJQQaYqE0YPA==
Received: by wens.tw (Postfix, from userid 1000)
	id AF3BD5FC39; Tue, 14 Jul 2026 19:33:13 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: sun4i-codec: Set quirks.playback_only for H616 codec
Date: Tue, 14 Jul 2026 19:33:03 +0800
Message-ID: <20260714113304.270224-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The H616 codec does not have capture capabilities. Set the
.playback_only quirks flag to denote this.

This was somehow missing from the original driver patch, even though
the patch prior to it in the series added this quirk.

Fixes: 9155c321a1d0 ("ASoC: sun4i-codec: support allwinner H616 codec")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 sound/soc/sunxi/sun4i-codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index f4e22af594fa..93f511fb6190 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -2237,6 +2237,7 @@ static const struct sun4i_codec_quirks sun50i_h616_codec_quirks = {
 	.reg_dac_fifoc	= REG_FIELD(SUN50I_H616_CODEC_DAC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN8I_H3_CODEC_DAC_TXDATA,
 	.has_reset	= true,
+	.playback_only	= true,
 	.dma_max_burst	= SUN4I_DMA_MAX_BURST,
 };
 
-- 
2.47.3

