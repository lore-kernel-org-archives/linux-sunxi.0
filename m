Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795815758;
	b=w3kjAig7pQZEhDMXA0Qw33ef3n0CPWXOZj7BwfJ7Ooz5WyJG2VljW+uQw8wZDRuiPG6M
	 r+A6xcR78kSUwRMgfqHk0gGZfB/iAAz7ZmUQwvARJyl91kGvrU/QU24awo/Zc7Pgfy2/J
	 U9ym9FODiCuHGt0lTJ8DoAxYd8uwDaW2TVNXVv0RfaV/UdjI2q4HoJuyJIMUAqd0IXKCF
	 rY63YEqI+OAUyRFC63NIIyh8A5oZXjn7ZWLdv1qSrt9v62pI9ZA+ss3psWDhGTw7PnL9Q
	 w/nl/955a+Kn7pAOFfYl9XdgDEdcvgXyzFbSTlOpqpToulC0E7GzGeJTvJ2pX7gAeNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795815758;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=hPcUXXPJ9lqr7gnnI/WO2aVWDUyWi+0TICJP+pC4I58=;
	b=08Z3yDqIV7iH+iLbWzYqcm4rPGAPG0y9CnFaCab/9jgTraXlXuQH2ZZ2BMFSGGFjUFFX
	 JN+wtdnjCYcGCSYuUHe0BMxffqxvye0mLpamM8nvMMTF6XYjbq7SclMAlwLRWsiG3O+rQ
	 u0QZvomdImH+fyXQJQClVj9ArIafz9idffKukaG0fRV4iuzg4Ts6wd7qXg0lnjvmAQE79
	 T0gQVWvulzFaJfWkVYPsHepOjk3OHdWkL/kxA0vJIncLrOQre6HuQ0kdtEDUM9NSmDym8
	 zB1cKmYJ6JHpIxxKZlb1LS9j56t5rP3QRuryhA7f0Az1ax4XeINSHmzKR9ogJF6W54A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2E4606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 21:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC2E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xX3i1-0000000008G-2ORN;
	Fri, 27 Nov 2026 21:42:21 +0000
Date: Fri, 27 Nov 2026 21:42:18 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, bui duc phuc <phucduc.bui@gmail.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Ryan Walklin <ryan@testtoast.com>,
	Andre Przywara <andre.przywara@arm.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org
Cc: stable@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 0/1] clk/ASoC: sunxi: fix H616 audio PLL and codec clock rates
Message-ID: <cover.1795815223.git.daniel@makrotopia.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The H616 CCU reports the audio PLL at half its real frequency since its
sigma-delta table was added, and the H616 codec support was tuned on
top of that, so the two errors cancel for the analogue codec. Other
users of the audio PLL run at the wrong rate: sun4i-spdif plays at
twice the requested rate once the codec has moved the PLL to its
sigma-delta setting, and an I2S driver for the Audio Hub that asks for
24.576 MHz gets 49.152 MHz.

The fix is a single patch spanning clk and ASoC. Correcting the CCU
alone halves the codec rate, and doubling the codec request alone makes
the codec run at twice its rate on the current CCU, so a two-patch
series would leave one commit with broken audio for bisection and for
stable backports, which need both halves together. I would suggest the
patch goes through the sunxi clk tree with an ack from Mark for the
sun4i-codec hunk; taking it through ASoC with an ack for the CCU hunk
works just as well.

Tool use: the root cause analysis, the patch and the text of both mails
were produced with an AI coding assistant (Claude Code) during a longer
session, which was asked to bring up HDMI audio on an H618 TV box, then
to find out why the analogue codec played at half speed after the CCU
correction, and to prepare this fix. It measured the PLL, the module
clock and the DAC drain rate on the hardware with devmem and the
AC_DAC_CNT counter, and checked them against the PLL formula of the
H616 manual and against the vendor-derived H616 codec driver carried by
Armbian, which requests twice the table rate. The measurements in the
notes of the patch come from those runs; pitch and channel order were
checked by ear.

Daniel Golle (1):
  clk: sunxi-ng: h616: fix audio PLL and codec clock rates

 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 4 ++--
 sound/soc/sunxi/sun4i-codec.c          | 8 ++++++++
 2 files changed, 10 insertions(+), 2 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1
