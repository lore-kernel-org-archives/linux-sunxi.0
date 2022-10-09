Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF981C2E
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Oct 2022 23:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726F2C433D7;
	Sun,  9 Oct 2022 23:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665359460;
	bh=FoAKBoM3BVE06nEwOQj9AKyKByzBVLYrsUm0mfXl8EQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t2tw1qWkdMgLMIkEKAuaDwOvFv8/p8RNHCTnJaqkpdXrYPPc3OkEG+flJkl2IsDMw
	 Y6QZnsqV9m+s2+3WXCw/QYBlJ9k52LlcXEmC8jkej1Wl+JuJA7b3H0psclMMzgwoTd
	 b2bLt9cR+5C+fuqvQyKPkwXnAu2F93rv/LeTd9P5dj5XdZA9WObZxDplCEJE11LZMX
	 3/gH56wD8g1o5xNBEuG7EAuW/lAG50MiTQBWY7TJMeG+UsE4F0mSkGETcJqoQNwfhK
	 hC9auInErdNk7s6d3N8t3Fg63B6v/79s3dChKF058CuLt9xQeA34cv1W0/4Q0PH44s
	 QWmzJ4muq93Aw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mikhail Rudenko <mike.rudenko@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	ckeepax@opensource.cirrus.com,
	lchen@ambarella.com,
	kuninori.morimoto.gx@renesas.com,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 6.0 27/44] ASoC: sunxi: sun4i-codec: set debugfs_prefix for CPU DAI component
Date: Sun,  9 Oct 2022 19:49:15 -0400
Message-Id: <20221009234932.1230196-27-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009234932.1230196-1-sashal@kernel.org>
References: <20221009234932.1230196-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Mikhail Rudenko <mike.rudenko@gmail.com>

[ Upstream commit 717a8ff20f32792d6a94f2883e771482c37d844b ]

At present, succesfull probing of H3 Codec results in an error

    debugfs: Directory '1c22c00.codec' with parent 'H3 Audio Codec' already present!

This is caused by a directory name conflict between codec
components. Fix it by setting debugfs_prefix for the CPU DAI
component.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
Link: https://lore.kernel.org/r/20220913212256.151799-2-mike.rudenko@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sunxi/sun4i-codec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 830beb38bf15..fdf3165acd70 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1232,6 +1232,9 @@ static const struct snd_soc_component_driver sun8i_a23_codec_codec = {
 static const struct snd_soc_component_driver sun4i_codec_component = {
 	.name			= "sun4i-codec",
 	.legacy_dai_naming	= 1,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_prefix		= "cpu",
+#endif
 };
 
 #define SUN4I_CODEC_RATES	SNDRV_PCM_RATE_CONTINUOUS
-- 
2.35.1

