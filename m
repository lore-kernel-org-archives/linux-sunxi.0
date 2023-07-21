Received: from out-17.mta1.migadu.com (out-17.mta1.migadu.com [95.215.58.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF6927F12
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jul 2023 22:16:41 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689977799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SGOT/l6CA2g1AAdldYA0RXmYrJ8ccwGw6CVVK+w5BCA=;
	b=VLdIbyfiarCZNCB0QlGxH273eSht0Yq8c8LmI3LDTUsl1VYdq+uOx1lz43tZRA8ERNOt9U
	yQE1SKMu2JAEAm51KsOLPPLUlM53OvVtECwynDB97Wm9cl4c9dYK3SId57lMAJC107p8jj
	x70KJmniOy1xmL1PXrPQt+03j+xfzjTLPDOwfpa96KiJ0RfqjhSxWczv6Sxn+YnNObhQ04
	+uFiu8BSWoEegNqTDmtgTSwGBMF3mMw8sjojvKJb+x3tis+ZERqMcFMJaY0j8lnlmCVrJa
	yBIyGkDKSbPxLjD5Btmia3l7tFY5kZ++eQuTUIBbyZmTDIzcPuBLXpUyMkrBVA==
From: John Watts <contact@jookia.org>
To: linux-sunxi@lists.linux.dev
Cc: Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	John Watts <contact@jookia.org>
Subject: [PATCH v2 0/4] Add support for Allwinner D1 CAN controllers
Date: Sat, 22 Jul 2023 08:15:49 +1000
Message-ID: <20230721221552.1973203-2-contact@jookia.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This patch series adds support for the Allwinner D1 CAN controllers.
It requires adding a new device tree compatible and driver support to
work around some hardware quirks.

This has been tested on the Mango Pi MQ Dual running a T113 and a Lichee
Panel 86 running a D1.

Changes in v2:
- Re-ordered patches to work with bisecting
- Fixed device tree label underscores
- Fixed email headers

John Watts (4):
  dt-bindings: net: can: Add support for Allwinner D1 CAN controller
  riscv: dts: allwinner: d1: Add CAN controller nodes
  can: sun4i_can: Add acceptance register quirk
  can: sun4i_can: Add support for the Allwinner D1

 .../net/can/allwinner,sun4i-a10-can.yaml      |  6 ++--
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 30 +++++++++++++++++++
 drivers/net/can/Kconfig                       |  4 +--
 drivers/net/can/sun4i_can.c                   | 22 ++++++++++++--
 4 files changed, 55 insertions(+), 7 deletions(-)

-- 
2.41.0

