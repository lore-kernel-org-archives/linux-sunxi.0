Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF093342C95
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 15:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666214; cv=none; b=GkPxyQyFjAMX2lZwgbNVy12UJQ4WqWTuUtc0hJWK068CDMcGYniMQb5YDpgw4+ULn01boIoMPbcM3cPvqOXtHmd7eA5r2ndkMp4LhMZOtASaYJGRCbKWyLufTGTPBI8SsIe25zy84sExcc+mzv7pR0ue5YgWTkyAdyvmOJPIuPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666214; c=relaxed/simple;
	bh=0OdKjf6E11PLhTN47izQgrYewu6DAaBIZBsxLqLrIEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oq6W+MtxYpcf9gCwXdK64nxYBanL1wgLQXB76FyoBi5J/Z3vhgtQrJ7I1bGE6p0nVPFYXbu6iF9mhf1NmnxMvfwe+xri7hoMdQsf4iD+xjjskGMp2tJ4KiqUxCahWRxrWRSt1en28Z1a55yce8CG/CpoC4NfrWTdHprbBvMN0u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjsKOcgL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjsKOcgL"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-475db4ad7e4so16232045e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 08:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666211; x=1762271011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OdKjf6E11PLhTN47izQgrYewu6DAaBIZBsxLqLrIEE=;
        b=EjsKOcgLT7tA3dtWC78UpV5wppVsR1sz+3/mR36t7oRWPGt3b7WdG1yudpPpwXYwFK
         XDEcDcAvTr7bj/0UuoWU3fu6E7aCLMO0IrtSPrAxcJnH1MlZH62UkuWW2Xhpn1s7ZA3M
         FNTal4KHfTIiyrXLNrsG0OzENsna+EAtqPY/XATCgp2JJbmhhitIK9EyrhjiQzy2EnYI
         3wuTFJ+yBeIpBT85cmJhR8cr9Oae4UpmanQ16agyjPUL1y0/iSJAuGTclnfeJbdYxZp2
         WwF6bNyHhGHzDc0KkSrSH3/ioQL8QegfupIlD4QTsfwr/NaWKlhKFJJUA1/5zAIDcqEH
         BI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666211; x=1762271011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OdKjf6E11PLhTN47izQgrYewu6DAaBIZBsxLqLrIEE=;
        b=Q6MESEz++EDi6hjqB5eFUCaZvaBkUSQx1hrSCilCQLFuToOO9JscttyhiTBPKVT04s
         25qGC7hJ2YLY0uZh1IQLbTwjmW6AOwd6KpR0hCSto7OAvsGns7XX0FGVyj4kYQ8/db/7
         6mgugCxjcSd7neV1Sa8eNZkbvgWiPsfzZeA9suqk8oBzto7NyD/i0WrMWAhY1GlWBe+3
         IdLt3hJlxWyAMHc/Mj8zvNjNhmiZG/zJacdiIM+ENHlm9tKzdktMYVMtyQXaIir89Xyj
         sIVGyIuFlbw6OY6oumGKMab3RJDpv6VxuUkoVWVlYr5O5H1L6T1bw8Cyx6ph/4kODH/q
         Ikfg==
X-Forwarded-Encrypted: i=1; AJvYcCUiMenZuHiJSGrbWRylc/c4gb7kIG5AiWCalCJTbaWLI2EcxSzuNV7JlZ9oWehozo2etMDY64WssKnH5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsKUdsskTPskULnht1PjV+LLPUW/5fEquCd9M0VU14CWdq98lp
	myjwjcd6mSfrngKIqA3QYGS3HCJH1pXpR8Y6v3jnjktLXwDHzMa1ooZK
X-Gm-Gg: ASbGncsJJqcTbn6pEmXMuM6Yqa1ZrE+5CLKCfOB8j7+42dl3uINiRLzHkfrRwPmdAG9
	DtkKmdLJhsL40Q0lk3n3J2xL5GolWgTka+H6MnR9VHz+JdW1QM3ix0++LJh2u959+5OzABp1Zo1
	VSuwyrAKQOpp3JBgT8ZOawOVXNhCFGIMRReQnpV3LIbnPuXQE7hMTa3aQ/gt6PBK0oBPiIyu+JH
	5w+yc9wKj/7YUDIZqLOKIBjQCBpB9aAXsueRiu8PC8P5JHrihqQax6xyZ2fHwWvMfs9fHFs6JIF
	UgA2Ge+knGhVo3dNAknyxRCluUHcbztZ5nCYe5nwgTJ7cREc9iFZk3kFVFnjsTweH3Y5OH3i66F
	e13CpWtkzntQYFaruVHNkk8zmZF4dO/kArfc/OlhAgDX03Jk9YwGdk5BTHCGgofJXpTWFiVhG4w
	9FNdgLln8c5mF10sCaL3tLjMC9d8cMMKOi7lqGDcx7+I2puOjptw4AMwM4kw==
X-Google-Smtp-Source: AGHT+IGQT1sWn537O9lUQH0SeyIcZJ4uWohxTzjPx9kV6HFu78PmQQbglpth1JWOPqlEUpT9jeFZgg==
X-Received: by 2002:a05:600c:4e02:b0:475:dd04:128a with SMTP id 5b1f17b1804b1-47717e6b4c8mr33281395e9.31.1761666210763;
        Tue, 28 Oct 2025 08:43:30 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd02cd6dsm210045835e9.2.2025.10.28.08.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:43:30 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject:
 Re: [PATCH v4 08/16] mtd: rawnand: sunxi: add has_ecc_block_512 capability
Date: Tue, 28 Oct 2025 16:43:29 +0100
Message-ID: <8637155.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <20251028073534.526992-9-richard.genoud@bootlin.com>
References:
 <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-9-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 28. oktober 2025 ob 08:35:01 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The H616 controller can't handle 512 bytes ECC block size. The
> NFC_ECC_BLOCK_512 bit disappeared in H6, and NDFC_RANDOM_EN took its
> place.
>=20
> So, add has_ecc_block_512 capability to only set this bit on SoC having
> it.
>=20
> No functional change.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


