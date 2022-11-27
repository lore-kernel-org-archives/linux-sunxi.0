Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com [136.143.188.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F10D20F9
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Nov 2022 07:32:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1669534350; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VWPX9rTrJaOJnNVu5xmGxa0PFtsJjSFfYa4HkfNURw6sYHzLP3EphT+pmz3Fp73iI4CuuFPDn/MS5hK2yIyib3fNtqX3yBgWgVRB+Wc/ycgtwMWZ7HiDu6zu2bHS2QStxGsfZThtvDg1TrfVAeIl2RWF0HK0fY3spnbPK2LEVsQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669534350; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=xi4djBRWGKO32BgCJFsyU3GWSFCZRI2GQNuB7KuOeCs=; 
	b=Q7REXLwUUz/rzl4tQsYhjID20+Kv2CO6FcsWgopctds0mzGg/iXVY3adQ6/WL1iXatf1kbEpu1saGuEur6zp7sOfbIP3PkOccSFdIHfUNe+Mitz/gDG6W352FjOF5hu03CnyLoPHHdIUYTIAoaNpth2Y3YHB4Wf6fqIV09rg3mU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669534350;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=xi4djBRWGKO32BgCJFsyU3GWSFCZRI2GQNuB7KuOeCs=;
	b=L1sU0Zoip8rUNv6rmQ8YFovJvIB7NCfx2kdrv/PuIjcCBGUFQ6CKBHjhmO7jhzjv
	yVkQGPzDn+XwcP8ZKdSYRsuwJhBpuMUSeRytcH9O3u32HkGgygGXBxcdNY2uTPtgG+/
	TFH22BN4VUi0xCB1p+N41vSDXSNxN3E2bJgeYpEM=
Received: from edelgard.fodlan.icenowy.me (112.94.100.108 [112.94.100.108]) by mx.zohomail.com
	with SMTPS id 166953434883810.636624385828554; Sat, 26 Nov 2022 23:32:28 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 4/6] vendor-prefixes: Add Shenzhen Rongpin Electronics Co., Ltd
Date: Sun, 27 Nov 2022 15:31:38 +0800
Message-Id: <20221127073140.2093897-5-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221127073140.2093897-1-uwu@icenowy.me>
References: <20221127073140.2093897-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add the vendor prefix for Shenzhen Rongpin Electronics Co., Ltd, which
specializes in ARM SoMs and EVBs.

Website: http://www.rpdzkj.com/

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 43359c0ccaf5..952ddeed4b4a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1091,6 +1091,8 @@ patternProperties:
     description: ROHM Semiconductor Co., Ltd
   "^ronbo,.*":
     description: Ronbo Electronics
+  "^rongpin,.*":
+    description: Shenzhen Rongpin Electronics Co., Ltd
   "^roofull,.*":
     description: Shenzhen Roofull Technology Co, Ltd
   "^roseapplepi,.*":
-- 
2.37.1

