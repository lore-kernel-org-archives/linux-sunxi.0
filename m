Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455749;
	b=wbFIWfMbKULSFHUAF/Js6wOZowRGkbZ6CJW9XwHkRWrt7dd0uF+OSVi/u/WfSG9LFxOc
	 hTHkj9ttc82KwC6H0WIMgcI1sL74FVN+TFdM7yNRmX2q83BfkveEL7HwBmr6ljV99OG0g
	 cflsQqrkD5g2tqbDOoiERiCnuN/UCCwNoSSz5RnhSRZTmdMAJidB8N73Klvhp+ZEVRLyX
	 7lXekwPh6raGQGFm4EjnY/Ewu4W3BSrl7DkXTjq/cqBNucUSFZ+VeirwRKa4YZzknQmUl
	 +puGZNZOIWKFoJVCKJUwZQ8JoL2hC1t+CU7+wOD5md8CYdXfIwh0vb9i1f3ZgjT0Krg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W1F5qjrP9rUJxl8cI1giD3DqF8jJKuOTOWSAgx1WpZI=;
	b=AfN4eaS1h4peNs9dLTguvu11Qj2V+Kg3rYDkQh893yyYkBDpUfGjnE8uOgkStcHIMS4p
	 YPbjcX7xxtJkV+ojE5o9zsfWEmj0+rkjQgAj2aYCf9WcKWJqbJe0mm9URzmkuoV2CBek1
	 XaxPS3Dugf7ha2O1exwKMgDUGyGxXsRijLq7i/kKCV3JUMT7ZOvl8jOohk0OzSF/Lqlv1
	 7Hnu/q6dZjukq3UuiB/PKf21QM2ehykO/Yj6941lSK8FnB+vZmRUxRVZr/A99d26faukc
	 53Dkb4ykLzinQKnvXQsUcuccfPqFHFKX97OjTc2DMGKhC7gfvMYrIDd1cwiKN3G973g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EcomVe3o;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94E2606A32D
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 17:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94E2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EcomVe3o
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-5058b105df7so1124195b6e.1
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 09:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455748; x=1796060548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1F5qjrP9rUJxl8cI1giD3DqF8jJKuOTOWSAgx1WpZI=;
        b=EcomVe3oSbV5Txkfd0eRC3sqRf1r2X4iPTUmi5tmOPjo1J+ghyyxv13PzPYKGi/HKP
         1ArF/cyFP/Le1eRDju/oW7b7C79ml6BNFx54P210K65TDT8Quy6psqxlfsWLXjXTx5IF
         LXyDFKdxsr1wowmEmtWdOdku/hcOECtZ2afGFjtw2MwHI9o9VQ8DouWr0/lIaOJ/6t/m
         MYgG2wHbvupQJMWjp4zZ7Y7YHSEj+K3VTD3rejn1TIi/ztn3FHm6kf6CfF5Zs1OJV8I9
         +NNfETvluOaawolPpOlP8/biMA8dzbWrJ87PUnAn9XpE4fuNjr+BaxwP/py6w7zhbScG
         sJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455748; x=1796060548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W1F5qjrP9rUJxl8cI1giD3DqF8jJKuOTOWSAgx1WpZI=;
        b=C1MqmYQjJ/opQnczhQSeSUaymyPEk1U4HPt89wDzJCpjm6hc78BnyxnIVsPbEWqZf/
         S5CqvEQUBRovl+y1usTB38FyQgqi8QlX48AchVwXLNJLl8VtP/Ny7qfr6/42DVFXhi0M
         Z3ur0+NPQujtuWWI65yhlgbYXVJ7eV7nEByV+UqYGjUbiS2IQYU6Og8JpICT98eMjyuv
         2HQCJq7cccuJmsSeob8Pjtux+CNFmvsCY1vNNR3HCEAAbah/uNgbtV4gO6NzpoeIXuZq
         lEzGstFsE5Aa55pQtFX6PFi2Zl14E1qE5bzDPSY6RGFIJu7OZfQlEEW8pQiw6bDkC5gw
         cvjg==
X-Forwarded-Encrypted: i=1; AL+hErFKz2fyAb6VknwSqQlbM3aDZp0arevSZDPCSVWLHatOXF4JNInqi0KtfriAfZa8vyzaIOr5P7Y2tGwiZg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+pmKyQ5uM4DSuDhnXnfDeqnZ6VDSlntEUqNUC+NumPjfmQC0iH
	gdyV6v9ZAuQHB3yGwwaTzR9wd1DOYl7kqWszha8BvBm5uWNE6qYwWSA2
X-Gm-Gg: AZFdTZfRarO7SCs2/6ZCRBDiTG3LGwCmG3mr754QUbMtLLVQA8/crv5kXDCAydDLfx3
	szx8wPQ0Hgm8enKBt02nufPSDLsBMhH5LeJZColoOukiiL9xdGvNevehQFukRq146kXedcO1Iji
	7msZytgRPFYoFmpylRL98pcwfMxPOS2cJ6VieeRkQvLTuuKvP77QYdRp8lSsJKwzM+JTGcGJbeV
	s/OGfrNVs37c6QjcMbK+7LAP2TxWnS53lemlnKSb53mOyFgZVaNo9+gpW0QkvMxiNQ7fanM7j98
	pPOnAeafSHUOA2zpKAQUstoFpRHNOw/5ABZzflXmIatZ7hXTzbmmk7fBHzuYeuUeSzl6Lv90wTQ
	nU/BTq2kMf7+uEOPeqsBs5/qa0pjqqJ9JT3A1Rg8/ChHJILd7kJPndtR1Rs8emUIk1s0+rZZ1v2
	OFWwCZ2jNgb0Oy0MxD7K1/WjkyCy05C3BGsC7eWz9PJk5QY6rSDhaxC0RilvBgJ+ZzXjCiCmUcL
	ljWVmwnzl9+GSU6JLs8Nfyc/uiu50lmSlxHsYTQaf3X+GstX4TnjPqBYAyTnx/DPuRb+oXK8Zyt
	0C9Ghj9eO5jsz9TnFIA3qzOz9QSZqgly0Gv8KC2sQiWVBANF5o3y50IXiEVxnjv+yattlysGbKx
	2Yfmz
X-Received: by 2002:a05:6808:6f97:b0:574:34da:2992 with SMTP id 5614622812f47-57a0a93033amr13407130b6e.27.1795455747731;
        Mon, 23 Nov 2026 09:42:27 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35e5ab03sm9481238b6e.16.2026.11.23.09.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:26 -0800 (PST)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7A and A7S
Date: Mon, 23 Nov 2026 12:42:25 -0500
Message-ID: <20261121-a733-cubie-a7s-dt-v5-1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
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

Document the Radxa Cubie A7S and A7A with their Allwinner A733 SoC
compatible. The accompanying A7S DTS uses the binding, and the A7A
entry gives Andre Przywara's upcoming DTS the same SoC fallback.
Radxa's Linux 5.15 A7A DTS already uses both compatible strings.

Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9
Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---

v4 -> v5: The only change is the added Cubie A7A entry, requested by
Andre Przywara. No Cubie A7A boot test.

 Documentation/devicetree/bindings/arm/sunxi.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7da84e2de748..c2ac34cd32b9 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,16 @@ properties:
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
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
-- 
2.53.0

