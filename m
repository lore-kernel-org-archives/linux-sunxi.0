Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB3928DF45
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 18:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746642023; cv=pass; b=FDVJW3BPYjk4QpKExAtwBBjPxIWBMY+td/8o6lZUesolBczipo15FOG3/pxrBhfmcDYNeNIeoaXy791NxefOZsXib6wleIF8h8gPWwVq0vlmXelffu9FzLMd+zIjI7/r6w6nMrSJguKVhmjv4yei9eczirkVIC0HJXsHAaYzfTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746642023; c=relaxed/simple;
	bh=k45LvJCj4nul5OnklsWDK1e1YwrPqFzRj3IxfD3mvIM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=a0hJtUz19+5Ky0ay3s5dmCctoOtrC+Bn1aZvOni82S44x8Dv94akEmZT62XaLuIxOrV7RKg5jwNJymlXFcdfhpne7mEPav6rJPdtmuEcUHgmProzZqTEGQJ1W0fJJ3kWC3zgrn2U/lMI4WYYkN4NuyCY0kFN6bHguJL9GWvkSaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fossekall.de; spf=pass smtp.mailfrom=a98shuttle.de; dkim=pass (2048-bit key) header.d=fossekall.de header.i=@fossekall.de header.b=D7uPwl8m; dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b=MPK+TQ1b; arc=pass smtp.client-ip=81.169.146.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fossekall.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a98shuttle.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="D7uPwl8m";
	dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="MPK+TQ1b"
ARC-Seal: i=1; a=rsa-sha256; t=1746642008; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ggge+QZGr5xlTVA7vxZ/DhCinzk/tfLC0jY9/0C12uHsm0elGXp7J2DtmfR5JkXSZu
    jVDRgFLUtJNo08tXBGmOB65mwOp2UggVv4H033dx5y2HaFb/8RquCRGu5SAcfDLtvIhO
    6STnMtKFQgCxFEhfkApD8YDsysd3q5MMgX+/zxNu2bpL/ijkN2gHj5g3PZ0dv+BpV2+e
    cFY6sBTRXa+1NzMcEJNVoAr1L4LIwZnPr+Y4mRU+d0s0AinEJnkep3GV9OG3OkGru50d
    Ux3rYV+y81dxzBCIbHN9Tse26DbYp+uaN8FJOM5NU5Z0smGPilJEhqih7QmZBvgphg52
    0KfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1746642008;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=aeRCGfuCcMOkPK+Z73zPArBARVdjs149XSsfgGnEbOA=;
    b=AaBAN5F+3xCC1nBDYRrN1DwzYcukxl0dwY5lL4M7/eypM0RwjNRruuRutLr+gev7Of
    OdpGi9m95ojwPJhwG1zd46zqY9RrvFMsdj0Vf2mnoZJsEYofkwxSfInRHHYNnvCbEEBf
    U3c1xl0M3FKqab3YLvI3rirUaW2ux3uuPraOFHosVDcQeKo67rLQdpQzAKLRqu75L4Ru
    cITv9CL4M3hjTt0Mmi0yYdkczbajYVYhBl/FpbUNXgC/Su+nvZv7DIL1+5YdvM4QO2kg
    1XfAJRuOMM4hEkgfqhlfxbGCCN7SxAcs/SDDxU/J8xHJI/LL+5vAAyq7ka3y+plEuvXw
    GGMg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1746642008;
    s=strato-dkim-0002; d=fossekall.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=aeRCGfuCcMOkPK+Z73zPArBARVdjs149XSsfgGnEbOA=;
    b=D7uPwl8mRfI57QaefQKOtQp9FCFjdKWBPLmCzJTfm/4snA0mo8iOYFbobl8yorExkw
    uCnhwU9lwMLxd6uHQnxTuF8MNoVQi5VYNssKMhCW9vCZpLWZNbBp0bIdY+h+VItWow3d
    W+gjclUHfpRS0i0T/tm7TV+xX20A9o+4n9+pfdXY0u4a7vnmJgA2DcCzsF+0qudlR+Iq
    qlZYza/u1wZPNSDJs8mBcEp8UhouCAia0nIBkqFhfB7GQlHQExzM0qxNR2dv8dTO3I2c
    CM0KqTq1nG4DAnpYhbtwe/MVA2OVXDkAQTED0nrPSgInOL4byOsvluoMJyw8ZXDoclwt
    29uQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1746642008;
    s=strato-dkim-0003; d=fossekall.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=aeRCGfuCcMOkPK+Z73zPArBARVdjs149XSsfgGnEbOA=;
    b=MPK+TQ1b+m+0OUuuVFOGwh69lVpWFh+Ddse2Lzgn7lMhnitJJQLWBdH68HbZ2/Vbm9
    1R/ge4ax/EiJpDTl5XDQ==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id f28b35147IK8GMU
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 7 May 2025 20:20:08 +0200 (CEST)
Received: from koltrast.home ([192.168.1.27] helo=a98shuttle.de)
	by aerfugl with smtp (Exim 4.96)
	(envelope-from <michael@a98shuttle.de>)
	id 1uCjNH-0002s1-0Z;
	Wed, 07 May 2025 20:20:07 +0200
Received: (nullmailer pid 8685 invoked by uid 502);
	Wed, 07 May 2025 18:20:07 -0000
From: Michael Klein <michael@fossekall.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: Michael Klein <michael@fossekall.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: bananapi: add support for PHY LEDs
Date: Wed,  7 May 2025 20:20:04 +0200
Message-Id: <20250507182005.8660-1-michael@fossekall.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The RTL8211E ethernet PHY driver has recently gained support for
controlling PHY LEDs via /sys/class/leds. The Bananapi M1 has three
LEDs connected to the RTL8211E PHY. Add the corresponding nodes to
the device tree.

v2: Refine commit message

Signed-off-by: Michael Klein <michael@fossekall.de>
---
 .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
index 46ecf9db2324..d8b362c9661a 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
@@ -48,6 +48,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "LeMaker Banana Pi";
@@ -169,6 +170,32 @@ &ir0 {
 &gmac_mdio {
 	phy1: ethernet-phy@1 {
 		reg = <1>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+		};
 	};
 };
 
-- 
2.39.5

