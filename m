Received: from a.peacevolution.org (a.peacevolution.org [206.189.193.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9073D1ABEC7
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Nov 2024 19:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.193.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730577389; cv=none; b=j6JBI5bsR0+E7TL2t36Obx0ZxsgyOEE0DyG71u+O/yAS+0eA7AosXSVORv4qpoItKdZL4FD94d6ekhi6zPCATiIjJXOc0Z96IQV0sX7hrjAfsStHMABaep6AVAX5yvmjN6sap5L3lDSDeaX3IflpFBMj3AcTGp8ZkjNthzCuayE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730577389; c=relaxed/simple;
	bh=Az7W1ohdHrR78IqIcSfKr8mkmXTqZ+V08E1PhLHn4d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2uVIA2p7Q5AxatoDBrllB1+9GTwawkMn4f/JWtSMcFyxzkzwp/5u5UfFjjOVu1m7o3TS1jafzQDvs+2G/CdE/BMyhex7GfUECDGkBApomGd0ayXE2l8tXHmkqFXWnuK9KrzJdAQwFMN24kp/dwJJ83U9Wu/07hN9uWGrI7c6u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org; spf=pass smtp.mailfrom=peacevolution.org; dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b=Pjp06f/L; arc=none smtp.client-ip=206.189.193.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b="Pjp06f/L"
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id ACC684C854;
	Sat,  2 Nov 2024 19:56:26 +0000 (UTC)
From: Aren Moynihan <aren@peacevolution.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Aren Moynihan <aren@peacevolution.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: [PATCH v4 6/6] arm64: dts: allwinner: pinephone: Add power supplies to stk3311
Date: Sat,  2 Nov 2024 15:50:45 -0400
Message-ID: <20241102195037.3013934-15-aren@peacevolution.org>
In-Reply-To: <20241102195037.3013934-3-aren@peacevolution.org>
References: <20241102195037.3013934-3-aren@peacevolution.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spam-Level: ****
X-Spamd-Bar: ++++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730577387;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=1Fb34FGXqzMNx+nxE4qoPozuG7GAzwlPuHgHmRcGRGE=;
	b=Pjp06f/LQfljxy4nUX7anE7BKppC4jnYqRqIDe1m7j06931HUoyxpBYZ6g1MUUe0uReAXB
	89CSOhXwYBG+oYdlidrjtzcCkFSUADPTFl3zAgUDxisOqeX11FOGMjeZExcKpc9yHtVrk+
	ivqT/Kd9YSRMrm65fNEpQdifcsk3ZAA=

From: Ondrej Jirman <megi@xff.cz>

This allows the driver to properly handle powering this device, and
disable power during suspend.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Aren Moynihan <aren@peacevolution.org>
---

Notes:
    Changes in v2:
     - add leda-supply

 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 6d152066a59a..618341b63db2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -260,6 +260,8 @@ light-sensor@48 {
 		reg = <0x48>;
 		interrupt-parent = <&pio>;
 		interrupts = <1 0 IRQ_TYPE_EDGE_FALLING>; /* PB0 */
+		vdd-supply = <&reg_ldo_io0>;
+		leda-supply = <&reg_dldo1>;
 	};
 
 	/* Accelerometer/gyroscope */
-- 
2.47.0

