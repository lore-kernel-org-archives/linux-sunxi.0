Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725382;
	b=m9PLF+DyMe0ijePMPBVM0ls8GiUbrRr4IkYX4M1BRbQvXQ5Al1OcvOur7FE0p6LJcaSz
	 STkrttR7P2ipIe9pvfnyWx5xGMIrGH1P///53FUXT5zK9xoHI7gvz3ZgkwKNKNzzXYC6n
	 aHAnZwtt1TV9gGW2zR6IWB0bYT2odmfYuVxABD7+o5tviCd2aRGxm9RuW/Y87Oma6mO0x
	 /6R6557lXAq99ikhuBGFCE3Ml+lZYj8G3Cy5NxHtQcnBO1ebQ/rz8AP5ZWNipHFv4DQ3l
	 wjYnOTcld4g+XMjRnPFsR041tuC/Xn9QVlWWs+IiV/LeJfaUYNfjmsbKdXH3PDegCjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=JAz5nKgdKURm2kGIEFLUS6ajltDqJFpi+dmIBSAUiPE=;
	b=SlvSRbewN61+i+dRVoHJ6n239ljKNmKrGu0qaotv+WQffGN6mXd9JCTy3KqI5YOLm/tN
	 RW6PHSCssKb17Iar6bhamxuszwwgiB8oKfDeKF6KvP3wXCzCbvl0y0Lk3T+ACek5x6clw
	 b6P7YiJDQbew1EWvIwcG1Ro+ReybECar1aCzVyC3AngCQH+sTsmHwjNCy3KkDUH3ddmps
	 AifuNdaDvuVeEl2RO7+bczw4QZfbnskJe7iw5F1x8molPe93LL2ioTeOwhR9RCwl8iZpH
	 KTcBSi20L3KC7N11HZM2NMAa3JM85ejDXpF8f7XT89lXhcuuGlL++dqC98fem74LXbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2dBrdfY;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F245606A323
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 20:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F245606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2dBrdfY
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6aa9606ddadso4786685eaf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 12:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725381; x=1796330181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JAz5nKgdKURm2kGIEFLUS6ajltDqJFpi+dmIBSAUiPE=;
        b=o2dBrdfYvqn/zQARem7Xj1nie7/4H0zRtyuDTWTVdAPQqSm9LbXvrxJW/q5M3jNWrl
         XyT5/aimN6NLcfb9ndwdHWrjox13sjs8wEDTY1bNXJfEGb4GWtVIf2aTPzCVzYaK+Sw1
         kgH32wkgS48vTf5D/Jd7hLDGn+JGFkwGX3iigtPtKq/KLXEKmyGQd7n1iqIut5dQX04x
         uJFsz66j/XKZCXFlrN1mu/N6C6wD7rCIjo0BN6XyMk+2sreIkrOEKHRuArw/GLU5uoj/
         eCGTMhDkRJurBo+myoRG5iGxz06cBCEG98pKgr77v22w5p5FfaDJGik5YUgbWNVEE1Kf
         G/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725381; x=1796330181;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAz5nKgdKURm2kGIEFLUS6ajltDqJFpi+dmIBSAUiPE=;
        b=ptjYIoFZbvjrhXb6XCyl+PhtwGsu9D3IYln1eNturdZIKhHp1nieC3dVa/T0XJKYpa
         +TiZEo9QkyAkz4D3duJRbQkRTsitM6hvIksqSxVAdxxyoWW+JCDUB8sJkcyI+oRC8xEh
         YLm1PCHY6bWq+R91HHGrD1rYAFsl6L1cuv0CxKAHOymvQgYXqkkqvCUlrqBdXX5pMm+M
         mbZ5W3BOF1znPPzEbS/mUskhRU7dMUiHvlSCU8+v3YjkxWI+LhYy3zL60qD4we1mrzUt
         AitemcAVsE9cEkTjI0QjstUT54oOFaSK4ml02xfmycBioOrcw5o1T2l0zc/qv8YWgql0
         Ckng==
X-Forwarded-Encrypted: i=1; AL+hErH0JQEOoyceod5BPIW8Tj7Zmc3kq4MzV2AwFA0wYqCjVhpzkfrFAqDJ2YYk6qerfUpkapAszQEx4XDHWg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8oF/DfNKqx24y8mjm0hk8el5lXEwRy4itYuCYPePQJFpsn6Mk2
	z4QggLS3k+uun95MjOh/Sj5g5xrT9/qUb55klpO9tDzNJZl9i7wPmdc4
X-Gm-Gg: AZFdTZf2NtXUKnc4YVrtpkKp4IdCMhOLPZ7kfQhb48TnSiVzrezCVnCUaF4HiV69OP0
	azDPkzoLYVmxZ81Oa3W4XdtqdsDMi1abTLdRWaTlZkpnPvdILfCQtnDG2+eEU0jUPm5wGMrpzzj
	r5ruSR61q7B50FFJVRkMq+ua4G3Z9FR2zoWHt5OpruO84vbA9CXfzpPm0YaCxeJ/Slc2gWnBp/X
	3bdgEixnNtPgJrf9XtPbKbTvUV4GPqtQHw5D2VWdo976cjEvmLY6KYDI2y/ZOoHq2pUHGmXiwxl
	0uTQL0g5YxZweYkIvPfikkn18XstFsVcDgoyuLFH2icI13Z4eg8rjm9Hr1wA3XxHcQfCulmjIOc
	F48tdPqvte2hI37AQ2TuhdjMkapdyP077jWLxIa2BXf3bk8dwcsgdx0pbkxQ7MeWv0cJ10dCCyf
	mSfAoA832IZtBkb1d9gBnJHSUVuCym/MXE7jroYUu6qEM9ylGwQgfKYosDLWmZg7SDLruxaYMbg
	HyG98kSzkQHHKw5RXMaFyogwS1F/nqoRAA3+hnhPQLuJ/nLoAAIRI9c8J/+EzjuqydwULx/rwUS
	hiL8h9augjgxvbCIgDNYD64R33zx+2VxLPXEgQZyogVahGcpj7A0fdYpHKgrKHKpVBF37dYjHVz
	kGPs/
X-Received: by 2002:a05:6820:1342:b0:71b:3fec:3915 with SMTP id 006d021491bc7-71b3fec4aa6mr17056260eaf.64.1795725380970;
        Thu, 26 Nov 2026 12:36:20 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631670c44dsm15454620a34.0.2026.11.26.12.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:36:20 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
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
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Thu, 26 Nov 2026 15:36:18 -0500
Message-ID: <20261125-a733-dt-v4-1-reply2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com> <20261122004008.0ee8e16d@ryzen.lan> <20261121-a733-dt-v4-1-reply@gmail.com> <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
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

> If you respin, can you please add this one as well?

V6 1/5 adds "radxa,cubie-a7z", "allwinner,sun60i-a733" alongside
the A7A and A7S entries.

> could you wait with a potential v6 post until I got that one tested and
> posted? Then you could ideally also include Vinicius' A7Z patch, so that
> we have all in one series, and just need to deal with the dependencies once.

V6 [2] squashes your A7A 1/2 into the common DTSI with your
Co-developed-by and carries your A7A 2/2 DTS unchanged. It also carries
Vinicius's A7Z v2 [1]. Both board patches keep their authors.

[1] https://lore.kernel.org/r/20261125131435.33190-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://lore.kernel.org/r/20261126-a733-cubie-a7s-dt-v6-0@gmail.com

Thanks,
Enzo
