Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61CB1DE2A5
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Feb 2025 22:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739570601; cv=none; b=Hm1vWCWhO/Nl8GajSKE5jCSNrDr9d7Q+zDhzgcE4k9HD/+t6AJcrzAnt0Mzai/y6qDvRf3L9ZUlwtiz2OOHN9j8bsAkr3P76XxZWpwc3eeZmapQpKPjreM5Cji7V6jhMRwb3y38U4xUQGpvy6yV/Y20WEn4xRjsOxervIS5VERo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739570601; c=relaxed/simple;
	bh=o4fmsSDO4lcy6w6rzyg4ehsS7WRcrQRpQBhuCvu8GGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJcBfvWVKenGs0oJ5QTlB7wbE91IVQGb3mbceNS3CRnZoOLkM4V0Ex9JyE5MKfSGrekvN4OL6zRjWsuwgvHuSn7MUmlqpc3NYA1YZcH62sn8c6ZUytmwmrtYNXZgAwflEO//uITQF62AmYHKPu2B3aMJ+Sz6fYLySFH6x+PkJ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=A07uP8uR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=O68Ivs0s; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="A07uP8uR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="O68Ivs0s"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A531D2540160;
	Fri, 14 Feb 2025 17:03:18 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 14 Feb 2025 17:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739570598; x=
	1739656998; bh=yQTl2yWBxu//zbP5sWSZfsZGIV4BkU9peMdt+WBASkE=; b=A
	07uP8uRFfo/ZmZ1tqW2W+6UpvSREqOJDLX5jBILeQBP5UlJrz+RfbuBrLqYf41ww
	bR7Irqlb4HVXMV+ZKp349SognNu9W3dIZT8n2x4vtsVmR4e7ZSgZ4ZgMI170wBUb
	VjcNhCwPjyo8DuD2VH06c/9yBnuu7rNqf2+CkJXE3Ewu8KhH8Q1t2FU3nQESqDUu
	QTjXoNsN8RfKCtbgBNSSvjFmeb2CJgsxe3ahMlj9U1MFkz24pDaTC9JWMM3XcWH0
	4AVTRhPQ8DUbBLh7/Gy93yOu1EJTC9OzRoohUHZb3P+1wvZs1BOYFahcszyCgyCU
	qwG2sHxr14r1goSy7D2pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739570598; x=1739656998; bh=y
	QTl2yWBxu//zbP5sWSZfsZGIV4BkU9peMdt+WBASkE=; b=O68Ivs0sRRGjv1io4
	r+dpnT769VZRxjQ1UFjWwArNTGkcUctQNy7wqfraeqW+bNaFaRI7EakbZgx+Lhly
	Q/KL+T+ldftfWsjzIFA/PkLEPXs8GPmOCscTT1lpPu914H6jSuxvQCnkb9C987ww
	2ratELoRpRsqr/o3uaBF7i1RPMQstMcU9rvvq8qgXoK/RDk4gMSpMghUGbbTR60U
	/H2akzErkI1FlGT0CiMkUP+6KM/E20daa6Uw0+c3c7fLnU7jHG+mJ4jB7O3LsPGr
	uTvj72B7nG53hfIbiJmosIuVrdjcTZUU9+7mNDSHQbB1d+hMmKjL3t5ZcpZEQHkW
	oaOzw==
X-ME-Sender: <xms:pr2vZ0gWIT28-N10dWxVMubAgtuWDV9T_YZxan2PjY-SAfSDtyjyXA>
    <xme:pr2vZ9BIcQPCsIP0xU80RceuLCFVr8lQXTFBNwwfv_Slzkt1R3QYSTnur6HwX-T8Z
    R150EkCT9_g1FVESg>
X-ME-Received: <xmr:pr2vZ8E4x7Vd_R18XB4rSdMJwEs3Y8juRoH4cw4RATVRQW7CdoZL1ewkWAv6oqGbL4YIYyJyx6foEPUd5WdcrRaflme0-rBfdKRhd8i_iRgz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:pr2vZ1T8n1f-x3lIjcRNB2gzSpnT5GIXmFQUfa1KlwH4QjlmBgbscA>
    <xmx:pr2vZxyshb3whw4n1e8AKh8bxbC1oVAYoi516UHbRVa8a7ar9ZhBEA>
    <xmx:pr2vZz4MQj3WsSEOaEXCwg90I91Aj_r7AQBdlpdc5zgxnPe-Gvd_sQ>
    <xmx:pr2vZ-x75Otj5S5KgSpVAHLfPvXaXeG7sLpIBoTy5Iz_UsgtCukQqg>
    <xmx:pr2vZ5AILt15Ngyp6qOR-cBP9YuPdRn81rkYU_8AJjuFuEF3ng-oLg4V>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 17:03:13 -0500 (EST)
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
	Rob Herring <robh@kernel.org>,
	Philippe Simons <simons.philippe@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v3 3/5] ASoC: sun4i-codec: support hp-det-gpios property
Date: Sat, 15 Feb 2025 11:02:25 +1300
Message-ID: <20250214220247.10810-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214220247.10810-1-ryan@testtoast.com>
References: <20250214220247.10810-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for GPIO headphone detection with the hp-det-gpios
property. In order for this to properly disable the path upon
removal of headphones, the output must be labelled Headphone which
is a common sink in the driver.

Describe a headphone jack and detection GPIO in the driver, check for
a corresponding device tree node, and enable jack detection in a new
machine init function if described.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Separate DAPM changes into separate patch and add rationale.
---
 sound/soc/sunxi/sun4i-codec.c | 53 +++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index f24bbefeb3923..3701f56c72756 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -22,6 +22,7 @@
 #include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
+#include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -331,6 +332,7 @@ struct sun4i_codec {
 	struct clk	*clk_module;
 	struct reset_control *rst;
 	struct gpio_desc *gpio_pa;
+	struct gpio_desc *gpio_hp;
 
 	/* ADC_FIFOC register is at different offset on different SoCs */
 	struct regmap_field *reg_adc_fifoc;
@@ -1583,6 +1585,49 @@ static struct snd_soc_dai_driver dummy_cpu_dai = {
 	.ops = &dummy_dai_ops,
 };
 
+static struct snd_soc_jack sun4i_headphone_jack;
+
+static struct snd_soc_jack_pin sun4i_headphone_jack_pins[] = {
+	{ .pin = "Headphone", .mask = SND_JACK_HEADPHONE },
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
+				"Headphone jack creation failed: %d\n", ret);
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
@@ -1608,6 +1653,7 @@ static struct snd_soc_dai_link *sun4i_codec_create_link(struct device *dev,
 	link->codecs->name	= dev_name(dev);
 	link->platforms->name	= dev_name(dev);
 	link->dai_fmt		= SND_SOC_DAIFMT_I2S;
+	link->init		= sun4i_codec_machine_init;
 
 	*num_links = 1;
 
@@ -2302,6 +2348,13 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	scodec->gpio_hp = devm_gpiod_get_optional(&pdev->dev, "hp-det", GPIOD_IN);
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
2.48.1

