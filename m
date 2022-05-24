Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57598A21
	for <linux-sunxi@lists.linux.dev>; Tue, 24 May 2022 16:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCED8C34116;
	Tue, 24 May 2022 16:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653408065;
	bh=+8/rSL0dktqyZfvWABToCYxgk0Wct5z+yxpZFfy6gak=;
	h=From:To:Cc:Subject:Date:From;
	b=QgDQbHQ/wXB1z7xvhmrgK5avhksMYuyJUyR8c/YolT+M56Jl2BQzU2tcZRQHaEbi8
	 IjLOFmtfqQ+GBYG9fWoABoSy0wlJhb6OPJ1E9ZpejLxeHdhlyATfbpwy1yTGbqZ4GE
	 lk+zyS8UfcQ4a13yGU/P31pq0JgSc3czURT4GCwTdRqKk/KoZTaZLgCZfu3myTxL7I
	 9SjBou4MtiqgsX+nciToaO2BsJontW4FP8fz6blQ8Q92f6+CvKEGrm132tjxm+kEr1
	 6x1Ni0BejF/VlzC3oQjp658eRsdAvUDzx+r3QtiXiMD1iBbwYU8Ub6u7TWl0qboHkO
	 LTWNW+E176MEw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: IotaHydrae <writeforever@foxmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 5.4 1/5] pinctrl: sunxi: fix f1c100s uart2 function
Date: Tue, 24 May 2022 12:00:57 -0400
Message-Id: <20220524160102.827227-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: IotaHydrae <writeforever@foxmail.com>

[ Upstream commit fa8785e5931367e2b43f2c507f26bcf3e281c0ca ]

Change suniv f1c100s pinctrl,PD14 multiplexing function lvds1 to uart2

When the pin PD13 and PD14 is setting up to uart2 function in dts,
there's an error occurred:
1c20800.pinctrl: unsupported function uart2 on pin PD14

Because 'uart2' is not any one multiplexing option of PD14,
and pinctrl don't know how to configure it.

So change the pin PD14 lvds1 function to uart2.

Signed-off-by: IotaHydrae <writeforever@foxmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Link: https://lore.kernel.org/r/tencent_70C1308DDA794C81CAEF389049055BACEC09@qq.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c b/drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c
index 2801ca706273..68a5b627fb9b 100644
--- a/drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c
+++ b/drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c
@@ -204,7 +204,7 @@ static const struct sunxi_desc_pin suniv_f1c100s_pins[] = {
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "lcd"),		/* D20 */
-		  SUNXI_FUNCTION(0x3, "lvds1"),		/* RX */
+		  SUNXI_FUNCTION(0x3, "uart2"),		/* RX */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 14)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
-- 
2.35.1

