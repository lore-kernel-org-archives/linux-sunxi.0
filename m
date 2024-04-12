Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867191BC3C
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 04:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895104; cv=none; b=iSnZdTvxxOdYeyT596Rn2kJmTWx0VLLuqDA3r/UwTBSczkA+kxQcs3ncK7/VnATcs8lRXfc3UcwAZBqdr+1HVJTpRjBnRrTEX13xkKnJZYca8B1AePptMJa0DqHMg69yfHuevIItthQtnzvJjPGSX8HrKu5jzQJXHqbOQchlSAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895104; c=relaxed/simple;
	bh=oL6I4ETw+/5YBi2SkRJ3Nc3nJsbymuJaBJHYjR4VtV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EBBYb9YNa0P3h/bW3eJzEiTVzZAV3X648wyBEdwHRxVspnGCa8kZzfprn2PaVGK1YXt4j7CT6PwZyRPd6AYcsPWIkC28Zeq1CMZzZC7ZuxO8hnnAMdiV4PupvK3zIdRKE8fDM5dCJlFSMJ9yo1ZWGSgmq9QwmDwI+3ZiZliAflY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=k3DjMHfy; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="k3DjMHfy"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ecff9df447so554307b3a.1
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Apr 2024 21:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895101; x=1713499901; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Sixzgo2r7kg6GY3Fpd4pBZrh6mU/5eZgncRXiQPqfM=;
        b=k3DjMHfyxzBjNXpEN5hmelPDl3d9v+XXBVoaJSHboXrPG0QbSVmwT2pwDN+lsuLkZA
         qlwtu5EP44hJxe84SYx7JHlkOye97UgD7Ln9F3jTCthLC7KzPG2Rnp1FBFhd0zRH2Fc7
         14f4D4k4uDBseOSZ5jPnHxBMK/bu9+eNkYoADw0Hto+lClNmFquref6A2Eq857B7dctd
         FruDGl3W0Va4Ru764niqtgClHZPSnXEjisTnBR2r4DgtSpWS7/PvelXPWqJEamvfefFE
         NrMvocIZiTT7uqd057h8x/pWmxxkZjViP3JadzVerNxtknaE96BwkEFQNisDltijyjao
         lyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895101; x=1713499901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Sixzgo2r7kg6GY3Fpd4pBZrh6mU/5eZgncRXiQPqfM=;
        b=jT/frhzQJqy/AXCFjW3KMxTBupHua0W0/DEsQZbYDgiJqN+kB3Qtuxe2y+6Wed7B8p
         Yk16r76DnXZyJKqp41HPuYkReGJX0x+5pWYhAIhVIxIC1ljjnhp3MnloHgRWaCRKrmhl
         aLHYwUoAUXMGwUYP3fFVD2vwMu0IcKXjawMGxKLUraWjpA24h4dPsEfyy0YVe51VV1pr
         /IKLXzCxJDPHf4wb1LYpEjFNNFOrgJbb9WaOzrC/cjdHINZ0kQqei765citj9BIaUbxi
         BM1PQnQkPa2j5UtTnZDRrEX2ObCgMozlQIOE6aK6AQI6Sz9PWWei0FnlmvqkFXIgxXKR
         z9XQ==
X-Forwarded-Encrypted: i=1; AJvYcCV34TNIUleM+bYIHWUjVZQKCwJO9nrv+/4JoJTXUWV98FmM3zif9XuN0WyPnwKHDsfMMYs3ve+u2IWETQV2GRt2P+DdYRllLmQv1/s=
X-Gm-Message-State: AOJu0YznuP8Or7xz5faM8vRCZBfGJPvDoQmFVQjeL/rocSBVVRFWxl5/
	J4RIj3a+Uv4gvu0A6g0lk4GKeGRtJgYzfc3Nh6KCSyGm5kc8qLq1oHJEw/Wkg70=
X-Google-Smtp-Source: AGHT+IEba4NqNqNEkKrg/H8FclHdYVWy4WtxCQBbHrwXnwjMt5W/XGMP4yXrN/YV5Oq23+OyoGfHWg==
X-Received: by 2002:a05:6a00:c90:b0:6ec:da71:9c4c with SMTP id a16-20020a056a000c9000b006ecda719c4cmr2110137pfv.34.1712895100866;
        Thu, 11 Apr 2024 21:11:40 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:40 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:10 -0700
Subject: [PATCH 04/19] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-4-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=1004;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=oL6I4ETw+/5YBi2SkRJ3Nc3nJsbymuJaBJHYjR4VtV4=;
 b=g/DzPC7a8tBrQ6gAdGC+lnd01Uz42ouki9Lrq70WlwEn3H44BQoong66ZykBP3aEbqygAr8DM
 /XZlDueiyI1BQs+8dexnhDJd/2hv+RQ1wih9R3Vr2glQhBTFzUpkdD5
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The D1/D1s SoCs support xtheadvector which should be included in the
devicetree. Also include vendorid and archid for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..aee07d33a4d3 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,9 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			riscv,vendorid = <0x00000000 0x0000005b7>;
+	                riscv,archid = <0x00000000 0x000000000>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0

