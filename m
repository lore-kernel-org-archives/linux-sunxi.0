Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1DF7A
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Jun 2022 02:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97ED8C385A2;
	Tue, 28 Jun 2022 02:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656383039;
	bh=w7fftTG4ZtdUDNlN2kkvN6wupt+2CPYIA0HdyTf1khc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VJYl3F1EItPXn1XO/MV/SZhX0S7oh4qdOU8QNOYa7BrRyYZ+NOzliuaye6yygGe2f
	 j1dq4z310w1GGroLpMU1PZquo8TxhibaNpB83altz07I8JbaTjY3PnLgP3tcu9zzYf
	 OrDhVmjoX9HJbspww3XI1HPrLOGnXYGlS8fDNwKpY+qOZhrjKlBdYFtJWmxzIuNHOd
	 1EKpxxVdRBivy6wgnzaz8AB2toYABfD6I3YVTn7+glr5OPtGBo1RgqCub5WC9zEHcH
	 SiJ36mSAmSm7dLX6igRG1ojGCqhZP+/B4IVCyeLC8sQEXnja0Qr9VQsDZv98ri6lI1
	 BxakKl+lizGGA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Saud Farooqui <farooqui_saud@hotmail.com>,
	Maxime Ripard <maxime@cerno.tech>,
	Sasha Levin <sashal@kernel.org>,
	mripard@kernel.org,
	wens@csie.org,
	airlied@linux.ie,
	daniel@ffwll.ch,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 29/34] drm/sun4i: Return if frontend is not present
Date: Mon, 27 Jun 2022 22:22:36 -0400
Message-Id: <20220628022241.595835-29-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022241.595835-1-sashal@kernel.org>
References: <20220628022241.595835-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Saud Farooqui <farooqui_saud@hotmail.com>

[ Upstream commit 85016f66af8506cb601fd4f4fde23ed327a266be ]

Added return statement in sun4i_layer_format_mod_supported()
in case frontend is not present.

Signed-off-by: Saud Farooqui <farooqui_saud@hotmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://patchwork.freedesktop.org/patch/msgid/PA4P189MB1421E93EF5F8E8E00E71B7878BB29@PA4P189MB1421.EURP189.PROD.OUTLOOK.COM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_layer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index acfbfd4463a1..d585377de2a3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -115,7 +115,7 @@ static bool sun4i_layer_format_mod_supported(struct drm_plane *plane,
 	struct sun4i_layer *layer = plane_to_sun4i_layer(plane);
 
 	if (IS_ERR_OR_NULL(layer->backend->frontend))
-		sun4i_backend_format_is_supported(format, modifier);
+		return sun4i_backend_format_is_supported(format, modifier);
 
 	return sun4i_backend_format_is_supported(format, modifier) ||
 	       sun4i_frontend_format_is_supported(format, modifier);
-- 
2.35.1

