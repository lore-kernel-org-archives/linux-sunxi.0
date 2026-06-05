Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BCF41363A
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jun 2026 19:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686866; cv=none; b=E2WsI3ENg3HiKNfITVzGYbOoVCrgjK7s97kuPZqAHlexxhAZcZ1ywqzHTdFXjKbYPZk2SJwaQ0jqMfJHtT08gZaUEKFMOPSlplzdMIRb0rjWTt40trbdCwJrj0oXbqVjjU+HFWP8Z44NioU0n0QHYX2mdKLQmKKcOvyKjKTKo5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686866; c=relaxed/simple;
	bh=27FZggmFfooUbRXK18oUXNCON2FidPig+TucrvZfa70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RtDR2GKtY61DOYfSTfbw61Kn7aMEBHWlER69KwETI4uMS756o39wKpec03AZfcfhCgmiqp9zjCzXTaM0c8AmLCuKl9Nor7bSj7KIvjIwUpmzWW2EKyqwnOKZe5o0Rb7fJGm60Kbikk14TXB6CDGSixdJhwQNfguotmXCFogk9Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=YJzz/5vB; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="YJzz/5vB"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=xgNX3BfF0sHR956gYPtFqiQRwqATyVW0rwVI7QS8mHU=;
	b=YJzz/5vBlwx7hPqGyZX8pBBWsNwfEMrzwPWls6nFnV6qkSpbeJm7yG8G6s32Dg4oaKOzIAqeJ4AtYCxAGfUnJvVGA+B2tS4Sy+W0MLRxCJxuAKalh9oINWhQeuHIMZJkT3w0/xG9qGkQr9MiT90w2ZwsZEWkZXbyiRk9R+D1MYg=
Received: from lukas-hpz440workstation.lan.sk100508.local (194-166-56-114.hdsl.highway.telekom.at [194.166.56.114])
	by mail.netcube.li with ESMTPA
	; Fri, 5 Jun 2026 21:14:02 +0200
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
Subject: [PATCH v2 1/3] dt-bindings: arm: sunxi: Add NetCube Systems OpenNMC (dobermann)
Date: Fri,  5 Jun 2026 21:13:13 +0200
Message-ID: <20260605191322.1920944-2-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260605191322.1920944-1-lukas.schmid@netcube.li>
References: <20260605191322.1920944-1-lukas.schmid@netcube.li>
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


