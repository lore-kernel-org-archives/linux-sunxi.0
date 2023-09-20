Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F79D29A1
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Sep 2023 14:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886B2C433D9;
	Wed, 20 Sep 2023 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695220629;
	bh=cUa4ZlT2wSGqeoteiiVi9GhpPWDTIxakVCkbOrAWqhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r3xYlQll/XiwjTJfNRp1fUhXeJkFLJURTLX8Krra38w1fZj8V8lbNOVbIA5c8CY9X
	 SLnuOJBzYOf33MJfVqSZ7WVF/NiAk+fO71KR0Sw91KZrPJaBsvpJTrV8IChhSIimia
	 BlwPynaG3iVKntqRdtHs2mdVVGwElT1fVotJpCE4knZEqSxquGzz4VKSLIQ/qO/e71
	 qht3/cTSwMVElxfCqJR0ue50fTsBGDSHPcUo/BFBvbj171dFACjB8py5nAd4IKZUGO
	 V6ISlq4SvLCjhdBaev6sUUXHoTNgFQGTZqibEWzg02MgOu1o53ORn+J/+bNQ6bFCWJ
	 qyRGgwhG8Jb2g==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 20 Sep 2023 16:35:46 +0200
Subject: [PATCH RFC v2 31/37] drm/rockchip: inno_hdmi: Remove unused drm
 device pointer
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-kms-hdmi-connector-state-v2-31-17932daddd7d@kernel.org>
References: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=mripard@kernel.org;
 h=from:subject:message-id; bh=cUa4ZlT2wSGqeoteiiVi9GhpPWDTIxakVCkbOrAWqhE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnczFYfC/6rlxU/EEutSXgjar3g/wONxB08AhbLeJuWb
 BbWFBLvKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwE0+yfDPUsZYS+GY+G0r9c79
 1ufb5+YWy573u3XHVLhJan2TIE8Yw/+Qi9/dmgxEatZFbH5eWNnkt379agmxNbvfzOP+cenN1ww
 2AA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_dev field in the inno_hdmi struct stores a pointer to the DRM
device but is never used anywhere in the driver. Let's remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index ed1d10efbef4..d0b463d166fb 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -39,7 +39,6 @@ struct inno_hdmi_i2c {
 
 struct inno_hdmi {
 	struct device *dev;
-	struct drm_device *drm_dev;
 
 	int irq;
 	struct clk *pclk;
@@ -732,7 +731,6 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 		return -ENOMEM;
 
 	hdmi->dev = dev;
-	hdmi->drm_dev = drm;
 
 	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs))

-- 
2.41.0

