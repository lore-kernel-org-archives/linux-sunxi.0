Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE09F14F9F9
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 23:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720653585; cv=none; b=S4tDXimNeoLbgW7s9DFOnyzQlsVzu19RqlxpdZAd/cfnZh0/2KiWbWLO6UWXImQ8ohIUEgAEkQwiBvBnLIGCh4xhv1fjgklhIIkvGvwx2eByPcXmIp48G8aTxZwq66dfUySor6EQgwEP117zkZXm7NhbmLrDm4cTEBewjCKpB0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720653585; c=relaxed/simple;
	bh=QyJ2iyxXUm8uwXMRO7RW/a7yXrqYjkuiZ+yXa7/uvlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JAvkY7OkjeLVHeROAw8043cfuDPWfJk/MhT5lDfxR9rF9H0crpynGEcV6Z7HfjfmR+tcSpkmiB3UEZV3ziKsJgvFdp9EoVSm0PKsWP7qeiftr3JsmNZvYp2J1b8nF/I3l+knKG6smJFNPjVO+2F1p0SWp6jZZX+gnfQkY74PqSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YACNj8Fv; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YACNj8Fv"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-70448cae1e0so113319a34.3
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 16:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720653582; x=1721258382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJLbcDQZflMARusAT/RDfGiN+HZbm/zgjn4S839J9N4=;
        b=YACNj8FvFuxwp3BAHSODVEMzGNF/0ObGZa9LeFIHP6uRpRnpsfNSSVMJyvS3I4sJxC
         /36UFSiuoaPtZg4k4dT+L1mLNfR5nwbe8FWRLE2yr4g//2zYzH1VMEYLx1HnF+gSldJo
         Uu4Tws7mYYVQjIwrbqdnQSy1ylNef9mW8eeGYIbdg9s4Cd7hBB4t2z/nRnOBADqjcNTY
         rI7TGWfo5C1IIEAINthI/nXW04liLNMJq5Rx535K4Ua+jg8opGO+XYrcqrf+gR74jLgH
         ctlX51NxiFS9XQiGUCPc5tUmbatj6QCnofbeOrSaczgGNxqsHcfbHkPP4a3u4ZGmZnrz
         X3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720653582; x=1721258382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJLbcDQZflMARusAT/RDfGiN+HZbm/zgjn4S839J9N4=;
        b=oRQY1UKOgmTNYieyrAma3Fim75DbOVt2a/p/anyNvBbNu3c+bhQm8OwRtRWOszBh39
         s6mxp5UFq2ysDgRjiS4jaWORfBSYgQa5R/ShGJFREgHr1KL+M7n2ehi37lzD3O/titty
         rpKffmf2eM6dKI+Dcfm+EVvbejZr1zaYoq8HSiuN+OTLKFW0zSecRyWtp5nrW314g5bj
         0AW6XvmzGVeulzN9KfKlKIH4ojnJ6khAfgBUgT9ejnn39NBp4ERVSZ6YQ85ZeuHh/HN2
         ryRY4a2dpvJoZLPUSk7qS4Mdk3TgLHhIaOD9FfldVXOxbt397CdSCA7rCvKll0SvQJg1
         G46g==
X-Gm-Message-State: AOJu0YyMfWJYrOftq2WLNR+YjXKZq2OC8WZU/Fki7TuelL2eLUAkcoC0
	hObHaetWd8Gn9r3BTMZjxL7S1PkAmkv173kEyLnKOstE6vrd6Gy4Z7simA==
X-Google-Smtp-Source: AGHT+IGvo3P5Dvaq5rkcuJAdZ+/lZcZ9HrqolQA3UoZ/TvJp3E68pRKbPJ3Qg9qxuEkUAby8hgX3Fg==
X-Received: by 2002:a05:6830:1106:b0:704:47db:cd68 with SMTP id 46e09a7af769-70447dbd02cmr4660736a34.4.1720653582547;
        Wed, 10 Jul 2024 16:19:42 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70374fcbf30sm1040207a34.65.2024.07.10.16.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 16:19:42 -0700 (PDT)
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
Subject: [PATCH V3 1/4] dt-bindings: arm: sunxi: Add Anbernic RG35XXSP
Date: Wed, 10 Jul 2024 18:17:15 -0500
Message-Id: <20240710231718.106894-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710231718.106894-1-macroalpha82@gmail.com>
References: <20240710231718.106894-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the Anbernic RG35XXSP variant device.

The Anbernic RG35XXSP is almost identical to the RG35XX-Plus, but in a
clamshell form-factor with an external RTC and a lid switch.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index c2a158b75e49..60b11b289535 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -61,14 +61,19 @@ properties:
           - const: anbernic,rg35xx-2024
           - const: allwinner,sun50i-h700
 
+      - description: Anbernic RG35XX H
+        items:
+          - const: anbernic,rg35xx-h
+          - const: allwinner,sun50i-h700
+
       - description: Anbernic RG35XX Plus
         items:
           - const: anbernic,rg35xx-plus
           - const: allwinner,sun50i-h700
 
-      - description: Anbernic RG35XX H
+      - description: Anbernic RG35XX SP
         items:
-          - const: anbernic,rg35xx-h
+          - const: anbernic,rg35xx-sp
           - const: allwinner,sun50i-h700
 
       - description: Amarula A64 Relic
-- 
2.34.1

