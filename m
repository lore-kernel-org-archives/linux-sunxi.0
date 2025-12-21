Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73245548EE;
	Sun, 21 Dec 2025 03:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766289487; cv=none; b=nAAFgfkic+mQ2jWpvtYqpYgL+1Tlmsk328vC2pL+fHMaY5fCLGlzfT9phCOAFLy8AFJk2/XViLFj51nOBZqRkHaNGQMtWnipn7umgDbDeKDysRl4+DpM3MJ23hLonl0mIQxf4CC3mv3PHrRO/l2aus+3elyDbsJCsDBYDvlddY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766289487; c=relaxed/simple;
	bh=/908pk0OfubdrCtvZz5OHGSoFUdnsJatveyzCQYu+b8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPZsQ/1DGJaAtGx59BwusTxZvMn/QC9/HnmLtKH2PinFWdW7ch9Jzhi+xEzvAMdDbDVrW/PuRy980by4oK8EEvUNmNEu4aI2ReEEcZNeprc0bh6oZfO3e8vlTpiUbUKrRxJPsGXodRT/v9NtBiaxtACRZkI+2DCY7IHtlpn2lQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVSQAzjq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVSQAzjq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F56C4CEFB;
	Sun, 21 Dec 2025 03:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766289487;
	bh=/908pk0OfubdrCtvZz5OHGSoFUdnsJatveyzCQYu+b8=;
	h=From:To:Cc:Subject:Date:From;
	b=DVSQAzjqyip9toHvHf/YGyFBN5GSBnbcnkP9ortvnRpfdBq1BYHk991clFj6QBUNU
	 2HdP2nJv/Bj2koUJYOB4+32a6l0JqejseuFXw4fbDry/RtjiWKu91Z1lUZr7gsOB6V
	 b4J2ZuTH771gWjiuyZz87fHm+/068IVidhXZrL2cM6KaXmphIhHkCiPE2F18F/aESM
	 DJzk4hAqGKMHC4pQYJPC/lyutC8vUxruA+GMfug/4sPjl2ry6vtFO4of6H/oVPAFjS
	 kRu8K76mCUbOwl4wrKpcPrEFvkQ69wXjVzULmq2yZKw+sVtbb0HSTMXltYQ3NVzVkP
	 TNaWDbgVBjWjA==
Received: by wens.tw (Postfix, from userid 1000)
	id E7FFA5FDFB; Sun, 21 Dec 2025 11:58:03 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: sun4i-spdif: Add missing kerneldoc fields for sun4i_spdif_quirks
Date: Sun, 21 Dec 2025 11:57:13 +0800
Message-ID: <20251221035715.1722584-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When sun4i_spdif_quirks was recently expanded, the kerneldoc covering
the structure was not expanded to match. This ends up causing a warning
when the documents are built.

Add the missing fields.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501311953.0Ox9CW5w-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202503060947.QKUUR62l-lkp@intel.com/
Fixes: 0a2319308de8 ("ASoC: sun4i-spdif: Add clock multiplier settings")
Fixes: 4a5ac6cd05a7 ("ASoC: sun4i-spdif: Support SPDIF output on A523 family")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 sound/soc/sunxi/sun4i-spdif.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 2e7ac8ab71bb..1e755a716c63 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -171,6 +171,8 @@
  * @reg_dac_txdata: TX FIFO offset for DMA config.
  * @has_reset: SoC needs reset deasserted.
  * @val_fctl_ftx: TX FIFO flush bitmask.
+ * @mclk_multiplier: ratio of internal MCLK divider
+ * @tx_clk_name: name of TX module clock if split clock design
  */
 struct sun4i_spdif_quirks {
 	unsigned int reg_dac_txdata;
-- 
2.47.3

