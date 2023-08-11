Received: from out-99.mta0.migadu.com (out-99.mta0.migadu.com [91.218.175.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8558468
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Aug 2023 20:14:51 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691784889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c760wkxPLczuI7tECzLOiGz+mznMFHiURmBp9IfloLs=;
	b=SF7GQFQIMbGSIRIbDdfcfm1/Ln1i/WscUwrTn0q7g9Z2FxkvffM46DLW+yosRia5C+01hO
	nSO9wHJ/nCkY+BuHCKtIPRhAvlQ26+RjFiLI3/9+ZRCUZU2QEYAs9tMPvWJLEALKgYLQcr
	DXWIy6JF3NZOOctaC6Rs+MK3rVAx64b2TffmFFG3FEaGNLX9rj59OoEnqqcuvwluBe52LX
	YHzSeZ9+eDwjs+4n980y4xyfurS640oORu3/5Co+ieSypxHceQZLOxxpOShOjqpjQSaoD1
	TkEoo/NHBMJqeVdbqUaF3VscGKV8A8XKNogDdt3TwOKPlMVigfFEWFhfkC/d5Q==
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	John Watts <contact@jookia.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/7] ASoC: sunxi: sun4i-i2s: Use channel-slots device tree property
Date: Sat, 12 Aug 2023 06:14:03 +1000
Message-ID: <20230811201406.4096210-5-contact@jookia.org>
In-Reply-To: <20230811201406.4096210-1-contact@jookia.org>
References: <20230811201406.4096210-1-contact@jookia.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On R329 I2S variants with multiple pins it's useful to read from
multiple devices within a single TDM slot. Allow changing the
assignment of slots through a device tree property.

As an example:

&i2s2 {
        channel-dins = /bits/ 8 <0 0 1 1 2 2>;
        channel-slots = /bits/ 8 <0 1 0 1 0 1>;
};

In addition to configuring the first 6 channels to use different
DIN pins for three separate ADCs, the addition of channel-slots allows
all three ADCs to be sampled within the first two TDM slots.

Signed-off-by: John Watts <contact@jookia.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 627bf319e1cc..019a4856c90b 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -269,12 +269,27 @@ static int sun4i_i2s_read_channel_dins(struct device *dev, struct sun4i_i2s *i2s
 
 static int sun4i_i2s_read_channel_slots(struct device *dev, struct sun4i_i2s *i2s)
 {
+	struct device_node *np = dev->of_node;
 	int max_channels = ARRAY_SIZE(i2s->channel_dins);
+	int ret;
 
 	/* Use a 1:1 mapping by default */
 	for (int i = 0; i < max_channels; ++i)
 		i2s->channel_slots[i] = i;
 
+	if (!np)
+		return 0;
+
+	ret = of_property_read_variable_u8_array(np, "channel-slots",
+						 i2s->channel_slots,
+						 1, max_channels);
+
+	if (ret == -EINVAL)
+		return 0;
+
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
-- 
2.41.0

