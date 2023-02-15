Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A2E5CB8
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Feb 2023 20:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Nm6XL9EmKootcd4yjvHH8UZ77IxEkk6Gx2zX6Qkn1sU=; b=GRXQdXOdVjKugMIj6vYmkR6z+c
	tE41n1KbONRNr3NV4YXgZSdMOEVn5/1gCdzlxD8lDYtnbEZC0tsHA6gH/XWo/iVTgjKa+Efojf7j/
	G3X5sPl/+Wmho26LM8904Xfwr+Yni2gD9GCcUBZaOPJjwyPH0xhHBVXVVJtxfcsgEGxkfVt2xGP8k
	6G04gRleEPJyOxb7jHV+CzjNPcucbU+00dpGiz7Csi1JW6mGAKTI5N2jSxbqvRbYFpOceWceFwcjG
	ZbkWcS0KKK/hxCICEt/ZnT7+6nKKrzvnLyAgYDfHY3dcAsbYJepme/v8XMO1B5PhcN4VPmFWJ9VVY
	9LrmTvTA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1pSOWj-002j5f-Vs; Wed, 15 Feb 2023 20:37:18 +0000
From: Bastian Germann <bage@debian.org>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Bastian Germann <bage@debian.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: allwinner: a64: Add hwspinlock node
Date: Wed, 15 Feb 2023 21:37:10 +0100
Message-Id: <20230215203711.6293-6-bage@debian.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215203711.6293-1-bage@debian.org>
References: <20230215203711.6293-1-bage@debian.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: bage

Add the hwspinlock to A64 which is already implemented for A31.

Signed-off-by: Bastian Germann <bage@debian.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 77b5349f6087..f2ecc21f06ed 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -851,6 +851,17 @@ wdt0: watchdog@1c20ca0 {
 			clocks = <&osc24M>;
 		};
 
+		hwspinlock: hwlock@1c18000 {
+			compatible = "allwinner,sun50i-a64-hwspinlock",
+				     "allwinner,sun6i-a31-hwspinlock";
+			reg = <0x01c18000 0x1000>;
+			clocks = <&ccu CLK_BUS_SPINLOCK>;
+			clock-names = "ahb";
+			resets = <&ccu RST_BUS_SPINLOCK>;
+			reset-names = "ahb";
+			#hwlock-cells = <1>;
+		};
+
 		spdif: spdif@1c21000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-a64-spdif",
-- 
2.39.1

