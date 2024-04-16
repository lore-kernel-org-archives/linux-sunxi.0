Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6948035F0C
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 04:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240726; cv=none; b=GYa4UB8NWnDGqAYbZGsFDBI6pQn+kIrIbA3LoqijRer4clbmFjNjByGI7DGdr/4vxwvAoehkyACQkOsZi9S+zVXVAPHXHuOZjXfDKUdHzEQ23yicBL7JID+JKkTq20tkr+54MO/vd1B56zZTcXmDRpMqGIaw1iZqjQkasz8Hm18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240726; c=relaxed/simple;
	bh=LQrrqBv9wvdBWycpaHPL+H3slFz3ptTYlzHL6vN3eX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLERpHKKwroNycVOUqcvG46T73z1TepE7ib3Tmq1LWF35B6TRIPToCvGvEEQgVZtEiGHD0ECvHYYa5evPW+U9BH5aJN6qdlvLrPxAaKpCTyBH5BX+brnPHLxRHMqXY4U1+iGsoGe2t2C268mvmO6mjRp3drtdIA6aEXvoYYLB/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dGFWnd6U; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dGFWnd6U"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-22fa7e4b0beso2570031fac.1
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 21:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240724; x=1713845524; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ix+javIgp733xv2R/th8q6ndEXpLyg6dF47BfihNDR4=;
        b=dGFWnd6U6YOWRTGbhiLXCbaXjutNHCBoLHQERiIAAQOUyxbTzvV1oJImUyZkwy7Kec
         hBgVG5+Pzd3eS8SvpA4YCKSH1F95TqN2BPfTNm6miozF6yBwkh6bHIfRdBd9B0Os9npd
         PY/njFbPu0NPCSWg/ympncYrLg5R0sjFrq+KmZHziBik32dKJ7DHTT5F9LiSzG6a5oYU
         KkF1p4Tnodsz4jytRllLOBpCoPuGWEC2MyQIgKf+PSEyzOztq9Z/j4pri9soJOq6vu/K
         Ke/VnR6vvpQmYwE7nYe0LV4ZUXirM6j/EI/f5UwftN15MyzSA+XK3KmU6DhaOGMuMFXR
         XXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240724; x=1713845524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ix+javIgp733xv2R/th8q6ndEXpLyg6dF47BfihNDR4=;
        b=UJB7i8k/GogAFVGklfscNnE2heBW2z2pPzi6hL3Kl0NqxLAAPFwhx4WZlm/dfUsX70
         PVdXJa0FmLjoZCA1LjGclGB0rW6adUZaYLKsOPt2Cn7JY9fiL0byNJMLuyd6H/xjm+D+
         kr3wEyd6cljLB2hpzEPHHrmZOz1hYYjd6fGoicU3OT71zSkOa2IFe0p+dSO7uVls+PGC
         0+DwtfvlXA7+Kp2nDFoWkh5IYKLL7QPH0ntE1kd6EaQEN69zHSC8TFp6GGPZuNAr+TZs
         IB3wMz5gTl5Gb/nKtmEQm33Y7eepwIumIGo40bXkEDo9IVeTxz2FdLRu691ItOGT8mJq
         d1gw==
X-Forwarded-Encrypted: i=1; AJvYcCXCf7Q4jiClJtNgsqB0vt2vQN0RajsRrsWWK9qLxsnbsGfIgNXBeE/FmD9lzhKj+HFwrjOZ9It2ojXdeskxD2vasdTBISr1oisVgvw=
X-Gm-Message-State: AOJu0YwkrLFIYzf8abXZdpIIKJpV3ckHKBhAH3eB+F3CRS5vpao0RG6f
	6K+gwHrEoirudSubLCiOro55At3phOqkK6qtxpMNBvlnpuUyYuERovXC7O2T+vo=
X-Google-Smtp-Source: AGHT+IGbXDdvkRXDVqIhB5dqemFYTdy2m0goN60loDY2Leve+0R5Bqf0uSbuOhPnRHK/s9fJTR1bFg==
X-Received: by 2002:a05:6870:1584:b0:22e:912f:252b with SMTP id j4-20020a056870158400b0022e912f252bmr15110674oab.2.1713240724489;
        Mon, 15 Apr 2024 21:12:04 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:03 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:11:59 -0700
Subject: [PATCH v2 02/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=1713;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=LQrrqBv9wvdBWycpaHPL+H3slFz3ptTYlzHL6vN3eX8=;
 b=pEvFaJ5tW8BRTsoIuU0vqAG3GqiyA34hephuzDd9Vt/mEXWI8V3M05nZxnw3RjeGomtNhqbaB
 ebM2WLKfKRbCojcWa3e7jXDiV067vSqaTtljUUTJYSibWxbVYFA+rxO
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d3
35e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..99d2a9e8c52d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -477,6 +477,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -484,5 +488,11 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
 additionalProperties: true
 ...

-- 
2.44.0

