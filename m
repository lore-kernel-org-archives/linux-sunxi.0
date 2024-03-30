Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B7915A8
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Mar 2024 01:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711762383; cv=none; b=jgu5SekRmSIR8kRHzQbiRtrtU2U5N5z/tTVR9hKpvBmcvqE6zfdrww+exS3Py1ArKgyeNbkAOM1XltZStHaeSlEUOALIbtGDutM9Fu9q4+H2q/SjLjuufQwehc4GnpobtFai4iFeS4SYanoCYxzV8fkHl3e38U5taMcsyK4VbaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711762383; c=relaxed/simple;
	bh=8eRdaSls3FrU4yMnvU39DnhH/3rXTbbSA9qXjdBXEkI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SXRbICiQhRjvHvEf5wUYkNOP14CpJKiQdlNM6ziax985I8u1P0MyF5hp8qtB/EiawSr6IB43M/oF/6bER5C9k6pijuzQHu8IzesJ4NtG0yrOinkFV1n0+H819Z4gEue6Xj8SZzU4ql0ShD2y3qXHZAmeMGM9MvHCBCmRCOusQM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54B7F12FC;
	Fri, 29 Mar 2024 18:33:32 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 078043F64C;
	Fri, 29 Mar 2024 18:32:57 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2] dt-bindings: arm: sunxi: document Tanix TX1 name
Date: Sat, 30 Mar 2024 01:32:42 +0000
Message-Id: <20240330013243.17943-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240330013243.17943-1-andre.przywara@arm.com>
References: <20240330013243.17943-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tanix TX1 is a tiny TV box with the Allwinner H313 SoC, a lower bin
version of the Allwinner H616. It comes with no SD card slot or Ethernet
port.

Add the board/SoC compatible string pair to the list of known boards.
Since the H313 does not look different from a software point of view,
we keep the H616 compatible string.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 6fe137605ba53..9530235941cc3 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -865,6 +865,11 @@ properties:
           - const: t95,t95max-axp313
           - const: allwinner,sun50i-h616
 
+      - description: Tanix TX1
+        items:
+          - const: oranth,tanix-tx1
+          - const: allwinner,sun50i-h616
+
       - description: Tanix TX6
         items:
           - const: oranth,tanix-tx6
-- 
2.35.8

