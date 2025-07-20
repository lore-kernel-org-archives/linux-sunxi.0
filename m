Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D741E520C
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Jul 2025 08:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753001505; cv=none; b=dFHBqEYf97k24zLQ8Mx5xVD+4eahnjXiMDuW6+sRbHw8BsvcSGQEFvwqKGB7EkzaK8n+5/tPv5bW3AoDaJJ/AhwgH1TQyFn4n6UpqPFFEcuPY1orDzZnpeGAq2dGy2Km2KR6wBgDaweEeBukaao2AGqRW0FgpQCI0C0AqCDbMGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753001505; c=relaxed/simple;
	bh=vf7kN02f///f0pqCMYvRRbiHlk0+mcZyGJp+0Ta7Isg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJo5gqIbkznc9mYsdGtGs9HpegLMFn1I1SZs9gP+fSqM6FFIf4kz/47g4Fa+uZVln6+m8EjuVdU8OCaF9jvSN98rlC+eS6MXgN+Y+PR+G0t163wB84FynKNvWMZNSoMAETwbrj/aBbPzF0iA41RiwluMhQiAsY6gv6mSofLIWXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Wvz/1Dq1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hc9as94Z; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Wvz/1Dq1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hc9as94Z"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 652957A017F;
	Sun, 20 Jul 2025 04:51:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 20 Jul 2025 04:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1753001502; x=
	1753087902; bh=Sj4XyUDt2nSA8SS+HepEZMb7jMhPBqpqhfbPXTN4g9U=; b=W
	vz/1Dq1VcG7cG+3BVGO0RxJqORb8keK1aLSyz0r4Yl3Z38qXkz8vHrCmx3oEFASr
	+zQRzsiQFMjFH7GK+7p+I4+055gccsgnQvGmfQOcygY3VbUfdiECk2mSefQW1rhV
	EWn4QQHuU7xddAw7ZxCqc0AvaeFFNpO7m2MIYqLdc3h1kbJCAmVZ19weMd5wlmZZ
	Krck5wAMM4nH8j+8tCjajDDLoPpbG18h7ZwM3Sysiso+Nj+i3sK/7kbWrKW/sZ4Z
	GhnhV17qUNY0rPse/dlRKDiodWVreE17fuiJL3lstRW4aGxtg3zUS/iWFPLh+BTU
	FX3eiohv5+oOycEd+IODw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1753001502; x=1753087902; bh=S
	j4XyUDt2nSA8SS+HepEZMb7jMhPBqpqhfbPXTN4g9U=; b=hc9as94Z9DJgmUPZh
	gXqGzQq9CEi1vURn6VHfiXgpQysoxrfaljyAWodFKMegB3tzKCkUrRRhCHfVjtfI
	pvQcUh0quwy7z0xmp4t1bbIKTz5AHQreU7Txxy3GN+6jW7wLsRXA7mQrOVcf7iHj
	0ZGseTQiXW/M28l11Bf0gi5Bm1SNu+KEKifVwkS5nVggIlrx3ZqWv+AaFgJmeK1L
	E9Ubq0P54bEjy2YOcuXCERwZW/A65YiL13FDViuayqZLofL2jQjSRGGs0uHIPne3
	FxOqSCbCR+QcPXFWQGP0F05t089O+yI7BCyTqQFEYJUrCNkBtj8xDE3hVbqqMYc8
	tJplg==
X-ME-Sender: <xms:Ha58aLXaykteGfTajJN_2folOxrtb_u_OjPie24Kx4hMyXklpF0euA>
    <xme:Ha58aOfYtZBz2a8hF8gqWTt0Ih_DYjJ6ZUrwi-w1sA_yiuSd4J5_nb6SYZFdAVSPE
    dIsbJSYOGynRO-Zjg>
X-ME-Received: <xmr:Ha58aBkwpxYQodq1usDlf_Rdc1HvrN7fp-9PTnQTAyUuB9_didn2tT5rzrWWRv52k5o472PDdV6J--QKADdToqyPsIciOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
    lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
    hrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieeiheet
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
    hnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
    theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprh
    gtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphht
    thhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprghnughrvg
    drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgr
    kedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrih
    hlrdgtohhm
X-ME-Proxy: <xmx:Ha58aIAuca_ViTQUWyI1Nl31K1Yy_Fken_PmzpwOaILr3YblOHzp5A>
    <xmx:Ha58aLdKMH3ZVld8Zt0_IX9NRLtFpo9Q6bClp7_iq63LB6vpH7KfUA>
    <xmx:Ha58aL4_ESK5u3S-0a7JMFHJbvRivMh-P80t9pAsw02wNAsK-eQaRQ>
    <xmx:Ha58aNOhRjXtD77ENFx2CF32Qud8PulMEBRFIFFzzO5H1541BoUpXw>
    <xmx:Hq58aFxKuZAYqlbiA1icl9AJ4UvFd58KjHFiOvciFpGhWfTjlF1Zm2UG>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:37 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Ryan Walklin <ryan@testtoast.com>,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 06/12] dt-bindings: sram: sunxi-sram: Add H616 SRAM C compatible
Date: Sun, 20 Jul 2025 20:48:44 +1200
Message-ID: <20250720085047.5340-7-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible string for the H616 SRAM C region which is
functionally similar to the A64 SRAM C region.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2: Add H616 fallback string
---
 .../bindings/sram/allwinner,sun4i-a10-system-control.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index e7f7cf72719e..cdb664d1ec41 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -103,7 +103,9 @@ patternProperties:
                       - allwinner,sun7i-a20-sram-d
                   - const: allwinner,sun4i-a10-sram-d
               - items:
-                  - const: allwinner,sun50i-h6-sram-c
+                  - enum:
+                      - allwinner,sun50i-h6-sram-c
+                      - allwinner,sun50i-h616-sram-c
                   - const: allwinner,sun50i-a64-sram-c
 
 required:
-- 
2.50.1

