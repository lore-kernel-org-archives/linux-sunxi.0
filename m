Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111617;
	b=uDXiGqsgTp99fXQ1grL6hMqbtty7petxa4YsATsIEiKVplHHHzBEcMzOI6l+ZYgLjWf5
	 IvGIHHev2ZTXPUaWjyg9m16Kw3s0Aco/Gjjo7585PAjrlHlgMMakF+W1qkw55gUNCoaTQ
	 jyr3+5bKJw2KM+B0v4sQw4QbWLevmO6xGMOiop9VSnK8YEhe6DNdtCQjXylgV9TK2sFoD
	 OpwGIS8IbHkFSKomD5/DHy6yUSc72DE97+kUDmq72khRH/LH3oOU2M7W3qI9Rhu5LBYtX
	 mGq82JBgGhysURF14XdqqwpKgJhfRoTJqDcsXmz4aUQ4X4UlB89RcqM5TZWqDEetv2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=u+h1+6/yXyfCQxVyWKiaA+3PG2QahTNSPc0SUKvEWjo=;
	b=ncez2WEzXrh7F4b6RBuHZCEz0FOc/UbbMfyoa/Lgc6ttCjmOOq35NUoqSbFMMWd3vL2m
	 Q56nwlgeK7xiIHnbz0xwACdMS1y+3kvaBvWXI7J52/nv0i85fUPEeHsT9prOm0b0FC1A9
	 8IhqyrsT6OXpRY1IsQ8iI82qNFyTeTjp9gKmBnWtt1XR16xL89K5/B2F9gFuFNSZQopGr
	 rgK2LzS+4gbXt0Sbd+HGDqAX2ccVrkz2X8DF32FuQB922oXm3+BwUsfikrDkvbuadr31x
	 Np1/PqMMDQJf+bUSd7tKV9ZOPfwFQR/Cc6JokV8WpSu5dpQmD6YY52N7oPTo3yIG7xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t8PQpYuB;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2E7606A331
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 18:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF2E7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t8PQpYuB
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4b563403c7eso34999fac.1
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 10:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111616; x=1795716416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+h1+6/yXyfCQxVyWKiaA+3PG2QahTNSPc0SUKvEWjo=;
        b=t8PQpYuBN03elopI81lUGFj+RT4iEt1oEZdO72doFwxKOzHO9LyxkvgxSGDCil9nrW
         oKR08Mv1O9ea5q74yawZ3S/5Gwf7XhNsASwsPEnJO08btI9GjW5hfvp7qZHUOPqKo1Ug
         pMzsQjG544+y0mwowM6pKSgNvAnvxdkXvzRLKWi6K7OHZgAKPDAji6Dkpnf1nKJhjpro
         EqOWhItjclkZbrCA2LK5tYrszrWbcZlXVRUYBbOPy/eweCOPqp9PH7vse4weaXE9W+x1
         i9mY7/DImcADnMmnia2pfrpeGZYAry8Xic7Hfep0L+/flE3Wsa/ChTGa5RD2Y0Xb813j
         zCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111616; x=1795716416;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+h1+6/yXyfCQxVyWKiaA+3PG2QahTNSPc0SUKvEWjo=;
        b=SuTi9/uNZ3ePs6ydRm/h8XWmLTO3dYVlbd6hFTI585YKookk9lEGazjrrNnoX5CImW
         gesO5QrtPuSayn8KKq4WF97AhC17T1xRZ6zttTp7UpLht6mXeoF0vZfvx9fN1qeP1uoI
         0yJPNkVHtPKeDV0T6r9M+Ee4aL2F8YjxjwPV6/xr/KbcTOQhxrTXR4BKTik2VB95897w
         wUn0UrClB7OH+SMalR027OtG2+rPNRFAWUaC5CPG+yb8k2hmeN2F0xquVzkFq8sH680G
         ETTVCvA8Btf9eBbazwBxnIwRL+ETkIlSxjTcorj3YEhhoAcHVXe/CWCYNkVShVWeN1ey
         eXmg==
