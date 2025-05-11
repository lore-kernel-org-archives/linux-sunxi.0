Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D331ACEB7
	for <linux-sunxi@lists.linux.dev>; Sun, 11 May 2025 10:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746960086; cv=none; b=jG+SbttbMF3rNk0FpvdS18P1rk8614Fwm4hDFcwQNyzk5Zsz7wkLa4tsv7Kn1NGs2V1mCeBGPrAjluO3pTisPw2sQWjnjXv9rIGR+Kh7gXtsxVqu2bt2E33bhrGldu4+kTrSFIbOt+Szgz6QXH1+dwuEXc68XXuoFoeIBNHeGdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746960086; c=relaxed/simple;
	bh=xXdo5iBGC+4woAdIZFbFA3PJ3ghvWgMfs9dVH6C1j1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hzY9x+vagGPBnUVONA3QZjfqWKP5F8tspKL3nw5esJ/yMEnN5irJ0BQuOF+KuVrWKecg2p3qq2t3NhNOv3CfumXFkVp/+QB6hqM4MjT3a74/q7vYlpK1Vs4KlhTGB9T/h3DOB8LMACXFBD805tlcsORPIhqrnyjN8tw+CgK3dBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=ROmWQpew; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gqgVpIfc; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="ROmWQpew";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gqgVpIfc"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id EA53F11400A4;
	Sun, 11 May 2025 06:41:21 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 11 May 2025 06:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1746960081; x=1747046481; bh=X8l9XDI6Zd
	3L0/8GlEJf0edObvK2gHwzfz14+hTGZ4s=; b=ROmWQpewPJ7Msza+whUfsBknAy
	0WmpX4sAO4KPuv4Pf69NG12pOC2HLlcjM4yz08FAYLLktSsjso/DPgWWi0DxtbyN
	PXSHu4vni9RcVTPV0JOhYijFjftnOyBe7f9zrDT/ylaGNKzqZWbVO3z2QTUY8ETB
	pIPl2ibaNv4RUXKQDIB/lDcJ0JdNUERC55dBjeZYGmlEN5eu7+kEGTPrZ3Lsv5sz
	zp06v2UwzZ3pFJp5G5xPA8Ll5IetQYHypeEfF9bD4+8vqIEkOesD6A0xc94SXRb5
	TrI4gjTgmodm9XIi7BMouuNnnoRrNU4Xgcb4APH2HMh5fJFDCfs4jG5B2MFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746960081; x=1747046481; bh=X8l9XDI6Zd3L0/8GlEJf0edObvK2gHwzfz1
	4+hTGZ4s=; b=gqgVpIfcVoPyxFhN0PVTHsYNcy9FyQfaErclbXEKl3Q1/UlE1aJ
	xn7f6RcJwE+q5CafIhokuQasRrLA+GqUoKrkNOmHakwdaKnflrJ6Mvyy6tPNWpDO
	SJQhrbaylYNH0cGyBNdc4U0JsK+Y1PlTmmjsGdhzix/zVOdYtXYwe8AUsHT/daND
	i7AyzWOusOvuwagzbY3JJd6BJ6vJf6N8bPToVZANnpbpz9IDfqawRwDjVXyFBxp+
	LfETqjx5ojZ3P8UCIFquGKoJyTgKLrRX9WR1wEP+FTssfVJ7MMckJ9TrifnPiev4
	TQ3LAgO/KOi8MZZcsQo5WSigFSRo241jncg==
X-ME-Sender: <xms:0H4gaPu89O1pOqosgitS4eczGXIoDVrjhWEr1yP0omivWI6sQqFvxQ>
    <xme:0H4gaAcVWFyeA2oe6nyNdGvJ1kX_eC4U_Z4_2qjijm92E65kgT6907FR0ksHQqI9z
    JjcyyLrbqwOoINSLw>
X-ME-Received: <xmr:0H4gaCyWOeAVo3bb7QeMuuLPzflGrqDR_5LGDxkYeRx83Dyg2ACVnMkbSRzWvFI0MMNd2czqTb1qK8aGzVLUeAQ_EMLNJSNGEkxbpP_3uLA4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleekudeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfedu
    udevkefggfeftdehgeethffhffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:0H4gaOPk4xJrz6uxj5siryAcfovkI0XSzsWe__GTtEuPouXuDFI5vg>
    <xmx:0H4gaP8qNOKq37d_PpXz2f7-OTsMB1Nv2HPyeo7we1F-XGr1Vx59tw>
    <xmx:0H4gaOUE0nSrFZnzT5djeEtvD3EK71u4R0lZzUX4HFZV7M5iFSPdlg>
    <xmx:0H4gaAdli_lPENY2e5jkLEkBGTbtiSN6KTpjphxhSJzyRegZcHAewA>
    <xmx:0X4gaHHCjFmmM4Csj-YzJh_iAN1y7mK5dx3HlK520GN8HoWgZIF5V8FV>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 06:41:13 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v10 00/11] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Sun, 11 May 2025 22:31:09 +1200
Message-ID: <20250511104042.24249-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

v10 of this patch series adding support for the Allwinner DE33 display engine. This version is largely based on the previous v8 patch, with Chris's changes to the mixer bindings in particular from v9 to add names for the new register blocks. As discussed, the H616 LCD support patchset (which are largely device-tree now that the clock/reset binding definitions from v9 have been taken as a subset) will be sent separately with the rest of Chris' updates.

As noted previously the new YUV support in the DE3/DE33 and RCQ/DMA shadowing in the DE33 requires more work and discussion, so that support was removed from v8 and this patch supports RGB output only.

Regards,

Ryan

Jernej Skrabec (7):
  drm: sun4i: de2/de3: add mixer version enum
  drm: sun4i: de2/de3: refactor mixer initialisation
  drm: sun4i: de2/de3: add generic blender register reference function
  drm: sun4i: de2/de3: use generic register reference function for layer
    configuration
  drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: mixer: add mixer configuration for the H616

Ryan Walklin (4):
  dt-bindings: allwinner: add H616 DE33 bus binding
  dt-bindings: allwinner: add H616 DE33 clock binding
  dt-bindings: allwinner: add H616 DE33 mixer binding
  clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support

 .../bus/allwinner,sun50i-a64-de2.yaml         |   4 +-
 .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  34 +++-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 +++
 drivers/gpu/drm/sun4i/sun8i_csc.c             |   4 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 168 ++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  30 +++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  27 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  14 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       |   6 +-
 11 files changed, 252 insertions(+), 63 deletions(-)

-- 
2.49.0

