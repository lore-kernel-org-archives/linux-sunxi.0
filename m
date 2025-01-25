Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018E218A6B0
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Jan 2025 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737788733; cv=none; b=aQ0Gq+WLU1wnpv8Nfj5LHCpSDIWiQoDyGXD+ZYjQUsP3JOBGEcOzRG8OFeD2tnCNrrGhubAKU/jtRR/d4FYUUlx+ogz9HVTIO8nBndPU6JYz5yh1+rwueM7uUQ450DouvWAGrONomxFYoO0hCifsAU9mc09xJ5dB62eYJQVG/ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737788733; c=relaxed/simple;
	bh=ySY15j5ssGCrm5GiFAsZxmh58WOHzQ5ECiuYRM7RpXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4nXAkvIFdKfTh7E/i5YgaQpk2JoxQ1HZrfzT31kqC7ch1dhQjV4oDuqu8OVIdMz0OvDqYPn/ULNVqcpZFJMHwhy71aKmJ924qRe4x0VuUyzC1wkfT34ExR9PYDZHp2QJpTucxIbbuTGDLVu28cf0Z5fXfT09RjqAgghqCsPpBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=g0izeiBc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ErDzVATw; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="g0izeiBc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ErDzVATw"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id D338B11400E6;
	Sat, 25 Jan 2025 02:05:30 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 25 Jan 2025 02:05:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1737788730; x=
	1737875130; bh=vHn5rroylHzuQrtAoY3TXyS5Zv+3P1p2kiq3JFX8d1Q=; b=g
	0izeiBcvSriI/RABTmoXVPr9G7V8F3p0wb1QvxZwYZZaKAgGYfIjxvJnrgoltrqE
	GGtjHMmZvjx4641+nekNM73TR4wfnr/GyJX7caaI+ebp80lNllWKQo4BR/LUihn3
	xPCe4shmYGPdvvwHLycz+ymwTJf+qUwc5pCPIde3kY4wrLye3Stb0FwaGw3Sj7iZ
	iwIKWPFbjpObjoIL3W4z14flMduTslDpcZwZo2YgVRrflx/Ut+AFanKZlnCYy6sQ
	LcVqJ2Do/Wcv6TncS32kb6D8Pj+1/51rhWh6FF7gmPrwf6x2wkm3EOLw5VQjDxjZ
	uECqF+B4QTqm/gtnaskhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737788730; x=1737875130; bh=v
	Hn5rroylHzuQrtAoY3TXyS5Zv+3P1p2kiq3JFX8d1Q=; b=ErDzVATwQcnagJtxc
	StmGAA5CJEl55iGGGMM4M9zbSNuAt466EiI0QD6LUAroHxiAEkeHP5GZkBvZlk92
	8WLMJHdJl3/xxWevKudh8NqCwnMWBy0012NVdN7B+QsfLIb1khI70ADThvHwqNJf
	3a7pWOMs2DAJCUdSf/2yjimOSwmgFjtu1+M+tLSBN6bWlYYsDL7LRxZn1Kqc3ero
	TIpVR2WV7vb57Xd/BUeUDnncfXLF1eHFXaXKOIdMC2K4PMjeXbnwriMgMK5aymMk
	Etf8ds9dA6E1on25rNlkUfJECfbJTfNZZDPuqia97D0bitEgHC4w5e6zOiSf/Kii
	Cl7ig==
X-ME-Sender: <xms:Oo2UZyg5mBt8-vLyPqUk6XTbJ7hqACnY5OzaLwhK8lEt-_c0FMgs9Q>
    <xme:Oo2UZzBiACzCctWh5ATiB-nuWRQzYcIzKcohMQat_8bcEy1plv6VvMUI_iZG6lCL-
    qmAMLtNpjE4bucOaw>
X-ME-Received: <xmr:Oo2UZ6FGATAUGmSObVpyNg81hXQmuJFKYiJ7-k-oJJGkNFZuLD8Rfhdbl1J7fF7Tu5KLNT-Y1eXiHNgkviyGOyEKufipJEE4pk_Nc7bt-zuZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgieejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:Oo2UZ7QkT5XcEM914r8FMsU3EPx_gL8kesYyPPw3YX4cREIxKCNtPA>
    <xmx:Oo2UZ_wc4NfRNmMmS0fyx7CN4lmJhcHUNqo4OuvQWU9X61b9E_vvbA>
    <xmx:Oo2UZ55brQWKqrjPXsE-FvV10QhIQSZJf8unlF2O6mEhn1w165GqWQ>
    <xmx:Oo2UZ8yHZRcID_7BsCfUsU4mdBFXLfT1mfUZ-Ca3lIbjj6_O3O0Uvw>
    <xmx:Oo2UZ3hg0G39QCbuFMkEoia0nLkmkET7c3q8dQB1iEhkMqFK4rzIP-Hx>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jan 2025 02:05:26 -0500 (EST)
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
Subject: [PATCH v2 2/5] ASoC: sun4i-codec: correct dapm widgets and controls for h616
Date: Sat, 25 Jan 2025 20:00:12 +1300
Message-ID: <20250125070458.13822-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125070458.13822-1-ryan@testtoast.com>
References: <20250125070458.13822-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

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

The LINEOUT route remains defined as the final common endpoint
for the codec's output, and is referenced by device trees.

Remove the redundant LINEOUT card control, and add a Speaker pin switch
control and Headphone DAPM widget to allow control of the above
hardware.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Separate DAPM changes into separate patch and add/elaborate rationale.
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

