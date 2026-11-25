Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610663;
	b=ydG//eSFvztP6w0MeU7ynC+39qO8MJl+wHtBEF7d7hnw/kH4fP9PD38pbTKCMdzayuPd
	 xzzqY4hbbKEm+OhOiFKLW7GDzMo6vBWm/o92w1527lUyJuCZuu8iVHXeak/iMTZ9B+Gty
	 Cy+08ymCb8F12okpvNqV4rm/YJyXkq35DX+ZMI111Z1CEIUgR5tDYyeVoSp3s+9Yvo35f
	 jEq1UXp31LMiGmYT+hvnkjtk3t5tQilE178NQupu9OXuHyuGV4MyrN/So92nvD/D13UU2
	 GG7N5LVqfrxJ3RyWtxoDL33PYB/zhrF5T1KG+bgNfSbhXbNqn7GkMS2Z3gKvkzQjCfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610663;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=83eNWKSER7AsPEjIiws9167fJCTB6KmzsxTKIsGFr1k=;
	b=UsXgCBbWQR/94XoOqgsFbAgKIAOGvqEx8RHLb7oSTBt5CLLpMDJoB6r29hAhLRaH6XL8
	 yvjmpc4ZGeDhx4+SSfLliwPHsQdqr7SBbcJPD96ue/0agErdBgbRIQqh+7AmQ0aSjxKhp
	 MTKlACF3nG8e/TMXfEjJyHXCfozyzt58WSQp44IhuM1zSzKmIXQJd7uziCXU/AeKAq7U8
	 kf3SdNZmv7KLjRgFSU86riSKAMMLnM6lk5OZ1qeFU/oAHoFo63/UwNzKn8SFLKMiekgrE
	 usBiuD+UkXqa9dpMNiL/bDtezyc4E7/mAdF2mq5wY81v6vo2UMHzDQrIiLUwUUFv7og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=CZ0nLNW1;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE68F606A329
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 12:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE68F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=CZ0nLNW1
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 5B5DE4C943;
	Wed, 25 Nov 2026 23:44:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795610655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=83eNWKSER7AsPEjIiws9167fJCTB6KmzsxTKIsGFr1k=;
	b=CZ0nLNW1m9mAL/zeMGCZHZGRRLumKHq2gQma1R2EwY2G9x73x81SnidUU60LVdxFvDUj2o
	pKm+9C7NU+V0e7e4gwGEGTklX7EQX6ubRzMzxqK2KyacLmojDgByb951Ku68qQ6bIodq+w
	LiJ/0HvppNfT0YkOu9cYv8v7NtiBOqw1Vho1f1hcdTOhIb9Ew9PBZOYDB2kz4liaQrrKFb
	pT0izfjRMnR7OJrvc8u/uy56nnHqcA7uzrxsQg9rMRRt7WEoLBwkEGPQqrbalX0y7SdKlK
	gfU8AOmPlPyN9j9mKsU7UFc6Cm1wGZsWIPBXdhl2dJq8d8uzW63lKGmQFtDcvg==
X-GPT-Reason: legitimate; the email is a technical patch submission
	that perfectly matches the personal mailbox of alastair@d-silva.org;
	the sender domain (d-silva.org) matches the recipient domain exactly;
	the content is a standard Linux kernel-style patch (dt-bindings)
	with no urgency, marketing, or phishing indicators; and the lack
	of external URLs is consistent with a developer's code submission.
From: Alastair D'Silva <alastair@d-silva.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 1/3] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4 Pro
Date: Wed, 25 Nov 2026 23:44:05 +1100
Message-ID: <20261125124407.4098345-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125124407.4098345-1-alastair@d-silva.org>
References: <20261125124407.4098345-1-alastair@d-silva.org>
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

Document the Xunlong OrangePi 4 Pro board compatible.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 091cb0765ac9..a41d4c752878 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -1023,6 +1023,11 @@ properties:
           - const: xunlong,orangepi-4a
           - const: allwinner,sun55i-t527
 
+      - description: Xunlong OrangePi 4 Pro
+        items:
+          - const: xunlong,orangepi-4-pro
+          - const: allwinner,sun60i-a733
+
       - description: Xunlong OrangePi Lite
         items:
           - const: xunlong,orangepi-lite
-- 
2.53.0

