Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725338;
	b=kex2j6s6+iCvNnxeH2P7QGoDgWSK6YwZgoOgI+w+X1jUtU1uwiJWymrdA9/qZFuoufKZ
	 Id7bbVlHFXBBQ71Ili2TtnWo8wMeZrpe73VwsrrkcetkKYg8ISINiyywdXEcbnVd1/imV
	 58b2NG4TB2OZ6m3+SKBBDJdlrTIcVoBwIay4CkwPdQMGE03HiWBFx4IlNSnf/RY3nmSGg
	 VgH/KoVWMiGYYY+Pc5mymBFVTBROR33q++Cd9d1hyLK0Jdo69yxqfOuzxpBZ3IWX+pekm
	 IQH3jaJQRcIqXc2FpuHya2MpcDfwz0XBvh5Wvee5ViXWYuV2RWGxHO31Q5kIGb0ZiBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nf5EzAPgVqjc3FGNLI8n0bbqrh6ZvaXv4uTgjtEloco=;
	b=GQH0c3RBp0dyWHuu9dl36Wc0YHC78TYbuT/+I6oKCHfMITaMOh3qr8goan8AV+WRqgOY
	 5ZX9UKZfb3wAOzhEk4qtAA2qeuDV9IRYTZokBihWhGtTTFsr4CUfG3152SmePeU+lbH2N
	 VUziE4plg5/PuDf9j+7rHbvn8e+U2Oe7L4rp7wvJcOC5xHylzGXfX/2Hc+GhKWuWS/AoU
	 yHtbgQH50LmClly8NKv5MJ8EFIZj+9Orn7vSBN+tanRhgM3b1MtE1jC96t1ifwdcAD3ck
	 9Imqefz1dnMydI6Lv3fAaLLcnBHvrYEYk6vwu6hyxoo/wamu5NmxiZtHzwpNYicY4CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DrCsC9nB;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBB6606A326
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 20:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FBB6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DrCsC9nB
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-717080a2d50so6795605eaf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 12:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725336; x=1796330136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nf5EzAPgVqjc3FGNLI8n0bbqrh6ZvaXv4uTgjtEloco=;
        b=DrCsC9nBEzqJvDerGv3ca9T9aRyHmbTjJ5VmR2coA8uNj+8rL50DsW8gFs3wtkjsdp
         AaRoVwh6U7U6KGj0KisrYgSY9ap42b7DTz/wW/wbI0TS2lqEhD2PPlHfsnoQQCKj4MSm
         CkJlnv9TsPRJ8Q5YPkMX+rdL7F6qR/e4Dg0nGixI71vXeUCao+nVEa5WWk+vC/4ZOAeG
         hgyau7WMOGCBkk/4Ogq2HUinskXN13o/Qap8gddQB+nbSyP0vIRcjgPLGmoV26TgJAuS
         i/2o2sI+DYABjSdc8/8oiGon0MZVglzzNCOwShYNAvCtto/zBomwG/3vYcSxoB0EArf3
         Yk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725336; x=1796330136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nf5EzAPgVqjc3FGNLI8n0bbqrh6ZvaXv4uTgjtEloco=;
        b=Eip5dJMgnQSxT7EFhNb1E8PB3+Y55By3R0qb43v9VYF7duyC0zcyr6YhA0Pl9evQhj
         juvZ3v5rJ9ScD3qyfU166/YsyryH3BPzKDH+l350DYSJWB18hjzb9ZLHj0Qb8wYkYzR0
         Z1yj9pryhTJOEqpWo3mzeEYrSH4UsY/OaUgcCOvGIVywnrFP4uX1ugteo3ORLAgCkPkq
         r4t69MM9kLXHe9QcKMU81TS3n+j0Zxf8VWBvgxAhIJMuQL6tTxfaUHcxJ4NGzyY+WuVc
         AuVYeNKunPDZDdIsjjpqPXOLhGc8sIsNwlOhevC4+XM3X4Apx0/xxBPen1HipPO7dh+i
         UXxg==
