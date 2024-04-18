Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884221DFC4
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 00:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713398879; cv=none; b=t4bG3+n02rFTJ+v0MAvJfAM3zySTdPx3nKNbvkRQVdYqBd9F+Ius6NVyx98CNJRmRmWuE6YKeJDRLGnllMTw6bXziL/5ZnSHZmQujLceXCcz+ZeJxuNJEjlD69/jhb7Gz23JZwvlAk840kcf9/VbW91LtjkPDA8x6rql7Z7Vqzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713398879; c=relaxed/simple;
	bh=Lx03dY0JM0T6hiG7Bo7KzhBJEfq4unQIvgy+uBgmf3s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TuD7oKXueG5d/wcxcYJE6nX292nICfu/6+o04D2G+wYaRKR83uYnRhqu58V2lQACb6WZwQkv9QkbBiwZeI3e5DrKvsXamZhhjGcTGrIyuzqY5wXGM+TQKEn6U+cCUSBRwbfE2xA6D6Q/LfLtHLNuIkZ4GnkCfrEurHkAQkpkQoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA4AF339;
	Wed, 17 Apr 2024 17:08:25 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 132823F64C;
	Wed, 17 Apr 2024 17:07:55 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ryan Walklin <ryan@testtoast.com>,
	Chris Morgan <macroalpha82@gmail.com>
Subject: [PATCH v2 4/5] mfd: axp20x: AXP717: Add support for boost regulator
Date: Thu, 18 Apr 2024 01:07:35 +0100
Message-Id: <20240418000736.24338-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240418000736.24338-1-andre.przywara@arm.com>
References: <20240418000736.24338-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AXP717 also contains a boost regulator, to provide the 5V USB VBUS
rail when running on battery.

Add the registers to the MFD description to be able to use them from the
regulator driver.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: John Watts <contact@jookia.org>
---
 drivers/mfd/axp20x.c       | 2 ++
 include/linux/mfd/axp20x.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index d8ad4e120d379..02513b1eff2e8 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -209,6 +209,8 @@ static const struct regmap_access_table axp313a_volatile_table = {
 };
 
 static const struct regmap_range axp717_writeable_ranges[] = {
+	regmap_reg_range(AXP717_MODULE_EN_CONTROL, AXP717_MODULE_EN_CONTROL),
+	regmap_reg_range(AXP717_BOOST_CONTROL, AXP717_BOOST_CONTROL),
 	regmap_reg_range(AXP717_IRQ0_EN, AXP717_IRQ4_EN),
 	regmap_reg_range(AXP717_IRQ0_STATE, AXP717_IRQ4_STATE),
 	regmap_reg_range(AXP717_DCDC_OUTPUT_CONTROL, AXP717_CPUSLDO_CONTROL),
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 8c0a33a2e9ce2..4dad54fdf67ee 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -115,6 +115,8 @@ enum axp20x_variants {
 #define AXP313A_IRQ_STATE		0x21
 
 #define AXP717_ON_INDICATE		0x00
+#define AXP717_MODULE_EN_CONTROL	0x19
+#define AXP717_BOOST_CONTROL		0x1e
 #define AXP717_IRQ0_EN			0x40
 #define AXP717_IRQ1_EN			0x41
 #define AXP717_IRQ2_EN			0x42
-- 
2.35.8

