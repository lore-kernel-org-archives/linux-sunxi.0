Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404979;
	b=IzOEDYuswuNbIiEZ8S3S96YSSLyFLFcC7m5RyMhR7kaSSZvnRV1wCqc+qw+NDQ9y2Te3
	 uq1jL2U6mk4u2UTqjZiM8KlvsgTASLbUSIMxJZ6W2UYFIdPOBvvE59D/ureYs7Fq+j8fh
	 81jjEItN3DIB4Z6lZBmudRr3FFFSkYw0cxKufTnHb9h/2tWOitXjel7U1w5yAw3lamExr
	 l0hwrx8dxwNZwEnbe4N4JP4eZ7k8Vr3J9Z5jTjQpUHjSvAeIAf4ypM52Np0PyQANylR5B
	 2Rfo+DohWGic5AODApSC3CyaHVCrpyVdlxl2RRK5llOYN7tDsO0p90q/chxVYM1F2SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ICmPBseWQJoBF6s/9mFq7gFHJnr6Bp/UIRwuOakdc3k=;
	b=3x0lkK9cXydkCyse2MMYvRFkKgdSk5ShZh/ax2VXHqAyE2LmSdUT1zcOTyeh2PRUHy5k
	 xicKVpftnAVh2sBs7L+heXVraylmg7hIP6uFmHNJgm1HdqPchRbG8nhj0CK1+VUcx8jt4
	 CtFVt/m7Ls1E6cF5Ki8fUCLw3SEkAn6BuoFxbG26f6D1OPH6dA1Y7ItAmrvfr2crs5WXp
	 c5Bqc9KUEFfvLVtvXlKXJ366WLSh/ak4skTep1rMv8BhQO+zn6PxU2JED7suVA3+nD0Xv
	 0TQQRfw+xs/afe4TQGQjUC4YwHBNoW7OgIIV1NnYZj7Ef232GF9vYEu2GcA/d//asdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YR+4Iahf;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75707606A336
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 13:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75707606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YR+4Iahf
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b2d14968c9so35037587b3.0
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 05:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404978; x=1795009778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ICmPBseWQJoBF6s/9mFq7gFHJnr6Bp/UIRwuOakdc3k=;
        b=YR+4IahfcOKQJz4irKwvwAdpsHDTEkZiWav1xcof8tiwU/+0WPlhYX0mN0aA7h87bL
         SpUXv78okz2IF94TOf22/bU3wn40oACS8BPO5gLfqlFTeodY0B7ZF+OgE9sr4PopUa45
         +3tLKtdI8QTJ4nWmewkxbKp1VuVSKVQPIL8CmU6iksrStw45umEmyLrg8a1ziFKKM9Ue
         wSAYtm0/bdxFq0H3GKURQ/9mLJ3pwi667qahAYlO7Iq9Wpu4j7hCGWAMaaeDHTrmFWSs
         kQ7mjaQNDbzD6sow9RhEj0kpTLCV/ZeqqPMQlk3qye1cieCV07C5vv7fI8yhdudZiOr4
         Hk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404978; x=1795009778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ICmPBseWQJoBF6s/9mFq7gFHJnr6Bp/UIRwuOakdc3k=;
        b=V/PINECY8U3FWgc11YKwzLAuIlTbwbdNjyYZ+h7Z27vZrH10RNXUMI/rA6a5qQpscL
         F9VjpgeN03c3cOIMdzG4qIFSYWnXe4tmT5bP4DVvS2du8U+oRQnyQ/MK8vczY+v/Os7v
         dnNGyL/5dhXclv6xf0X1svk+WRGP4dV3Vl6DLRVGWh6MsXWykBMUAnrGQWBKMz+A9sVq
         GZgKchyeZX0cw7IRhvmywOrxGwyg/hMBrIZO7fJU6FZD3GFhmyJ9KTibR5bAGNFu5GZ5
         Jr0AUbkLs88V3Zilv3J2N22Dujq+sGkIHRe+pK/qdFXbpLZxVsYvkhGYOFsxzAyAv8M5
         OXPw==
X-Forwarded-Encrypted: i=1; AL+hErHC6BvHdUB+1pjAsVFoIkFSgIMtGgjBNM7mUne6+zrXm0jwDbZW+DaJUjG6rv1oq2W473iBrjS8pTX7dw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/esaG06TaC+7/D3Neju2Ef94VvhAZXr3uXhrhMrSDtI64RJhwr
	WPSjOc4oN6N7W0xVl8Ib1WCtOGRzNSrYGQDQutQrYnQD1+qP/OEs9lAY
X-Gm-Gg: AYBFou0UlwmKu5d6cgKXddq/zjjibDcBq9u4bc7Ai18ZAFtFbutcgK144GTuOiqojIe
	nK1hNbrjBCcGIbUfJHCYLV65sAeCB81XFGWwODySoxlxtZcQvqC5jP6T+ntLeb+p0h3nf2W6BKS
	wRa7kBifP/8A4jvPphps+bg2lb0gcGrtRGFT9pjcaKUZjSkBR+8sp+T4JvyYevcrCOuLWdvEDe/
	+tjm3ySH6uAYWdMsEFhALLOiID9zQrrllwp6OkelESD1lNXbgE/95SwbtSHisIygNmBabpCi+zY
	ODQmQ03f1LaInxIKwz+DYKtqvQolUq7LdIZJhJ7SmtvgPZcYrJ0I3ecBqqvaeIMfucrH7hKqCH0
	ZWYFTqc+3tWkXiE8A7YA9kZwaUkDN+JmeboUQRWq0PswtYaOvcvZN+MC/6mVo9uJM6KFg1qMt9X
	JmHInxtyrfXGs+7nkDGnjLFAFCPtGS9cL8aQ9Rp6V5gK2CQxL9oqQguBNex0vip7OYxk0zZk3uk
	da3cbFKcr6DbLU9b1ehq2N4yThItiRzYkesufCfZ21hobJXLjRCCRkqAcwLTCAt1jdIQSfQODJU
	JDHDYJMZGnkraWhUIMwN/tNNnmecMiLo+mGBzSXKSCVIUL5VqUyIvszj1NbxRkT7tjOlD/8Zjqz
	z0KqUFErjiJ7um5GNMRIKZBBS+ltUuI42TTzNDKFW6RhhDjRLVV4MbINY+EnLgrW26AAIa8EXqI
	8=
X-Received: by 2002:a05:690c:a081:20b0:8b1:9b4d:b121 with SMTP id 00721157ae682-8b3a7ffd0admr14988867b3.23.1794404978378;
        Wed, 11 Nov 2026 05:49:38 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:37 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7Z
Date: Wed, 11 Nov 2026 10:49:15 -0300
Message-ID: <20261111134919.90264-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
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

Document the Radxa Cubie A7Z, an Allwinner A733-based board.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 37a7d713ac71..2b9e4d3b2fe7 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -862,6 +862,11 @@ properties:
           - const: radxa,cubie-a7s
           - const: allwinner,sun60i-a733
 
+      - description: Radxa Cubie A7Z
+        items:
+          - const: radxa,cubie-a7z
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
-- 
2.43.0