X-Forwarded-Encrypted: i=1; AL+hErEJcGWqpyvSiy5jzrifdKU32VLqxQFGGCvnoXLGdSFh191nv0aFWk0DRBcq8P0Hpizy8nub2eqpPkSVRA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+sHoqO0K7OKUkahC/H6Yq4smO8B+Hruwpfm3+8YuaIDje1YS2q
	Op9Y1/QFzMbFPXAUq0bxrkPaAPCDWuwBtTnGmFNfA1tkId6JCntb2wx+
X-Gm-Gg: AZFdTZcAVTDb+9S7cyaBJut5/6fyhaDpA52Qbf5xFureIjP7H0JJvE9y95lg7Ilyq5l
	p9Ax0l8cUAwff5Ze+LtoN043VpzUi8yVz8ipSYMhXS7wc8FHOVx8ZolrwKPNoLRWrgNW7iUCR5x
	a0+w1Csjf4uwbiEs7a5VNgmNUzrXyDKq+aIGshudfZB/O9WF0JZK0lTw+fPr2hQbizav+p3VojA
	wSpGpLTjWTi4GE1AwAy8Aww+ZFkQtjMcqup9zfzwlBjN+8xvwPSU2VaawMHXZ9vWmnN+lkMr25V
	0an7H9tpaPILSLlXyBAuHrpxbicvJXlUMxg36flTdbgxjsSiw2MA87UL+AXnZaq6diV8uWb4Hdb
	nOkyEK5ooL2saLz/cw9ggCAYR2ABfno+C41gX46b/RhjAHRnVk6US1uapuBJWwHe9ChPF1OKkQd
	SHn58DVw6dWd6BKIAbWmZhUwhX5GS7XLsd6GCwsPUQe7mnrvH3qQIhf9GEqeQ7Bofg4V6BJxwCC
	J+rGfYwbOVwh5Zwp5vyYWVmZ8EBC0c1liUBzo+Xm/0HYEybEBG87be9NKXHm3UYWwkVer3IIpaV
	wQFbE1Vp9YM2NTnyjqL/hIUc9cHPHGXMo36V5QZnodiPNbCcGps/xYHOjv0rXhsnzwaUoFTg3K5
	3IYldi9I=
X-Received: by 2002:a05:6820:61e:b0:71b:7883:8d89 with SMTP id 006d021491bc7-71b7883ae62mr6639742eaf.66.1795725336439;
        Thu, 26 Nov 2026 12:35:36 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e5472sm15740888eaf.14.2026.11.26.12.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:35:35 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: [PATCH v6 1/5] dt-bindings: arm: sunxi: document Radxa Cubie A7A, A7S and A7Z
Date: Thu, 26 Nov 2026 15:35:33 -0500
Message-ID: <20261126-a733-cubie-a7s-dt-v6-1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Radxa Cubie A7A, A7S and A7Z with their Allwinner A733
SoC compatible. The initial device trees for all three boards are
ready to use these entries. Radxa's Linux 5.15 A7A DTS already uses
the same compatible pair.

Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9
Link: https://lore.kernel.org/r/20261111134919.90264-2-vinicius.eduardo.pedrosa@gmail.com
Co-developed-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes since v5:
- Fold in the A7Z compatible from Vinicius's binding patch.
- Drop Alexander's Reviewed-by, which covered the A7S entry alone.
  Krzysztof acked the A7S and A7Z entries separately. Leave the Acked-by
  off the combined patch since it also includes the A7A entry.

 Documentation/devicetree/bindings/arm/sunxi.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7da84e2de748..7a7f96f21f57 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,21 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7A
+        items:
+          - const: radxa,cubie-a7a
+          - const: allwinner,sun60i-a733
+
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
+      - description: Radxa Cubie A7Z
+        items:
+          - const: radxa,cubie-a7z
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc

