Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038900;
	b=gPZvKUCVsQ3/m5QDOoghwtvt053AJNACRSOzqajmuFZFDEHh2MCDOhWIQQ1oKh+VcoDA
	 oMLDa7tagsIEXBC61Bkq9xBI+9W2dbnphvfO8/ImVgxULBVPtawfVGV/Kdj9YBidpCm/C
	 SnoOeu8R8/PCn53VbJRCf1kc1MxYUGwoLBqUtRiVDOa2EIRQLxxm4P7opViMAG+r6mXa5
	 VQAKtUEV7/eplHJdut0NX8AVSStO8L6l1P3L0siezhQBSr6UhBMR60jnRPZb2X7/aRk7+
	 NiqH/X1bwBdHnrAtXXouov5ny/pCQiqnxhG+YFv9tJyb3N6MoliJnxLOGx3lw55IQQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038900;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:
	 X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:
	 X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=e/rFmgN3Z5KxfWW+Rzz0lvQ+GFMHmAzHgZaIrh0Ft3U=;
	b=sZVFW1Z3UhhaNDlre4zvbm/9K1qwp39iY+2RcnV9Pq/FJSmgqqEFp8C9FEv6sxt/esRu
	 lGV/Qrs8KMF54gmZajJ/PjsBBmXjEWH6wBEqKAOkI7BYdxBYaerpAU0LAojN7oJmH1kF2
	 IlgX0GH9SvgHWvlT59ZjKcd24gefyELXd3exoQtjd0CrZ/W57sEqiODvsr7qscxgyyqSJ
	 z9UpmhKDaJDHBo0oQg0JKuztukyF3tQngjOwtThvfMAreM8EeF5hUD/q36KdR99mTXw26
	 w+MlmD82VZAJZAyH0nhQGUoBBZQ0oHyZG7Ya2zJ8PEnZdCOnptiE/Kt6vixVnzOPEzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DC9606A33E
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 08:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83DC9606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jM7w265jZz8RVJk;
	Sat, 07 Nov 2026 16:08:18 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 6A788DXS022834;
	Sat, 7 Nov 2026 16:08:13 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:08:15 +0800 (CST)
X-Zmail-TransId: 2afb6aeedc6f415-84fc1
X-Mailer: Zmail v1.0
Message-ID: <20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn>
Date: Sat, 7 Nov 2026 16:08:15 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDAvNV0gQVNvQzogZml4IGVycm9yLXBhdGggbGVha3MgYW5kIGEgTlVMTCBkZXJlZmVyZW5jZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A788DXS022834
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 07 Nov 2026 16:08:18 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDC72.001/4jM7w265jZz8RVJk

Five error-path defects in ASoC drivers, found while reviewing against
linux-next next-20261030.  Four of them leak a reference or a clock, or
drop one twice, on a path that is easy to miss; the fifth dereferences
a NULL remote port while parsing an audio graph.  The patches are
independent and can be reviewed, applied and backported separately.

  1/5 ASoC: rsnd: fix NULL dereference when remote port has no endpoint
  2/5 ASoC: wcd9335: fix SLIM interface device double-put on error paths
  3/5 ASoC: rockchip: rk3399_gru_sound: fix codec node reference leak
  4/5 ASoC: sun8i-codec: fix bus clock leak in runtime resume error path
  5/5 ASoC: rsnd: fix SSIU node reference leak in rsnd_dma_of_path

1/5 returns early when a graph endpoint has no remote port; 2/5 removes
the four manual put_device() calls that duplicate the devm action; 3/5
puts the codec node on the two skip paths of the Rockchip DAI-link
parse; 4/5 disables the bus clock when the regmap sync fails; 5/5 puts
the SSIU node after the DMA path lookup.

Patches 1/5 and 5/5 are R-Car (Kuninori Morimoto), 2/5 is the WCD9335
codec (Srinivas Kandagatla), 3/5 is Rockchip (Heiko Stuebner) and 4/5
is sunxi (Chen-Yu Tsai, Jernej Skrabec, Samuel Holland).  All go
through the ASoC tree.

3/5 was tested on 7.3.0-next-20261030 in a QEMU/TCG arm64 guest with a
synthetic DT; the test section in that patch describes the setup and
the observed reference counts.

Shao Mingyin (5):
  ASoC: rsnd: fix NULL dereference when remote port has no endpoint
  ASoC: wcd9335: fix SLIM interface device double-put on error paths
  ASoC: rockchip: rk3399_gru_sound: fix codec node reference leak
  ASoC: sun8i-codec: fix bus clock leak in runtime resume error path
  ASoC: rsnd: fix SSIU node reference leak in rsnd_dma_of_path

 sound/soc/codecs/wcd9335.c            | 4 ----
 sound/soc/renesas/rcar/core.c         | 2 ++
 sound/soc/renesas/rcar/dma.c          | 5 ++++-
 sound/soc/rockchip/rk3399_gru_sound.c | 8 ++++++--
 sound/soc/sunxi/sun8i-codec.c         | 1 +
 5 files changed, 13 insertions(+), 7 deletions(-)

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
