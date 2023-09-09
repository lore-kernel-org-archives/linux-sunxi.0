Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE2C1101
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Sep 2023 01:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F4AC116A5;
	Sat,  9 Sep 2023 01:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694221994;
	bh=6o60T4IulUDOCc88GUZG/bUlhJf9eDG+Nop1r+QSrv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qcYv9h9LrPKwkUfQ+ry5FGKSC6bGzkANtlUFtwlp+1vPjbYond0t5YfNlhRc8mNT/
	 byyaQYT5+oU1TkEPn8W/wZ7pbzt7BD8v5svTuLDcVmoCgg/SpqGpPxeTI8xqtAfEvi
	 fAfFXatWhqgm6+y9klUUoS9lEBx8o7hhUwgLU/HHVUDEvYI+e9+v8bdHCkQSVCmIuV
	 Q2CFj5sZFsnyHK7FIeYqNm+6q5XTHm28oJaOAbCYRI3uQx16fMZMHLDxmrl/lqTZ1e
	 TzurGtfG/l2p/6aAXKIOZ4aXBXUoW4LWTCVcEuwDA1jlyLWkID3Je7PG74UekBGCr/
	 xhXtwK0JB0cQg==
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
Subject: [PATCH AUTOSEL 6.4 6/6] thermal/drivers/sun8i: Free calibration nvmem after reading it
Date: Fri,  8 Sep 2023 21:13:04 -0400
Message-Id: <20230909011304.3581870-6-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230909011304.3581870-1-sashal@kernel.org>
References: <20230909011304.3581870-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.15
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
index d4d241686c810..56a00f1efe47a 100644
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

