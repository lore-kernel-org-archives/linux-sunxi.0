Received: from mail.croughan.sh (mail.croughan.sh [135.181.193.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3109C10EA
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 23:38:00 +0000 (UTC)
From: Matthew Croughan <matthew.croughan@nix.how>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nix.how; s=mail;
	t=1691278675; bh=ozH0GhiwKpf+3WO7HJRyIfSC4fni4M0Jmnu12HwytJg=;
	h=From:To:Cc:Subject:Date;
	b=jZroIgsjXw8+ZLSdV8FdySv3mfJs1zZ6c4ZCR1xHayM0Tbayobv1VesodrEy3glqB
	 H2ad1S+0+fHDVPdJupaEAaBOaayjgvV8Q4hv/95vA3oDl3KJx0HmpqqaQWNtw9IOen
	 vqQRNicInVQeeyLT2YUA+XkB2tWNolwxNKQw6CSc=
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Cc: Matthew Croughan <matthew.croughan@nix.how>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] arm64: dts: allwinner: h616: Add Mango Pi MQ-Quad DTS
Date: Sun,  6 Aug 2023 00:34:54 +0100
Message-ID: <20230805233715.1216456-1-matthew.croughan@nix.how>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V1: Submission
V2: Alphabetical ordering, added "widora,mangopi-mq-quad" compatible
V3: Added Signed-off-by, add to device-tree compatible/bindings documentation
V4:
- Add separate patch for bindings documentation
- Regularised comment style
- Add vcc supplies for gpio according to board schematic
- Removed unnecessary x-powers,self-working-mode;
- Added comment regarding ALDO1
- Removed unnecessary reg_dldo1 regulator, it seems to be connected to nothing
  in the schematic, no adverse effects observed
V5:
- Switch ordering of patches
- Fix comment style
- Add Reviewed-by tag
V6:
- Corrected Reviewed-by tags on commits
- pass #interrupt-cells = <1> to axp313a
- pass interrupt-controller to axp313a

Matthew Croughan (2):
  dt-bindings: arm: sunxi: add Mango Pi MQ-Quad binding
  arm64: dts: allwinner: h616: Add Mango Pi MQ-Quad DTS

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun50i-h616-mangopi-mq-quad.dts | 187 ++++++++++++++++++
 3 files changed, 193 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-mangopi-mq-quad.dts

-- 
2.41.0

