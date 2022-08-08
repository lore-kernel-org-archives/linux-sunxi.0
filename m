Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F094A7A
	for <linux-sunxi@lists.linux.dev>; Mon,  8 Aug 2022 01:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7122FC4347C;
	Mon,  8 Aug 2022 01:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659922638;
	bh=CRl5thBS3ZKwFT58v02G+ypacOiiUGNgiHmYuAwki8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D+mjygdB5IXRF79KhoNObHGgIGRGuFctlD8ztKWWKwfh5G8lbfg+/IFkLMoXo3ZBs
	 0wL98Q4HYZ5qKkp9WeTPRpBO+lVmuMMCsxjxyaWRZXtnx8Tc4R6Z7d88pEiIKi53aU
	 y1qPwLdB8jWqMfLlJLKWg2uymoBsk2kF9+5x2b4cswrbxhdaF0i0mkjPc0STZPJXXu
	 o63ykdFRpbnNmPUhvVhX1Gr/zkCkfg/EqEzSI6HTqx8GB8rpEZcKoP543cdqxS9QOa
	 IWcV4O+KOWxJky1e8VZU1JJZwC4GoiAKZ9DUzKEoPrm7wnQNEL+SN2SEIGj/49BDS4
	 IdTKmk7qbmQDQ==
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
Subject: [PATCH AUTOSEL 5.15 36/45] arm64: dts: allwinner: a64: orangepi-win: Fix LED node name
Date: Sun,  7 Aug 2022 21:35:40 -0400
Message-Id: <20220808013551.315446-36-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220808013551.315446-1-sashal@kernel.org>
References: <20220808013551.315446-1-sashal@kernel.org>
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
index 097a5511523a..09eee653d5ca 100644
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

