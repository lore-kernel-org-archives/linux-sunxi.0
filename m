Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC443C73E9;
	Mon, 23 Mar 2026 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286700; cv=none; b=E4t1nuwLQrQ36whbCk7O0qxxiLEdg5BI1ubtLQC+JPw5lXnr6JJ74pCQ/00MP1p3XdeUOs73L44MuTWYCPc6yRE5MZ9N1v41VbcOgKkb62qwE+kn+Ov9Ja/0E4VvbVEF7EhMxOLWNqOWKdEL0prs2F9rx5KcKHb0u8+kTRA0EA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286700; c=relaxed/simple;
	bh=8x3XhKTRhj8fiC5KBOLOsXbRYGBoZP9/5mMJZOSNv0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sWyd4mo3hTg2qFUW+WvDS1F7XrLImmF26joffrj+PEGEUCiHi7NglaFKGE/TF4EaWno7HHQvydx/vXpkIlfrEeBUNAzLQVmY3ySNMzY/V9eJO0Z4OMBwlZubFF9dV/E2c7D2/iG2BvgNC17ZLz2Ikl8tAy3K63TR5gMgQQO2j5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEkhw5uz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEkhw5uz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D06C4CEF7;
	Mon, 23 Mar 2026 17:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774286700;
	bh=8x3XhKTRhj8fiC5KBOLOsXbRYGBoZP9/5mMJZOSNv0c=;
	h=From:To:Cc:Subject:Date:From;
	b=mEkhw5uzX8sIiPj3SFwm2P8eG5Ssi5hiPcfCnuLQB7S8lqbqi9BIFzBP+4nra7+OJ
	 pfYBNM1doj7m8NjEIDuh+mcXAuf4C7YBvED9uKKAExYdxa4L8+zaoEjR1KY37p88xT
	 Ni2lcBTFjwd8g7bVLdelcxjqGf9BLUCCpz94wBDeyG1yvKKZTm863mTqlzsL6iiir+
	 98LOh7eu+ySwXmZUn6WvhNcz8Xn1H71sEbBe6tUNKMy4uaEaIi+h/JCYLn3upSYDk3
	 RETxZMdvOHYxnuw2s70GwvhtRgn755gYV0foTN8sfO+GSOHniaU2K/7bJZ1g8HC7IM
	 Zgro5kx1tXubQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 771605FBE4; Tue, 24 Mar 2026 01:24:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: sun4i-spdif: Make reset control non-optional and check for all errors
Date: Tue, 24 Mar 2026 01:24:48 +0800
Message-ID: <20260323172450.1259111-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

The logic around the reset control is weird. The driver already has
quirks describing which compatible strings require a reset control, but
the reset control is acquired using the "optional" API. Then any errors
other than deferred probe are ignored.

Instead, switch to the non-optional variant. Also use the deassered
variant to simplify the code. This also fixes a missing reset assert
upon removal.

Last, clean up the error message printing with dev_err_probe().

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 sound/soc/sunxi/sun4i-spdif.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 65de03ca3ad2..c2ec19437cd7 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -712,15 +712,10 @@ static int sun4i_spdif_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, host);
 
 	if (quirks->has_reset) {
-		host->rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
-								      NULL);
-		if (PTR_ERR(host->rst) == -EPROBE_DEFER) {
-			ret = -EPROBE_DEFER;
-			dev_err(&pdev->dev, "Failed to get reset: %d\n", ret);
-			return ret;
-		}
-		if (!IS_ERR(host->rst))
-			reset_control_deassert(host->rst);
+		host->rst = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
+		if (IS_ERR(host->rst))
+			return dev_err_probe(&pdev->dev, PTR_ERR(host->rst),
+					     "Failed to get reset\n");
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
-- 
2.47.3

