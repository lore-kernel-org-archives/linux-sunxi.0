Received: from relay2.uni-heidelberg.de (relay2.uni-heidelberg.de [129.206.119.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C321C548A
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Dec 2024 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.206.119.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733516481; cv=none; b=QdED6SlWaW54aOCpose/Vq0jabTl7IVgH+IbUd4L8vb6oc1H3aZyDa6zifJ1a/HJOqsxNLc0dHFvi8K8wvmz4hgs2AAuVOqzhv9Mdwpf8JAkLjI1/B8lqjFRVdh+BLFxpd4OU2v0DEHlj/OpRWlOR8GIhSyiwRnOC38lFUW/MVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733516481; c=relaxed/simple;
	bh=obweLbPmdaRNnm9sBPFdYU+Tkq05AKGhDIpdDJNmTx0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5XVvCIBc+hutDdQ0kbRjL/pmV+wEJG3et1PH+KOFOq4q5NvZYZlM7bi8kR82aTXQTnaKdYXqmPIliN+mvlHyUMX60QwFMsHJ7hU2A+9AKgizl77Kkyr3vsFSnbZsEGcnrZjSZCOoKedKJ4KxkJPUXBdJ8UP/+SUc4z2ukJEBBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uni-heidelberg.de; spf=none smtp.mailfrom=lemon.iwr.uni-heidelberg.de; dkim=pass (2048-bit key) header.d=uni-heidelberg.de header.i=@uni-heidelberg.de header.b=Y9E+CfxA; arc=none smtp.client-ip=129.206.119.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uni-heidelberg.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=lemon.iwr.uni-heidelberg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uni-heidelberg.de header.i=@uni-heidelberg.de header.b="Y9E+CfxA"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=uni-heidelberg.de; i=@uni-heidelberg.de; q=dns/txt;
  s=s1; t=1733516478; x=1765052478;
  h=date:from:to:subject:message-id:mime-version;
  bh=obweLbPmdaRNnm9sBPFdYU+Tkq05AKGhDIpdDJNmTx0=;
  b=Y9E+CfxAcGDkVlVW3dCdHn9h6iPsc5RzaPnYrRavLz8vpID+zQaHrufm
   kA8re3ARNN7CP7eo3zn5OrArMGdSFOiZ8hr/Qe+BlTdOCl7aBq3dwYctc
   tBMujFkB5E+Qs5C1pQ8zVmmgwJ5JIuGqseaDN+WDuve2bTt5mP/Uoqg05
   wi+0TDu6AHwp75tds/sArKaWn3KlLWRtpboKSgSxcH8LseJNZFg2O2pnd
   AFZmRav9SITqq7izuK4THpYk5EOuplZIrOD7JHIwyLY3fe0EWUwzqAuzd
   SNbLH+85gYyjDmOQ8KBm1ymrltxtUWLHy9MhT5VDadCIL8SLDd3VZrmiM
   A==;
X-CSE-ConnectionGUID: 8Uvaaj9YQderm1jRwBtoHQ==
X-CSE-MsgGUID: CejYt4G9T9+tz3lmYZ5eeg==
X-IPAS-Result: =?us-ascii?q?A2DPAwCyW1Nn/1BqzoFagQmBU4IcgQoBgX6EVbAJgg0BA?=
 =?us-ascii?q?QEBAQEBAQEJRAQBAYUHimooNQgOAQIEAQEBAQMCAwEBAQEBAQEBDgEBBgEBA?=
 =?us-ascii?q?QEBBwWBIYYIhwSBCwImAhZJEoVmswOBMoEB3kqBVoEaLohOAYVqATuCDYR+g?=
 =?us-ascii?q?RQBg2iEJTswgw46gi8Eh04liQCdHYFNeDIBVRMXCwcFgXYDQoE4gU2BNoFRQ?=
 =?us-ascii?q?4JOSoNKgUJGPYJKaUs3Ag0CNmmBOyRZgk2FGYRphFqGJYIXHUADC209NxQbo?=
 =?us-ascii?q?n9GhxDHBAelYQQWM5dRkn8BlhuCYCKpCIFpAYISMz6DNlIZD45ZdgECwQ93P?=
 =?us-ascii?q?AIHCwEBAwmVOQEB?=
IronPort-Data: A9a23:i8BeXq1EPovxeR409fbD5dJxkn2cJEfYwER7XKvMYLTBsI5bp2QAz
 mBNX2jTPq7bZTfzLtB2Pou/pBsC6JbXnYI3Sgdr3Hw8FHgiRejtXInGdBeuY0t+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7wdOCn9z8kjv3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYQXNNwJcaDpOt/vZ8E0355wehRtB1rAATaET1LPhvyRNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiI+t5yZv/R3jndaPpDXlBYrQRw/Zz2hx7idw
 TjW3HC6YV9B0qbkwIzxX/TEes1zFfUuxVPJHZSwmZyu0UTPcSrd+vljFkRvP7cH0PpwIVgbo
 JT0KBhVBvyCr+a7xbW9DOhznII+KsiuPI4etnxkxzzDArAqTPgvQY2Tv44ehm9uwJkWQ7COP
 6L1ahI2BPjESx1LM0oaEro6keKvgD/+bCcetVSU4Ko64mTeyAZ8yrerPNe9ltmiH54NzhnD/
 TiWl4j/KjoXNu2DlRXUziPvmv2UmSbKat8fGbLto5aGh3XJnzdCVUZIPbehmtG9i0ijS5dWM
 UlR+Sc0q6U23EiqVcXmGRy+rmSNshMVV5xXCeJSwAWMzLfEph2EAHgFZjpAc8A98ss3QyE6k
 FOEgbvU6SdHtLCQTnTb96iO6y60OG0VIG4OaCsOQBEKpdXuyG0usv7RZoZeDqe8jIzEID392
 TXTrhIhrakUrfdegs1X4mv7qz6ro5HISCs86QPWQn+p42tFiGiNOtbABb/zsKooEWqJcmRtq
 kTojOCywYgz4XCxeM+lGbtl8FSVCxGtamW0vLKXN8N9nwlBAlb6FW2QiRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPAsON7rUJh7kPC6SrwJs8w4iPITOPCdkyfaoElTibK4gggBbWB1yvhkY
 8fznTiEXSpKV8yLMwZat89HiOR6m3tgrY8ibY39zgqqy6GfeHeYVf8FPVqCY+Qz4bmLyDg5A
 P4BX/ZnCnx3DoXDX8Ug2ddCfABRcihkVcieRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:cQNmwaHB1QcC9vD6pLqEIceALOsnbusQ8zAXPhZKOH9om62j5r
 iTdZEgvyMc5wxwZJhNo6HnBEDiex3hHPxOkO0s1N6ZNWGMhILCFvAE0WKN+UyYJ8Q8zIJgPG
 VbHpSWxOeeMXFKyeH9/Qm2E9wp3dmA97rAv5a9815dCSZtdqFu7w1wFwacFVczbw9bApA0UL
 qa6cwvnUvERZ3fVKWGOkU=
X-Talos-CUID: =?us-ascii?q?9a23=3A86LVn2oG0SdU/2cOxogRFc7mUZAYbHTUzibhGkO?=
 =?us-ascii?q?1E2MwSoeKY0OX2Joxxg=3D=3D?=
X-Talos-MUID: 9a23:UFBdvAoCvnorfNN9aEgezxpvNvZ0v4v/NBFOjYddv8y1B3F9NjjI2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from lemon.iwr.uni-heidelberg.de ([129.206.106.80])
  by relay2.uni-heidelberg.de with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2024 21:20:07 +0100
Received: from hlauer by lemon.iwr.uni-heidelberg.de with local (Exim 4.92)
	(envelope-from <hlauer@lemon.iwr.uni-heidelberg.de>)
	id 1tJeo1-0006Sy-NN; Fri, 06 Dec 2024 21:20:05 +0100
Date: Fri, 6 Dec 2024 21:20:05 +0100
From: Hermann.Lauer@uni-heidelberg.de
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH] ARM: sun8i: r40/a40i: rm unneeded PH23 setup which resets
 Banana Pi M2 Ultra V1.1
Message-ID: <20241206202005.GA24845@lemon.iwr.uni-heidelberg.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Banana Pi M2 Ultra V1.1 board resets immediately when the usb core tries
to setup PH23 GPIO. It turned out that the V1.0 board USB-A ports are
always power supplied and according to the board scheme PH23 is simply
not connected.

So remove the PH23 setup: Doesn't harm V1.0 (with R40) and let V1.1
(with A40i) start

Signed-off-by: Hermann Lauer <Hermann.Lauer@uni-heidelberg.de>
---

# HG changeset patch
# Parent  236ffa4558b03bbc654515fae80a7a2387f06cd4

diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
--- a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
@@ -347,7 +347,5 @@
 };
 
 &usbphy {
-	usb1_vbus-supply = <&reg_vcc5v0>;
-	usb2_vbus-supply = <&reg_vcc5v0>;
 	status = "okay";
 };
