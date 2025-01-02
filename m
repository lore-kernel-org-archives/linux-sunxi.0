Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879C1195F0D
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jan 2025 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735840434; cv=none; b=WcH7mUYxXhNkKd4K3/k9ZMfn2pIu4TcZXqExUiDrYkrVXpr+VQmJIMO1vwmBiQMn9ZXafX+5ZigA4cYrqfx3/a0yoRuz11gZ9PD6RoU62/lTz0fKhu9LMG7s1jWBHrYUkN2fKeK+NboQ+44NsJ+2BeHsEBAOR353SGSEMBKTgvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735840434; c=relaxed/simple;
	bh=5htAVyEqvc/PjRXB18GpRqGpoQ7MA/4FJdPnbUS7O3g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q6dssTWPyE6d9jS6x5Ykn2jDeHEYOLO/Ggqr4Zt0Sb2ty4hpvRNAYTlbAAt0Ufehx8JrLJIH3xYnYbQpNoH1iPigr+q+ml7lqjRniV7Er4zG9u3KgsNiRjNWUKH5AS7zKEZTybbPIdVO2kkSvguZJUD4WouAjbdSuX5GaihJaKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=oUfhOdQJ; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="oUfhOdQJ"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=mIlPcnH7ebANMNhSm6ayEtbRBV91jgb3GNIkVPKx9Eo=;
	b=oUfhOdQJFfh+NdQBj3asUTt3vO+gk+ANv3N2taJXCF9C1KScXf6ERzqvCbjG3xTCRATbWgp8tqVgTeAU3Jj0w6d6dhLYuZSIDEAe8EtqLmzo8Vf6+xds4XqGbEfwboXzd5Y/JqNU69XjLp0jAEo+K4SClQs9Gi8hFec71QSMUgU=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Thu, 2 Jan 2025 18:53:46 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
Date: Thu,  2 Jan 2025 17:49:59 +0000
Message-Id: <20250102175006.3675-2-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250102175006.3675-1-lukas.schmid@netcube.li>
References: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org>
 <20250102175006.3675-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c7..a30ed9547098 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1027,6 +1027,8 @@ patternProperties:
     description: Neofidelity Inc.
   "^neonode,.*":
     description: Neonode Inc.
+  "^netcube,.*":
+    description: NetCube Systems Austria
   "^netgear,.*":
     description: NETGEAR
   "^netlogic,.*":
-- 
2.47.1


