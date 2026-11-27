Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795815773;
	b=VNNmQTwm8kXt3uAc8gK6DRcWGqvwgSYpD4o9k6r4+HSjTicqMiWCLR9TYI3Enp2/g+4j
	 W+RunCdo/og2oNZkmt174G+kLzaCuUqvsxI/Qp004093Vo6AqTE2USUrB4wxe46iEXNPi
	 xkOAJgxThUkZ7SfbWtbCkpu4qzLjQQYCCB8whtxmhCH++EOH3IrjEs8S8CDtPHfxx1p4v
	 eaDuHvIW+EvvSoXpZwAEmIMNWd5HyYTki0FyHro/F/oBydwGI/1X5RE6StL5WWUP0UVR0
	 x1iFdo7fqI7mfqwUoOBc3P/ujanYvZuS7GPfte097txx9Vp2CxSo9LdeBCVjHA0f8DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795815773;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0ZYgNUiDFfhKnL3/ciwpgFJhJOXc7waapLIK1GJZ/ZQ=;
	b=VGGdwiJXz8VxcTC2W0I/tIDIAbW4fOwDDBrZgyIhtfT+6yNunKquOLItlyZSrOV/GKe5
	 oVq611hX3tVRuvjeHud1KTDH6fW6FBpB1itds7FHiKFVFYeCveioFoulQjUX0JHT7MfUs
	 KM3xMV8YML3S59PFh/1oRDPwBXj6GbLCEh2KMaqRO0s2FbCZALanO6W4ubQ4WsrEJJlQ/
	 FjtzCJKi0PlvNirfXqIzxTaCiGVNJRD6vmibxd2+p3Qa7PSXVKrMY8RHyGvfQStbiAorZ
	 zFCH7JP/0KrFCzqxuQ8BMFZV6L6ZY9Wca1r9FpxQBa/HG6qASHmA1xXiq8VOU91ntUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A438606A31C
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 21:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A438606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xX3iR-0000000008m-2Kgz;
	Fri, 27 Nov 2026 21:42:47 +0000
Date: Fri, 27 Nov 2026 21:42:44 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, bui duc phuc <phucduc.bui@gmail.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Ryan Walklin <ryan@testtoast.com>,
	Andre Przywara <andre.przywara@arm.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org
Cc: stable@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/1] clk: sunxi-ng: h616: fix audio PLL and codec clock rates
Message-ID: <9b134cf8ba90d4524188d4b5977fd1d8335dc751.1795815223.git.daniel@makrotopia.org>
References: <cover.1795815223.git.daniel@makrotopia.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795815223.git.daniel@makrotopia.org>

The sigma-delta table of the H616 audio PLL holds the PLL_AUDIO(4X)
rates of 90.3168 and 98.304 MHz, which already include the M0 output
divider of 2, and ccu_nm divides the table rate by fixed_post_div once
more. The PLL and the 4x, 2x and 1x clocks derived from it are therefore
reported at half their real frequency: N = 40, P = 5, M0 = 2 and
pattern 0xc001eb85 (a fractional N of 40.96) give 24 MHz * 40.96 / 5 /
2 = 98.304 MHz for PLL_AUDIO(4X). Store the rates in front of the post
divider.

The H616 codec only played at the right speed because of this: its DAC
needs a module clock of 49.152 MHz for the 48 kHz family and 45.1584 MHz
for the 44.1 kHz family, and the 24.576 MHz requested by the sun4i-codec
rate table landed on pll-audio-2x running at 49.152 MHz. Request twice
the table rate on the H616, in the same change, as either half on its
own leaves the codec playing at the wrong speed.

Fixes: d0c322b6e4bf ("clk: sunxi-ng: h616: Add sigma-delta modulation settings for audio PLL")
Fixes: 9155c321a1d0 ("ASoC: sun4i-codec: support allwinner H616 codec")
Cc: stable@vger.kernel.org
Cc: Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Marcus Cooper <codekipper@gmail.com>
Cc: Philippe Simons <simons.philippe@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Measurements on an H618 (X98H TV box), DAC drain rate from AC_DAC_CNT
and aplay run time of a 4 s 48 kHz stereo file:

  kernel           CODEC_1X_CLK  real module clock  drain    run time
  unpatched        mux 2X        49.152 MHz         96360/s  4.06 s
  CCU fix only     mux 1X        24.576 MHz         48160/s  8.03 s
  CCU fix, 2X mux  mux 2X        49.152 MHz         96360/s  real time
  this patch       mux 2X        49.152 MHz         -        4.06 s

