Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84D71F2376
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Dec 2024 09:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734774110; cv=none; b=uJ7UVqqP/ylfp7G1BH/6Xuex2p2udevUub9sUslwvvwP0oJW17Eu7MJdo6rQIsz3mBDfnXaV7Vg4VA762XUHMJ7P57ARDX7HtL9duA/mt+xyA1tKrV2F5W4Qo473705hSu59OKDt3wvqA7AXUmdMZfmVXOZDsnvAIYSI50+qya4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734774110; c=relaxed/simple;
	bh=/96xyJvoHR7TUxDjQdtUcVpAy6Aoo9Hj8EQRv8xaj0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fo45glnRPCw6XpIeeQlo9zCJq/AMYJHFmIyBQIPad70Oi0fqwtIKQ9NhMHPfWIz2pF7Qw+bieumKjFGqtFPJST74nx1r5yp1jPImc/JptHs3CK1XaSEtz90igfpNFAx1psIuQ1Mzz38tyrqd5MLcKDMfj8P2W5oYy7153KywpDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=ebgzXI65; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XuI+IoOq; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="ebgzXI65";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XuI+IoOq"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D9D071140157;
	Sat, 21 Dec 2024 04:41:46 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sat, 21 Dec 2024 04:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1734774106; x=
	1734860506; bh=ic+OZ7nYn48w9tiM8ZxAJ9YbDge6f3PVBtso/XTbadU=; b=e
	bgzXI655/AIg2Jj1OWoYkYKVJYJhN/tLS5q7DRj8xYoNfyqCTw46HMYUvle3dVIG
	5VD825ytUSYqk0jgESSUB1nJH2Skt8yeNvzyXe82DSPh01+gB065l73ziahiC4r8
	UY+qpbSpoa1IdgsOcS9HvKUFnHOCZHbX/sF44BirGqMG+W4W8UbQm6PUQgtP8DlQ
	7uH0hb/A5F8LkPZO0hLXisWf7kJKVcltd3sdZx4dcXsc8sg1JNwiQxNq3+rNkyy2
	aPPVkfZmFj1pn4RyjGD+cqNmhgQ9ezNj2LtWBOj+Le8M84ntEJtLQucBbuvWTVqf
	PH9OOI+EYkutNo7Xr9JeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1734774106; x=1734860506; bh=i
	c+OZ7nYn48w9tiM8ZxAJ9YbDge6f3PVBtso/XTbadU=; b=XuI+IoOqTm6F4rpY3
	Frbl3nUg/U3+1dYsAxgpcrr8xtyLWhPoT+3lDPJYKHPkmdVTth5l3eP1PufKaHqb
	vYrn0+qPEEWJxXs71CaCTTLuNGOKXoJ/1D1cPV9ej1DiwmnQazUwbE3sLa+wlV45
	qCCDHH5oOb/xnsYTCoVN3O2J/Q9msbH/C2ZGAcsp9C+WmaSbS1fzTaS/k1HIAeOf
	CM5OS4a+0mMlvSA4FLsTXWJ1PzPT1Qq0P/DvTMhAE6a+XPOGhZyKuVF7YWPGGEVo
	ilEBAdNsuYoZrCWluALHdNmhpb/j9diCcTW4LK4gBoGCiwnGiQc6WLKti+BfGer2
	cNi3Q==
X-ME-Sender: <xms:Wo1mZ2otyArIGcDI5Y5UBzZUsbO67VodGoviawyDZvCgIVaiK7hKyA>
    <xme:Wo1mZ0qutoEfQ-WkMfaufRjKyw24i7HNj8auluGKa4Rr0bEiLQsGBq28moWQSX2gT
    -b1Ivy9BN2987ELkA>
X-ME-Received: <xmr:Wo1mZ7MJ9yrIHqzuLlL3ETx_5ItlTc7POcFHfK97RX2fhka35eUxR4vPbDAtIYDalZftCr9RVNJdgSh6CY3udhBoyKOOAR5vD0ui7hlqTnYn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtgedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihooh
    gusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifi
    grihesshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtth
    hopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    shhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:Wo1mZ15fza1ppsM5jiIETjo0059YNfAWcQnMxC7DQTozyIXTtP89QA>
    <xmx:Wo1mZ17TCy_bsLaL30NQhkS4XNP2CPUSVMZkuGLdat3-2TJLab_qDg>
    <xmx:Wo1mZ1gPfofqUGNcRaMTP5MYPl705swq-9fXe3btuu2WaN7mVNyrGw>
    <xmx:Wo1mZ_4pM9pxX4BxPwMjU6hyigft7sRBQk0QECWqcknNoFSmNi2zEA>
    <xmx:Wo1mZ0LCbDQrv1x8BRuuSj1PLbyPgWoEuhXbopbXJJJE-jLj3xPR5--x>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Dec 2024 04:41:42 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 2/3] ASoC: sun4i-codec: support hp-det-gpios property
