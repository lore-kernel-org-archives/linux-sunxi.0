Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C691DA617
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Feb 2025 22:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739570584; cv=none; b=aXmpdhaIy8sQYLSiY/3+YNz3eajIcGZJZ4hkQGG/Vff8onvue9oOJg0CmFilxZ9OQKzieAECy6NovWEpCmoqUPMEtAuWjCvMyuPWMFbxevAHXHAm7oRu44YweiTgHEkcMn3aeNMYvxDCkXupQ3KNclbCu0OZH6mpoVHNW0HGyek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739570584; c=relaxed/simple;
	bh=WYbL5uHopMCL/NKIC35v5HCLxP08fhYWzZiSg4isG1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UrT0CE/pJf+a0rSXph1G7GNBxAyg+5ykwqo0mLXONvWHZFu2I04A4/Jqu9aIZt9fBQ7vJPju+iFu5yZNzgyEFhvj/wGvQdodKM56ZKjRm3ABqFDxJPrTBOX0LKGrZF/e9Qh75t1gbSSxoRpSqDaf6sLZYGZlb/rAG5TZogZ46ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=NbKiz7/R; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wlt7ETHk; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="NbKiz7/R";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wlt7ETHk"
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfout.stl.internal (Postfix) with ESMTP id 5180D11400DD;
	Fri, 14 Feb 2025 17:03:01 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-13.internal (MEProxy); Fri, 14 Feb 2025 17:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1739570581; x=1739656981; bh=MHNT3f5hLj
	cnetnq/l/svzTI+IIS4M2adI0Mbcob3ZU=; b=NbKiz7/RaZFMjgt3hOlUtFiMLg
	c9zTfn6uOXVDsAk+3X4wJ0aBfG+x4bWuPVxoiX1d9/4TahGJtTw898mmr1Tm5lnn
	Vf3eTt2VXYOeRslg8i2oruAgbnugJ6L+Km/a6Nc9s4dS2DzK0zdsAXoPdR9YQRUx
	BwiSV9BkJ3QVI+9ucN4Ih4UvoVQaBqB+El2wdLcFvWBYFUOi+5pnBmCmf6QITSuw
	3uUOtdkqerOmDlp2JXmRJ5Q641u1/8wiIruihF2WH+L+ARNxeKBnOVayy+EvgHKX
	9T2OPCTmGFWVav85VbIRhbsTVvf5vaQanZhjFYu6aZTMTHw3Jz5txI0gavng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739570581; x=1739656981; bh=MHNT3f5hLjcnetnq/l/svzTI+IIS4M2adI0
	Mbcob3ZU=; b=wlt7ETHkKuRO8oluKoAUczwLLXksyb0a1NSM/Nk8aEM9wbwK2X8
	rkdCdst+cARj5e2n2g4jQVeb62P0SBZzD6ASK6y3a/WVSEXwpg0KfnRXLL7narA2
	ZrFEnfAp92Nl08fphjLpyaczAQQTnB0WNsEUq+LaYi5iobr0Oh2rgns6Z8RPrTND
	lI8+Ol12sWLsmFDyD3q+pY+5vgAjJRamsSYEnsneXBBBoEx1hynpmsaW6EC8NKQ0
	K84FXhHdoSuSC1QKdFaCiqBVZRDQ7xNrjKcMx7Wl0sfNxTvoS1VqWQApPqSvw/0+
	tWbndrxK0z8eCoBHXC4s3tg8N5z7rD5SfAw==
X-ME-Sender: <xms:k72vZ4FveCpoa1EWFamhDMmP1Z-u-5sveN-tWxzAtuEOGyBK0PEIrw>
    <xme:k72vZxV8VzqpO1ZE5Y8uAkE35gKu8jexAcL4g5QOBtlU08_KpR4vVxKQjTEyMO9k7
    ym8bdTq0NTsfphr5Q>
X-ME-Received: <xmr:k72vZyILdwF_FZwFB2JoxIt0niNfXmg3gVKTmzcS11FYmIVra71SDsjPsED7xHvD2rBOU_2SZ7bZ-hfdMwsLSP1BDsfXSJDsnqWDdlVOeABr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtg
    homheqnecuggftrfgrthhtvghrnhepuddvueduueegtdeuffetveevgeehhedvhfefuddu
    veekgffgfedtheegtefhhfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphht
    thhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifohhoug
    esghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtihifrg
    hisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhigqdhs
    ohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrg
    hrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:k72vZ6G165cYoQa4MW_roGOJ6h_k6pmDbfJOVAB5KD-7QQOd-X4HUw>
    <xmx:k72vZ-W_Or_hDIVpyj9c4_YvxcuH7XlifJBo3aDcGRhpY_LoPoMwOQ>
    <xmx:k72vZ9MObjL93MKzL9OgWhbtZvkPQJWEP14raAGj7-ZZKwxZ5qO7Cw>
    <xmx:k72vZ11zT3FZX46x6erYjeCbS2ikgwzEfos2ATs7Y8fNzQ4KW3mKpA>
    <xmx:lb2vZ7UCu0iLcG11RIKklqkLh5B8Qt0e7F2vdYdJyWWwskkzSTiV6rrx>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 17:02:55 -0500 (EST)
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
Subject: [PATCH v3 0/5] ASoC: sun4i-codec: add headphone dectection for Anbernic RG35XX devices
Date: Sat, 15 Feb 2025 11:02:22 +1300
Message-ID: <20250214220247.10810-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

V3 of this patch adding headphone jack detection support to the Anbernic RGnnXX series of handhelds. V3 corrects my misunderstanding of derivation of ALSA UCM file paths, and adds recieved Reviewed-by and Tested-by tags. Thanks to those that have reviewed and fed back on previous versions.

Original message below:

This series adds the required device tree bindings to describe GPIOs for jack detection in the sun4i-codec driver, adds support for jack detection to the codec machine driver, and describes the hardware configuration in the RG35XX DTS. The existing speaker amplifier GPIO pin can then be used in concert with jack detection to enable userspace sound servers (via an ALSA UCM configuration) to disable the speaker route when headphones are connected.

Thanks to Chris Morgan for his assistance putting this series together.

Regards,

Ryan

Chris Morgan (2):
  ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
  arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX

Ryan Walklin (3):
  ASoC: sun4i-codec: correct dapm widgets and controls for h616
  ASoC: sun4i-codec: support hp-det-gpios property
  ASoC: sun4i-codec: add h616 card long_name

 .../sound/allwinner,sun4i-a10-codec.yaml      |  6 ++
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  5 +-
 sound/soc/sunxi/sun4i-codec.c                 | 57 ++++++++++++++++++-
 3 files changed, 66 insertions(+), 2 deletions(-)

-- 
2.48.1

