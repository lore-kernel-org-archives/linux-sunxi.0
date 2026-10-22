Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627739;
	b=bTrnKwUU+YbNsS6SK8FQEvNMG35h902rH1fryyA+uQuBpcEybajlceCC46S07qSbIMMJ
	 m7+62wuI/3KJ1tjrCTHpmdUZ/jOh0zmbaeBJhJR73HOg0AhWtx3MyBEvpzAG0Nby3j+P2
	 BcWXcxNciMvz2zAAn5+0Yd7XVJTABgWy0bmq8Wmc0zuXIx6AD42cDUWQQz2vjf2IwZVQd
	 9aMgD3P1mUaWBbey4tGCyi8086G3hEjFHWAY+lwKV3fLOz9uaByqefoUUej0Hb4Q6fbYo
	 vOHjoIREd44qzcI94KEVMorHd0na4KZtie0FiE0Hjr8qrsqkcuf+fhMVrOCwFU4nxhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=;
	b=k5MPr80kaJWwJYpsFcA2U0zbn8q/qz3EzGCLwtUghbUrpIPPb6fDuKFEmu8oOdP0baN5
	 RIE54NbG3no8D7A2CkgP4zNfzrN5zbFrsF5M4MA3DDPhsVlj3jIkHIPXL4o7fm9pyMofA
	 g/0gk44VGu7YeLjDfE6ahvmwR01AHHqgC1TLtxHor/hHsKPoly77Orbjx5htQQTjLmWTQ
	 9JrYvqBx+rcoo0l7xEkjN1SkioF4qJsRQ5YOjPMVQDznVtHS5O7RqYZlO4YGtJeHpSC+t
	 Yt6RwYu4+NEpnem9K2FsImetxuIKHahWeyKM26NF+F/oDX6MI9wSO2HSzKz+US8M6SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JrazIpzq;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215D4606A31D
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 00:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 215D4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JrazIpzq
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6d290b10a35so576708eaf.2
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 17:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627738; x=1793232538; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=;
        b=JrazIpzqp/mYanDuj09YBQ645I/8+eZYfVw7TA49wEwdEhO2NLxnwuRUhmXb0b0q10
         1DfJAuiJOQkD+3QUrzC9a6BwQQOznpYbvP+30kxXQa89wUTLVY5kuK2Y8IZGBwjCfMiB
         N4FogseI1O4A3ZPnjyvnFdyk3vCfLAWNcT7sPaV7f8jIWLb6RQ+guR4ZJTjpwHISQrRZ
         POOTvCk70+fyC5D6FEkf8rju2uXf41pcS2iRQpPsjDGee+LHW+bKW1DC979dZyndFUHp
         5ZVR0lt/eVv4N1svZiHzWBvB/JgLRmFsMu/dA1PqAQ5mHwcyrle3EOB5cdByyc5wbNFD
         i0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627738; x=1793232538;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=;
        b=rX1jfxWGFOMHqCnCrFAST3ePAkxja4klbcglZAcncYXCcME9mIGX5BCA4+336cqrK4
         fYmFu+J9kmbxNXXUNYKle/fOtCCDVJuiRL/+c6chemzG9Sd9RZAO7s4GTMYoOIwucreW
         ITfwDFWC8eeJ81OpSc4swrIjObgvBV2Flid1ddXTxmoZB6zCOY5rU9bzAHNptE8PR79g
         LOzCF2/bnStalUHD5TuGZivWA+Fj78mtmTTvw5nAzZl/vlZEvpJzWv1sqo42nzkij7Pq
         c+n+tCLo89FsRhFfhc8ymTkOtCj/o3mk/QPw0Sp8jvxISOfPVuKQzLJrpUO9st+kMAfm
         xfJw==
X-Forwarded-Encrypted: i=1; AKwUvBzOPqIHAQ/me9a94UeHSoWZhSriU76Qy6s1bVDJEOXXJPOtfk4gfI9rOGe8CHtvNXT7zR+6AgaLxtWqrQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLsmmwViUT7rfxie/0Xx0/sBsaNECHe4guDdUnZwtnJcjCYLEkR
	oVaMsTO9Db3a1caEY600QgMutUH7heht5y/7YXDyoyI559+B2xPkvB3C
X-Gm-Gg: AYBFou3mW9OXFJc8Yn0HMjthnNZy6U4lMC/a8ju/5XDA95lheSHP9ukz9+wnldlfHOX
	Mg07c4mtrkGX6YyYohJWdVyJANnrLNR6LJCwADBJybS8ea4ZmjTKSsfGUrcdjiFRDWyqq5KUHhT
	rI/ccWP+a8+/OxDEnMFy6JQUTTXVXmUNK9p0uL/vXzciBJhQuztm2kxjPJEuLOq4HXd8gmvk+T+
	59xYq+sgY+p2DLyMt0P7w/1ceG0C3TlrmIsZkbrRlA+5mMewToZ/40SLJQPE9Exvapzmxq0al+g
	dKyCHVGOCQgXcMwiQrdepUBemflOSdFrPK9iMo/F8aogxTjyF0u0qOXsNnC7/b29GauNIgssLJK
	ggACigcYa7wV7LKBtrJXTJ/d7OA7txTw4cYfjPhSLcn115gptqAEGsDfUN/Hw18g4dr9AeK4Bm3
	AcRqDtTeAHqmDkgvLR8Bg3mpMTlhmOmYQx9vaQrLopGv+qUN7MzYB53oY8klNhOq4Z/S1f8+Mjt
	4ZI1wF2HwexqQsqbfZkNlbGIDE7L/vjQtlCPisl6gON9UXsCCMyOaZMqiw2NnAulMo505I4KyJF
	6SL//pP8jzb/rWr5+J1aauE3AYf6dyhG/Yt+2QVdw/AWaxwGP5d5pah8Un0TNzKZkVOCHFBKMPo
	4Ttn9Yk8sn2CmLku6Gr9lLOhfLj/i8JHgGQ78RJ1epr86F15nfv9Bs92CQEmL+4TWsYijQRCGQJ
	+jBA==
X-Received: by 2002:a05:6820:5715:20b0:70a:1787:268a with SMTP id 006d021491bc7-70a178733admr1123581eaf.89.1792627737623;
        Wed, 21 Oct 2026 17:08:57 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:08:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/2] clk: sunxi-ng: h616: export the APB2 clock
Date: Wed, 21 Oct 2026 18:08:54 -0600
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQ6CMBBEf4Xs2dW20Qr8ivHQrousYCEtEhLCv
 1v0NHmTyZsVEkfhBHWxQuRZkgwhgz4UQK0LT0Z5ZAajjNXKaEwf/5YpR7gowdZqi270BqkfqMN
 Zo61YOeKqrEoPWTNGbmT5Xdzuf86OF9O0e/eFd4nRRxeo3ausXuREfYfNEPF6PMO2fQE4WH1Sq
 AAAAA==
X-Change-ID: 20261021-submit-sun50i-h616-apb2-clock-v1-69e0ace9898b
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Expose APB2's existing clock ID so device trees can reference the UART baud
clock independently of the per-port bus gates. Add the public binding ID
first, then remove the redundant private definition.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (2):
      dt-bindings: clock: sun50i-h616: export the APB2 clock
      clk: sunxi-ng: h616: drop the private APB2 clock definition

 drivers/clk/sunxi-ng/ccu-sun50i-h616.h      | 3 +--
 include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 9ef62592b80c7ffb8cd987d889f659c1dc4f9f16
change-id: 20261021-submit-sun50i-h616-apb2-clock-v1-69e0ace9898b

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

