Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8786C3D25D0
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 14:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667052; cv=none; b=DrLtQPJ8YV8MD4uvZv7nFMfkiXtd9Qc7sxoZxreuMRZ3pQx7hoYhi2MD5k7JO5B8fO3tYL9icU0qAyDn0iv8Vaa7d0wGk4sEGuy+zWU1rmLK126GopvV+It0ODAKXp02XSRoggnqMIeumVyhET8CRbi6WN/eutyOUI4vSzQhGug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667052; c=relaxed/simple;
	bh=1A8fABCFuifqVIEGjwCpU3ptFnX5HKfPD+BMzGnAtrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lo9lt7RS5BFi1hIk1ufYhyGI45h32A7U4eDnO4tlFhjN75blk71jGp3TGF6F31Uf7loUAK9jWPkKXQH1LE253uEWTueSqPvamv6nmUUJDM3QY97oNZiCz9J9Kx22FgfAhr3lJfgF0GyEguu5Rdx/GEtzUHHXwHlo9eWbNlyHegw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p1/86vpv; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p1/86vpv"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso69086a91.3
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787667051; x=1788271851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ZIjmuEHE9Rlk5riwplSnnGgEFCzgmjA3IFA8anx86U=;
        b=p1/86vpvMfXWDth37c520GOHB2OBfZKALtRLQq7GqbTeKuGQ349KOivf1x+ubLlSyd
         nR7FWE1IE/A5+QZIUxEkGmXes63pq865aKEWaWnQL6VbQp4FRcsNSW8QpFDixDXVmj/j
         nTjmhxhjSEktddsWLjzuT64mRFZl61zu7YubXynI+4Jr6FCxJ89U4fiwNM8GUP+boevd
         WDGYZDSNhtfLbFLF4swZMwNbCphTJQmp3uokTRRkX7YJDWzQt5XsXuFhK+x9aNvh5iXY
         M7Q25dbLdx6Uh/ojvqOueMO3tA+YrfiltbbaUQFt328F+P4953XPFiLx0rEOASeccw4a
         /kMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787667051; x=1788271851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ZIjmuEHE9Rlk5riwplSnnGgEFCzgmjA3IFA8anx86U=;
        b=N0VqHxcKxxfnRG6iKU1sLXDemsNLWk5SigDqYw4i+cxjbUEn64i+0hbFbEHtLcAm9V
         uUY7GsFdUzLsbEATb5tNeEJnkHGDXI9yWVlJSQ6squvK3wyHRHi42mkZAzzZbezy0VoP
         00JxCSYRlbdZgFvlgFGAN4l8E0NOZInW0peMXicBYn41O2OkYsEUTpUeuCYgQ+3GFJdX
         DPU9rjh95RATz9XH5XGOTWr5bxWuswpyUMivGz9ijiIEOWDjF+265I+TVSUpDGdM56Dk
         QmZFxcB0OgYaIaiYGS/1/XzPibOGXHUlG/rsli+WCuF6SKh880kHZDskDJF0HAkVXBWh
         2cXg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+DU5KQNCgnXYLH9Oi0Kz/GgofIkjWeGJhgBDVTmw7q+ZfnEsyI+PvUhrM4acM9tAX9OPUWqKAW/YpKQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lbupBvZuCahbouOOrWP4Br4K2Wlgn3oCn1Hl7Q0mJNWEp/EOxe
	s2a0Spknq6wWBz7bQjXZYq4K82UjBBv1Zprc7ze7acR5c1RR+fOEQwiI
X-Gm-Gg: AR+sD11cYTRM3h8uavcm213/8T8ZxEo/TxmClP7Ttw/8/Qx3NJzldrFctRWualYMbQs
	MYRsLkgyl5juMDsL3Ui9z2UvGzzPBiX1W8G+aDqinSciNb4/d8Ti5MG00BDU6r1OvWCMdhD+89o
	mPVzkaYG/XtKb/Rk57SWRouulCy+LZa+eXMcmjlCbvKvXwrD8rdCGOvgmiEkEyQh1i//W6Vv2uN
	2Xa+ArYwiTaDIpu84VTjPaimWkhs9cZLmRTF7Jgdc3K8J/VFpV52TnnURRjh55ylMnU5dJIKFRH
	Pd1AkzAiECUkyy1btUzlE49Snk5o6lMHzjm6STGfw8p3A68thBBTGFKOA5+R6T2jWlAd5725APR
	qXHhsFg7fmPsbbGgVWsYsGOp1afXYBP7qVirW1FDtvbHuMJMltVymrL900qC283YDs90dA4utXX
	HFoayfOJV2EU1TUfpM6SbpRobbIQGN+++yJgMWXzEmZ2gP6Jz5zsEHJnEe5qhuFB/g4X5j4iSMF
	8h4zG3poNu/xAI=
