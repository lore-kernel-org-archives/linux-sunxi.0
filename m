Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB7A1BD9F8
	for <linux-sunxi@lists.linux.dev>; Thu, 28 Nov 2024 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732808812; cv=none; b=GU4poXhEu09yyyShaOuvHiySFzl2a9fTC7FDiJygt3Xs020ST5A7gLP/vlhau9hakqt3RfPdjrP1DRdmL8gV4BbcleDR7JYw+pXDzIIivYWJ9F0ZZ+xmePuqbAz9HqBRuhpMB6XR6hNxxTvzk3qw+6NZ1ui9jnxLRUK9LxeISYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732808812; c=relaxed/simple;
	bh=gO+1X2k+laXeuczPhixpw6KqT4OtV7bvBEPrPNDyaPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kRqFSJz5G6KIWnhl8AGdYjGXUU7LrsYOjb60xFunf0Q5hWUrPK+8sa8QiH54KVZa6rFs8trQvzh4Nd74EpGFmDypDTVcgoBiLato8wio63a8PSC+U3QSavuwgBCxc6f+jjoD6s8jAOkqGjLFYYb+zESnblZd6oP51PBiORKpxnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwMv8Thf; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwMv8Thf"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa530a94c0eso132302766b.2
        for <linux-sunxi@lists.linux.dev>; Thu, 28 Nov 2024 07:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732808809; x=1733413609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gySyX3xb7lz2NAGHoDoeS8CCZN0aAJNXyyTJzm5Bn3o=;
        b=VwMv8Thfzt0cleIn0y0RNvbcYFXYpjUvqOWNBsWeyE0pwBm7G52O3k5hfy8z0jDSr5
         pj8Wb8NlMclQPuXoQ4W0atjwe3dy/iJMJmVdoCGJux0BpTPkptOklGy64OQXkBh8jNZK
         No6bCZUX7t2tlzj1WuphiGatSpddWPAnGPWAAsEPafGHHQCCdTKjkTjNkgJdEPPi32M/
         UpGeaJXKBxxulbN03S4OK91texPbB5ZKXYp6LgQDTCcS+UqINg5NMPL+S8c1+7QuzY1A
         WR1kMNxlnzXkRcS2mRdgXRcNcW/pV4p4qmuvZd8vGL3ikmZh0WlnBjCKRfgcqfM+qYz1
         8tZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732808809; x=1733413609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gySyX3xb7lz2NAGHoDoeS8CCZN0aAJNXyyTJzm5Bn3o=;
        b=PwcD3Oec8VDizZjcKZgRIqDn0WOXdgYiBlVcevCSQVz6SOV0L3OA3iaEfSoGuAwP3n
         VnGg5/EZFVTvXplo+g/iYDHDC9Bhk7gvddlu1hIca31+zemS67TGYJ+xHUyPHSqgKUoh
         mvCFAvBSKCYqVmKKSYcpUXr7ysGeC3C9PvvkPBeSqc8HHyl9q34a8yX0SbzCWKZHyQxu
         L8zhz3eka5IhtPHmrON0kN69uFPv7lhsSL5DzrhLjAK4FnUyXjREwqzHyotCJHabupbR
         ra5px32XvU6pNtPwxgtlrpQEMMXyr5ZvyHnwJAgXJPr8XfAkdxjtl9u+G/6ne7oVYQRA
         4aVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWciwJSTxpLI410X99CNeT+PwpSftPK8IAnz7UwN+0cTYWPiVXWxx1b7eKY3LBFh+6HvZHNOQoW7h4C/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgkBrFXbmmk7kxx60wcxYFOVrMWguxZD98X5MKJWLiziEbje83
	XXXMMWmOqOQ4yhVo9kW7tXt6Kkoyl9eGR1SBKuCjWRh73Gl4llU/
X-Gm-Gg: ASbGnctVh9rCYgd+LcWo//x8wS+qqs7xNFQVfrCGpKqIonXkH5GuktJorZcjasV3dfO
	bkLw+t0z8lI+2vAAMe1zHGzPlbBGlWf60OJtQRfAwbNhJGtbJfyNzC5OM0veRojETLm37mDhpQg
	dgVH4MMJ1FCsvaxndjvedsUDKGmz8gkgdt0Es0sHBOrUmKVESsDggSwvaP4qilKkYze3uf0VU/g
	gnPa5EDuHSf+2RU8cddob/u7U68dN5Z9c8WLaSGkl3dtCSeovn4wk9meDBbbD3wKJruz40GkxIY
	Fa0UmKquT6mm1k3Qt4pXrTvaGAPau09VLPJ6wTw=
