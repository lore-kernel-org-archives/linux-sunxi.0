Received: from the.earth.li (the.earth.li [93.93.131.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B04B33C8
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Apr 2023 17:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
	s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SuK0Nqd+nS8SKUO0Du0/KQ2vGgQINfivPg9iv+lc2e8=; b=QMszMv9lQlnmQjnVcFHF+mMKxz
	UIfObinv+dr6ErxW/cA73BQtmAMgwfW96jimxUxUUZ+DUIUPuKPECjWK+hfxVPOHqvc4+GGrxMl8P
	7BrkcpGDS8Wj+3C6jG25y6CA0E5q4IuGzy6mlOijtVNSW9d72Xmh2WFjsoVGdopp8pbwCTbZU0NVJ
	YwTUXU46pmxJspVAKv19lOCAQawtvU9zZoNsM0XNGcrHYm5WgFgTr4QnsV18XLEVsKzTlmH/pwvef
	g00uLngAY22PrVKADROodq2YW5ICLLcq7LL8dWFMXn90SDVFiLfeN0TTRgzEmK6eRUlc1cWqJrEFw
	b3KL3awA==;
Received: from [2001:4d48:ad59:1403::16a3] (helo=earth.li)
	by the.earth.li with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <noodles@earth.li>)
	id 1pnjyn-00FJoJ-Ov; Sat, 15 Apr 2023 18:46:29 +0100
Date: Sat, 15 Apr 2023 18:46:24 +0100
From: Jonathan McDowell <noodles@earth.li>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: sun5i: Add port E pinmux settings for mmc2
Message-ID: <00d37ef9bf70785d05fb446ee6d0060c4a8d521a.1681580558.git.noodles@earth.li>
References: <cover.1681580558.git.noodles@earth.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1681580558.git.noodles@earth.li>

These alternate pins for mmc2 are brought out to the 40 pin U14 header
on the C.H.I.P and can be used to add an external MMC device with a 4
bit interface. See

https://byteporter.com/ntc-chip-micro-sd-slot/

for further details on how.

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 arch/arm/boot/dts/sun5i.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 250d6b87ab4d..e4922506ce22 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -517,6 +517,14 @@ mmc2_4bit_pc_pins: mmc2-4bit-pc-pins {
 				bias-pull-up;
 			};
 
+			mmc2_4bit_pe_pins: mmc2-4bit-pe-pins {
+				pins = "PE4", "PE5", "PE6", "PE7",
+				       "PE8", "PE9";
+				function = "mmc2";
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
 			mmc2_8bit_pins: mmc2-8bit-pins {
 				pins = "PC6", "PC7", "PC8", "PC9",
 				       "PC10", "PC11", "PC12", "PC13",
-- 
2.39.2

