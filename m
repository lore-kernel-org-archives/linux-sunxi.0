Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5615918C03A
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Mar 2025 00:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741309061; cv=none; b=dqiUeTg+2v3TgvdjTmw8VLZm9JXI64lZzsTEdAnYvGOEU3qUeRQGvht0qmY4uGbA+34FTA6dnD1EfR5G82oygVK2RVCnMEOOSeYnzfW3rPYUODe5rIninwWkgwpYx5E15hXlOT3BGUJ3vsTf0SBztprYwZZfKcXYilZgujyKQlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741309061; c=relaxed/simple;
	bh=U+6Jp8W8uWdW+9lFtNK/ic07v/3AhAubY0PIRb/7zRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzwdni2UFd/nR+uVicAjz8ExXSD8ak6tf6zareUpR/wKJYzVb+6CgYu3m1tIvy/bMksXm+LChovFpPH/gOL6DB5WzG6wDEjnb5+17oPacghSnyNhnD5O5cHYZiO7w7nU/f3l80bGXwlOge70M2+6a08RyZwd1VSk9v9F/no+mEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3F1A169E;
	Thu,  6 Mar 2025 16:57:52 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4875C3F5A1;
	Thu,  6 Mar 2025 16:57:38 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 09/15] dt-bindings: vendor-prefixes: Add YuzukiHD name
Date: Fri,  7 Mar 2025 00:57:06 +0000
Message-ID: <20250307005712.16828-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307005712.16828-1-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

YuzukiHD provides Open Source Hardware designs, and also offers
ready-made builds of them: https://github.com/YuzukiHD

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d1e..8c0991e002ee8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1737,6 +1737,8 @@ patternProperties:
     description: Shenzhen Yashi Changhua Intelligent Technology Co., Ltd.
   "^ysoft,.*":
     description: Y Soft Corporation a.s.
+  "^yuzukihd,.*":
+    description: YuzukiHD Open Source Hardware
   "^zarlink,.*":
     description: Zarlink Semiconductor
   "^zealz,.*":
-- 
2.46.3

