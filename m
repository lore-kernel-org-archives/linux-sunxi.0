Received: from s2.avantea.pl (s2.avantea.pl [46.242.128.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC6D2F7ABC;
	Sun, 16 Nov 2025 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.242.128.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763301005; cv=none; b=qCB3SwuOOZFRgL4oUSIU95L1mSVAHvYaSOz3zHGYaV+zNDwme+Sq/SZ+th09ljsGA5VrrzlL2yjpngccoexffCRDi6CCkAUPYEPgu4V9fiVFpA/nnjnPGRlRv4dj5gOHMs32Xuz07cI/XfRLtR+jz4gZH+XL22sQ63v4llUl9wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763301005; c=relaxed/simple;
	bh=3aAFcuu+7RJFQUvIoOJMZfKU7fItXvVuYOcTxGYfCe0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HuFWce3tzKWBheVhQa3GTiZd4fG3Nba/Si9bSPqtyzahMoHTsS69Ydgi8fE6t8SjjWMzPF0NQTtuSUxWMvDie9F9utFiuVvewlQmUT/9+uJC14BWn9FEjHP6FHbCcM9JOgWCJxh5oMc9TviomRYHyLppYFlbFHUNBRPMKZeVEzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=szczodrzynski.pl; spf=pass smtp.mailfrom=szczodrzynski.pl; dkim=pass (2048-bit key) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b=nkS2MsQu; arc=none smtp.client-ip=46.242.128.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=szczodrzynski.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szczodrzynski.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b="nkS2MsQu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HFF4qIvkAwehv5Tg/aWnvtUclSg9Yim0HrFAtniNGnY=; b=nkS2MsQums1TjT8SkZ1fGdaVKd
	QPvsnOWFgznnU6N7/RYsk7wYdXekhIuNo1Q28VxUXIYmiQkV1LEi0jNDbqratmvo083E9fKJI4rMi
	NwxJb+Xp4dvxiexFm/7wjGkjP3qXFCS8MPxdBJa5bcXIXlnqrfdkjEicb+BjzyecRk9BM/hgqYDuW
	oOuetjWS6PIpkthZIpkj3y9sclWvtTUX0Rwf+az3bNgTkOEaN1pS2WWIyx8NEp5bvsO47kWIPUyLR
	FuSFnPLZUrOh46hh3rVjNmDgztQiNjRmtY6CCipITkHD4cSRC7fwi5ODmkqM2/T80g12Lqayq2fk7
	88ivLjgg==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKd8W-0000000FXUh-2saU;
	Sun, 16 Nov 2025 14:49:48 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	parthiban@linumiz.com,
	paulk@sys-base.io
Subject: [PATCH v3 4/6] dt-bindings: display: sun4i: Add D1s/T113 combo D-PHY bindings
Date: Sun, 16 Nov 2025 14:49:43 +0100
Message-Id: <20251116134943.447443-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116134609.447043-1-kuba@szczodrzynski.pl>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl

The sun4i TCON needs a reference to the D-PHY in order to support LVDS
on Allwinner D1s/T113.

Add phys and phy-names to DT bindings.

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 724d93b91..52589341f 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -115,6 +115,12 @@ properties:
           - const: edp
           - const: lvds
 
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: combo-phy
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.25.1

