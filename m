Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662455;
	b=Uk5s3VERhFu3TsM5uEdYnJOFa7brWYaLEAKCflat+Wd5im1f0PPltFbxWR6+AuTrbmor
	 jiAZ3vCH34grV5Y9gjYq+zRY8j3FMrmZcLQ/hcsvCIZgV6SfuWDJelRH0SMlnd8gM13uw
	 rxPR6cVYVK3I6oYHfQ3zR6fM84KgaPqK8P8SxweOD0hPBCBwaIVdEN/+EbBena6pd9oL9
	 iKkZi2+HDaVQR7lD7yFjfJFlAuBDJQT3dbaa48ItATy7bio6kEEOyYXRIswV21qPJMFdj
	 y21WvJI7jy0bc0A1WtkQ2tPhJnoab4iXsXPYuTAfs1PajiQyJ3NXg1lbs4KX0r8iCsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662455;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=rYrONzDmndfVB6GaH3dGiAC1FfNwMYrSAW/wh3V+FUI=;
	b=NUbKkYuLkFifU+sJB6Le4c4FZe4UhbExyPXjK7gCdN3B9wWfZau7LyVAyiJe/PGQT84U
	 nk53GRxJUKkAqNGzC/bXqsfp9fxjjGGL1yfDGg7eBjxKo6N1vbDMcTq4IQyWvrGA7tHK0
	 ZMuVo0SSQFpKEMmkCQrF6/Rs3GYZfP3O8s54GcqM3LGLgKvMZIAiCznotf/CQQftkdGK0
	 burKsKK0hcfZbbzNp3BqfBH9j0l7ZIzw2TvuUmy+FYtA7qZKGr6WMftuF7/MpQM0v/ylx
	 XkkGxveQsHfHZcPWXlugiSCkLIrkm6oKdHavY9mTEPKNd+NEjiR3CIKqBoOqDOfCzKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="KY5/YjPY";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7E9606A324
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 23:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE7E9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KY5/YjPY
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 386B22F;
	Mon,  2 Nov 2026 15:34:04 -0800 (PST)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18AD73F673;
	Mon,  2 Nov 2026 15:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793662447; bh=TyPXI9cOspx3YhD24PSZEUA31oaVYiyRztgSw5AfOuc=;
	h=From:To:Cc:Subject:Date:From;
	b=KY5/YjPYz1s+wKGHenLIrGW6UuNYi3/dP16lbQEGEt1D/xIUfcJWgXCqly+N+kx9n
	 NfBiNAUBXfBBKCZAQHlOC+PSKYaWTAZXz7RW5fUnbe/BgMqfm80lBVLBYhJWEZ5m+U
	 Yh+SupEqXGLE9FqUi90PuwGcORUSgU+vffXiOk+I=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] arm64: dts: allwinner: a133: add ethernet aliases
Date: Tue,  3 Nov 2026 00:33:48 +0100
Message-ID: <20261102233348.23117-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When adding the DT nodes and properties for the A133 Eternet support,
we missed the ethernet0 alias, which is required by U-Boot to generate a
stable, device-specific Ethernet address.

Add the alias, to allow U-Boot using the Ethernet port, and also provide
a non-random MAC address to the kernel.

Fixes: 8f128f357dfe ("arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts      | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts
index 694c0cacf9064..607864ee13718 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts
@@ -19,6 +19,7 @@ /{
 		     "allwinner,sun50i-a100";
 
 	aliases {
+		ethernet0 = &emac0;
 		serial0 = &uart0;
 	};
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
index 90a50910f07b7..81a2914ae3113 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
@@ -16,6 +16,7 @@ /{
 	compatible = "liontron,h-a133l", "allwinner,sun50i-a100";
 
 	aliases {
+		ethernet0 = &emac0;
 		serial0 = &uart0;
 	};
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.46.4

