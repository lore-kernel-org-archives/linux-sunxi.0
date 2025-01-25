Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239A81DB122
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Jan 2025 07:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737788728; cv=none; b=NLU0v92uONQqeKOKjvbc7WScy+Ejz51kZm77Des+FEuAemRrc4SlsIM6STMo2/oyyaiWoJJG5B8Y95bd6WeEl/9YMLS/+ZDw+/7RHjVC5+dLWp1Jb+13wofFEPHmKM2DkcUNi9g2zh4jhQwoY3wsa8ybxVcH6xCiYqvb9LLSfQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737788728; c=relaxed/simple;
	bh=CkCuMGNYqNDSIpYcQ4sUvuNkgq97hDNdz6TvTAJidY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8Xg0MpYO8+db7pp3wgqhz6+PIk4Je5MmHsE5D/7am7kPeUmS80vppniG496jRJiLMAJOKEDn+P70C3vIWKG3IHQ0sjiA/iY9BpxmYF9IqM1Fs5DsLjYZxjRdj8HBohih4AxfiEz4DbUiGC5tk+xzx5sLOMQa9o7uS8m9hKY1wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=oUXtML8V; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hV8ZNZma; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="oUXtML8V";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hV8ZNZma"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id E845711400EC;
	Sat, 25 Jan 2025 02:05:25 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 25 Jan 2025 02:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1737788725; x=
	1737875125; bh=HdIMwhJ8hC1QC8RbpwkAhUuLla40fvTl8JmybcX17Ek=; b=o
	UXtML8VTe1AS5ZbXENmEh9Y41Nq6nF1YxJs66muN1ddyCMh1NTQMnvRdhH+7QAFh
	rBh9zy3YEL4hSvLTdUL2b3QnM0dNfQKRJDP91KVIgoEqipBR+A2+hoNJ08Rw5JDC
	3ST4FklzZQs9GiqUWPcKq2L/uJMwsCOQb85fzyaaFMG3iQadOGczi8SsTonvIYFk
	v5dDawqqRVtE6XgxRSs54rfvGbOay+BsWIT7z3nqkU+Ns3OUG3/UXJiysuQWrygx
	PF0aiWwcUiJ7iYTBpPCMbtCalb9D4V7TwsguNq1BS567jDnHs9OG25YD6jLEmgAO
	aq3PJim9M6Gyt4dNNHVAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737788725; x=1737875125; bh=H
	dIMwhJ8hC1QC8RbpwkAhUuLla40fvTl8JmybcX17Ek=; b=hV8ZNZmaoob38TAJQ
	P5dsajXdf1E2E7xbXHtxU3O5VKmhVZ/HXjhWsWAULagmUI/cRzXYwOG1CNQQ0jEf
	KdfgzMkjEfhdMJwIepC97dJUY/i9L49qt9vxOhFdUDfmouu14AgLWNWC69Wb9m/f
	WYTmzyILS5xxKlSsKa4TcN5jq/wwR0j2DKGoBVtWB/OrlXWf6Zdj4QL0JURYRWHq
	RgJRK5/H1UWjyPrao5VNcPukTQUeyhMkq4t9SkpyYbDNqFC/4tj6JFpegL3lF3gy
	7bSLDLvTGEdh7Q4+kmmiKMXzcpxEaWpED5fIug8cvo0ZDWoTZJBnrHzhLMUO4Rj0
	JkB4Q==
X-ME-Sender: <xms:NY2UZ3W3amUC1Ec3Y246_WKUpsAzE0NPIzzTgKF60u6qjxGbWDhFSg>
    <xme:NY2UZ_lWFe00dNaNz05RFY882x5PDyWNfOeV3NEQcaSrgPZsuiyC4FWBNW6ZwQW5P
    cvw2zAcsNppKycP3g>
X-ME-Received: <xmr:NY2UZzYWJjFT5LDFPD5vG4j6PIH8tNCGwrnJR1OHdvKQbeAZQzs5Llqkf1fVFt-zfvZPsRVAyNDMdflPCJqGe-Sa2hxPN1-fAlGXGjgubmMm>
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
X-ME-Proxy: <xmx:NY2UZyVl17cqwAKaG98tsBBcziq8AeiRjZfSJnArdu5DT2bNiSW8UQ>
    <xmx:NY2UZxkT9VuCLubmGgVIRPNiV6AQ-yc8HJBInZ8tE_9FGL8VD5QrYQ>
    <xmx:NY2UZ_czdCCUOzHlPcbWz36rbBcOLEc3OVEUKnYqtllypjkNZ2jeVA>
    <xmx:NY2UZ7Gbe8RE4iFBIqYrmuq6N1QJZnqbkxYYQF74CZCHzYDeg5Iufw>
    <xmx:NY2UZzk5oRLVFhoVveMfhEsNpJcax6W1XnWfP9B1MZLH4zrdBg1kvMZp>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jan 2025 02:05:21 -0500 (EST)
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
Subject: [PATCH v2 1/5] ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
Date: Sat, 25 Jan 2025 20:00:11 +1300
Message-ID: <20250125070458.13822-2-ryan@testtoast.com>
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

Devices integrating Allwinner SoCs may use line-out or headphone jacks
with jack detection circuits attached to a GPIO. For example, a number
of Anbernic devices featuring the H700 SoC use this mechanism to switch
between a headphone jack and an internal speaker.

Add extra routing endpoints to support this.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Remove vendor prefix from hp-det-gpios
- Amend commit message
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