X-Forwarded-Encrypted: i=1; AL+hErFUiXixKY52jgonYA2O/8EZQ9jthNxBjUfZevxIrLtk+vRmlMgo7OwGqqQsJRuffCNXH5N5vFJLXVgWIA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+sQ002o17YViM4Y8U86qxm3VS4zeopsxg8UVWKN9Rqylm6PofJ
	z5QkA1NbIoJftM4pUIS06nnqNW1Eng1EZfNNvLntGHMpMfv+Ucfokb4X
X-Gm-Gg: AYBFou2IqnrtrQISJc4kgBzaRRyyHFwa8AbckXqq4i2GaXjg6kpf7PmMegrMnCFKv3U
	zDBhumrwIrVlvVq1Ha7/fgXIDpdtZ4DYNbYOFXiEPjsbegPICNxYjdcn1dhVkNXIutNwFX3c9lr
	Rt8Cr2jjuoHWnIeWUOP73RH8cRCIPQWnpudFqJ/2TAvdCaHiRNg0EVOMFsxlNpEpgEzNulRKzbw
	NUb86KBuDcjNLVjTXyOIpkMxm514duqrR6sN85NMgWH0LrdabwJk3+htsJkJSAHPIduHwIQZV3K
	FpTqFHTcxh7C4TL7t4z2S8JKtVo1/cVfX7PwYtKFQWYN65XHDQ5W/KbUppetyl//K9A4VoyBZ0s
	eSzy5VQIAYB3LSaHXWc04Rr+F8eDgzABv1a1LhlAEvZU25r+AexwEjC7+jvmV7j0y1yDhsjVlaV
	An4/vkaFnqZPsh0JyY0B2v0EmGJVm6nYmQSagkCyO/RZpLD/dEt4vyyRjh9BM8qmr0coqfme/rf
	ZxqUNhJS43d89dgzh7LJkeRgGPrpocB5XHXdVn2qP+At1Lnp+U+ils2kiREF2MVdwy66XS0/mZH
	M4U+xOSvmUX9vb3cqgZU8w52Zjc/Lh51mPDhUIe/2v23zkM7zJZfirS2aUKFs5qSqaIOFVuBKyg
	C6A==
X-Received: by 2002:a05:6870:ac13:b0:4bb:98d6:f37c with SMTP id 586e51a60fabf-4bc81ca0dbemr415502fac.15.1795111615833;
        Thu, 19 Nov 2026 10:06:55 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5fcb19a9sm453262fac.10.2026.11.19.10.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:06:55 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: alex@sverdlin.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Thu, 19 Nov 2026 13:06:53 -0500
Message-ID: <20261118-a733-dt-v3-2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <18a78cddfc3c28c011bb5d0c566c2f307773b235.camel@sverdlin.org>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com> <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com> <18a78cddfc3c28c011bb5d0c566c2f307773b235.camel@sverdlin.org>
Content-Type: text/plain; charset="us-ascii"
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

Hi Alexander,

> Shall parts of this go below "---" as history/changelog?

Yes. In v4 I will move the dated test results below "---" and keep
the hardware rationale in the commit message.

> Do we need capacity-dmips-mhz, cpu-map and two PMUs here, similar
> to rk3588-base.dtsi? This in turn would mean ppi-partitions with
> #interrupt-cells = <4> in GIC?

The A733 manual shows one DynamIQ cluster with six Cortex-A55 cores
(0-5) and two Cortex-A76 cores (6-7) sharing L3 (section 5.1.2,
figure 5-1). Every core's PMU interrupt is PPI 7 (section 12.2.3,
table 12-1).

In v4 I will add a single-cluster cpu-map and separate
arm,cortex-a55-pmu and arm,cortex-a76-pmu nodes on PPI 7 with
ppi-partitions, and switch the GIC to #interrupt-cells = <4>, as
MT8186 does for the same six-plus-two layout.

I will leave capacity-dmips-mhz out until measured on A733. Radxa's
BSP uses 430/1024 without a stated method. In the November 18
RAM boot on Cubie A7S with the v4 DT, CPUs 0-7 were in one cluster,
with the A55 PMU on CPUs 0-5 and the A76 PMU on CPUs 6-7 counting
and receiving PPI 7 overflow interrupts on each CPU.

Thanks,
Enzo
