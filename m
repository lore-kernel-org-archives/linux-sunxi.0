Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385BB2F2A
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Aug 2024 03:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724126285; cv=none; b=HvZ4FEJ5qwUbM99Hdd5f78HbJZAQL/n+rQb6UCajmc/+0cB508xOicOzcub3cgW9SYMCWC43GcXyd8vLIRx3BbvOW1WJteibzUI14byae3vvPwDgdNYqDxqBO+WVDK++dDpl9lZFvxS3n7IBpFOgcV7vfrfgk4bHUkpLbciPYsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724126285; c=relaxed/simple;
	bh=mmOgcyCfBFdErLrOLtV2GtGnZgs7oWhwWnSiOcOVecQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nv6R5a86Y4BPZw8Vj4JxK9CpehFYPbwkbPouoUSvXlq0u+qbRwVagvBVsnmuqU4do2kJXOEjom0Vrssaq0SS50lQY/IfR4RP2jdewjM2ZYoaJRmgCL3HeW/4WfJIZn0/TObLnU8Yrr+ZrpJHA54+gLJsPY9DBKEG1XcGvfzEDRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=XRXkUPy3; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="XRXkUPy3"
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1724126281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6MSYoUFUlL53+l626iAN1HyCTu4sv54B1LG1QwOvN8A=;
	b=XRXkUPy3TxEws0/uYt+fcDoMzNwxiFyLl66YfDYmFAb/pKznWzNjQ2LAwdldDWZQzcvCpU
	NHWv08LKEhI2yRKhKvXixkOPaAwVV6UN1xuaavfeOCcULovhPItbYWzshpfamyj3xlB4Bu
	dEyDcQcz1WaLm9KrunDD7Zd2G15GgnH2qBymHnPw6cU3XemvFpHBp/Y8LpBKpZ40Bf8htF
	tF1v73qMC3y/GkFH/2wOO6BU/ns2+5m7eBQdGroxdQ4//vcnCV2vI+l7E1RkZ2xtNn4Gue
	5xdUBbR2M4wsZJeopKm5kRCdCBpqTL6DX1OcD2lSpp3vCVHQxT+Hd7O9pOIxnA==
To: linux-sunxi@lists.linux.dev
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	uwu@icenowy.me,
	wenst@chromium.org,
	broonie@kernel.org,
	daniel.lezcano@linaro.org
Subject: [PATCH v2] arm64: dts: allwinner: a64: Add GPU thermal trips to the SoC dtsi
Date: Tue, 20 Aug 2024 05:57:47 +0200
Message-Id: <0a6110a7b27a050bd58ab3663087eecd8e873ac0.1724126053.git.dsimic@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Add thermal trips for the two GPU thermal sensors found in the Allwinner A64.
There's only one GPU OPP defined since the commit 1428f0c19f9c ("arm64: dts:
allwinner: a64: Run GPU at 432 MHz"), so defining only the critical thermal
trips makes sense for the A64's two GPU thermal zones.

Having these critical thermal trips defined ensures that no hot spots develop
inside the SoC die that exceed the maximum junction temperature.  That might
have been possible before, although quite unlikely, because the CPU and GPU
portions of the SoC are packed closely inside the SoC, so the overheating GPU
would inevitably result in the heat soaking into the CPU portion of the SoC,
causing the CPU thermal sensor to return high readings and trigger the CPU
critical thermal trips.  However, it's better not to rely on the heat soak
and have the critical GPU thermal trips properly defined instead.

Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---

Notes:
    Changes in v2:
      - Added "a64:" at the end of the patch subject prefix and adjusted the
        patch subject a bit, to match the usual prefix better
      - Dropped the removal of potentially redundant comments that describe
        the units, as suggested by Icenowy [1] and Chen-Yu [2]
    
    Link to v1: https://lore.kernel.org/linux-sunxi/a17e0df64c5b976b47f19c5a29c02759cd9e5b8c.1723427375.git.dsimic@manjaro.org/T/#u
    
    [1] https://lore.kernel.org/linux-sunxi/24406e36f6facd93e798113303e22925b0a2dcc1.camel@icenowy.me/
    [2] https://lore.kernel.org/linux-sunxi/662f2332efb1d6c21e722066562a72b9@manjaro.org/T/#mdd7b18962c1ae339141061af51b89cd68bc04d50

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index e868ca5ae753..a5c3920e0f04 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -263,13 +263,29 @@ gpu0_thermal: gpu0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&ths 1>;
+
+			trips {
+				gpu0_crit: gpu0-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 
 		gpu1_thermal: gpu1-thermal {
 			/* milliseconds */
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&ths 2>;
+
+			trips {
+				gpu1_crit: gpu1-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 	};
 
