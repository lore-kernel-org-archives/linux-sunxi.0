Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454231F2381
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Dec 2024 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734774105; cv=none; b=Sbmh9fFxHrvyf7BFEV3sffzASyokA8fCMwl8iR/GBnjFBaCXzKAtKQX15ALA3yHZlPCGhwAkbV5SlomkGjhiq2ss/0ZxOaiyavscGwLb6vRL8Iqrwi+sSyKt0juPCie4+Joe62DN3TGxyH1X8z65CkT25HddP+aSOclA/9lbUX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734774105; c=relaxed/simple;
	bh=mSk6wrsBbCBSa5Zmg7q18JEfXb98cH8pMkr4+XwOYac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yjuavf7COAF22ClXAMiw1Y01S+fPT5miLHTqsXvSnkMzz2awPVutLiCtVm7x/VOC8Tate8t0gyzVdBHXVRi/Cguivt9WLuDvLR4avbZ+eiDFFmLYqO2+TNE3vTIebIJKOdBdcqOyr0IdkOQQ0q653mRB8p2cMy6pdiwLU9tmI3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Mhpx/LR0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sSh9lzRm; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Mhpx/LR0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sSh9lzRm"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 595A4138012B;
	Sat, 21 Dec 2024 04:41:42 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 21 Dec 2024 04:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1734774102; x=
	1734860502; bh=ktgkOKk/4MreY3cyjWCANXcTqGH2vZ5XorZkiep5peg=; b=M
	hpx/LR09UiuhX/iWlvujHHjIko6U19/Z4xAzhEVteiK9jZa24JeqzRQdlalPaiIm
	oOn1jNZT7shr6aBjNGvVYDKSs5Mok0CIi5RrCo1bLxBtlOE3M3J7j7PFwaO6ufs/
	MaGJqlGS5ZBMh9W/LRp0FcwoR2DH/oL88Ech98EhMN0O7ZqIAceGVh4dk4G67aoj
	Gzf7Ntv2EKs92+PsLxSTl9X8DraSq8w+HXhvyUeoY20lUyufJEEI2f/WYUQIZA04
	qz1n0AQcJVVTxRpVRlKOrkAOgLaNRGBSgGz3ieIwlfL9PKiBxaC6wqHXb64gO77N
	TqrKJTcees4pICQNvSYqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1734774102; x=1734860502; bh=k
	tgkOKk/4MreY3cyjWCANXcTqGH2vZ5XorZkiep5peg=; b=sSh9lzRmbPvvIbUlJ
	VKUg0dBHunGRdqXY9HipfhSINqwGAfc7DU1KnNRGgee8AGdk1WoqiwlEEn4rsXEs
	aH6fFlzT0LNQzc1ZA3ssoKnA48rsds0dfoWKEC3Vd4PZ3TIPirWWfs/QFgGWgKEr
	8yp2HV+xnsdrQqji0YLM/Ahpfr0uAjQibkZShZE80sK/3CblO/g5DQr/RWpGjNuK
	KzqdzogSEXEdTn5UxfGBR4mN27RT/dLrHEzKFbjZi71GPlOijlM33SpP7Dh6EvY1
	ZxE0V0P6sBnbWt6C6LXtGlFCfDx4n64uvVBkXOrzCmaT2g7bbrsU3ymmppXLFD9S
	1vBEg==
X-ME-Sender: <xms:VY1mZx6bkb5GpI4J59srVcL11B-ZERQoLBUzGnJjS66Yx4-1bL3QtA>
    <xme:VY1mZ-4b-kAus49puadYkiFDOLkRYzBkbK0c0abZBE-nE_N_sAqQncHYkAt_XJPP3
    hx965PSLEYi37SYtQ>
X-ME-Received: <xmr:VY1mZ4cQXnqQwlQkTLkBEFD-ZES9D5PpyHHOQeE94QyoBYRGr-6y0dqGciaRjfoDLvW9eskHkE_9qXPnHBDs3scWSkeFxhfEX6O8w7zSENGY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtgedgtdejucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:VY1mZ6K_PTC_TpnClRqxD93-7UcGvmtCy1ic8jEEAr-yaCy6eupF2w>
    <xmx:VY1mZ1LoEWaaHjm1XoSVTCWDarEwRskvxwJOY-Ir4c6g4GR3WlaM2Q>
    <xmx:VY1mZzwz2FQZTNhRo4WmZSIyyeyfVETd7--2RxMWH9j_eoMvFtRkXw>
    <xmx:VY1mZxJKAxSVl2YLbFgzfOXUXbSEOV2hEG8COUDtDb-LtIpk34fzvA>
    <xmx:Vo1mZ8aLRezZLQaSCkvJvfHqAs_YwjZ17SWplEPpVzOG_JMtZ81S1sgE>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Dec 2024 04:41:37 -0500 (EST)
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
Subject: [PATCH 1/3] ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
Date: Sat, 21 Dec 2024 22:26:32 +1300
Message-ID: <20241221094122.27325-2-ryan@testtoast.com>
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

Devices integrating Allwinner SoCs may use line-out or headphone jacks
with jack detection circuits attached to a GPIO. Support defining these
in DTs.

A number of Anbernic devices featuring the H700 SoC use this mechanism
to switch between a headphone jack and an internal speaker, so add these
to the allowed routing items.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../bindings/sound/allwinner,sun4i-a10-codec.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index ebc9097f936ad..b4b711e80b65a 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -98,6 +98,10 @@ properties:
     maxItems: 1
     description: GPIO to enable the external amplifier
 
+  allwinner,hp-det-gpios:
+    maxItems: 1
+    description: GPIO for headphone/line-out detection
+
 required:
   - "#sound-dai-cells"
   - compatible
@@ -247,8 +251,10 @@ allOf:
         allwinner,audio-routing:
           items:
             enum:
+              - Headphone
               - LINEOUT
               - Line Out
+              - Speaker
 
         dmas:
           items:
-- 
2.47.1