Date: Sat, 21 Dec 2024 22:26:33 +1300
Message-ID: <20241221094122.27325-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221094122.27325-1-ryan@testtoast.com>
References: <20241221094122.27325-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for GPIO headphone detection with the hp-det-gpios
property. In order for this to properly disable the path upon
removal of headphones, the output must be labelled Headphone which
is a common sink in the driver. Note this patch also adds the output
of Headphone for the H616 codec.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 sound/soc/sunxi/sun4i-codec.c | 59 +++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 933a0913237c8..5f718dd3fcf0a 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -21,6 +21,7 @@
 #include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
+#include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -272,6 +273,7 @@ struct sun4i_codec {
 	struct clk	*clk_module;
 	struct reset_control *rst;
 	struct gpio_desc *gpio_pa;
+	struct gpio_desc *gpio_hp;
 
 	/* ADC_FIFOC register is at different offset on different SoCs */
 	struct regmap_field *reg_adc_fifoc;
@@ -1302,6 +1304,49 @@ static struct snd_soc_dai_driver dummy_cpu_dai = {
 	.ops = &dummy_dai_ops,
 };
 
+static struct snd_soc_jack sun4i_headphone_jack;
+
+static struct snd_soc_jack_pin sun4i_headphone_jack_pins[] = {
+	{ .pin = "Headphone", .mask = SND_JACK_HEADPHONE},
+};
+
+static struct snd_soc_jack_gpio sun4i_headphone_jack_gpio = {
+	.name = "hp-det",
+	.report = SND_JACK_HEADPHONE,
+	.debounce_time = 150,
+};
+
+static int sun4i_codec_machine_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	if (scodec->gpio_hp) {
+		ret = snd_soc_card_jack_new_pins(card, "Headphone Jack",
+						 SND_JACK_HEADPHONE,
+						 &sun4i_headphone_jack,
+						 sun4i_headphone_jack_pins,
+						 ARRAY_SIZE(sun4i_headphone_jack_pins));
+		if (ret) {
+			dev_err(rtd->dev,
+			        "Headphone jack creation failed: %d\n", ret);
+			return ret;
+		}
+
+		sun4i_headphone_jack_gpio.desc = scodec->gpio_hp;
+		ret = snd_soc_jack_add_gpios(&sun4i_headphone_jack, 1,
+					     &sun4i_headphone_jack_gpio);
+
+		if (ret) {
+			dev_err(rtd->dev, "Headphone GPIO not added: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static struct snd_soc_dai_link *sun4i_codec_create_link(struct device *dev,
 							int *num_links)
 {
@@ -1327,6 +1372,7 @@ static struct snd_soc_dai_link *sun4i_codec_create_link(struct device *dev,
 	link->codecs->name	= dev_name(dev);
 	link->platforms->name	= dev_name(dev);
 	link->dai_fmt		= SND_SOC_DAIFMT_I2S;
+	link->init		= sun4i_codec_machine_init;
 
 	*num_links = 1;
 
@@ -1635,10 +1681,11 @@ static const struct snd_soc_component_driver sun50i_h616_codec_codec = {
 };
 
 static const struct snd_kcontrol_new sun50i_h616_card_controls[] = {
-	SOC_DAPM_PIN_SWITCH("LINEOUT"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
 static const struct snd_soc_dapm_widget sun50i_h616_codec_card_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_LINE("Line Out", NULL),
 	SND_SOC_DAPM_SPK("Speaker", sun4i_codec_spk_event),
 };
@@ -1684,7 +1731,7 @@ static struct snd_soc_card *sun50i_h616_codec_create_card(struct device *dev)
 
 	card->dev		= dev;
 	card->owner		= THIS_MODULE;
-	card->name		= "H616 Audio Codec";
+	card->name		= "h616-audio-codec";
 	card->driver_name	= "sun4i-codec";
 	card->controls		= sun50i_h616_card_controls;
 	card->num_controls	= ARRAY_SIZE(sun50i_h616_card_controls);
@@ -1940,6 +1987,14 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	scodec->gpio_hp = devm_gpiod_get_optional(&pdev->dev, "allwinner,hp-det",
+	                                          GPIOD_IN);
+	if (IS_ERR(scodec->gpio_hp)) {
+		ret = PTR_ERR(scodec->gpio_hp);
+		dev_err_probe(&pdev->dev, ret, "Failed to get hp-det gpio\n");
+		return ret;
+	}
+
 	/* reg_field setup */
 	scodec->reg_adc_fifoc = devm_regmap_field_alloc(&pdev->dev,
 							scodec->regmap,
-- 
2.47.1