X-Google-Smtp-Source: AGHT+IGbYgbDaKacn6oy8Mz56jrQShpX/zaBxCgc1Y2PUaxFezDPqSG9ETGSHYc4z4+CFFxCm/VZhQ==
X-Received: by 2002:a17:906:3109:b0:aa1:e60e:6fe7 with SMTP id a640c23a62f3a-aa580ef31e1mr547320866b.11.1732808808516;
        Thu, 28 Nov 2024 07:46:48 -0800 (PST)
Received: from localhost.localdomain (229.140-242-81.adsl-dyn.isp.belgacom.be. [81.242.140.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59991f215sm78390266b.158.2024.11.28.07.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:46:48 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH] Update H700 opp values
Date: Thu, 28 Nov 2024 16:45:56 +0100
Message-ID: <20241128154556.2743839-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My H700 (RG35XX-H, RG40XX-V and RG CubeXX) devices are very unstable,
especially with some OPPs.
Crashes were fairly easy to reproduce with any dynamic cpufreq governor
and some load on CPU, usually in matter of minutes.
Crashes manifested randomly as simply hanging or various kernel oops

Manufacturer (Anbernic) is using more conservative mircrovolt values,
so let's use these.
While using performance gov seems stables at 1.5Ghz, it still crashes
using a dynamic gov (even with Andre reparenting patch), so let's drop
it for now, like manufacturer does.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com
---
 .../dts/allwinner/sun50i-h616-cpu-opp.dtsi    | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
index dd10aaf47..ac13fe169 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
@@ -50,24 +50,21 @@ opp-1008000000 {
 			opp-microvolt-speed2 = <950000>;
 			opp-microvolt-speed3 = <950000>;
 			opp-microvolt-speed4 = <1020000>;
-			opp-microvolt-speed5 = <900000>;
+			opp-microvolt-speed5 = <950000>;
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-supported-hw = <0x3f>;
 		};
 
 		opp-1032000000 {
 			opp-hz = /bits/ 64 <1032000000>;
-			opp-microvolt = <900000>;
+			opp-microvolt = <950000>;
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-supported-hw = <0x20>;
 		};
 
 		opp-1104000000 {
 			opp-hz = /bits/ 64 <1104000000>;
-			opp-microvolt-speed0 = <1000000>;
-			opp-microvolt-speed2 = <1000000>;
-			opp-microvolt-speed3 = <1000000>;
-			opp-microvolt-speed5 = <950000>;
+			opp-microvolt = <1000000>;			
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-supported-hw = <0x2d>;
 		};
@@ -79,7 +76,7 @@ opp-1200000000 {
 			opp-microvolt-speed2 = <1050000>;
 			opp-microvolt-speed3 = <1050000>;
 			opp-microvolt-speed4 = <1100000>;
-			opp-microvolt-speed5 = <1020000>;
+			opp-microvolt-speed5 = <1050000>;
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-supported-hw = <0x3f>;
 		};
@@ -93,7 +90,10 @@ opp-1320000000 {
 
 		opp-1416000000 {
 			opp-hz = /bits/ 64 <1416000000>;
-			opp-microvolt = <1100000>;
+			opp-microvolt-speed0 = <1100000>;
+			opp-microvolt-speed2 = <1100000>;
+			opp-microvolt-speed3 = <1100000>;
+			opp-microvolt-speed5 = <1160000>;
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-supported-hw = <0x2d>;
 		};
@@ -102,9 +102,8 @@ opp-1512000000 {
 			opp-hz = /bits/ 64 <1512000000>;
 			opp-microvolt-speed1 = <1100000>;
 			opp-microvolt-speed3 = <1100000>;
-			opp-microvolt-speed5 = <1160000>;
 			clock-latency-ns = <244144>; /* 8 32k periods */
-			opp-supported-hw = <0x2a>;
+			opp-supported-hw = <0x0a>;
 		};
 	};
 };
-- 
2.46.1

