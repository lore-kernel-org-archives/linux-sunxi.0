Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2AB53B3
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Apr 2023 10:24:44 +0000 (UTC)
Received: from debian-test.local.in-circuit.de ([84.160.205.173]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MxE5Y-1qDpy2483U-00xXMj; Thu, 20 Apr 2023 12:24:23 +0200
From: Ludwig Kormann <ludwig.kormann@in-circuit.de>
To: samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andre.przywara@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm: dts: sunxi: Add ICnova A20 ADB4006 board support
Date: Thu, 20 Apr 2023 12:24:07 +0200
Message-Id: <20230420102409.1394618-1-ludwig.kormann@in-circuit.de>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XmyExJUcyaHlgkS3PmANMlORisd9ThgvbQjfc2YPKpP4gQkUbj0
 9eQ3tWIBgvl9I9mLFHUyVNGc1AtnRUdp5io4vfD/ubEdf4ggTQFihP6qbUo/yXlYqVMJzei
 nMLA0oTsNJB7FUFcNxC5+7Nk5icYNE33L5GRG7t0OxqyRJGW85dC6rrKfwg1vEXMQiggPQY
 ycQi7E3j7cQFDfSnUX96w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+qBpm5I9Lyk=;1GEbhepTFQiwglEP/GXLZmzJ91M
 hGGyZLnt2tzalixY6EmLHFca8jgESBWab2fdEqx8cuaWfGK+o8Zj38LRl/BiYmcfUkc6Cd+Uv
 nK1ReqXhQlHtFevi5m7BE2107aGZXemTu061kg/jR0/Nv3s8KL0JjE2l5IupJlpEiOOj8Eg9p
 YIngaWP16srrpxajmcTagXVkOpcbA1Q2QLwIJCY2L4i3T8/GYU0jv/Jdb5LXzhCrLYpq+hyOm
 WOVVdxbhsvC6/4KBJfjO6uqlkFr6Wh8VxgwAN/5H+F7cHWq+C1Ge60OY8yABLrZgQHJWO4Vwr
 TwWxsLqqWwxuU7Hj0hDULWYU8qTdplWOE3t1TwMRD211u104/HAEKw/GhsKYMJo+t0E5HBtiv
 iR175dkKrfy5pOZZozJMITuUhHX+3VJEl9pw/eqp/tWZ98M8o+PC74lLmxVVuhW73nQwqxhQR
 tT7j4V1amoscZYA4ZuAZbW3AfrayIK3KePd28TIok5krHBA7/oXXZJYGqlTAIeUg0YaVFAXno
 b+0x66SmMpf3s0rKDaJegKuEgE6/BCX+MXhVcfhht7lT818mO1ev1KNUU9PuqC3YIo6CsJyIw
 hDHlgWq29lCLgSUGGWIqsYv8iRjpQNlbyrioxAm7en1crvK0FDgfk+deszZT+8C2sOMzuDspM
 j757x2rcNOWpPFIYZo5hTQdo+icuAZwbeJjDhQS8Xw==

Add board support for ICnova A20 SomPi compute module on
ICnova ADB4006 development board.

v3:
- drop stray blank lines at end of files
- separate patch for bindings
- update licensing to "GPL-2.0 OR MIT"
- fix typo: ICNova -> ICnova

v2:
- use short licensing header
- remove deprecated elements from led nodes
- disable csi power supply
- add missing pins in usbphy node
- split dts into SoM dtsi and carrier board dts

v1 of this patch was sent to the uboot mailing list [1].

[1] https://lists.denx.de/pipermail/u-boot/2023-April/514605.html

Ludwig Kormann (2):
  dt-bindings: arm: sunxi: add ICnova A20 ADB4006 binding
  arm: dts: sunxi: Add ICnova A20 ADB4006 board

 .../devicetree/bindings/arm/sunxi.yaml        |   6 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/sun7i-a20-icnova-a20-adb4006.dts | 137 ++++++++++++++++++
 arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi   |  62 ++++++++
 4 files changed, 206 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
 create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi

-- 
2.30.2

