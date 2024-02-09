Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E1C26AC2
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Feb 2024 11:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707478828; cv=none; b=ViwgcHPl4zJ04bSfJngUCDCsN/JvlY5B4y1uXLoCbA5IFACNxv8veOlS4srpsAh2nlc9HPgDnaBD5aeWuDyHwh7VW5IhHMaGfvKTGWt7+Mu9MlurAhEXoJBCP6Lx5vdadmWlgAz96k5r5chO/JwFmrFCs3JY2C3gEZMmHbdXknk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707478828; c=relaxed/simple;
	bh=xmBnVpuxpAAlgUB30fWHrky/1PrcYPdAs3mdMBIQg2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s9/MgOT6f2Cqd9T0DcPXD8Nk3i9B9jyew4rhMiRlfjaMbf34BMBBF5RPFkY2SSdhwtboFqPpctT8umUL0Ka5gqKw8MRXO0OuhPT1BdV4XA85t0ewsHtCENW+8aqg6dnzqa1969uDU4vrPlAi5rYy6tz+oz6ZP3/TW/eT+I+0IT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C00DFEC;
	Fri,  9 Feb 2024 03:41:08 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 049AC3F762;
	Fri,  9 Feb 2024 03:40:24 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add Jide
Date: Fri,  9 Feb 2024 11:40:16 +0000
Message-Id: <20240209114018.3580370-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240209114018.3580370-1-andre.przywara@arm.com>
References: <20240209114018.3580370-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jide tech once create the Remix OS Android system, and shipped it on
some custom hardware. Add their name to the bindings.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1a0dc04f1db47..dfb834a9279f2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -719,6 +719,8 @@ patternProperties:
     description: JetHome (IP Sokolov P.A.)
   "^jianda,.*":
     description: Jiandangjing Technology Co., Ltd.
+  "^jide,.*":
+    description: Jide Tech
   "^joz,.*":
     description: JOZ BV
   "^kam,.*":
-- 
2.25.1

