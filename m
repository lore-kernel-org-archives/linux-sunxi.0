Received: from mail.croughan.sh (mail.croughan.sh [135.181.193.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901B91FB2B
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jul 2023 17:17:24 +0000 (UTC)
From: Matthew Croughan <matthew.croughan@nix.how>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nix.how; s=mail;
	t=1689787036; bh=f4xIuJQrQRXyZNafjmPTj5No4YjDqBwsgyQB3z7zS5Q=;
	h=From:To:Cc:Subject:Date;
	b=X/vAN1kPFMYKKFhzjKZhtkaCObuzeuFMQZdZ+6sUoEzoalXuPIuTPMVuQPHT8W7Uc
	 s/Qk9bf5O9HkcI/s3IKTYSV9KocqELvHxwUJHM5tM5hVGmNl5tBgPoQFOhEBhVJNcX
	 Z16nGWAUQGSF9Mz8Dwx3kIS1H4gZ0hAW+U6pX3wk=
To: andre.przywara@arm.com,
	krzysztof.kozlowski+dt@linaro.org
Cc: Matthew Croughan <matthew.croughan@nix.how>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: 
Date: Wed, 19 Jul 2023 18:09:49 +0100
Message-ID: <20230719171608.3230198-1-matthew.croughan@nix.how>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subject: [PATCH v4 0/2] arm64: dts: allwinner: h616: Add Mango Pi MQ-Quad DTS

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

Matthew Croughan (2):
  arm64: dts: allwinner: h616: Add Mango Pi MQ-Quad DTS
  dt-bindings: arm: sunxi: add Mango Pi MQ-Quad binding

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun50i-h616-mangopi-mq-quad.dts | 183 ++++++++++++++++++
 3 files changed, 189 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-mangopi-mq-quad.dts

-- 
2.41.0

