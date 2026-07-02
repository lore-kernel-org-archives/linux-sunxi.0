Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF4D3AEF51
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 21:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783028889; cv=none; b=e2wAnr7iipfQ0vod/i2daJD3p7JXtnKhveyDdiOV3guFbA8myi1X1SBiLOP+UzsTzZBpcuX2Gj3dkOTAG55q/CqjRTSm5DYQWXvyrj5DMDgPZekI8WRNXZZjQPSZlDEAeCvJ+JfMDjFWy0ww8+klVKIBoU//jPUp9n8SbPiDp5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783028889; c=relaxed/simple;
	bh=+HAMBaZcdBrjRhj9S5KxkVE10MrfH1DGewIu3JXAVXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2JkUePnIT1FIbm4pqfpNyevM4KnguVhCaqO5Bt0Hb7b9PhBW1DNYM4qLV0F0kC9G1pYjked1qxdqm2oKOpjS8F0gls0iTXjCSzUytmVEsMvXyRL33hFe7ZeXvibegBdgVD/8aYhns/rbdm3Xqk1HFt+I4ZOXtoBlK+sPlkapoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SC47Sln6; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SC47Sln6"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-664c6304683so2584300d50.2
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 14:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028887; x=1783633687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tpj+MtbD1Voe05dyT9Fd9S36++WsVidg7tbKtFQLZbU=;
        b=SC47Sln6P4mFekvwgSIjSRTfH2oSsuzUe+mVy2rSzp43tMqDjMlmG+JgYw3mC4nYzL
         EvvOw5UYm6uAVIObvPRHIQ7zXPXrb/oPQGrBDauE1XMsZRDa6A9PjOx9jtBfGuD4+E5P
         ocz+j/EU5pKExJD7ztTzlchUkk9PTtnN0vD3nEiVxON62klm30jGzoToSVks1YxT80vE
         9PDtnxOq4+iZftNLXeXcilMmYVjfqshINdSZgZJlBdA3Wy1sG7h5pKJL8sP/yZO6Y3Cw
         sELyYTzIif6nJ1LXcyVzmvn+3MKpABAQy+MW5BLHqn+i/2y1gsGRrE2xyudARRrvw7Ze
         1mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028887; x=1783633687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tpj+MtbD1Voe05dyT9Fd9S36++WsVidg7tbKtFQLZbU=;
        b=KuyfB2tNXaceuN7OvvCuknj5qq739ScgqNIKSw3pvm0JUW5zZs07/YMVRwmyqaG995
         3tEy430O7Y4txiBykcgBMHuku7FLuhr2WfKwE5thZDl54U2HUUAGALJAFTXRZpsbIen+
         lsf67K97+Xyjv10/V8kXPDvGv4/yLbZHuhTi/R+BSSVYqnZ/V7goxAFvcTAc7XHbd8gT
         KL0OiYaUZahNfzuu+ddidC0U9T8hbuX9m4LAV5O+Ur1bEORXcFwdCw5TMkaYpUndnoQG
         NnIe/e2jTEcr8ywYbprD9owkZn3gG8mYSk2ESZF/aX1+4oGGYj8OX3bwbRQuL1d5QsZF
         s2og==
X-Forwarded-Encrypted: i=1; AHgh+Rprwu8vxI3/pE80amUY0Ifg9HpKWRWK4DAbx9KzYpVVd0P7wZzG7rnz6mTk3WvjkpKCo+/A50om97KR7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLVVNUUeXIIJNo6AgTlPQXyNp0dYjo5jbtVpGJ2DEP9LRe8Zpj
	G/rUeHsPkwOc1UYKy7vgck1iaLfPwCPfz3tDfAjBIMcleTIs3U+5sE5q
X-Gm-Gg: AfdE7cm5g95TqaI9iJjL4tGaL9mTnhY62avGRX0sTQIac+EJHqb9oUoG/GswdMG/aY4
	7QNCB/Nc7MoQT3IZgY3dEO5obaXRUD1u2guUqz4GG3k3J+y1Z6Ea6t+4J/DOz3ZEN3AbN+590wf
	gxMoQhwYRdfXCJz6pjcdjwFyx5cRTp94EnEYOlcwGXPhSBiUaQUB2bKJI1vXJNJh811IASkbMyx
	ORQCDy6trggqzR4tvX4KP49esZ56FrwvVWiXFztnxraHv9nXRva5lUHfaghWIlOn8VBheoL6X2q
	VJ3+mN88zFJ4oJYccw4BGC3L7WNf6J+ueHPSDfz2L0gqjpHHYdqwE+bs/rQo+YCVTd9nMPxHNdP
	SPKKeOu4XeNqA18v9biw0L3D4PjUkP63ABBry3BA1qo2FLJV1wrY/DZm316cZKjRRpughw/Ikbb
	HgP0P9AYisJPGQDvCSySRRGrFv8IFx7kIAbDHldzobJBeEegg=
X-Received: by 2002:a05:690e:440c:b0:664:a0c8:f956 with SMTP id 956f58d0204a3-665916762d3mr4471470d50.15.1783028886926;
        Thu, 02 Jul 2026 14:48:06 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:48:06 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 4/4] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Thu,  2 Jul 2026 17:47:50 -0400
Message-ID: <20260702214750.3428694-5-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X96Q Pro+ TV box has an IR receiver window on the front panel,
wired to the SoC CIR input on PL11.

Enable the CIR receiver.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..de2bdc21c781 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -266,6 +266,10 @@ reg_dcdc3_323: dcdc3 {
 	};
 };
 
+&r_ir {
+	status = "okay";
+};
+
 &r_pio {
 /*
  * Specifying the supply would create a circular dependency.
-- 
2.54.0

