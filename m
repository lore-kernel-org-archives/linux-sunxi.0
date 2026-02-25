Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1813D903F
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Feb 2026 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038689; cv=none; b=eSVmDOmoBmn/jMui95MLrNxQNq+/zC7+7rA1Z/Pb2BExnDqUTYxMuhhMotKt8A3mLl1uw0VMaUEZBWhl7NUICgiWFHPQJFjWnXEJvyQxz5pPSQvsK50ZPFCg4QGwQIatZ7SHv+YPWQ7sZAJEbgluSqdL5zbBL6e/Y6fv94HkcJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038689; c=relaxed/simple;
	bh=LsyQapBUPdwmIiG02O5zaGYSemSJNCNHx7rED23cBYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M0z2Xl21LNWJPxFwtebeg2PXZ1UBd7jfMSHGG2YJxMaZmENqWoOBY+aYY7mBb0aiTMfBe/BK5+ntoXA4V6wVZ52SrVLaoF29H1+jp/GsKFvH0dei0R1KdQ9mPcnlR2gbPNpKpK3unvxhNfCc+4Jll9WPTuaZbLD6t+HyAdPi+4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYuwV6OF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYuwV6OF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48371bb515eso87568555e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Feb 2026 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772038686; x=1772643486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsyQapBUPdwmIiG02O5zaGYSemSJNCNHx7rED23cBYY=;
        b=GYuwV6OFvOwsPu0kX/jc2lQvhCzAeyOXgGB4Xb2RXln8pDabyO7/x5QQP75PgQBsd2
         0NW0S5FJDNTTgf2N75uk14+cls1O7qW4fE5LuPY28NqgrgteMJEm/pt7ZCHzzeTEwW5U
         B1RkCZcjwPe9Iwm8aqc/xVYgniI7aRdF+Igmtskd6IM8VxP/aKZqDk4L5EYTpj0xvyfy
         AACKfwHYQx/kwT8EudIdpaYZAWzXqyh6+m0l6SRNy5qYuhKl+MtaVlSH2xT/85Gx3O2J
         I5FhwQOA51WqWLjdL1y1jB3OaKAl0VPyH0h8vCvZo3kRsMRQXYnAzbGUJpU/7t1FRtuJ
         bi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772038686; x=1772643486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LsyQapBUPdwmIiG02O5zaGYSemSJNCNHx7rED23cBYY=;
        b=mAVAHQTHBLLIVDh7mMUyAK4KQ7tToQz/0+JohuuThy4AHR+jTOBujgyX1w1UpZ+73R
         jFedsZCwlpT9JoqseBlFzHrKbrj+R5ZVS3Gn2DXRxanjf58oj8MZxJSBCJ3pE/ukZciM
         QQ0c2hOCRdFcJ9dO4xDQ4JFG60ovDWPQU96TTPml9rUq70c6jaPPQYanANojcuNKywbN
         Ugu1NoPNtUHmXoEQM/k2+xivh0qVH27Q5zWPeOmzDpEWq53kVFpfn0G0Zej4arZMH+Ov
         6FoMjfMbwQsx72+t/rL3g0s/ljD3TG2FRtnbJfsob19/MZBRvKzgAHSDOqyQIJzPGY3k
         5u2w==
X-Forwarded-Encrypted: i=1; AJvYcCXtmMlxe99jKXe6kYnYseR8fmlnkP/atAudq8FnxQNGf+K3gTHQUIBbKF9FNRckFF696KpcUDeeJocMQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkLH0jAgo4N+8nu83VtvCpo6CTF4bXWwTqXuLAzbi9r6gAOTpu
	S0rMRc0bBGYEe8ON2DzIHmaWq+eXZeAkxX6LzTFtEUIA1mAVytieKKF8
X-Gm-Gg: ATEYQzwhzgMUdxvvcJEsS/HK8pQlmj06yqKgeNt5uSx45j/7b7C3Nf/89g+sf9p5s1F
	InzFFfCtJ8FN5aDK42RtLlgJX8oZS6xkTdBEI6tTSsNP3hR+xV0Gu3VF65tPPStg0T9VnRYiN9j
	zWTy20Z4MKvJCg018wIiz10BeV7EhfTOsN/iCLZiX7sONN9Xwa1W0tXikZQHR6gcOMYJlG6isNt
	lCN+bXV2v4iQykyXdi4vSWLk+cND4kK3IG6g2na6Mr9FJAcWLmU4dZKALAamMuUDdm2aEVcR99V
	U6sSS+EmKpDYtGFIeGI4MIJjlYpRSVAmHtQAfpB3NCcfaXCg3Cgh3HqLtQVq0E1Chw1WUWfVx1U
	N/jQI/miCUd810ef/IreW30BM4oFky/CLT6WDTJ6W76nsY8pX/A0FtnbZhsqp0rK/a0D55FEKDD
	aPX4OnZkE+ORnyC/08P9+1RnrY61MdDJ8YoaFZdIPRCQUPKazdHz/gvlSM/QtxJ7a/8OSUHXrze
	t0z7Q5d
X-Received: by 2002:a05:600c:8b03:b0:483:c12b:fe4b with SMTP id 5b1f17b1804b1-483c12c002cmr31522165e9.9.1772038686018;
        Wed, 25 Feb 2026 08:58:06 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb789efsm29583655e9.2.2026.02.25.08.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 08:58:05 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject:
 Re: [PATCH 1/3] dt-bindings: leds: sun50i-a100: Add compatible for Allwinner
 A523 SoC
Date: Wed, 25 Feb 2026 17:58:04 +0100
Message-ID: <5968038.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260225160828.1687643-2-wens@kernel.org>
References:
 <20260225160828.1687643-1-wens@kernel.org>
 <20260225160828.1687643-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 25. februar 2026 ob 17:08:24 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> The Allwinner A523 SoC family features an identical LED controller as
> found on the A100.
>=20
> Add a SoC-specific compatible for it, with fallback to the A100 one.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


