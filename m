Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F937A
	for <linux-sunxi@lists.linux.dev>; Mon,  8 Aug 2022 01:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29147C433D7;
	Mon,  8 Aug 2022 01:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659922529;
	bh=rwkTHpB1djJ8Tb2+9cwpD8csB2WM2/iWjGaLWOtDMeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sFckeHz+HYeAe/xhle972rwUDuanl/5yzdFsovd21EH6MCBeMAREpo2NeUBAxKo02
	 iHjUC6oeFANtuIGaYHo2wXFoObtiC4SQg6cU/qyxShHla5FTzZgjIlOoX+WPZPz+0U
	 9d0OLD8bHAIDxD3BvZWLWQNOTcIJSXq47e/dGsfwGQrxgkG49VB1ACoyadlyDJ6sZ2
	 nWA9T9uXZL+m/+gqImA9CApKKUoivAW10jZf5rHNXYhmMfPaTHr03/G+cfNEftFTga
	 bBJqAWaT0jQTfwp6DqtklW/hcg0pru6PVPv1ImMndUTbdl4Pzxu3/jTkBuIB9gNE7I
	 Y5W9/XFIGJXsA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	wens@csie.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 5.18 43/53] arm64: dts: allwinner: a64: orangepi-win: Fix LED node name
Date: Sun,  7 Aug 2022 21:33:38 -0400
Message-Id: <20220808013350.314757-43-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220808013350.314757-1-sashal@kernel.org>
References: <20220808013350.314757-1-sashal@kernel.org>
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

[ Upstream commit b8eb2df19fbf97aa1e950cf491232c2e3bef8357 ]

"status" does not match any pattern in the gpio-leds binding. Rename the
node to the preferred pattern. This fixes a `make dtbs_check` error.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Link: https://lore.kernel.org/r/20220702132816.46456-1-samuel@sholland.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
index c519d9fa6967..3d2c68d58f49 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
@@ -40,7 +40,7 @@ hdmi_con_in: endpoint {
 	leds {
 		compatible = "gpio-leds";
 
-		status {
+		led-0 {
 			label = "orangepi:green:status";
 			gpios = <&pio 7 11 GPIO_ACTIVE_HIGH>; /* PH11 */
 		};
-- 
2.35.1

