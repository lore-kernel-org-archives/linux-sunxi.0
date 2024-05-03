Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DD613956A
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 04:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714711608; cv=none; b=ldf/qOu5KuQonIh6TkPi4r98d6py96rC3KeW96925gj5rg2UbB1U8w9UOjz8BXxWRqDXjBZ01FjtIaJE8t4JJDUq2ln9rDrb3eMazRxlh3LbJ76pxKMwqTrP82e3iamSuqWe9pB1+fhCuhtwxRGUxjI3D3yVid6OkyI3eXLaFdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714711608; c=relaxed/simple;
	bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EE3ZdOiaG9xhGGM7IbtH2qWlwqNLMQse7XBp+iHoFG6dg5gWnOuStqu5/GBhF5uBNaO+CFyTQqMA+lwFxD8kFK74RM59jUW4AiIS6dVFOoymQYTTBdt8L8qYfH6OJTZZ/2/JFqqwq9G+K8vCbYcrcVHDrSHrX7w2JyvpcObAEBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bS4z47a7; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bS4z47a7"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e65a1370b7so81149645ad.3
        for <linux-sunxi@lists.linux.dev>; Thu, 02 May 2024 21:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711606; x=1715316406; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=bS4z47a7q3yXvdbQxTqLT6T/ypz5QpDNcTPcGdcHkVGSfheEase0X2vSfDtgB1nXc9
         hh4lQ9wCS1MncypGa7LA1UDuZxdEmXgvR1+0wSvSFXH3+Rbji81aMar+Rbn8w153pXVn
         QCU9kpxeGxzTh5Xd/oWypwQHwnVWrEvws+jzBA1qV0LKYKEdvuPTYQ7ZlSihD41fERyy
         FTd9V1d31dAjiH5r8FkMqivdSXAPOvcbDqK1iluY/GjRdN57whk3E3sUIxlcZyWs8tO/
         cpMJs9wlEQzaA6492XqPN+WLiuIFJ33vsWF2xbENOCqd8LbOQhkhPN7mUWw5NJplEMBG
         23aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711606; x=1715316406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=TrmZZSPNiXHQGgCJq3Mgi44cCXz83cdY8eJugy3K7L8RtUmOBWccK51a0levbxVpP9
         DRASA7zQRHrmWFsi0VfPPszBCw8i0nF4Xeivv/bE/1xjlGUlovpa0fhNf1MxWnmuezdA
         RIzIMDOp5mTZE+cb9OOMbyJFAV4kIAPNeUBANqouJ/6AMCKmO0Zg0C03mW/yN2ouecm6
         j0vjhZAfDgNy3Y/ANaI2q449c83BEUTEV/wOlQalpfeByQej+sVzbh58D4bKznoona9T
         qqqybAFpG7FQ81/ckwE2TIA+kC/vnOl0HBEY9AvDiaHlnjm3bUkUnfNSW/xouKstR0to
         L5kw==
X-Forwarded-Encrypted: i=1; AJvYcCXU03jLwzKHOYRtZHzJNbW+DQKAxZy3sk6eF4vbqnPfvUYhlQ6d1G22NTKArig62KVeJvTClDxSaNt3bRIRtnccfF/iDkBo6bH+cTc=
X-Gm-Message-State: AOJu0YzJhKs97sHfsMoKSFKJC1pwDtptPdsHIv/BMMCIKEoY4Blge5sf
	VCtszdl4QqVDteU4pMSnLTM/st0jTFO7LY2hV1HtWrR+pg16Ew88CsNX+31y2z8=
X-Google-Smtp-Source: AGHT+IGj1ONAgc+kZn8Vit+kAEhx9nnFFqmH8jc56LAHeK2W7eeNxdNjrfMVxDLPsmj2wTx3n9FXFw==
X-Received: by 2002:a17:902:ccc7:b0:1eb:fc2:1eed with SMTP id z7-20020a170902ccc700b001eb0fc21eedmr1841442ple.41.1714711606253;
        Thu, 02 May 2024 21:46:46 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:46:45 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:36 -0700
Subject: [PATCH v5 01/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-1-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
 b=oyLK0Y3PHVDiXz4KLcIk3Zze14XD3Dj8FvvOLsEWb4mhVtA7Gk0Zj1s8367QGoX9DEP1j/2yN
 hDvPvqHGDMfCgkikiIADs4vpG9jXpfT5XFPyort30d88L/FSaRukOAJ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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

