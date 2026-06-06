Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9AB3B18A
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Jun 2026 20:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780779320; cv=none; b=EZLWJEf8LjzCZTF1P7bQkEGk3dkmONp4MUFpl+jrfE4R1BkNVDJjIZvRjQgswSNaQRnkrNFto1zGS8HMHIcH7pXKfo4/+v5NrUwpaf1zOQUz806QDiyFsieRLODnzuZr4sAyI5yRjKz9CctcH8xQBNp4JyItajzotkLstw7VJ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780779320; c=relaxed/simple;
	bh=27FZggmFfooUbRXK18oUXNCON2FidPig+TucrvZfa70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mkyr3/KeRbL7pJoE36x5Owu3moRzrIDp+KUos2qxaZyX5WS9b7vwogHdOYxRfVPJrVhn91TknyMXt5/pyNEEmIz9OX6VZUgl+Lp8w7srOSRHzlyYz1nH0s0UFwQKLzmx1XBVjVU23GfgZ9OFE1mBR3KE1Pvde6YCkowRBqcwsnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=Zciy3iEO; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="Zciy3iEO"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=xgNX3BfF0sHR956gYPtFqiQRwqATyVW0rwVI7QS8mHU=;
	b=Zciy3iEO9kQCICY0jza7XyrrLzhEfUvM1IqCBuCeMQ4E7jbYdsk+fzcSSwgkxE2/VTU2M99QUC3C4c2IX3iCh/tz41rYarbAbeyklTHpNrsACF2l7nouICZCg+sPqpDg6hv6Q8kY1kHbcWKb1RByNAkZdtZoQPUzIcdmaUpxh2E=
Received: from lukas-hpz440workstation.lan.sk100508.local (194-166-56-114.hdsl.highway.telekom.at [194.166.56.114])
	by mail.netcube.li with ESMTPA
	; Sat, 6 Jun 2026 22:55:12 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 1/3] dt-bindings: arm: sunxi: Add NetCube Systems OpenNMC (dobermann)
Date: Sat,  6 Jun 2026 22:54:41 +0200
Message-ID: <20260606205452.2386930-2-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260606205452.2386930-1-lukas.schmid@netcube.li>
References: <20260606205452.2386930-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OpenNMC is an open replacement for APC SmartSlot management cards
based on the Nagami System-on-Module.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..077b65507645 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -598,6 +598,7 @@ properties:
       - description: NetCube Systems Nagami SoM based boards
         items:
           - enum:
+              - netcube,dobermann
               - netcube,nagami-basic-carrier
               - netcube,nagami-keypad-carrier
           - const: netcube,nagami
-- 
2.47.3


