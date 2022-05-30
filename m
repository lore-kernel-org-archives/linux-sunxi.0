Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391FE2F38
	for <linux-sunxi@lists.linux.dev>; Mon, 30 May 2022 13:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B34C385B8;
	Mon, 30 May 2022 13:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653918472;
	bh=Lk+qwOUG5tyMc0NNzqaOUNC1fExdrzPaXeYudF92OEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ca1qr/xKn7MIWo1KCiSvRe1UTFFo37YNFCFhvLX2xIY5zsYT2X0xlI1FqoqeO6+dd
	 SNjUMFfFeecWc750W1LLFb6ecvHH1OBf7sauQdKjKQvSzgkEb67MeW6xeiFU1wchzo
	 CmpnK8LS6GpWBvOx26Ig7Xt9TnHFfvqB6IOV8hd6Zn5t4Ef4rdZVxuC0Lozw9n55gF
	 pXxQWWxV30Cf1feELlO71kGBoYD9ETNkKFnudYa78/2c+sfR5ErW7IqCQnpgZnHhQL
	 2B22MbbVwBUtFjUdihUsMjS57cdq2/tNmtox+isUlgYdUkLMoZamheLe+1b274CPL2
	 ZrLUr6eN12E5g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>,
	Sasha Levin <sashal@kernel.org>,
	mripard@kernel.org,
	wens@csie.org,
	airlied@linux.ie,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 5.4 20/55] drm/sun4i: Add support for D1 TCONs
Date: Mon, 30 May 2022 09:46:26 -0400
Message-Id: <20220530134701.1935933-20-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530134701.1935933-1-sashal@kernel.org>
References: <20220530134701.1935933-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel@sholland.org>

[ Upstream commit b9b52d2f4aafa2bd637ace0f24615bdad8e49f01 ]

D1 has a TCON TOP, so its quirks are similar to those for the R40 TCONs.
While there are some register changes, the part of the TCON TV supported
by the driver matches the R40 quirks, so that quirks structure can be
reused. D1 has the first supported TCON LCD with a TCON TOP, so the TCON
LCD needs a new quirks structure.

D1's TCON LCD hardware supports LVDS; in fact it provides dual-link LVDS
from a single TCON. However, it comes with a brand new LVDS PHY. Since
this PHY has not been tested, leave out LVDS driver support for now.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://patchwork.freedesktop.org/patch/msgid/20220424162633.12369-14-samuel@sholland.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index eb3b2350687f..9687f2b9652d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1509,6 +1509,12 @@ static const struct sun4i_tcon_quirks sun9i_a80_tcon_tv_quirks = {
 	.needs_edp_reset = true,
 };
 
+static const struct sun4i_tcon_quirks sun20i_d1_lcd_quirks = {
+	.has_channel_0		= true,
+	.dclk_min_div		= 1,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+};
+
 /* sun4i_drv uses this list to check if a device node is a TCON */
 const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun4i-a10-tcon", .data = &sun4i_a10_quirks },
@@ -1526,6 +1532,8 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = &sun8i_v3s_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-lcd", .data = &sun9i_a80_tcon_lcd_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-tv", .data = &sun9i_a80_tcon_tv_quirks },
+	{ .compatible = "allwinner,sun20i-d1-tcon-lcd", .data = &sun20i_d1_lcd_quirks },
+	{ .compatible = "allwinner,sun20i-d1-tcon-tv", .data = &sun8i_r40_tv_quirks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_tcon_of_table);
-- 
2.35.1

