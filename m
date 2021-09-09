Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4442FAE
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Sep 2021 11:52:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CED3A61B32;
	Thu,  9 Sep 2021 11:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631188336;
	bh=p+sAzM/XDE2JhZloIqQUgcKpO2Gb1o+zgmF5bat62yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rw+S++0rwbkQI99ZrlijyiWQDRmu76sz4r4o9+wN+BOVUeNhjd9o0i3lTxr+raIV/
	 potKDPK63xGKIC1LQ46Qy2VWmaCB5NvC6HH/4JhpRPfaR9NAaV6q/QtsEpVze5gvYI
	 HRS9ceAKyhugR2hOTA5+za553q76gEuf7rp7GPnih+OD7XFe/4kX7b5rvvJPqTCfhM
	 H5LXUKJNHbdEDrOuhGz0Gz6lCUtBCXYrpyx8YV/NwLA3y8ro3wBd6e06aw76rE8yCj
	 wWgXFDnyg7Qzl7f0jX5RDVvrlU27Qlrjy9m/f9JYhy2vhi7ypL67MFZ3C3Uc90XL7y
	 bM7l4zik6qTvg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>,
	Sasha Levin <sashal@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 045/176] arm64: dts: allwinner: h6: tanix-tx6: Fix regulator node names
Date: Thu,  9 Sep 2021 07:49:07 -0400
Message-Id: <20210909115118.146181-45-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115118.146181-1-sashal@kernel.org>
References: <20210909115118.146181-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

[ Upstream commit 7ab1f6539762946de06ca14d7401ae123821bc40 ]

Regulator node names don't reflect class of the device. Fix that by
prefixing names with "regulator-".

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://lore.kernel.org/r/20210722161220.51181-2-jernej.skrabec@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
index be81330db14f..02641191682e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
@@ -32,14 +32,14 @@ hdmi_con_in: endpoint {
 		};
 	};
 
-	reg_vcc3v3: vcc3v3 {
+	reg_vcc3v3: regulator-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	reg_vdd_cpu_gpu: vdd-cpu-gpu {
+	reg_vdd_cpu_gpu: regulator-vdd-cpu-gpu {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-cpu-gpu";
 		regulator-min-microvolt = <1135000>;
-- 
2.30.2

