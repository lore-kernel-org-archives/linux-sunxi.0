Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AFF9477
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Aug 2023 09:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biqu3d.com;
	s=tfld2305; t=1691139763;
	bh=076LEVD4BSyLWa2SK5VEdvnkqk724L3qR38RrXLbRys=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=U1QcAi10vNcKy0uCpS48sWcAEop1nsZtvGzTWhsUjoY95mniWSc6l/V/BKQvBBtNr
	 gw865bhoUQ4NGekVyFS2mU0OWrKaSW7LkQZIgulYGKZhTk4wOnkLO1GjPv1i5/HoH9
	 1yqkTuDLDfnCoViOfBeP8BcwLY+SsMx03IZ5ipMg=
X-QQ-mid: bizesmtp65t1691139692t3on4gcc
Received: from localhost.localdomain ( [178.41.211.221])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Aug 2023 17:01:13 +0800 (CST)
X-QQ-SSF: 01400000000000404000000A0000000
X-QQ-FEAT: CbHyMb8VrI0apQFECDBnaa0WH30dRGFXyvH1NAubuW747/SP5wwgte8RozsWT
	lmsxn3196kNP4oFbTgDFKlTaao13LeM/mQ8BgcmMmiZc/Pk9Ca73xI4sRt2nsb1+6yYso/1
	W7175A8iZQyXzbS7AJCiM3cAf3u+5RIU3rFSeJVHEdHhyrK2b3DcA+LcFEy0PwLAhN43NCE
	ISoMEPZnrDb9MumTUaX1nZkNvGSAYugG6Tqom2XMwFp4lIo11hbQLM58Kmr2HI0+WmqsmH8
	CQpLtcuyIxYiS8Hh7p4onAco7qQ/kymhfIFERX5CVmO6TrIVpbDag5d7OP3+uPq5W7l4WfQ
	dwfRWLRbzoAMbQ8gSqWYYxtfeg0YfFBo4rF4hIfxksaLmcokkv6oQpLIIk3ZA==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 3923523324437657278
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
Subject: [PATCH v2 0/4] Add BigTreeTech CB1 SoM & Boards
Date: Fri,  4 Aug 2023 11:00:28 +0200
Message-ID: <DC7CD91802A925BE+20230804090102.273029-1-martin@biqu3d.com>
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
 .../sun50i-h616-bigtreetech-cb1.dtsi          | 142 ++++++++++++++++++
 .../allwinner/sun50i-h616-bigtreetech-pi.dts  |  68 +++++++++
 6 files changed, 260 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts

-- 
2.41.0

