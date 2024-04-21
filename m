Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A87EAD6
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 01:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713661496; cv=none; b=Se3ycPE9Px6OlXnz8HcjiSfzAwgZdJfHcvKHWlhSk8OEXPxaBhWiynb4oOKSNVaMwuMNRL/0FhqjkAXXOXQOSDtaLSCj4qLq/P+oD07L7etfujU9wk4gjrvhRrLyDCrisl63yXKrkYUUQ/WuPOmJtksvv0TrUIAGroEFOFqSj2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713661496; c=relaxed/simple;
	bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R+24v96KQa1tSUTlJHsvsib8zVRYmpCK49gLfGe2AYNiAKLI58QzkYsSjMALFqpwJ0ZrTfL7svZqX7ijnY19UWr+Yq18EmFRB5DwG3jwq1HNWQWRUjz/fbxLxf9nqlND6S+heojpOgdgBRkDpw0RRalCBrt+byOkIKZUnB4nCD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=k24TbiXG; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="k24TbiXG"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ed04c91c46so3229531b3a.0
        for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 18:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661495; x=1714266295; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=k24TbiXGSc3BnObaWYPzbP4m6SWAnAq7kv2mYAjz67+a9jFOpp82FMzdYl85p4Vy4k
         oAj00ca4cYucEoakKTMfT2TfyI3zlJqod0W3lfZWgfrKISXlNeNt++CW5ImoL8yCiRjX
         fghEhf8W0xecmwca0PjjTdvXR/DQMGKzJCHbofqxaNMwxpuZF6nr2K9+wHpsEtAO5mpX
         M0dT+/ubLnupZHwKIL4xN120wm81fgFxglLZUn+2hxQVeqO2D479SPWIzZlX5GT3/w6L
         RSZN/lcVQOXekuVC68f1nRvRmSXZUk9UjcevgdlI3iCFHuYQ3nQHB/IOwIE/YGbMIp/Q
         ebkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661495; x=1714266295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=lLQvUMTsts2Rx8Ftx3vd0vb8G0PywpIZLV+Kb8IDHNCf3molu802mRBpuwC6/G6CWf
         zpfBM985erX62yUee29uHgQgbBv6Bz/41+SKDWPlz68bL3ghuZUaO87l65uboFZHRbgN
         pPYrEbWHr0KVl7RPLJrwXegZdIXa1gH3Do8bXEgRJJa/J0K7pYAPWsWJnbAc7F30gxIE
         XYmQn29c03KZUhZIspFD9icfJPxyfaqumJ7/XpfdzO+ey5VuMze2sZJIY9nk5buRdIqZ
         FgTAHX/fFBGVoNHrUKNVyKW8W08jTkQZE8yEf7Kgh5MFSNj/IV92sZxxHzB5BbJblvmQ
         2EyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+X+j3iCeAyHQJv0ohTArTtA71yH8wNUiGe7Y0myeHa4cLXtkG4GVaacquATVQByt70iKPDa3lrpBkWBjitScerxOMQquy8P8NtVM=
X-Gm-Message-State: AOJu0Yw0lREAsbf8avu/NwztyRpY3nN2eG9zhL5n1Gk270taC8SSfq58
	kCdP61qCREXaDI6CvqPwSWBUaJ9BOf4O4j+XH33kGsBqL9t+2b2uFsg2R23+SvI=
X-Google-Smtp-Source: AGHT+IEFz0EIsCfMN1kGF/wQXfftvTTUxdm975Lo9/cXHpjBlb+AqzCdg7gjhE8/LDpE+0gp44E+1A==
X-Received: by 2002:a05:6a00:10d4:b0:6ea:d114:5ea1 with SMTP id d20-20020a056a0010d400b006ead1145ea1mr8547967pfu.17.1713661495007;
        Sat, 20 Apr 2024 18:04:55 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:04:54 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:37 -0700
Subject: [PATCH v3 05/17] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-5-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=904;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
 b=kZB/gcvpdY88mM3BCpDWs4dP4AKzfkcUQrEei7evf3AAbBAZdLZh9RDC+cGSOoMpXUpY+epQ/
 BrXAER33w+vB259xFs7+rySg+Y/OSVCHSvRLoNArK0nYqNYuINYlX8t
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The D1/D1s SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..50c9f4ec8a7f 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			riscv,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0

