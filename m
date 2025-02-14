Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F026A1FBEBF
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Feb 2025 22:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739570612; cv=none; b=fIxo98cF+QZkEm0FBvFGvnaEo2Fs4JqeNY2KbzFVA9lsjRaZP00PEVDMb2FpGJX8EdvA93f30JzdHpR/eWA1vxW5XQx09Vo8sh9thAH7VpPwz68OvsAT/wsk6exWKyqmGJa441WB+zb+wgAS2k6PitPb7Kgai/NlJAuQ5etWtlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739570612; c=relaxed/simple;
	bh=C1pSc+Q88lWwv8lyzUEZsi+O8dQyzz/w4NmzIChw0I4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJ0efvfM6SKoB0m5lQe+CeW7MeOFBrozny4XIViUoTz94YAfhG/7kN5Uo7zxy7c/j/c+i+5+0kg/4fYUqJ0ZiW1OSkZ3oIaWCFmI4dXCCwMuFrutbc+RbZ0KDWpyTB0S3vYEH8HpPPdDzYMsStqu6arRqjuBpkJvkP8mftTuKM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Ebm2AD8T; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qk9WjaBg; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Ebm2AD8T";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qk9WjaBg"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id BD7AD11400E1;
	Fri, 14 Feb 2025 17:03:29 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 14 Feb 2025 17:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739570609; x=
	1739657009; bh=gTke6NecdvaDv8ZvNHp8Udw6/L8ag3GpaDjR8TobllU=; b=E
	bm2AD8TMqXNNsfgC2vUjpOf2c5IJ4IFSFrvzCqYSGdA6o86oFkLDAeV9f0lE01wR
	rQEkZ2zuo1D4bM1oN79/kqd4L9j3e+5I/0IXpHNKCDCTrF6w0rAGpEibA9Eo3HR4
	wmFzPRJlIWiNgroFrnR6Oqhtzt2xw+dJwMrxbozdr8F4JoK5xHzsBQPPkuY+OClm
	F7NouZDzY4cg4+LiMZIvWT9QaUkvva5mP3TGL3VIN9dCbn30eBSxJm+jsIxxRf87
	7/w0V2YSP4pzvStDauhdOXiHD39Qt149H7vpjpJ+1gUgxM3BB44bTZ7GxJ4RqHXf
	OkK5qpaoByDCD34NXNmqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739570609; x=1739657009; bh=g
	Tke6NecdvaDv8ZvNHp8Udw6/L8ag3GpaDjR8TobllU=; b=qk9WjaBgPkQweCi9l
	bljhlilpSmnnKxuGgXp61UxqYVTtu1wuhRvLuALCAuZBkhUCKiyZ9eLQUkHoWFLd
	3+6DUMXu5LuJAXAzNuTsYW/uiqe/PeXCq8XJOGVr8C/cbati1WnvU0BlxWzaN7Lk
	3bofUSa1mcYHioRjDkCS13b0WLW0KBLJUCy9yJ0yh/64GFSz9o6OX2ypS2JNviu3
	kK0pvmuFFOGitb7to6CX2pQiMTgd8VbU87QhaEQGLb/Fz7EVOPUqQZQRzeMmeb3j
	SmmuDocGi0LksOkxtQL+4oGkq8my7ChndpeOWb8h/io61xOIOqX3bKXJELaEEv/7
	0OhyQ==
X-ME-Sender: <xms:sb2vZ965bj3wDXGmpLSgqOl7KGmRKnm2vGHQByxRr3tTE5O6kxlFLg>
    <xme:sb2vZ66zwMcuXX4bf6suR_yUb7bkeb7r-Ag0yZbaXK4wDVFYtjcVDbaDlrGtGAWpR
    meq9wltxMMpP9HakQ>
X-ME-Received: <xmr:sb2vZ0ctQ67_0vZ_oTjfGeDC-w128Qm20PFIodMr5gjeLi-M_fX3KRuZr6D9U7NG1GnHQaNm3uZ2NFfsmVsFVuAf8D5Kw6tdqZz2MnH9boQz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepjeevhedtjeeuvdeiteelgeehjeegieeuveev
    ffetffdvudevfefhudejiedvgfdunecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrhigrnhes
    thgvshhtthhorghsthdrtghomhdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvrhgvgi
    esphgvrhgvgidrtgiipdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpdhrtghp
    thhtohepfigvnhhssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrh
    grsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishht
    shdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:sb2vZ2J9nyHit3mtK5G3FqZIQDyrbCWBw-yECW_Ph8yk2rHbSP4OXw>
    <xmx:sb2vZxIzKmrZmcYahuk36aP-feetw6ho5x2PZiF6h5TUBVD8QXtO8g>
    <xmx:sb2vZ_yGWE8H82E5x9ulrXtqMoUNXhW16MglSDpKFCjB639VfcViqg>
    <xmx:sb2vZ9Jy5bwDdA9Ld7MYEmFppEZMC31AqrexI6OSv48GXEjchbnAXg>
    <xmx:sb2vZ64UdEzLeQeGzmY8s1S8C2cthtzJH8TMNtgGEGXX-b1PfVlkdVRm>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 17:03:24 -0500 (EST)
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
Subject: [PATCH v3 5/5] ASoC: sun4i-codec: add h616 card long_name
Date: Sat, 15 Feb 2025 11:02:27 +1300
Message-ID: <20250214220247.10810-6-ryan@testtoast.com>
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

Adding jack detection requires sound servers to act on the emitted
events, which are described by ALSA Use Case Manager configurations in
userspace. These configurations include the long card name in the file
path (falling back to card->name if this is not present), so add a long
card name for the H616 without spaces, making UCM referencing easier.

The corresponding ALSA UCM patch is here (now merged):
https://github.com/alsa-project/alsa-ucm-conf/pull/491

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Separate patch for card->long_name
- Note UCM patch link

Changelog v2..v3:
- Add card->long_name rather than change existing card->name
---
 sound/soc/sunxi/sun4i-codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 3701f56c72756..93733ff2e32a0 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -2013,6 +2013,7 @@ static struct snd_soc_card *sun50i_h616_codec_create_card(struct device *dev)
 	card->dev		= dev;
 	card->owner		= THIS_MODULE;
 	card->name		= "H616 Audio Codec";
+	card->long_name		= "h616-audio-codec";
 	card->driver_name	= "sun4i-codec";
 	card->controls		= sun50i_h616_card_controls;
 	card->num_controls	= ARRAY_SIZE(sun50i_h616_card_controls);
-- 
2.48.1

