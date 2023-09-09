Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC7D7E5
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Sep 2023 01:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D0AC4163D;
	Sat,  9 Sep 2023 01:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694222001;
	bh=zVMpq/gM87f5AGttmVO2xueTDbmIF7lgyde3fz1QGYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hPVfODX7MsR7oYgFjmOCh0XpLWhVF0i34YtuYWqXkXxJplrEN+FyzS7qq5Fu7Zj1s
	 JCxNA205jDqkrZWdTLUx2rIAznckt/sFPWhHb+XzRIhbiiVAOqVBlZCtsqr9mxd8uI
	 bJE2TG2ardA8PXMk4f77o6qO0rR3KGym/PZwYx+drZF3bHZTBK9SSGsfpcB3HHWP4P
	 J87niGa6c/iDKBnAblf5IFzv+PxPLCpUw9wffiWgSHGSmHjLSS3dM6XVLhJkv1wWAW
	 vc455vI1VCYUtML3ZGztYAqcpup2m+vBn+Oi0lnKScdyQrfDup3KITR7DVEkuHSD4w
	 j9jofP0xdXhVg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	anarsoul@gmail.com,
	tiny.windzz@gmail.com,
	rafael@kernel.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 3/3] thermal/drivers/sun8i: Free calibration nvmem after reading it
Date: Fri,  8 Sep 2023 21:13:14 -0400
Message-Id: <20230909011314.3581953-3-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230909011314.3581953-1-sashal@kernel.org>
References: <20230909011314.3581953-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.52
Content-Transfer-Encoding: 8bit

From: Mark Brown <broonie@kernel.org>

[ Upstream commit c51592a95f360aabf2b8a5691c550e1749dc41eb ]

The sun8i thermal driver reads calibration data via the nvmem API at
startup, updating the device configuration and not referencing the data
again.  Rather than explicitly freeing the nvmem data the driver relies
on devm_ to release it, even though the data is never referenced again.
The allocation is still tracked so it's not leaked but this is notable
when looking at the code and is a little wasteful so let's instead
explicitly free the nvmem after we're done with it.

Signed-off-by: Mark Brown <broonie@kernel.org>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/20230719-thermal-sun8i-free-nvmem-v1-1-f553d5afef79@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/thermal/sun8i_thermal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 80614b6adfac5..5776ecc8d0c76 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -286,7 +286,7 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
 	size_t callen;
 	int ret = 0;
 
-	calcell = devm_nvmem_cell_get(dev, "calibration");
+	calcell = nvmem_cell_get(dev, "calibration");
 	if (IS_ERR(calcell)) {
 		if (PTR_ERR(calcell) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
@@ -316,6 +316,8 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
 
 	kfree(caldata);
 out:
+	if (!IS_ERR(calcell))
+		nvmem_cell_put(calcell);
 	return ret;
 }
 
-- 
2.40.1

