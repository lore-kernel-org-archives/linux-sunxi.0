Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EB457D219
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194999; cv=none; b=sxjygfey/W056TMCIwqw5IGYr1T7vDkqStBPo4nH9UFXJp+IwrmSZlo4uXoCmviFaqBojwkKJpEXXr3hzxsm9A9G9xGLkp6uFqxDM6VEC47edym5regiR86AI1nHxrTW2onxKoaJjTpM1Jp4FhHXrKYeONRvj2x55+qwcmwiIng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194999; c=relaxed/simple;
	bh=HqfZG9G5ZIenBJJAaY9rfjLXNR0FjaP1nUhMOUSdumE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNUbR6fY3QSDhwyHhvI3ZraxzhVJh5mRXMONB9sYNFpL4csq/fgPUPbRxUySBNOlIXAYPmjPg3DtYO2Wl52hC0Li0aNG5RYV+HICxirv/I2SC2P8BdTm+ZkK2Lulg1SiAU4Xxrek7PZPY/pfgfCe5nM6sx1wdnI+yMq2B56HqVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bz9H9Pdu; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bz9H9Pdu"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f560398so182685566b.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 13:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194992; x=1790799792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=;
        b=bz9H9PduJ+l0iNGmz+pEUobo00MtX9qR3ROjyj8moka0ut7nf+h0wY31LSIDZJPwTf
         QqwBgC8SfKVL8O+fBYeE8LVYSiHh0Ykj2lQUnYSiir105qw7Deo/SkoUp9Iy767sKuO7
         Hm9RqQ3MLAUIZzPoTfnKJ64laf0SunglEq8o/0XroanRUpXKhlQqvhnuqBugv75d40Ra
         SBGbSA6OJ72p7faSHhqOFQgZhFvQn62Y3mt+sOCXoZGIqeH5/sTBD4d+D/35t0isrPbk
         6OZ8/d+zNA8QbWwnuPua/3/Z+7dofhrbBXRVo19eoFmnmQkfCm4QXU6iDB9eCNuw7pt9
         AfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194992; x=1790799792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=;
        b=KIR2RRS7MScQrNTwAdQpib+l2iCat5T3GFc5WyUuVWVu5B9cmwYCAOGuC5n3RG1WWd
         1q7b40L0PbVfQdaik/yMLWqlyx+f4G3EDOtdo0sd8QSFrXDQtPQltDPpXh4YbpZsOGfZ
         3hARtyxXP4fzXfJESTnRPtuIummrBwCiB/a2/RmQQ3Rv4BkKjmmuGe03B2slS62RtKEN
         +1wH67kUudfHv9tDbRzIkw9s2CQoOT651nuWCVZyn2MEReepWTl/JT7NMvGxa3CtUkc3
         K/NZMTls2kcwf6UAhhryo5qxJUZW22/G25Xs612GDo1J8nzSFxeE3AIS5UVk38j2JfVo
         7L5Q==
X-Forwarded-Encrypted: i=1; AKwUvByCO477cLDKHZlexwDvidi471BZrAUK4Z3iwMftM9yz9wFU2EhJlFncitpsxPc81Y+erLdIrXNegUL59w==@lists.linux.dev
X-Gm-Message-State: AFuF++nWAKTiuNlYeMPSYGx/8Mcrg23aiZDfK8OFdYPtg1ldw4mZT5t5
	3FW/j2lcEoGqKMq0wrLy5lw9QRaYHfrNLJ0Ua7lerY0z0BKLWjGuzlKN
X-Gm-Gg: AYBFou2MWxWJG+oiI0+LXHm50K4X3hl8eYPcK8m01nh1d3V94v7ADU9Qo2Ohdph/lh7
	9LzWjcT/urfJPzCX1ofasJ+q2285AKQjtsF9LUQm3Ns99i/3dZAw5XXAc/lMYawY9MwX5MuKE+N
	5Sg8LU+nG37oAxwWXixY7pVadfo3nH45mRkDbgipfjOBRS7HRey+91sELJLeSi/9bOHgy0pfV9G
	WmRMcGBg8WH51H07DLJYXwXfP+7gc4DmqVGsmh+SuvqTpPIOt8JQgJ78LxxKqooYMCfWf5qRB0g
	TyDvckKgwAPfFTnBfq1cYVIeMSPXVsYljYvrH6TwUmP5wpMrp7Mg8XEui/pguDRkiyu9KXhN3yi
	DIUExL7B6cFHBVXYf5Ehe8oKGhagZGm2wR3OwLc/vJbRnzh/c+UsbMZ755ajvsKQKseWMwjaMF5
	/u+X2Vjv/s8QWG029bB9juwaX4QwTHXr+xnZQzX1+4l4aMpJnZbSXs+s/ySnxfJE0VGp0IBb2vq
	0QJTgirWfw6y050Es1UgQuLk3SoNJna
X-Received: by 2002:a17:907:e8f:b0:c29:63f2:99bb with SMTP id a640c23a62f3a-c2ac26820b5mr19501766b.47.1790194991761;
        Wed, 23 Sep 2026 13:23:11 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:11 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 09/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Wed, 23 Sep 2026 21:16:59 +0100
Message-ID: <20260923201701.43391-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index bb9273ec2457..179e7842bf46 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun55i-a523-nmi
       - items:
           - enum:
+              - allwinner,sun8i-b288-nmi
               - allwinner,sun8i-v3s-nmi
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
-- 
2.53.0

