Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B54827C876
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Mar 2025 22:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741127150; cv=none; b=kz/kCsvPQD1KXS7xiOvZcz2wg0gbSULHgSS036ESPI92WpI8uv4Mk9qvY+NUch1EHRthZh/KG/u0wkA8dXrgiMJT5LnFNcnG+F9LsxUss9wmiIhAkxv3OE1soI+u/SE3OYMlNWVAisHr8Hqra9kzHxqMj6IxT3AFqTnp1NqQ+uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741127150; c=relaxed/simple;
	bh=+9BrNfN/II5WogLvKDzRyNR4sx+4VqrZ9EQTEmtqMUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imYhlNhuqlVv0snYiiTvWZyj+ejPkjcApiXmdZZA4g0oMJiqg8J2yFmNh5/pHrinDnTIy1rq97I0SIGrGaYD2HRLSp1hor5agxONq3iSx1T/cYF5YKFK1zLVQxlKhQ2xjY6Xl7+LR/D5PW8qwQzcFhPjVGM+7b8BScp3/msdh0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 421051D31;
	Tue,  4 Mar 2025 14:26:02 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EA863F5A1;
	Tue,  4 Mar 2025 14:25:47 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/15] dt-bindings: irq: sun7i-nmi: document the Allwinner A523 NMI controller
Date: Tue,  4 Mar 2025 22:22:59 +0000
Message-ID: <20250304222309.29385-6-andre.przywara@arm.com>
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

The Allwinner A523 SoC contains an NMI controller very close to the one
used in the recent Allwinner SoCs, but it adds another bit that needs to
be toggled to actually deliver the IRQs. Sigh.

Add the A523 specific name to the list of allowed compatible strings.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index f49b43f45f3d9..06e3621a8c06c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -26,6 +26,7 @@ properties:
         deprecated: true
       - const: allwinner,sun7i-a20-sc-nmi
       - const: allwinner,sun9i-a80-nmi
+      - const: allwinner,sun55i-a523-nmi
       - items:
           - enum:
               - allwinner,sun8i-v3s-nmi
-- 
2.46.3

