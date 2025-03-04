Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CA7266B77
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Mar 2025 22:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741127144; cv=none; b=Y49Wi+8nXYwA05WTz6G0wPNijb2rgQ3cbyzK54ezfhM9LABVU0noYcK6HU4ErcYSGRp+RVCv66GIiL4V8QmWc+h2zemx095gQWGUPSGyXEcrV0fgm9YrRNZ9H1KkCRyJspnzKUXtjQPpv42kcy3GRgWJJ8WDE1nWrRCOkdXeJTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741127144; c=relaxed/simple;
	bh=3vWWyG7MBd+DfNTEwJ/WP/VVI33rbJgw+EDHXaX/+SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=feHzIRJY9mv2kBXArSGUsIx93Il24Gp41DRlyCMsFZvMr8EcF6EMUiy7XVyc58tV9V9zdcI9yhjbTX7gFh4NtJGIfK2r8uhX2oYc2Sr4PdADIoOAsE13bNZOmaxkb27G3SGIK1XgY6VrY0OxLjPEss1lU7y1U1GwKjl8JRLV44A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6401A1D31;
	Tue,  4 Mar 2025 14:25:56 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AD4B3F5A1;
	Tue,  4 Mar 2025 14:25:40 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 02/15] dt-bindings: mmc: sunxi: add compatible strings for Allwinner A523
Date: Tue,  4 Mar 2025 22:22:56 +0000
Message-ID: <20250304222309.29385-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250304222309.29385-1-andre.przywara@arm.com>
References: <20250304222309.29385-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523 uses the same MMC IP as the D1.

Introduce the new specific compatible strings, and use them with
fallbacks to the D1 strings.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 8e4c77b7e4ab9..9f3b1edacaa02 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -50,10 +50,14 @@ properties:
           - enum:
               - allwinner,sun20i-d1-emmc
               - allwinner,sun50i-h616-emmc
+              - allwinner,sun55i-a523-emmc
           - const: allwinner,sun50i-a100-emmc
       - items:
           - const: allwinner,sun50i-h616-mmc
           - const: allwinner,sun50i-a100-mmc
+      - items:
+          - const: allwinner,sun55i-a523-mmc
+          - const: allwinner,sun20i-d1-mmc
 
   reg:
     maxItems: 1
-- 
2.46.3

