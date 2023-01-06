Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CA07E3
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Jan 2023 01:03:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8589811FB;
	Thu,  5 Jan 2023 17:04:30 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D3243F23F;
	Thu,  5 Jan 2023 17:03:46 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	=?UTF-8?q?Andr=C3=A1s=20Szemz=C3=B6?= <szemzo.andras@gmail.com>,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ARM: dts: sunxi: Add MangoPi MQ-R board support
Date: Fri,  6 Jan 2023 01:01:51 +0000
Message-Id: <20230106010155.26868-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MangoPi MQ-R is a small SBC with the Allwinner T113-s3 SoC. That is
a very close relative to the Allwinner D1/D1s SoCs, but with Arm
Cortex-A7 cores, and 128 MB of SIP co-packaged DDR3 DRAM.

This series introduces the missing T113-s .dtsi, which builds on top of
the D1/D1s .dtsi, but adds the ARM specific peripherals, like the CPU
cores, the arch timer, the GIC and the PMU.
This requires to add a symlink to the RISC-V DT directory in patch 1/4,
to be able to easily reference the base .dtsi from other architecture
directories.

After I had written most of the board .dts, I realised that the
MangoPi MQ is almost the same, minus the RISC-V/ARM difference. I am a
bit unsure if we should share more of the board .dts, though, as this
would go cross architectures. I am open to any comments here.

Please have a look!

Cheers,
Andre

Andre Przywara (4):
  dts: add riscv include prefix link
  ARM: dts: sunxi: add Allwinner T113-s SoC .dtsi
  dt-bindings: arm: sunxi: document MangoPi MQ-R board name
  ARM: dts: sunxi: add MangoPi MQ-R board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts | 160 ++++++++++++++++++
 arch/arm/boot/dts/sun8i-t113s.dtsi            |  59 +++++++
 scripts/dtc/include-prefixes/riscv            |   1 +
 5 files changed, 226 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts
 create mode 100644 arch/arm/boot/dts/sun8i-t113s.dtsi
 create mode 120000 scripts/dtc/include-prefixes/riscv

-- 
2.35.5

