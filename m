Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038907;
	b=hV+Dyk9SGsC5FI++Lb6WLJisqhJWdhRDl/zUIHBoYvAkChujWAcEHdk4UkHFrQCoUQIc
	 s01QS45hkjb2tpYgkGcWvN7LtiVggTIo2aU8zAZaWtx7yS8RjfztueSgp9m4vlXTI1Lfe
	 LoTlI61zDs5n+EJPxRlAwSLXyoiKpX+RuEb479PNizPJDeNib0tBves9BHipkdKvjZ0cF
	 OE3g5h9u5dReLslX99XkI+hfJpo/pNv98Smc2m8GdydZJU9YTmptvXjuKEWtunGrVr2d4
	 D8uQwyhLAszHPDNG20bjWPtIa5CHNp6cXzU7lP9bSUeU4wlR6jzNmOkR0RryuiHSw/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038907;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=ekhsu2gD2ffd2XUnkad76rYwYpPwsHO9XjiLqW89QII=;
	b=sxSv4ZcUyVmqWS/fVllN+4vvKolcDAkQItuRf6a4G5iVG8FEocDx0TMVpZWhDN9djy8d
	 rZURWH425EjAyTS6Bkw9kIBk/DGE266rUOR/ei3+sLZ7hBdUsLnljpDcEzVLxSekJqRqh
	 1pKAb9qzqNjm5v180fNvFBrtbAxCoUv5a2I1/FnyfZeu16gNrg6ERCtYnJs7uh3SATyBb
	 6YshPTDfduNgOanH+q7Jn/8N/qQLA8XChP9OpbegGus7vt/6orC9+2bJpx11cK3E05F5A
	 zXlr42JyifgjC8X7vf14/OR/4AhDwvro56g3gbJZpbuODy50bp1i22mEp4s3o5AQP2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650EF606D812
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 08:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 650EF606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jM7w53lPSz57HS0;
	Sat, 07 Nov 2026 16:08:21 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 6A788J1W096644;
	Sat, 7 Nov 2026 16:08:19 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:08:21 +0800 (CST)
X-Zmail-TransId: 2afc6aeedc75063-80c13
X-Mailer: Zmail v1.0
Message-ID: <20261107160821263n_tb5YdtJX-icNTWJbOW9@zte.com.cn>
In-Reply-To: <20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn>
References: 20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn
Date: Sat, 7 Nov 2026 16:08:21 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDEvNV0gQVNvQzogcnNuZDogZml4IE5VTEwgZGVyZWZlcmVuY2Ugd2hlbiByZW1vdGUgcG9ydCBoYXMgbm8gZW5kcG9pbnQ=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A788J1W096644
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 07 Nov 2026 16:08:21 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDC75.000/4jM7w53lPSz57HS0

From: Shao Mingyin <shao.mingyin@zte.com.cn>

rsnd_parse_connect_graph() uses the node returned by
of_graph_get_remote_port_parent() without checking it for NULL.  An
endpoint node with no remote-endpoint phandle yields NULL, and the
following strstr() on remote_node->full_name dereferences it during
probe.

Return early when the remote node is absent, so a graph link that does
not lead anywhere is ignored instead of crashing the kernel.

Fixes: beed78aeeb10 ("ASoC: rsnd: move HDMI information from ssi.c to core.c")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index b7954746e953..6fba4f46868b 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1140,6 +1140,8 @@ static void rsnd_parse_connect_graph(struct rsnd_priv *priv,
 		return;
 
 	remote_node = of_graph_get_remote_port_parent(endpoint);
+	if (!remote_node)
+		return;
 
 	/* HDMI0 */
 	if (strstr(remote_node->full_name, "hdmi@fead0000")) {
