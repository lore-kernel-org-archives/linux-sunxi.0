Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADE9206F06
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Jan 2025 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737788743; cv=none; b=A/9W9ao1/+1te2u0job/wQz6ehuf/cnxQuFNdVOZKNHsy6rcLC3XtJVYdsP0/DOZNYa9nR6qXhxHh/4o476FguOEz/Qs9Gxrd6NK5p1jtE9fUUvICJbTeVuMjZKCy7+mQI4SIZ5s6MC4Y0A2+BuAc8LU84kpP7T47m3aDt8TEQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737788743; c=relaxed/simple;
	bh=MAIv2p5psUoqy9S+PXVUqW6L0zZf5xVdUiH01Qxp168=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UvmF88EkihYnL4a1bw0/m7IcKrAPp/RTtIQDRvJgKDXQNTXPRnHa53Sp9Qx9djQ6sDpRrQ/LBznhrWLMllxrGPDXdrPrBeP2rMKiyW9RIX4al/quLXQwEGfwxrH/J9ueJxPJwoRuLsNUUghkrUUVn8N5OE5vwLYk4F6DGifP4qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=rRdX4bN/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h3IwaLEn; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="rRdX4bN/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h3IwaLEn"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F214A2540109;
	Sat, 25 Jan 2025 02:05:40 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sat, 25 Jan 2025 02:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1737788740; x=
	1737875140; bh=hLsGe+Pf+NJk0N+fJlpAq1eWp/8FyDIG5iZXZV2pPus=; b=r
	RdX4bN/DWi7OAgkNY45u0kt/vTzPnSMRElz3f/snNFzroo23T7QpXoDswna8W7v4
	g1BIrX5ZqV0ylVMRQwoIJJ6PYzOYkG1y3cQ7bZZQ1ZW0qN9ZK6IKFMkDk+iEOpEd
	xOmPryn9S6PMH5YibDzvhUzT4H15AkwKqSE25+K2U3Ws7ZvkdSKypKWB3vYXknbb
	4UP6FFhjiRGgBmJKEm+vA5CZ3A8FWuwY+2skIlZzZmb+/AdObxTXSz5WvO/ce59d
	aSFf816T4sfQ0CgIkDCQl5lqgO0RMKQD71+f0lzmI6etbrTaNbFANOzuSmDeKvKS
	R/Gc0TiCvLnvipZIzT4ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737788740; x=1737875140; bh=h
	LsGe+Pf+NJk0N+fJlpAq1eWp/8FyDIG5iZXZV2pPus=; b=h3IwaLEnIuyuv7C5Q
	U3LCLKrd5eRYdJDxjwL7wtS9FUfouzyCvXkyViD0cVPc2Jm0dAQYXGU5p5IsY7iO
	+4LGtKlug7F51wjVbluzxt2ONqeitZh21vOnEUmpHAIiAWpbGlHroDnhddQMwgwY
	1NYpyFAYSlLX76XrDjoH3sxt3qXysKIeUnkTzSMGGj1l2Iq53lwLjSKBWaNnPUkn
	W/xi8vPcxJbCmBR5Y+OqoTMgi01gPzI9NtlfD/e+/OHVe+6eIQj1MACU8m/4hbt4
	V0QytVuLoE2ARvqEBhUE2P8YLZw2lnXR8nJ++fMaPfk3lckSyqJRnMYoUkF1dT+J
	5TdOA==
X-ME-Sender: <xms:RI2UZ3ink3SxpTGbKRgZn3I8uXCwe6-qsdjWdYO9zrqqLLs9IxjhuQ>
    <xme:RI2UZ0A66gXNsWrxQAEoeWXGpIlgzN8xRt2K7-RrwEh34nCdzhW9kKyjDLfwlF_IV
    RMF8CENhboIUi3HpQ>
X-ME-Received: <xmr:RI2UZ3GlcB8A73MZKbJOBj-Ho0hsymOFyUyu6LOYAqihcOQqOY0DRl2LQWqyh_GwNhBkBiNapkKS2q2tfb6yI0eFr2nbE9qhcVhWprH9uZcA>
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
X-ME-Proxy: <xmx:RI2UZ0RjqV6hzsmNaUbYfNyZSEcA4BGEqT9ORvSXmofipAt48jGSoA>
    <xmx:RI2UZ0wgQjRQbhrhDqZKdfxHNvVTvUSHJ-Cfy9ZxDR5MTo6XRG1xyA>
    <xmx:RI2UZ66kItiYwcK9VZ2Ts7wvSMwQwKAaBAHXc-1ERTyOdOIlUfS1xw>
    <xmx:RI2UZ5wDuk3HqMBJh27vMQ7M0TsKT8rL2poewwuFc66qX0zEHoQ8AQ>
    <xmx:RI2UZwj8mtDOL91oNaSbiei53pZW2qrs0JFyHTIYbpZFF2cvW8oqFVy3>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jan 2025 02:05:36 -0500 (EST)
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
Subject: [PATCH v2 4/5] arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX
Date: Sat, 25 Jan 2025 20:00:14 +1300
Message-ID: <20250125070458.13822-5-ryan@testtoast.com>
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

Add support for headphone insertion detection via GPIO for the
RG35XX series, and add the corresponding routing to the codec node.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Remove vendor prefix from GPIO description.
- Whitespace fix
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 34c2bb4cc0474..0e3537505d293 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -232,8 +232,11 @@ panel_in_rgb: endpoint {
 };
 
 &codec {
-	allwinner,audio-routing = "Line Out", "LINEOUT";
+	/* Both speakers and headphone jack connected to 74HC4052D analog mux */
+	allwinner,audio-routing = "Speaker", "LINEOUT",
+				  "Headphone", "LINEOUT";
 	allwinner,pa-gpios = <&pio 8 5 GPIO_ACTIVE_HIGH>; // PI5
+	hp-det-gpios = <&pio 8 3 GPIO_ACTIVE_HIGH>; // PI3
 	status = "okay";
 };
 
-- 
2.48.1

