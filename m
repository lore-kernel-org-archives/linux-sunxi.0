Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7332222A9;
	Wed, 25 Feb 2026 17:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038851; cv=none; b=C1ak0hh3q7JBtCM7xlFnd5qf2GlYbJiCn+SP2Zo2tvQ/aIxXr7nNIp7Tb7m0ImJR9cjkDKaRmzkuY1stmunCjnCvdGyDD54yr2UdzPM4nKoE0kz8mZ28xhYuIq8IsJTl0oDn7izvTE3BpbY954xe/w0ilL+OsNBCnQp2kHaWA4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038851; c=relaxed/simple;
	bh=PNi0/q4UjW5yMslxBn+SOhC+y5Dq6F9aivP5HpDL04s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N2SYGt83pJ0Z/XiO1oS+A0BQSJdU8Xn+YCIfanCxSQjBZGMrMFduYC+FnFRD7UwOokcVBk1qeWxOOMnShplPjF1zfnLt4c0q6Z2Wd+kPOBQa6FyQOCs1EjORiGdjKg0O1I+37wZSqmVWVoH/+Nctw1Pge/AVuWxhK2o/5BAIgz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQXAnmwU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQXAnmwU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDE4C116D0;
	Wed, 25 Feb 2026 17:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772038851;
	bh=PNi0/q4UjW5yMslxBn+SOhC+y5Dq6F9aivP5HpDL04s=;
	h=From:To:Cc:Subject:Date:From;
	b=bQXAnmwUUO4LEEFrLZyamQRoP73t0nSZoDD1T4nV/7Es3kXCzK0p9z9TPjuQYJchH
	 alKkgA5Sms82jlH2bGPfmd0A0WKIr6AAxnJKd03ev7/265PxpVpBQTrYIzmWHKmm3g
	 w+MRUPwbgzoj6nTovchwWBOxM2NuYP64xPgTlixg0EvmccIJIdykNwNKccYdncB2gd
	 MthZN+KjLruyCPN+tDh367gC8EXz2AdPtA8R8EsulxlDx3STY6gMe86YHg7MhBq4fs
	 DsZXlRmy+vEqpcmBK/kXdJrYy3DM21MrSceEGhESZrr6ao/Da9eoG6QplhxY9NpWfh
	 Q8mSv+jOOdx1Q==
Received: by wens.tw (Postfix, from userid 1000)
	id A68325FD2A; Thu, 26 Feb 2026 01:00:48 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: pine-h64: Enable USB 3.0 host
Date: Thu, 26 Feb 2026 01:00:44 +0800
Message-ID: <20260225170045.1707778-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On both Pine H64 models, there is one USB 3.0 host port directly
connected to the SoC. The VBUS is shared with the other USB 2.0 ports.
Unfortunately the DWC controller binding does not have a VBUS supply.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index fa7a765ee828..f2c453ed344a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -89,6 +89,10 @@ &de {
 	status = "okay";
 };
 
+&dwc3 {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -333,3 +337,7 @@ &usb2phy {
 	usb3_vbus-supply = <&reg_usb_vbus>;
 	status = "okay";
 };
+
+&usb3phy {
+	status = "okay";
+};
-- 
2.47.3

