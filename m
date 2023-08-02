Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2185125BC
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Aug 2023 22:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biqu3d.com;
	s=tfld2305; t=1691014016;
	bh=KuKfICHe8kJpAKODRVYzdda8Hek5/0cPyGj8I7ZATlM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=cGZo2uUmVNRochHlVubsDjPgFcYAwGYPAVZ+YZnf/X+bl56KhP5zhyne+WfSXgziz
	 7x1cJBHv45b0ACRFqvy26Tm3ODsh4Yfxtpgi6Y5w1OmueZo3LzI8rQ6QY1UpzDNEag
	 meCanGvVnX0aWRbVT77WNPYDBEqY6JlvzkMq7+fQ=
X-QQ-mid: bizesmtp89t1691013810t38ek73v
Received: from TimeMachine.lan ( [178.41.211.221])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Aug 2023 06:03:11 +0800 (CST)
X-QQ-SSF: 01400000008000201000B00A0000000
X-QQ-FEAT: iDzLjIm7mlb6svzCVDKdtprdYr5Ri/HS/vKXlXvRaJu43GC2mBGpFg65hutKI
	VEq5zJRTqZ9of6v/teJS70B3V4Cuy1Q51oVsX7YKe0I2SduKmIdoHh175Ng3iWEEJ11xHm0
	mV6tqRfz7I3kq67ecFnK3V5QmJlrAwhZL8ZjQFB36pA5zcm81W5RLW4+Yc1rBQxJAbLAwQ5
	a2bqTIJQDcB8JKnpDnGHSwRRemeh0J+9RuaEoB0z6IaFag2ISYCjIeCnP9pXJHRTe5X+QsD
	HnWFSnETtxbJPY8psOBGvV7EnJ/qdHNQ1C/ubOT6TffaqnRs40q7gDZy1ETG4uXYXeBBMge
	B1idzazbfcreHgLsNjXEjVy5bvznjXxM5r02sTh0e4dKyQGr2E=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 14097724008001462046
From: Martin Botka <martin@biqu3d.com>
To: 
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
Subject: [PATCH v1 0/6] Add BigTreeTech CB1 SoM & Boards
Date: Thu,  3 Aug 2023 00:02:33 +0200
Message-ID: <910F0CD8FD751C0C+20230802220309.163804-1-martin@biqu3d.com>
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

Martin Botka (6):
  dt-bindings: vendor-prefixes: Add BigTreeTech
  dt-bindings: arm: sunxi: Add BigTreeTech CB1
  dt-bindings: arm: sunxi: Add BigTreeTech Manta board
  dt-bindings: arm: sunxi: Add BigTreeTech Pi
  arm64: dts: allwinner: h616: Add BigTreeTech CB1 SoM & boards support
  arm64: dts: allwinner: h616: Add BigTreeTech Pi support

 .../devicetree/bindings/arm/sunxi.yaml        |  16 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../sun50i-h616-bigtreetech-cb1-manta.dts     |  20 +++
 .../sun50i-h616-bigtreetech-cb1.dtsi          | 164 ++++++++++++++++++
 .../allwinner/sun50i-h616-bigtreetech-pi.dts  |  44 +++++
 6 files changed, 247 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts

-- 
2.41.0

