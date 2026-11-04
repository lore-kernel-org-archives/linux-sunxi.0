Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818188;
	b=1+NY4rHQQG1D9mocjsCllarcqP29zwN3hfJ3WoMFRs5nn+xZ7x8S0zgAob2rT6WD5hll
	 i9rc/F9GG+G1VPsRxQ5U48vZH4vYalWv3sx3QwR+m7nCqUf7ryADQdoyvkwgfcPa+6jyX
	 dl+4BDsfMWg4QVM6+Szu68SZ1BMS8LeHWog0kiKKfIWv6C5b8VJZHQZNd3r6gtjKJSC7c
	 TL+DjrUZs1K4fbH5Ylgb0hrmTZG7RPJW6d+NOO7/Xyaozqx2YRUkjcdFzhsaSXmNyzSsC
	 ZAn3MDywktJqGvtgKD7FtQi6WGpBI2my8QGeJkuJVzS0eXB1LEj0hFaUmMX+o9nMZpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tDX9nGWyIBZYspDuB9K3KPW8x4O1lO65MXioXZW/+9U=;
	b=x/ST0oVPy6JTHJioUTBULd/nLGe7dkik+TeuQaImGmYaqUL241XwiQTjJtsTbb9PaTvc
	 hpcaEsMHR8fX6MG1cKJY7lnMYXGPNXzdNFwN6wzLvd3oYdNlr55jQowa6aWRmHcR38s23
	 AWCImsJx9tlmw/P9pOwGaK2giBO6grW2Zs6ooy6gaJu21SFHVWMZ0KdmDSd7w/7drLIIf
	 fdDjQGs/cV6WB9XyQcioCtRhIe6dmC1jBCVMqJoQheEcPOkNjGu2pbAUPER7N9tNul5rc
	 ycQwm0Y/Ml7jxu2fzL5mkYnFr54VTFxxRLTRXRAMjMOoKl0YYahW4wO2t2hwrDD5sUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdqatiK6;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CB1606EE87
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 18:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32CB1606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdqatiK6
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a210470b49so8035255e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Nov 2026 10:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818185; x=1794422985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDX9nGWyIBZYspDuB9K3KPW8x4O1lO65MXioXZW/+9U=;
        b=kdqatiK6aa/oP5lqB2sIFvGTC5s8r792KH57nRqD/2Wn2KFcn2M1Q7gGuUkyxBglrr
         ihUyeR4peRb61MUE5gX0QIgxu57AIq46FZ0cRa7GZM89QF1oQ6su2vhGMwAOP3e8vCEA
         4cBKDxyO1qhWan6hFerj9h4B4LC408YO6mhKI2cQDcowLj6rTq1SsdZNJyzj/qj33T+U
         mewuwGmhfKD1VXLMZfnzlHOgzxTg6nGyX9DFtQ7SwR6SI9fMbwi07/hYlHmtQNwU2Zdb
         B/0tqBGRugkes+9oDpjK0REoygpRjM5khpHuIdkhIojky6yThSVaM8hyq47gbQslB6x2
         HdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818185; x=1794422985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDX9nGWyIBZYspDuB9K3KPW8x4O1lO65MXioXZW/+9U=;
        b=JRPeWEJo1CswdYhz8jskYvBieh98qm6303d/DtaGyX10sk+gaDhyw0fjR0Buu5pWUk
         NSbTGKO+SqiElSSl2khu1f0jCkw6X8wxJ3jICLYiwzSH8kP2iykRqpEaoG9NnZJQGgp5
         XYosGX04DADbOGXQlfRz0AEmgZa5KxHuj+IeO4c5QfBZ2jLYvAgjpQmlSiu3NW2hPdA2
         qvPYNva2xzB4xdq8jvdDonmsK/XFQraiqmbU6DD+6cePcH61ufisj2l0xzGRdFq00cYw
         q5XGQSxFJgQJLE2cjJ+ZvLdUAMfCE/t2UkjrmJzkvWla4rAualrKdBfQKub8GfDMvO5I
         QFqg==
X-Forwarded-Encrypted: i=1; AKwUvBzLNZ36AHkZoLVOz9iAHbHFDdOduEtvevh1/+UfhC5dcUo0Z/GXAWuzbuN1MTtnucuYbz1CGOlixaF5Gg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+uu+CP7y+GLef7TsC7MJhTDTn5wWGt3tj0B5YSEsx+UkhdFWXO
	MQ0mkg+1Ofe99jgx0kdhpNfaPFjikbCYdSwfE8HIV3mGmbX45tX2aM4j
X-Gm-Gg: AYBFou3S7ItfNkyWwWrxAYyfMlH9oUNlZzfFun5dXXChWfw3W0gxDZWUZiOOZZ+HyV+
	0Knhx0sQCYfNm4/Rz8u7MJ3dGglHtLjS3ozBift5wK4SsxDCIJ3RsO8dKqHAtZstkJpKeQ9TE2K
	hn6qEc58iT6q02CMvSp94YFT/ISGl/ob+D1npDiPlbXoeOVbmUcYza2oTI6zZK0VxSDhRIfh1G/
	YDmFH/t545v7gXrvMvKwdkKI4VTH08jk/6aefOSbuZye9NGo2Esl0N4s74IgzopKPISnE+CVRiD
	eTd1X24Rk+CwN5sv4gBhUsTnP7MjIi+cZW6Wfk+tHKOICzkdUOifMr1SDEu9tfwu5iD8fJ1r2BY
	i1cTSjOTwciZknWh7j3zOxnzxz8hh0vSioc35gKc/j4iGvTLcfn1SvVO7S0j69FuCVTksLIKpc4
	eqipdP/E/frDu6d3dKz/tQGphlRr8EuCE5Wey2ec2aVJwDxIXG8aIYEpvsQ9VIBt/r0VvOAfOSR
	xq6Hj/L7mexzBmJAYx+hmu8ztFu9WXlb8tpATr7soNzHx1n41HXVX6HvkWzRhIUM1xAFCfG2a+r
	e5VD123eWxCmqdKJQHRcFI7MXtNR2xoGuuIKWiD40dalceUKYd9Y4vTNDemN7f147KxLw0/XWM9
	ZVMrjY0m8nz7K6wEZML2FlAWcFddyeKvat9U9nER3XZspnom87UwzHWpGX6zFa4jto9ZrnrQWTK
	bRcIWTUWaq0n0m7q55DofscVCW9afuiyJtWahupQzIAGcJR2vx3kmOxiqVR1WDJ2v8nAsC3j5uN
	kvtL4O1p1mnDdTArFsI8VsuSihbqnKsciXPcKfrQAsL
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr403830775e9.2.1793818185436;
        Wed, 04 Nov 2026 10:49:45 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm5081745e9.14.2026.11.04.10.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:44 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: h6: Enable GPU and CPU DVFS on more boards
Date: Wed,  4 Nov 2026 19:49:38 +0100
Message-ID: <20261104184940.882833-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Most H6 boards don't use the GPU OPP table, and the Orange Pi One Plus
and Lite2 lack CPU DVFS as well, so their GPU and CPU run at a fixed
clock rate. This series enables both.

Jernej Skrabec (2):
  arm64: dts: allwinner: h6: Add GPU OPP table to all boards
  arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling

 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 6 ++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 9 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

