Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038913;
	b=mx8/Q91X0Kth5Bg+RHBT64Wk2vmjPBBreIwSMYwETw+ge4J+Mwdznpuytep6EH4aYxAM
	 2DdbKWcvNx/mTUjpDrCyaTIqIACm2636ssLoYgjNh4jC/VuvnB8v7GCy1LjQVErV6OJ1O
	 aiKXExI9W/Mbwk9Rx4fsey1Dogyh+YfAmuVseWSMcmSnyN0q2Rglw58cLKoPcHk2fSQg9
	 wm0ONrsRiiOiaO6PBaWHl7bSNfJdTzj3GhU59n04s5I7VVG1PVyJ5V7+vBt/zHlgyRKAE
	 +v0ahpJPFFpQtsICeJKZO89RDuzeZU2S0wil8IH8ECX0cfEFIfnsDCEE9CrPXTQ0jhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038913;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=5dGP7OsYZrgZld9I1X847oOXXK6extHaSO2lUmdQfn4=;
	b=LD4546G5YuU9n3v6D20g7wmZSQx4aDqmFx3+bKQfVTSwChtWF5+QjKg3ZPS3tJwqa2du
	 nzZcyeR4rIc2jUTNfPBGDEIDAowax9cZix8BgYsh7oIgibsdU8p2nhH77HCDOYdk/IZIM
	 0SL7+mkDUxi7lW7dtQLOMUVJqVfsFM+WIopnxWROsuu57FArLgk/HHYiZbrEGefzAC8nD
	 gVw3FSzk4tTnnKn8zaSJDwjudQEn9bsTWJgGiZqnDzzJy2//5o2hjchZlhcOvXfG6/5gu
	 MWrWIaOf0OFe0kiMWRYxYn/IOBq+bfKAhx0HZ5b+yeABhPHMNaHeo1mLWIXckw19CuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7A5606D83F
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 08:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D7A5606D83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jM7wB3t1tz57HS1;
	Sat, 07 Nov 2026 16:08:26 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 6A788OUH022866;
	Sat, 7 Nov 2026 16:08:25 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:08:27 +0800 (CST)
X-Zmail-TransId: 2afa6aeedc7b7b3-93351
X-Mailer: Zmail v1.0
Message-ID: <20261107160827257FwoXZMjcThgcfD-ZPfKsk@zte.com.cn>
In-Reply-To: <20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn>
References: 20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn
Date: Sat, 7 Nov 2026 16:08:27 +0800 (CST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
Cc: <lgirdwood@gmail.com>, <heiko@sntech.de>,
        <linux-rockchip@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <wens@kernel.org>,
        <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
        <linux-sunxi@lists.linux.dev>, <kuninori.morimoto.gx@renesas.com>,
        <linux-renesas-soc@vger.kernel.org>, <srini@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDUvNV0gQVNvQzogcnNuZDogZml4IFNTSVUgbm9kZSByZWZlcmVuY2UgbGVhayBpbiByc25kX2RtYV9vZl9wYXRo?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A788OUH022866
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 07 Nov 2026 16:08:26 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDC7A.000/4jM7wB3t1tz57HS1

From: Shao Mingyin <shao.mingyin@zte.com.cn>

rsnd_ssiu_of_node() returns the child node obtained by
of_get_child_by_name(), which holds a reference.  rsnd_dma_of_path()
only tests that node and never drops the reference, so every DMA path
setup leaks the SSIU node.

Put the node after the SSIU branch has used it.

Fixes: 4e7788fb8018 ("ASoC: rsnd: add SSIU BUSIF support")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 793dd4adbe5c..ece23ef5e56c 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -791,6 +791,7 @@ static void rsnd_dma_of_path(struct rsnd_mod *this,
 	struct rsnd_mod *mod_start, *mod_end;
 	struct rsnd_priv *priv = rsnd_mod_to_priv(this);
 	struct device *dev = rsnd_priv_to_dev(priv);
+	struct device_node *ssiu_np;
 	int nr, i, idx;
 
 	/*
@@ -803,13 +804,15 @@ static void rsnd_dma_of_path(struct rsnd_mod *this,
 	 *	rsnd_ssiu_dma_req()
 	 *	rsnd_ssi_dma_req()
 	 */
-	if (rsnd_ssiu_of_node(priv)) {
+	ssiu_np = rsnd_ssiu_of_node(priv);
+	if (ssiu_np) {
 		struct rsnd_mod *ssiu = rsnd_io_to_mod_ssiu(io);
 
 		/* use SSIU */
 		ssi = ssiu;
 		if (this == rsnd_io_to_mod_ssi(io))
 			this = ssiu;
+		of_node_put(ssiu_np);
 	} else {
 		/* keep compatible, use SSI */
 		ssi = rsnd_io_to_mod_ssi(io);
