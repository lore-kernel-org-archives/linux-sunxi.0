Received: from out-124.mta0.migadu.com (out-124.mta0.migadu.com [91.218.175.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E502AB48
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Aug 2023 20:14:16 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691784855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6hBtpLiHEAUCKZrFtYgu+mEZQfu4FFrE7uRZuwIPRHo=;
	b=xiIIaoSI6Jtq489azAwmEJ/yFbLyZbRhnHjLmq9FFFDqsuGS6QLvxM3Q710jZif6S1KdLi
	CO1yUsvfc9rneaCC3Q7n/p3PMmt3yuTVxSUjjoN7BwOMXtK6rEYEfiyPnFNyR2Ct8xWAgh
	eMTD0kdGCv8eB5xjlNm154x1CvIkTLpljwUmQGI50pG81iPoLboEBJDtkVtpCHXNO4F+gI
	D9OSkB32lWJ0zbQPHAcNdxT/4A6hle46rcOAQfHBlbOpTRXlWl76FNcrcPoGY8BYMXTw1S
	Z0Y8sgtWBtPxwv83OLKrESUeJvBU2jwGXuUK1/a1CvPp5b1pmDdkXtdzL2O5vw==
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
Subject: [RFC PATCH 0/7] sun4i-i2s: Support channel remapping
Date: Sat, 12 Aug 2023 06:13:59 +1000
Message-ID: <20230811201406.4096210-1-contact@jookia.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi there,

A while back I put out this thread:
How do I set up multiple codecs on one I2S - without TDM?"
https://lore.kernel.org/all/ZMBRMnv0GQF4wyfQ@titan/
This is my specific use case and motivation for this patch series.

I posted how I managed to configure the audio-graph-card2 to allow
doing this in conjunction with some register hacking, but I now have
an initial patch series to support this in the sun4i-i2s driver.

Now I've tested this on the T113-s3 with 3 wm8782s and it works well,
but I'm marking this as RFC as I think I'm out of my depth here and
I'd like to know the direction I need to take this: I'm new to
kernel development and I'm genuinely unsure what are best practices
and which are bad practices design-wise.

My main concerns are the following:

First, I split up channel-dins and channel-slots. This is mainly
because I implemented one first but both of them only make sense
together. The registers themselves use a format of a byte per
channel with the upper nibble being the din and the lower being
the slot. Perhaps this is a better format to copy?

Second, I use u8 arrays on the device tree. This is done so I can
just read the array easily, but it also means I can't make this
property contingent on a compatible string in the schema as $ref
doesn't seem to be allowed there.

Third, channel-slots is available on all sun4i-i2s controllers,
but I only have it implemented on the R329 variant for now when
there are multiple din pins.
I could add support for this on older controllers but there's not
really a use case for manual configuration as there's no DIN
and I don't have hardware to test it on.

Fourth, I don't limit the readable channels to the channels
listed. Reading more channels than you have currently results in
the controller assuming you want to use TDM, but that's not the
case here and you can have strange duplicate channels show up.

Fifth, it might be a good idea to increase the maximum channels
from 8 to 16, especially if people are going to be running
multiple TDM streams on one controller.

Sixth, the channel-slots only apply to capture, not playback.
This is something I just realized now when writing and forgot
to document in the patch set.

Thanks for your time,
John.

John Watts (7):
  ASoC: sunxi: sun4i-i2s: Prepare for runtime DIN pin selection
  ASoC: sunxi: sun4i-i2s: Use channel-dins device tree property
  ASoC: sunxi: sun4i-i2s: Prepare for runtime channel slot selection
  ASoC: sunxi: sun4i-i2s: Use channel-slots device tree property
  ASoC: sunxi: sun4i-i2s: Detect TDM slots based on channel slots
  dt-bindings: sound: sun4i-i2s: Add channel-dins property
  dt-bindings: sound: sun4i-i2s: Add channel-slots property

 .../sound/allwinner,sun4i-a10-i2s.yaml        |  30 +++++
 sound/soc/sunxi/sun4i-i2s.c                   | 106 +++++++++++++++++-
 2 files changed, 132 insertions(+), 4 deletions(-)

-- 
2.41.0

