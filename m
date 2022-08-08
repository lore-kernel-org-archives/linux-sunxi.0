Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26D77A
	for <linux-sunxi@lists.linux.dev>; Mon,  8 Aug 2022 01:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1F8C433D7;
	Mon,  8 Aug 2022 01:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659922745;
	bh=hDlEM4d9HLVjMgmnjDUPrcujB7QyITqOhNqevX9Fxf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=naRoJl08x3qweR2HX+VnzCwKLMZCUD8xTivJPMrMPcgFOTXvA4w2VStj/KEE3PGUA
	 +liPBtUIO51X+wnpVj0B/Cm2GYjfoYX40NUU0b+0+AsJaT3tWNwOU57DN8nD73pYQs
	 pLGwX1xuBhewo/9WnrM2ksuG+Qr66Hy6aAW45ci/I2NXIS3JSI7sLqvX0SSN8zXcp+
	 +Oz2Llyl0jUhq14C4X7LjaXK0arCJcmwkNt3P8FfgqyuRAFKMhr/kyfrFNSq2ZnT5K
	 +3J9ANp4MK2SiARGEGen9k12kRXEq0OixFlwt1KM1gUc4Nu48DB4bmjTiZvSndW5IR
	 8ikEjAEQyfMZg==
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
Subject: [PATCH AUTOSEL 5.4 19/23] arm64: dts: allwinner: a64: orangepi-win: Fix LED node name
Date: Sun,  7 Aug 2022 21:38:26 -0400
Message-Id: <20220808013832.316381-19-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220808013832.316381-1-sashal@kernel.org>
References: <20220808013832.316381-1-sashal@kernel.org>
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
index a0db02504b69..963a7c505e30 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
@@ -78,7 +78,7 @@ hdmi_con_in: endpoint {
 	leds {
 		compatible = "gpio-leds";
 
-		status {
+		led-0 {
 			label = "orangepi:green:status";
 			gpios = <&pio 7 11 GPIO_ACTIVE_HIGH>; /* PH11 */
 		};
-- 
2.35.1

