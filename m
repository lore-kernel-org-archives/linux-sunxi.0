Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766837;
	b=Ct3JoPbAtT+937+QuNH5EiEMrO4wZoSeFbKklilqG2fd3Y75hk5JmI7NM6skMdQbk08n
	 PqsW4X/nep+bdlONGbRFMYs3m/tP61su+tx3jqr+Dl/S+HQf/r0gRHVwY6ackAM93ty1o
	 lLk6jM1X4/SnhI8eK15a0k3TiExhLLSKrh4vSSSWljcpHfwvAZv7JzfeOK20NUJ0GCygE
	 Hz0WDhYkmK2ULLE/b/tJIvEuuwrUI7Yzhmbo/PzNVGtTk0exALcdZB8rblfWK4LQ2WZro
	 eS+kqOIFJjjUyJFZ8wYwLuLdRKmsLEyfggBEbRY0vSpFGsfX7vxVAu19yX1ndkzYWPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766837;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uP2T9+mEzaneJvWG+hF9U3aolWC4k7dp9+khY3E2Xds=;
	b=I5cXg1b6AlJAajlh4ab5angZgRSoz3dKX65eIzmxJRB6LYtJUZ6lfg+kNHchkDQTDY3X
	 tQv04UfbkMYwjlWg03cQN5TF0GShBL9vXzjhTcW84Z1kC5QLT6SFMp4Q0zvakcpKgaBSa
	 WwS+ZDeLhtNmeUhUXwCRcqzZi88kv43FgJUyBuUVQeIPb+N3Dxh3LBrZeIUb6hNazWMu5
	 e5sJrUb6UDMryBIRrJGlG/cRfPHp9ORoGCKp9iD599pViQCaU1PeP2JvQuN8hhloiO+rW
	 q0Puzdll9Wc76elUY5oMecbGrwMMFuEFwqf53CCMLOPCPCxHAGjp5JStIH9GaIDi9SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=Rix4Na17;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2B2606A323
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 08:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC2B2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=Rix4Na17
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id C68B94C97A;
	Fri, 27 Nov 2026 19:07:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795766828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uP2T9+mEzaneJvWG+hF9U3aolWC4k7dp9+khY3E2Xds=;
	b=Rix4Na17urkRnqUM/sP+h41j5Yjmqu/7rkE9IuJLrl0v6kQ1CKEGwb7ZUllKZZ3eR0IC41
	GcoDm8bh4lWKB3Vy6nDn6olt36+0OTZMRTYXrXS2FUiW+RZhXeYJCNOujeIAOjSvXmNWlJ
	csfrhv3+3XF9JyP8GWt5MI24oNoPxm0wh0/KSS1uqYF19jUmpNf0R/U2A9glIhZukFgBXf
	ZQrM4D4FeOENAmWVlX6TNmucqYTa1IkDRYgC47MQiX2XTa86JhNTDa93GGSKjiXg8zueSp
	dA0Q7FA4FSHQS5T/Sy2IzMdUejs85aLA8Gwt93HCxZmOc8ISqP+C4c9xAX1aiw==
X-GPT-Reason: This is a legitimate personal/technical correspondence.
	The email content is a technical patch description for a Linux
	kernel (arm64: dts: allwinner), which aligns perfectly with the
	sender's domain (alastair@d-silva.org) and the recipient's personal
	mailbox (alastair@d-silva.org). There are no phishing indicators,
	no marketing content, and the sender identity is consistent across
	the From and Reply-To headers.
From: Alastair D'Silva <alastair@d-silva.org>
To: Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 3/3] arm64: dts: allwinner: sun60i-a733: Add simplefb HDMI node
Date: Fri, 27 Nov 2026 19:06:49 +1100
Message-ID: <20261127080649.1982883-4-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127080649.1982883-1-alastair@d-silva.org>
References: <20261127080649.1982883-1-alastair@d-silva.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a disabled simple-framebuffer HDMI node under /chosen.
List the DE3.5, TCON, and HDMI clocks and power domains so Linux
keeps them active.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index 509d0cfea160..46418fc60529 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -13,6 +13,34 @@ / {
 	#size-cells = <2>;
 	interrupt-parent = <&gic>;
 
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		simplefb_hdmi: framebuffer-hdmi {
+			compatible = "allwinner,simple-framebuffer",
+				     "simple-framebuffer";
+			allwinner,pipeline = "de0-tcon-tv0-hdmi";
+			clocks = <&ccu CLK_PLL_DE>,
+				 <&ccu CLK_AHB_DE>,
+				 <&ccu CLK_AHB_VID_COUT0>,
+				 <&ccu CLK_AHB_VID_COUT1>,
+				 <&ccu CLK_MBUS_DESYS>,
+				 <&ccu CLK_BUS_DE0>,
+				 <&ccu CLK_DE0>,
+				 <&ccu CLK_BUS_DPSS_TOP1>,
+				 <&ccu CLK_BUS_TCON_TV0>,
+				 <&ccu CLK_HDMI_TV>,
+				 <&ccu CLK_BUS_HDMI_TV>,
+				 <&ccu CLK_HDMI_SFR>;
+			power-domains = <&pck600 PD_DE_SYS>,
+					<&pck600 PD_VO>,
+					<&pck600 PD_VO1>;
+			status = "disabled";
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.53.0

