Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594EF1E0493
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jan 2025 19:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736190664; cv=none; b=LHl0k6ZjwNMQ9p3SAyoe+XLKyRY3F1yH6W7fqZUtxBv4rFp9iQemhoTLQw344aC3FIDhGSWkGwLpPcR9AZv4xalFkHZ8883wcBo4kRvSEbYYwWwBY6em6m61XsSIt05vxmethxziJsMC5AeAH35agxE+MKsnc3oNtfvodQWSuGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736190664; c=relaxed/simple;
	bh=R5TC+H8iqyGub1Z4HABbztLdtLD8EB1Hqd6fy5XKwOw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sQWr7CxdHa+gmubFw6gubq9qITilD8HOz6rRslm19lcD2LfhtEWSYHtRuUKpS8q8bFOVtRddTaaApfIRmwhzRhzK8KTylu6LCpZXH1EWM5HmJ5LlZJha0FV7DFMlGHxvDL2Nih0RC6s3xYHHiV6hXFBzaUeV5LMvwKaJ3MRdlhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=t0WF6L+C; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="t0WF6L+C"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=r8uHDg/x40TevlTefyWB2n9w7vCjeuz91hItU9OU7bQ=;
	b=t0WF6L+CLmIpygiUfB0vGEh0jF3MvSvB1uyHvGfkxTjG1nInkFpXjMEXKfWlOlszW3vxZqFkc26eNhqU154ZLgSO1G7+g3Vcvu8d4sm5AHqixXkhy/HRH/YcSoUHMqFlbTGdwmYusKDjOheBV2zDB8M0lWwVUHtwzOHOXHVUcjQ=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Mon, 6 Jan 2025 20:10:42 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] ARM: dts: sunxi: add uart1_pe pinctrl for sun8i-v3s
Date: Mon,  6 Jan 2025 19:07:01 +0000
Message-Id: <20250106190703.4015-4-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250106190703.4015-1-lukas.schmid@netcube.li>
References: <20250106190703.4015-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added the uart1_pe_pins pinctrl for use by the NetCube
Systems Kumquat board

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index 9e13c2aa8911..f909b1d4dbca 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -416,6 +416,12 @@ uart0_pb_pins: uart0-pb-pins {
 				function = "uart0";
 			};
 
+			/omit-if-no-ref/
+			uart1_pe_pins: uart1-pe-pins {
+				pins = "PE21", "PE22";
+				function = "uart1";
+			};
+
 			uart2_pins: uart2-pins {
 				pins = "PB0", "PB1";
 				function = "uart2";
-- 
2.47.1


