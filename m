Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594421FC0F1
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Feb 2025 22:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739570596; cv=none; b=Gy2gzfuS+EUKCKJrZ854Z3IS0z2BQWMFVwM7imzNp2uWQYnBX3pBZODA3FsaBT4VhfgPv7FImYv9FrbyF1Y6bMclaMmBMzoFG/BeopdTZgAGjC6L8VZd5110Jvwh61J49QLSDdYXq/rou4V0+eem5H6zOdm01XXET1EXlMu1uBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739570596; c=relaxed/simple;
	bh=HXrBrgZ0i+5VU91GpVY/rEeGxIvZenjl9fAtj8inY8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m225nrTwQ5BdbwIHG6npLOKs1NHbRl++Zhgyn/1hqEnqgoziBmlfGvW4yGG2ryX7ZyCFaVY9RW1qV4n52NVCNyCnRFYgMxHgHGQS5kwaLCMPv3JOCITful9ieka6CCGAndDckHTYQR6XRYs3XstohFgFQhBCR8yjjpsT8fJJQmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=c886sJFT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G6E8P8L5; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="c886sJFT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G6E8P8L5"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1E3C9254016F;
	Fri, 14 Feb 2025 17:03:13 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 14 Feb 2025 17:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739570592; x=
	1739656992; bh=2qPwN79Uv5GTOoN5qb6sqVr1UhzN0N8IbfXzXbZmDIA=; b=c
	886sJFT/RjaBVsHLukqf80E+EOUHuPCaZlscq5oC15FNYxMFckdHZoaR6YWjC7AE
	dKp/6gbygQLQFYFj44kdgPjZ0DpI5IAj3Rl6A49fvc2YaXlXYQV3glY1s8AkTqVt
	5FILu2dT4m1hW51o1CFXYsOXVRTdehGD+v86V1W/HHwq87ycJ1A08ZMTcn2Gv+zI
	XX1DO+u3p/N+5omVhMaVsgp4p6XsrSY5EHWu4AfE9fXsnWJbPFk6467U1lQX2QGG
	L352DuNwSEMjbbuGlXCbW2or63NWtMkg3MqYRy+C4/qNpIWsqj5MESHgpozPT/ab
	WlwSuiM9Uer5NttycYL+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739570592; x=1739656992; bh=2
	qPwN79Uv5GTOoN5qb6sqVr1UhzN0N8IbfXzXbZmDIA=; b=G6E8P8L5upXF33CVQ
	eGKvVP/YRRB99+Q+6hQZUAtm9Rzp+RaNSQidTHce4HlCmRY/fwEXqFznSr5H/5fu
	hsUVwn90Vunr0BGQq0RhRSImQaRh1wxD8kPE3992t2VrU6oHzqGAWUYU+EN5TYe3
	55IPZx89ZqjTV0skchdu5z7EgADsT5pvjdr/94BzBVdagfF8pwlY7I7OuGWQc8T8
	keDNQrn41icPlIbCHl1pD6Xy7nmw7iz7mXgK0IvoyJ6pLpKhfP37w44yZoWmQkpw
	ovOX/0M4p92DUsOaTQd9wG2JplLLmacVjNP8yfJ0IOVVKgmIS3QYW7UJuRREC3Bo
	lwQpA==
X-ME-Sender: <xms:oL2vZ0jNIWSxA90tBoCBhsrSp5VdBZrL5QRtRZd1QENdcBnHi7N-iw>
    <xme:oL2vZ9AzKffXAcavpA-9xXAakxhRtTJLEPBOYbX8TETQ6gzlvXK133-YD6ozFuv2C
    WVXSaOylE100qMuRA>
X-ME-Received: <xmr:oL2vZ8FHOFyDtVNlnY-cBQF829_YLMwS5Fkabxp6tZ5W5fBC1HZQY_FoMzIQ1ERwDE6ZlQburkToGzCIp5bEaN-qFLh4SBYKYu5ReQdWPRm3>
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
X-ME-Proxy: <xmx:oL2vZ1RfPZ0ZwtsQ9HqDv1AcJLwtT1uI2GrnaUxZ992SiPnoND7XzQ>
    <xmx:oL2vZxzTegw3oasttG5vjBKmSzV_yYusUl7K2-wtnreanxMEq6k8rA>
    <xmx:oL2vZz6nrRCrDOPKDtRc9NjHPJyJreV5EC3D7rLoFYKRrEwwNeR8Jw>
    <xmx:oL2vZ-x694HVI7gWm--sEtiHVMY645sUIz7sbijHedPxRmzBQniHEA>
    <xmx:oL2vZ5ATAfXC9T4hxVycHX249nw_1UUtFd-h_43WG-jCVsqKsbUKC3_a>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 17:03:07 -0500 (EST)
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
Subject: [PATCH v3 2/5] ASoC: sun4i-codec: correct dapm widgets and controls for h616
Date: Sat, 15 Feb 2025 11:02:24 +1300
Message-ID: <20250214220247.10810-3-ryan@testtoast.com>
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

The previous H616 support patch added a single LINEOUT DAPM pin switch
to the card controls. As the codec in this SoC only has a single route,
this seemed reasonable at the time, however is redundant given the
existing DAPM codec widget definitions controlling the digital and
analog sides of the codec.

It is also insufficient to describe the scenario where separate
components (muxes, jack detection etc) are used to modify the audio
route external to the SoC. For example the Anbernic RG(##)XX series of
devices uses a headphone jack detection switch, GPIO-controlled speaker
amplifier and a passive external mux chip to route audio.

Remove the redundant LINEOUT card control, and add a Speaker pin switch
control and Headphone DAPM widget to allow control of the above
hardware.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 sound/soc/sunxi/sun4i-codec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 886b3fa537d26..f24bbefeb3923 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1916,10 +1916,11 @@ static const struct snd_soc_component_driver sun50i_h616_codec_codec = {
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
-- 
2.48.1

