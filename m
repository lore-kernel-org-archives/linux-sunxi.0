Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BC67A
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Jun 2022 02:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA8EC385A9;
	Tue, 28 Jun 2022 02:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656382947;
	bh=E1KZbsvZDhKevxONtzdxRu8TU+GH1dIUzBdc48HTQ84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WHBEcyG30ApwViyYY4f+uBncTFJXSrK+2lA05TcuEFLhi2VC9BxXY+fWQhsftft/H
	 SbmTnXbatD502cPzAVQYf17NdYKLYcALZJ6NcWjI492uU41vQtzkexa5zMvWQptZh+
	 In3JiNOmcY9ZvepuG2YSpAij5YMZSmuvqImRxw9svY4CrSmZY/gE9e1t3QL9QwoAG5
	 4T6iGltSE+5zF2o6a+aPD9ItyrL9wBZdxCao1AFEMzLdfosC275HTdoebInYYYYTss
	 gyCHemGzRPgckxTDgb8leFegASBFRL4IKKPzRp4CWiYsXDyJ5KmAVuh+X4dkk4mKoK
	 nxilD+B3VcThw==
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
Subject: [PATCH AUTOSEL 5.15 36/41] drm/sun4i: Return if frontend is not present
Date: Mon, 27 Jun 2022 22:20:55 -0400
Message-Id: <20220628022100.595243-36-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022100.595243-1-sashal@kernel.org>
References: <20220628022100.595243-1-sashal@kernel.org>
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
index 929e95f86b5b..2036574e2cb0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -120,7 +120,7 @@ static bool sun4i_layer_format_mod_supported(struct drm_plane *plane,
 	struct sun4i_layer *layer = plane_to_sun4i_layer(plane);
 
 	if (IS_ERR_OR_NULL(layer->backend->frontend))
-		sun4i_backend_format_is_supported(format, modifier);
+		return sun4i_backend_format_is_supported(format, modifier);
 
 	return sun4i_backend_format_is_supported(format, modifier) ||
 	       sun4i_frontend_format_is_supported(format, modifier);
-- 
2.35.1

