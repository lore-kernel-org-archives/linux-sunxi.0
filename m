Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09867E5
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Sep 2023 01:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD0EC433B6;
	Sat,  9 Sep 2023 01:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694221984;
	bh=s7UGrDwp2Fbn1/Oq5TSE/75H8fK01vSD0DcAQNFWpLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H8vQbFWMMBCzENoxYfMp8Vc7W09HgWYbOJESgTgDL52LTsG1rwvJ16j5J+6kw4RgL
	 M8HFbZ3TqUuQeoYqzPDgV9DzbEUqCuBdlrPR5NGznHNS8ezZBYiDKSQVkV6GdEJji0
	 kWr6n+V8BTJueuM4qzc5Ej91+46A42ZrxQ61HCv8uyXNTuea6FiZIGywMrUYDpNsCr
	 AMtj7z/nCVFu1FnoZX75O5QZSjP6w/4K4It855qVxsQGg528yyFHVlKRt2Do1m2z7r
	 mj/dF1GJ67LLmjgks5sgUSFtR8kGTBnBZkRIqQTCfImPJLWC+xTt52dx/LrM3gIcUc
	 9L9YZPmDe+ULg==
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
Subject: [PATCH AUTOSEL 6.5 6/6] thermal/drivers/sun8i: Free calibration nvmem after reading it
Date: Fri,  8 Sep 2023 21:12:54 -0400
Message-Id: <20230909011254.3581788-6-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230909011254.3581788-1-sashal@kernel.org>
References: <20230909011254.3581788-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.2
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
index 195f3c5d0b388..af3098717e3c1 100644
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

