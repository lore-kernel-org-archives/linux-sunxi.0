Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00C61FBA
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 01:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710639370; cv=none; b=i+pHvQ+hFD4l38WT3eOoQcLEi26ASK6QEBJzVGeseTXcFPUj4ASJvNiab9QY0IcTGb+zRJE20fJ5icq8pvkAFJ+9eL9l7NL9cKzqli/xJtcsysph75V1g/HvfUSV6RdZt6ZdzOaWrkaSF1LL6EVJGWK+fTCPLJFw95sRCWHDETI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710639370; c=relaxed/simple;
	bh=iqesdghEcnwOh+0QdQK2UT0V3yXb8zQ3CiPUlwu6za4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+0cae8E202HrFOsy2SapHnBv9emK2moeEYuK2kN4pasmu2YBCYjv/aTjfScELnpjIx4ly1TO+ztEEdHBA/uua4EU/nd/8B5jS/GC5a4fyt5vj9pangT3MBvQN/pk5//F1/QHdaRp/Sw3UpFOQPX/Jb0A7nYyp6vVRdzIkwUkC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4lZFEVo; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4lZFEVo"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a46b727ad3aso10019966b.2
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Mar 2024 18:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710639367; x=1711244167; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mldgZHXC40qWEZn3FORzvd3xQhVR/l/EKFy+VTj6VJI=;
        b=Q4lZFEVoHwivnelSdlh4wakp2613U6l2aEkndLjccH1nuuWv1q84WXOiQkFIoojRA7
         IbAFL9MkLfiy0GDmM7sXKj0G9scxWbdZvWbAQ0HF4UvZNjqLo08jXIeFJ9ZC/faW+oMC
         6gyFgbcjwp/QhyhYzjSEq+5gRTMYEarkf/RMKuJnYhd9vyhS1nPYCT8cJFFb8QVQWpoo
         UaEHXZfju9vuw5f39G7Pk6hPwUuobN97GUhpWfsWnIt67FYWqjfs46aQigQU4XgBCEGY
         Ht+Daikm6YdYWiFdq8B0xNUv9bghn1HzWDD+iLPk9h+zlMTKB9ydsB1JINwEXmkHmNHB
         4pRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710639367; x=1711244167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mldgZHXC40qWEZn3FORzvd3xQhVR/l/EKFy+VTj6VJI=;
        b=HoVKJls7aPw9tukFFFaZH/Uj2KaL0Y88Mc1oUYfjiPlfChWFqo5m+9CatsI5lfUDJt
         vZ8XVIiK5+FQKAkTAFdrIU5QWJuxPXCcHYt4rJYPUFlEjDPAexzhBsXM/yS+Co9wrFUC
         B1ChRey6xIUSoUO42O9GdRrQDJorH9Rurvftuo0IKnoOyTm+4/lKljX2XeW2EAXLOy5a
         siid1ePQNYeFCBshF/HkDB+So/77Qx8aYIstB34qTLyWuWHPovng+AlDoivYJ7jYdqvH
         CrdlsIAZ/EMSGB7KS0gyzRJa1yB6cmkxrEXzFY9Qimcw0vLwL2rPHpqCX9797ZjNBw4k
         b3XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIBV71hwOMByi1IGjVdznz8+vhlJE5AUHBThSX5Xyptjf/4BhLY38wW7CiNWP02Ec6jLV5oZUjG/yRMiC0O3eaIFsgqFFxIAVuSi8=
X-Gm-Message-State: AOJu0YzjZt8vq9qCoC6t9Eb6kmnH3Fl8hEyWb11GgVs0MWRaGOSlf7aS
	A7X6/6F8DqglT3jaRdf8ES3MtsLUhMiQSASPE674vfVCYvg9LI3j
X-Google-Smtp-Source: AGHT+IEmY2wt2cMNTQFpTQtnoJDnHefkASho/KmNPwBLag9ZY1aMF86aWic69vO6I/zBDNxWycQPhg==
X-Received: by 2002:a17:906:684a:b0:a46:a194:bc78 with SMTP id a10-20020a170906684a00b00a46a194bc78mr1697690ejs.49.1710639366774;
        Sat, 16 Mar 2024 18:36:06 -0700 (PDT)
Received: from ALDERLEJK. (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id p7-20020a17090635c700b00a465b6c9a67sm3273109ejb.6.2024.03.16.18.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 18:36:06 -0700 (PDT)
From: Kamil Kasperski <ressetkk@gmail.com>
Date: Sun, 17 Mar 2024 02:34:00 +0100
Subject: [PATCH v2 2/3] dt-bindings: arm: sunxi: add T95 AXP313
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240317-add-t95-axp313-support-v2-2-e38032811758@gmail.com>
References: <20240317-add-t95-axp313-support-v2-0-e38032811758@gmail.com>
In-Reply-To: <20240317-add-t95-axp313-support-v2-0-e38032811758@gmail.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Kamil Kasperski <ressetkk@gmail.com>
X-Mailer: b4 0.13.0

Add T95 AXP313 TV Box variant to dt-bindings.

Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 09d835db6db5..6fe137605ba5 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -860,6 +860,11 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: T95 5G (AXP313) TV Box
+        items:
+          - const: t95,t95max-axp313
+          - const: allwinner,sun50i-h616
+
       - description: Tanix TX6
         items:
           - const: oranth,tanix-tx6

-- 
2.34.1

