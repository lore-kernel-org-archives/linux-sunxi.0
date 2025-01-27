Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8254197A87
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jan 2025 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738009310; cv=none; b=XIG5I9uKnf62x2WOw2TQSHmkdQK8LQQPzZamwzezWzeiRnGUCvsDEB+SjHztV6g63kXULnNwwBXwAs5hvLsBKA6BU2CjEIOuFxn/BuFW0P9HlXAL9x0tK22w9fj7GaVa7RkxTvn1YyUsorQsY2e1c7HuZOan+gbtzdbE+w3QEa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738009310; c=relaxed/simple;
	bh=bUJYrPnrWwRcPuvxgBB18esttNvRuShGWNkJny3Be7U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QLOvO+cHhUbKFR0WC7duJSeHj+r+g40rQ+vbxJnLyLfRLh5vW50GIXHH6HzZaaa7eE0Gf6vQAbilT1O9BcYJggSQQpvH3Xdgt0DfsUe28zfFw+F6nyUvxMTQxxRkPGqyyctCZPvvYB4C8VF6luwkRJTpxzUFOTJfiI0DSmENXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=rkljnW/8; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="rkljnW/8"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=UvMQd0CMGgZ6M5Dh0aWqUTlHmxWpXSJE9hm+SSJoE88=;
	b=rkljnW/8rC9qdYt6bel+AqwbhfrVyg6wRmz4EkFZy+6VeeGO+6ua55PQHce2HmlPuEZkCtLB9ga356zUZXsZ6B8aGtM+F1DVMLnaUndLwXk5hXvvlrvSWM7950XUyNxKVN47zpZoZIJH7TW9G5Rn6uQb+B2frEGhdghk0ZNAVgo=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Mon, 27 Jan 2025 21:21:33 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/4] dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
Date: Mon, 27 Jan 2025 21:21:22 +0100
Message-Id: <20250127202127.971172-2-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250127202127.971172-1-lukas.schmid@netcube.li>
References: <20250127202127.971172-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NetCube Systems Austria builds Embedded Systems for use in IoT, IIoT,
or Smart Home scenarios.

Website is still WIP, but the Links on it are active:
https://netcubesystems.at/

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d1..499ab972f9d2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1031,6 +1031,8 @@ patternProperties:
     description: Neofidelity Inc.
   "^neonode,.*":
     description: Neonode Inc.
+  "^netcube,.*":
+    description: NetCube Systems Austria
   "^netgear,.*":
     description: NETGEAR
   "^netlogic,.*":
-- 
2.39.5