X-Received: by 2002:a17:90b:5844:b0:393:1d92:db5 with SMTP id 98e67ed59e1d1-395c35e1199mr72431253a91.10.1787667050000;
        Tue, 25 Aug 2026 07:10:50 -0700 (PDT)
Received: from DESKTOP-E2NGI2F ([103.155.185.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f909a51fsm34020361eec.4.2026.08.25.07.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:10:49 -0700 (PDT)
From: Sushanto <seditorofficial@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sushanto <seditorofficial@gmail.com>
Subject: [PATCH] ASoC: sun4i-codec: Fix OF node reference leaks for analog controls
Date: Tue, 25 Aug 2026 20:10:35 +0600
Message-ID: <20260825141035.784-1-seditorofficial@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device node obtained from of_parse_phandle() for
"allwinner,codec-analog-controls" in sun8i_a23_codec_create_card(),
sun8i_h3_codec_create_card(), and sun8i_v3s_codec_create_card()
has its reference count incremented by of_parse_phandle().

However, the driver fails to drop this reference count when
sun4i_codec_create_link() fails, when snd_soc_register_card() fails
in sun4i_codec_probe(), or when the driver is removed in
sun4i_codec_remove().

Fix this by adding the missing of_node_put(aux_dev.dlc.of_node) calls
in these error paths and in sun4i_codec_remove().

Fixes: 08289086b0ab ("ASoC: sun4i-codec: Add support for A23 codec")
Signed-off-by: Sushanto <seditorofficial@gmail.com>
---
 sound/soc/sunxi/sun4i-codec.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 835dc3404..b10c2beac 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1429,8 +1429,11 @@ static struct snd_soc_card *sun8i_a23_codec_create_card(struct device *dev)
 	}
 
 	card->dai_link = sun4i_codec_create_link(dev, &card->num_links);
-	if (!card->dai_link)
+	if (!card->dai_link) {
+		of_node_put(aux_dev.dlc.of_node);
+		aux_dev.dlc.of_node = NULL;
 		return ERR_PTR(-ENOMEM);
+	}
 
 	card->dev		= dev;
 	card->owner		= THIS_MODULE;
@@ -1468,8 +1471,11 @@ static struct snd_soc_card *sun8i_h3_codec_create_card(struct device *dev)
 	}
 
 	card->dai_link = sun4i_codec_create_link(dev, &card->num_links);
-	if (!card->dai_link)
+	if (!card->dai_link) {
+		of_node_put(aux_dev.dlc.of_node);
+		aux_dev.dlc.of_node = NULL;
 		return ERR_PTR(-ENOMEM);
+	}
 
 	card->dev		= dev;
 	card->owner		= THIS_MODULE;
@@ -1507,8 +1513,11 @@ static struct snd_soc_card *sun8i_v3s_codec_create_card(struct device *dev)
 	}
 
 	card->dai_link = sun4i_codec_create_link(dev, &card->num_links);
-	if (!card->dai_link)
+	if (!card->dai_link) {
+		of_node_put(aux_dev.dlc.of_node);
+		aux_dev.dlc.of_node = NULL;
 		return ERR_PTR(-ENOMEM);
+	}
 
 	card->dev		= dev;
 	card->owner		= THIS_MODULE;
@@ -1808,6 +1817,8 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "Failed to register our card\n");
+		of_node_put(aux_dev.dlc.of_node);
+		aux_dev.dlc.of_node = NULL;
 		goto err_assert_reset;
 	}
 
@@ -1830,6 +1841,8 @@ static int sun4i_codec_remove(struct platform_device *pdev)
 	if (scodec->rst)
 		reset_control_assert(scodec->rst);
 	clk_disable_unprepare(scodec->clk_apb);
+	of_node_put(aux_dev.dlc.of_node);
+	aux_dev.dlc.of_node = NULL;
 
 	return 0;
 }
-- 
2.55.0.windows.4

