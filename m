Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4261FDE
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 08:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biqu3d.com;
	s=tfld2305; t=1691224693;
	bh=+BxO+ZED4zlRuZz4xYXEOBi7Y6/aGXllrwkGPtZgaP4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=NJfa5dhnhHGTRK9QJKuba7poaFYrpfppJ2j/BDOI9gg/S3G2ksmO4Kok/HlhXGn4K
	 v+hpbtcrb6l4LpRu3S++Ps92uCd4L7f586/AQrqRzAKXucZeAcgy/RbHKqrj7NrXFE
	 PJw6T7WKBDrbjr5/AH7kxkoY2s22AxBOv4RFBaIk=
X-QQ-mid: bizesmtp83t1691224631t6khw1z3
Received: from localhost.localdomain ( [178.41.211.221])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 05 Aug 2023 16:36:53 +0800 (CST)
X-QQ-SSF: 01400000000000505000000A0000000
X-QQ-FEAT: j84kgieUNVTkzKKF5myYsXOvfz8GfDL4jsNw/vycnjfxv6NngBvTipOzKxPTj
	UjRe8ZDtEr1QClYjcBSbLGdtlkT7ZefMc6FfCYz6NX7za06zThAmxp1KCn2qwaAvOWy367c
	WqMBKSEfsZtF525y/10287o6zNtUs7vXtnrWE7zLq0oXpDGxfShZPYIdtn7oxvpj+hbjUgx
	QOqnCqYnR51vJY46hxjGyf0bSY64Cxk/xhztUiZoaLnCaPxYKg/XR2w0hnizbAakapIEqKw
	6euan9E702YY0mUE978CAQjlV6LIH142+X35WWkN2dKj87y2M7QnRs8F23pjThFK2ns30KB
	ThytapvsBxyBKDZ4Ol19DpJQCaqElS378PV6vlYMdmwDm05XPJF5zzTqoQvMw==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 7752003586006880166
From: Martin Botka <martin@biqu3d.com>
To: martin.botka1@gmail.com
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jami Kettunen <jamipkettunen@somainline.org>,
	Paul Bouchara <paul.bouchara@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Martin Botka <martin@biqu3d.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Icenowy Zheng <uwu@icenowy.me>,
	Ludwig Kormann <ludwig.kormann@ict42.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Add BigTreeTech CB1 SoM & Boards
Date: Sat,  5 Aug 2023 10:36:03 +0200
Message-ID: <5EB3DB1D7F80A40F+20230805083636.788048-1-martin@biqu3d.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:biqu3d.com:qybglogicsvrgz:qybglogicsvrgz5a-1

Hello,
This series adds a vendor prefix for BigTreeTech and adds BigTreeTech CB1,
Manta board and BigTreeTech Pi.

CB1 is just an SoM thats based on AllWinner H616.
BigTreeTech Manta boards are expander boards for CB1 and BigTreeTech Pi
is an CB1 in Rpi style with few additional things like IR receiver and fan port
on GPIO.

This work started before I was hired by BigTreeTech and thus majority of the
patches are from SoMainline email and few are from my work email.

This series depends on commit https://lkml.org/lkml/2023/8/2/801
"dt-bindings: mfd: x-powers,axp152: make interrupt optional for more chips".

Cheers,
Martin

Martin Botka (4):
  dt-bindings: vendor-prefixes: Add BigTreeTech
  dt-bindings: arm: sunxi: Add BigTreeTech boards
  arm64: dts: allwinner: h616: Add BigTreeTech CB1 SoM & boards support
  arm64: dts: allwinner: h616: Add BigTreeTech Pi support

 .../devicetree/bindings/arm/sunxi.yaml        |  11 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   2 +
 .../sun50i-h616-bigtreetech-cb1-manta.dts     |  35 +++++
 .../sun50i-h616-bigtreetech-cb1.dtsi          | 140 ++++++++++++++++++
 .../allwinner/sun50i-h616-bigtreetech-pi.dts  |  70 +++++++++
 6 files changed, 260 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts

-- 
2.41.0

