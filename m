Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB074A08
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Feb 2025 22:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739570590; cv=none; b=VCG9FPzcVpNykIJQDiPtm8fVphkrfXMVk5ck/IXcSUK9Q6JsCQkHGX8NvBohgvZpZEjqk2PV2XVuEVzniuvGEDG7XRz7GPociK7QK0sOLNUvDKbZ+FWrU1+2mXmbpHyex8VNYDvMgpcc/CUUZ5aLMCRMLTDvuPjcaKC9/n84iQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739570590; c=relaxed/simple;
	bh=4ffj4HC4tu/PHI7cgsOXXER//acU6AvxNr0GPZrr5iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACmEsfb09N7ijKoPsE2PZK6kOqJ2SAi1Zxvce9itbSnku9sxqsy5keXKpXKg7cvoy7SRUNfMVWoTpwhqVWE5zaQAf+EHFkSu1R0Npt8DcZxwWfK3l5BsiipFqAZt3C8iBKwMI3ooTOLLP2ByvcnNNAbv0UIm3bYNNyh6StmMJfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=sH28oRQD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rlPDzohn; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="sH28oRQD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rlPDzohn"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 30B04254016F;
	Fri, 14 Feb 2025 17:03:07 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 14 Feb 2025 17:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739570587; x=
	1739656987; bh=uCaiF0dqbp4bwhlBinjrBKomV700hQl+mu+AYigkmoo=; b=s
	H28oRQD6s1zNuVS12lanjr9OjwABjGom6Klmh7VlRguzl3zedexO7k296u0fYrtg
	2JUHlICGJJ5mZKqmcrjdiaukDaSc85zYmeMrHcifhhoRSMV0PzQiEvRUaMZ8bk6i
	9itS7TOaqSwQDZpldO3Qrta9ypDl/pCpK155SF9EDjR7ilW+86rrO5BPWurBd10D
	y9/N82okwwyH4iPuLgemrzy+L8nyGP5LSrAv7IVEq42kgqtQEIR4mtnK/MNLvon4
	lTsa1hSf62EdSMZtgLjOtQs4UgoUkgMT41ZyU9jyeN7Cc/Bu89ETwxoYj/fpR+Rb
	6LAqGe4Yxb2AnhYb/x+ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739570587; x=1739656987; bh=u
	CaiF0dqbp4bwhlBinjrBKomV700hQl+mu+AYigkmoo=; b=rlPDzohnzWFPy+6Ky
	uMltyrq1QtSGMf2HOWKsajsj6W4RCj4ZujkOIaxJUYkJ9tuDd2jXJ6qSiBMlyUvB
	nZHmxvd7H8y+oOgakimd2skx4WM4JdtS+hr3uXpaszSWjRMt+x5Sz+goGzmDA/wJ
	gBz9UtKgjRm2ayPiqCjuI3OkqA58sjxbN6wfv+F9u1Kwr0pXFyLKvtIF2OqdZXXO
	ftAnIlrYznYFOnA39HBaGds/7hyxrKuYiqXuyM76akBYkAb5sjSRqIi3qvUlveXb
	wTA/TOPZg0GU1a1SOB1jzhCnot34Fx0zkAf2mfymxBiquuTRbrD6/tl7d2wVtxW2
	0A5sg==
X-ME-Sender: <xms:mr2vZ2n9V0aSYKgouCnSPKa_JKN_hPeQSbNgSy0Oc9H2A5sAON9B5Q>
    <xme:mr2vZ91X5fPT-vTHCnAfmxJAb9uxkEXcbIuW52cX6j_XSVCNzC8qZF7LxGUIVwCfM
    DqWv9cMQ51DxPGY8g>
X-ME-Received: <xmr:mr2vZ0pPs4IHMizTPWRVDZtMLTY7QF2Nxc1zeVUDbthGUPekWSbtt8SXOcsMS0YGOq7nhTXDSgD3HNLpcbJJqGWIlOEo_Zc4hyQPIwxIZipl>
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
X-ME-Proxy: <xmx:mr2vZ6mqsEg_3CuQjNPEpaUTsGMIsHMdnCmeKQRrR9-HV6jrAE2sCQ>
    <xmx:mr2vZ01EnMp4ht_FPyaZ0zxjvvaUe47XyUvZF1k4mzzjdEwjW_94cQ>
    <xmx:mr2vZxvfyOcEEZxx3Lzgx1jPLrleQr4T5rUp4CBNrQeAOHoNL83BYQ>
    <xmx:mr2vZwXSerK5mBWmWTmgnDvz_FiRqkoHryq1WIFuqRELPkj1sN65yA>
    <xmx:m72vZ31RyidI5HiD2gu5BZ0ZHdPxJ3dEHm3wMdyH-oBR34bzxG4BN48i>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 17:03:02 -0500 (EST)
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
Subject: [PATCH v3 1/5] ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
Date: Sat, 15 Feb 2025 11:02:23 +1300
Message-ID: <20250214220247.10810-2-ryan@testtoast.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Devices integrating Allwinner SoCs may use line-out or headphone jacks
with jack detection circuits attached to a GPIO. Support defining these
in DTs.

A number of Anbernic devices featuring the H700 SoC use this mechanism
to switch between a headphone jack and an internal speaker, so add these
to the allowed routing items.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

--

Changelog v1..v2:
- Remove vendor prefix from hp-det-gpios

Changelog v2..v3:
- Add Reviewed-by tag
---
 .../bindings/sound/allwinner,sun4i-a10-codec.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index ccae64ce30719..b4eca702febc7 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -102,6 +102,10 @@ properties:
     maxItems: 1
     description: GPIO to enable the external amplifier
 
+  hp-det-gpios:
+    maxItems: 1
+    description: GPIO for headphone/line-out detection
+
 required:
   - "#sound-dai-cells"
   - compatible
@@ -251,8 +255,10 @@ allOf:
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
2.48.1

