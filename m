Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B792805
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Jan 2023 01:03:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55B0612FC;
	Thu,  5 Jan 2023 17:04:33 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 000253F23F;
	Thu,  5 Jan 2023 17:03:48 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 1/4] dts: add riscv include prefix link
Date: Fri,  6 Jan 2023 01:01:52 +0000
Message-Id: <20230106010155.26868-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20230106010155.26868-1-andre.przywara@arm.com>
References: <20230106010155.26868-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner D1/D1s SoCs (with a RISC-V core) use an (almost?) identical
die as their R528/T113-s siblings with ARM Cortex-A7 cores.

To allow sharing the basic SoC .dtsi files across those two
architectures as well, introduce a symlink to the RISC-V DT directory.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 scripts/dtc/include-prefixes/riscv | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 scripts/dtc/include-prefixes/riscv

diff --git a/scripts/dtc/include-prefixes/riscv b/scripts/dtc/include-prefixes/riscv
new file mode 120000
index 0000000000000..2025094189380
--- /dev/null
+++ b/scripts/dtc/include-prefixes/riscv
@@ -0,0 +1 @@
+../../../arch/riscv/boot/dts
\ No newline at end of file
-- 
2.35.5