With this patch the 44.1 kHz family runs at 45.1584 MHz and also plays
in real time. Codec streams of either family keep their rate when they
alternate with streams of the out-of-tree Audio Hub HDMI driver, which
retunes the PLL between the two settings. A guitar tuner held to
headphones on the line out read 440 Hz for 60 s sines of 440 Hz at 48
and at 44.1 kHz, and 880 Hz on the right channel only for a 60 s 880 Hz
right-channel sine at 48 kHz.

The real rates follow the PLL_AUDIO_CTRL formula of the H616 manual
(3.3.5.12) from the register contents (0xb9042701 with pattern
0xc001eb85 for the 48 kHz family, 0xb9021501 with 0xc001288d for 44.1
kHz). The same halving made sun4i-spdif run at twice its rate whenever
the codec had moved the PLL to its sigma-delta setting first (a 4 s
file played in 2.01 s). With the fix it plays in real time whenever the
PLL already runs in the rate family of the stream; the spdif clock
cannot retune the PLL itself, which is a separate problem.

---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 4 ++--
 sound/soc/sunxi/sun4i-codec.c          | 8 ++++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 955c614830fae..6af0c1318ccf2 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -223,8 +223,8 @@ static struct ccu_nkmp pll_de_clk = {
  * frequencies with less error.
  */
 static struct ccu_sdm_setting pll_audio_sdm_table[] = {
-	{ .rate = 90316800, .pattern = 0xc001288d, .m = 3, .n = 22 },
-	{ .rate = 98304000, .pattern = 0xc001eb85, .m = 5, .n = 40 },
+	{ .rate = 180633600, .pattern = 0xc001288d, .m = 3, .n = 22 },
+	{ .rate = 196608000, .pattern = 0xc001eb85, .m = 5, .n = 40 },
 };
 
 #define SUN50I_H616_PLL_AUDIO_REG	0x078
diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 9d5bc3d7b4dfa..759343bec42a8 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -333,6 +333,7 @@ struct sun4i_codec {
 	struct reset_control *rst;
 	struct gpio_desc *gpio_pa;
 	struct gpio_desc *gpio_hp;
+	bool double_mod_freq;
 
 	/* ADC_FIFOC register is at different offset on different SoCs */
 	struct regmap_field *reg_adc_fifoc;
@@ -661,6 +662,9 @@ static int sun4i_codec_hw_params(struct snd_pcm_substream *substream,
 	if (!clk_freq)
 		return -EINVAL;
 
+	if (scodec->double_mod_freq)
+		clk_freq *= 2;
+
 	ret = clk_set_rate(scodec->clk_module, clk_freq);
 	if (ret)
 		return ret;
@@ -2147,6 +2151,7 @@ struct sun4i_codec_quirks {
 	unsigned int reg_adc_rxdata;	/* RX FIFO offset for DMA config */
 	bool has_reset;
 	bool playback_only;
+	bool double_mod_freq;
 	u32 dma_max_burst;
 };
 
@@ -2237,6 +2242,7 @@ static const struct sun4i_codec_quirks sun50i_h616_codec_quirks = {
 	.reg_dac_txdata	= SUN8I_H3_CODEC_DAC_TXDATA,
 	.has_reset	= true,
 	.playback_only	= true,
+	.double_mod_freq = true,
 	.dma_max_burst	= SUN4I_DMA_MAX_BURST,
 };
 
@@ -2365,6 +2371,8 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->reg_dac_fifoc),
 				     "Failed to create regmap fields\n");
 
+	scodec->double_mod_freq = quirks->double_mod_freq;
+
 	/* DMA configuration for TX FIFO */
 	scodec->playback_dma_data.addr = res->start + quirks->reg_dac_txdata;
 	scodec->playback_dma_data.maxburst = quirks->dma_max_burst;
-- 
2.56.1
