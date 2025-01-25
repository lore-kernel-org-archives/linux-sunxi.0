Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB55D1CCEE0
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Jan 2025 07:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737788724; cv=none; b=KoOKuw5sLgrgLSiLjg77/wQQlhiNp6ZgMCtwnbhKs/d2+LPw69lQ56PWyDGn4f0gD3blCo93tSXzmasDmpGosoLeZ2waspAVqnM7nuqZdRHz9RDAiNR1XeVdrbUgKoptf0+HzYRd6di1xRd8SD3+bLGc0bN1wKNoGislQDRSHXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737788724; c=relaxed/simple;
	bh=lgrTF0hT6hQ+HT9BbEqzqPP+3j+6xLiFGqBE8/N0rrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=llcHT857wS5LqDeuHDkvcOmgeBtXLuy/fJ/rD5M/1fr21NwYOUhARf9Z3FQrVmfxqR6M9TL4nnUIPsXD1fXXUPHm6bSaLmcwe1mdKwLK0fqwG3VBXKViqHkBkiTxqyjzWPpcMgvI0GhAG0YOQCam9GpraLoVQlm79n//1fqKKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=sVRBfj0+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=v2u+DZnM; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="sVRBfj0+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="v2u+DZnM"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 3EA3711400C5;
	Sat, 25 Jan 2025 02:05:21 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 25 Jan 2025 02:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1737788721; x=1737875121; bh=C9i7gm4WAx
	SUWE4yayXltdWJDnwH6ceARKDHxirqIGo=; b=sVRBfj0+MaZlDukOD5hReT6NgI
	lh0uIVp+Lbz3fv2xLDquWXv3gOH8G6X1YRcjDerLSSj/xvV70UYGZ7zvb1wbb7We
	0skXvBOo63LiwWi5y9b+l8Mry6Z48MqNqSscfgS7sAvpIEpQdDPLMVbyJsgH8EPk
	WB50zZQUx2u9cpzQ2NnPbX5lawS7nK2kImBL78REq9oAkCMF8n8faKyuTqFsgbrU
	io6HBh3PtIoeoydWpTjzTs8jtvBPiYgMi1hQ9U5U36kqiuHt5MCV/+Lhxu7boA07
	juqVSFUaA6y7UCtHfJHiWcFHn/UqqbVofkY3+Qg1CL0tQS7G0x63YN6SMIAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1737788721; x=1737875121; bh=C9i7gm4WAxSUWE4yayXltdWJDnwH6ceARKD
	HxirqIGo=; b=v2u+DZnMyOTKZJolmZf9caq1hXRxjaoG3wUIdZI7byacovVY+uE
	iAD+ecT23FAwKAamCIevSwmjk4ybJF+GmD19Wgt/tdhRCe0SkTelCYhlo/mrtQln
	BToQ+k9+qpVLSLRUb2HAuaPgMljDvjCk5vCZMh90T3zo1X+58X32V4LcHMg/BoKD
	krfK8U+sqgV/omvudGNq77nfTsvYsJ0105v8poMcLvi1biKnIr2BEjF4vxsWuqrT
	6UWuPohQxbhoFz4QZPoYnDqxm4WUg0w7QAusQeNEuBmtNDF2c55MNwY3Tpn8x9Kp
	8IYmMMud6FYpF9igesKKSkX/yJ/2qWgV1Cg==
X-ME-Sender: <xms:L42UZ_1hoYkfk0gHnFhAwrDXhTyTJiBvFeIKj5ZGUyu-zABfthbTvA>
    <xme:L42UZ-Ei8pr06ep39HAzdeV20bTYvUeA2uZPnXgv_tt0FXEMCLQEVtPxeThLFrjSM
    icBmV9WJnNPsGMqTQ>
X-ME-Received: <xmr:L42UZ_5XO8GmmJrMoL05_e1LQxVcySituHjwLaFfVoxbSMDjCR0QHPVqnoW9pQ8LNAf8eWzN7pdfyosrP3Gok9a7QXyear-qGTb0pmhvEazO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgieejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtg
    homheqnecuggftrfgrthhtvghrnhepuddvueduueegtdeuffetveevgeehhedvhfefuddu
    veekgffgfedtheegtefhhfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphht
    thhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifohhoug
    esghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtihifrg
    hisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhigqdhs
    ohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrg
    hrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:L42UZ00XXj7EQp1II1_6eGZHTy_kgqC3j2scXnsKpv5eE26G_PYSHA>
    <xmx:L42UZyHePpRkFETSkVOaywQJP9BhBuuTW44a11ybmkSqCHkO6pv1oQ>
    <xmx:L42UZ1_WqH9Cj3igKMahIzLvwe_wKDUyGCY-5vljhWikKbWd42C8Qg>
    <xmx:L42UZ_kxrn9z3IbY4yazrVWwef04WgQ9jIaLUS6NVXt0wTsoGmQTSw>
    <xmx:MY2UZ-FftMkN0oGL16b1r48GldvxnBTdXrWFkcizIo2dLxCEOzSigy62>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jan 2025 02:05:15 -0500 (EST)
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
Subject: [PATCH v2 0/5] ASoC: sun4i-codec: add headphone dectection for Anbernic RG35XX devices
Date: Sat, 25 Jan 2025 20:00:10 +1300
Message-ID: <20250125070458.13822-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All, 

V2 of this patch adding support for headphone detection on the Anbernic RG35XX series. No functional changes on this revision, patches refactored to more clearly represent a single change per individual patch, remove vendor prefixing for the device tree binding, improve documentation of the DAPM widget changes and associated UCM, and small whitespace fixes.

Original message below:

This series adds the required device tree bindings to describe GPIOs for jack detection in the sun4i-codec driver, adds support for jack detection to the codec machine driver, and describes the hardware configuration in the RG35XX DTS. The existing speaker amplifier GPIO pin can then be used in concert with jack detection to enable userspace sound servers (via an ALSA UCM configuration) to disable the speaker route when headphones are connected.

Thanks to Chris Morgan for his assistance putting this series together.

Regards,

Ryan

Chris Morgan (4):
  ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
  ASoC: sun4i-codec: correct dapm widgets and controls for h616
  ASoC: sun4i-codec: support hp-det-gpios property
  arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX

Ryan Walklin (1):
  ASoC: sun4i-codec: change h616 card name

 .../sound/allwinner,sun4i-a10-codec.yaml      |  6 ++
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  5 +-
 sound/soc/sunxi/sun4i-codec.c                 | 59 ++++++++++++++++++-
 3 files changed, 67 insertions(+), 3 deletions(-)

-- 
2.48.1

