Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FD32E634
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717613627; cv=none; b=kS90PCtCxWjQoy34MlKswtb7sAnVK91Gh1uCrMcQadAzjrhkq7nMP68D7jS7CEe3X3j5GFz8V38LNSVDqfzProPiUlwoHqc6/73gtWXm+TPWPFzaFOh2UaoZX9M4LmNemXRWwS3zYLqflB5jWVLMIM7xnIcoL/YdUGgfNDgBMr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717613627; c=relaxed/simple;
	bh=z4gazJABgaR31437s43C6iANSBoeq3o2q99mvbLyA7k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tblk+G02l3RrKLObx2zp0N7o2HTK5xgbkOwVkEcWZn5aLld1hoPFOd+lhbP3u8ww828IdMrrV5sBPT1mBHayN0rT36axj6IN/XC6TI4TTVbwur31qjymTrMXU/xbGVKLKErOEQPM02b7LW3fCA80KvlfiifptapbWyVre4yPWCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MykTTV3e; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MykTTV3e"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d1ffaf6091so44814b6e.3
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717613625; x=1718218425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVVt4CvcEbqB4usx6GbIzvQhpK6chWGevKH5JeviVOg=;
        b=MykTTV3eiX9FJjiQ8/blovGR87d6g2aQXA1djRmzXbGEkKvRgbPsz9fCqK412fkGKG
         N3YbCUhLD2G6XjdGFSBE/pZkIRJYp6E1EHkDxCqzqzWsGoa7hHxLObRDZ1bLb/P0IfI/
         t56MQ+b54+ePL9+aWaWWkwfyF0zOEQ0C/EXK7f3GobopUflZGpkVu2Z/HNZsYfG2CavQ
         jW0dRl3ljgkjXeI4b99Z4F4AFaI1fYRNfXP5+8e29824FvzvHxUWXl9y1oXP2vlYKVdd
         5wDGz4ZH5fPJ0ofAY/njuhTZRNSB7kIYQ/dJnr/W5r3+2pNeziynai5fK6XZvG13i6dD
         v2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717613625; x=1718218425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVVt4CvcEbqB4usx6GbIzvQhpK6chWGevKH5JeviVOg=;
        b=WlfOVH+egirAXlgAgbNO9IxNkSfRFmhEQwAC78XRFi2VvKLwRKENuqu0TQi2euSjGD
         ODCBSdGQV145eZaf0fIwRyPzPMB3iJm4VAdr4w2jka5hBzs2cNnbeWDa+wflTQxbAdDe
         FEyBcbmKvpUifA2LqO71bwmDyzHqALh9deHj9fiYEF+UreKhdIuL99FRjyiDBYwW59+h
         7aiZ252sET0KitdRMC9Ik2ILbnI5cKgE5JpVS7f82WmbouMGzydbCKHg0YYTfwNBIJP1
         ZLkH4ZtVizNx9Cmqzb7F3tjXLCffiLGjE9RguXZDIGR94B55bPB38wI8natC8wiGkU+s
         YdLA==
X-Gm-Message-State: AOJu0YyTW++0IHhI31Pr5af1I9S1nylZPogqnZuIIRIlV74WTT1uuQzi
	ODDHv4wP6W4kud9JQ0Pl/rEmdv2papmRQS71gzYnctnH44EYlxPXDVebTw==
X-Google-Smtp-Source: AGHT+IEQ8ihk6NNxKmxMwNP9he8d5hD0KGq6l6cTUseO39XzzkeS/iG7hIwPtz5v/YBU09zzDbgXUA==
X-Received: by 2002:a05:6808:9b9:b0:3d2:2e1:a5a with SMTP id 5614622812f47-3d2043a5c25mr3712727b6e.24.1717613624679;
        Wed, 05 Jun 2024 11:53:44 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d20a7a37a1sm29684b6e.4.2024.06.05.11.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 11:53:44 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	ryan@testtoast.com,
	andre.przywara@arm.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: sunxi: Add Anbernic RG35XXSP
Date: Wed,  5 Jun 2024 13:53:38 -0500
Message-Id: <20240605185339.266833-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605185339.266833-1-macroalpha82@gmail.com>
References: <20240605185339.266833-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the Anbernic RG35XXSP variant device and consolidate the Anbernic
H700 devices.

The Anbernic RG35XXSP is almost identical to the RG35XX-Plus, but in a
clamshell form-factor.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/arm/sunxi.yaml        | 24 +++++++------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index c2a158b75e49..1ae77e5edf9a 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -51,25 +51,19 @@ properties:
           - const: allwinner,parrot
           - const: allwinner,sun8i-a33
 
-      - description: Anbernic RG-Nano
-        items:
-          - const: anbernic,rg-nano
-          - const: allwinner,sun8i-v3s
-
-      - description: Anbernic RG35XX (2024)
-        items:
-          - const: anbernic,rg35xx-2024
-          - const: allwinner,sun50i-h700
-
-      - description: Anbernic RG35XX Plus
+      - description: Anbernic H700 Handheld Gaming Console
         items:
-          - const: anbernic,rg35xx-plus
+          - enum:
+              - anbernic,rg35xx-2024
+              - anbernic,rg35xx-h
+              - anbernic,rg35xx-plus
+              - anbernic,rg35xx-sp
           - const: allwinner,sun50i-h700
 
-      - description: Anbernic RG35XX H
+      - description: Anbernic RG-Nano
         items:
-          - const: anbernic,rg35xx-h
-          - const: allwinner,sun50i-h700
+          - const: anbernic,rg-nano
+          - const: allwinner,sun8i-v3s
 
       - description: Amarula A64 Relic
         items:
-- 
2.34.1

