Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C1E342CB4
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 15:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665702; cv=none; b=nyL2SpA0M2kpSXxSPFgvHKMSyFBuWngBKBARI9cJx5kTgyGuBNELgGqVkkWvuy9J1Qb1WwQmRCtc/ukWkztBV80+uCUluSnbQKvDtDFzUBC5L0UvkVYzLo1Ci4HJcdh8ydX2+tGImjSzocE1QRazULFXEIl7SdicURVFMcUQznc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665702; c=relaxed/simple;
	bh=+zf/L6+BpO5HiQmCsVmEtAAefad0gqPlx28ytnkqVYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QioKwnK3pwUtbPMcuDUch8GualuGgG84ci5w/DhJ8o2T/9Iw7pGxdvhEu7MZ+6RwxSGEYgCqTydpPJQh4pPzCAsxO43EM151JCT6MtnzBbpLa62Z+/P5pk188yCnVIdd/IueWUiGMOoUrMH9lTmLypN/uR0WxGzOp3LlCtX9iO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJqeRy3p; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJqeRy3p"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4270a0127e1so4871933f8f.3
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761665699; x=1762270499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zf/L6+BpO5HiQmCsVmEtAAefad0gqPlx28ytnkqVYY=;
        b=PJqeRy3pWz1FSpF0MA4B/85ukUK7svLV8qNCbKipJXzXx0ob2G/GP4uZNO5bhvZ0CC
         ey76Bzf9MND450DhzBMq6Vvq6t4M5co8jxd2EUnKfizHZkF0dSKQXA5EAppfiD8FL2QM
         f1tc8k7mRGLmRX7t6LVSt/XF0NowBKfsE1TeyZ5jKSA252VUBocDD46YgaJo7+75dxsr
         UgFrXASI2Fl8NsQQeHJbMWpOx9EE3U1V890W3OanTknDzyh8/5Nb+77GwvvdJGRUgHA5
         NDLr3PnTH2Qg/gfAxoH5pKF310iBcmgaOO476R3AdYoIRMELSYpWx0ZRaalxQEP7DyTs
         tGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665699; x=1762270499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zf/L6+BpO5HiQmCsVmEtAAefad0gqPlx28ytnkqVYY=;
        b=sXj4OLbTIoTobPTXy88PrlQMj+7KaI7n7Wz7fK4kFwXjjA354y0Dv1njdCd/iO9KSB
         CLrzxnVy3KCzrEOfr+Mnx3o1LyRPiD8Bg89S9iye4KOArFFAI13u/XXv1fYI5JCl/R/V
         xdRc/IwR9eiIXzA6R0/63kCYHqKZ8OlspFPO+OZVuHhDogPA7ceboY+PUV1g12BXjlNR
         89IsZQqmpBi7b61d0xstNKbNYzcbf8Rk5LsdINTDgK1RVmNKOmEvloVy8Gva80oDq3j6
         4477yMX3t5feZNSrhKy1S0z2cUwMCDk0wilYG0MtlgLzAMxHgyXrrhJv4+ilJWSSvsr/
         Iqxw==
X-Forwarded-Encrypted: i=1; AJvYcCWcoIShMWLq7mXHLtZRT8ik9rgfthV/vfMHoDztBe5HUTEjQA3OD/RSMuUDrytu2TZe9fx7JgUzusyTbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkFbGxLZ/DUbVzp4kVzMT5UM8Hm9rM4ZBMjr/2HslIFnAx8sw3
	lGks7niVFocSTCRGk+LIudn64pJAPavyhUB7ZjEMSIBd1rU3h2pybec0
X-Gm-Gg: ASbGncuuEoZxtS1gqE2IUsg4nAPQUGx5Yt03oe4kxIqYpghBOY3mkaNnstqXSoyWBSA
	riyPaUJkFaayfOo4gzc7EF8h9BzcEeCNizCXC5JV3mH9QIFWlrEN4daxPBht/w/B6Zy47VVqOyp
	aamSDZ1u2SdhJzBP1Bgw618LKvhttjQAgIzWlPypXheaqxXSECojiXicQo812x3Up74jb3BybmL
	0S2a+trvF0GqnTGI2wI8iNbwBHkrn4csJBlCCvdd/S/WpnMw6q9aglgZvvYui4sqjLMgZk1wdNs
	vU7z9fMXsY5NsY4x6l9PUTE3oaL7fdyIesRFVKSo/0BYYIL5d5OwbyAWiwQpWjV/G+eP3DUaQpk
	uzbiXYJOnPYr515/o2SOuft2O/cEsMAoLH0KiFZ1YOzw+P+m3zKB0YQLmnrgFpuVU72jEOnkn/1
	xTg5jhFKnrHdQiWEl6IiclPL8aN4BWQdKJYjpcg7kQyr9Dc9Z7tgC3oTDCqQ==
X-Google-Smtp-Source: AGHT+IHQaqAyFKg0dIVlFNzHvuX0zpZSii67laWQ5yWofyqAlv0IPJ4MzzJSDYza6+cEoyhxJ1y+9w==
X-Received: by 2002:a5d:5c89:0:b0:428:3f7c:bcf3 with SMTP id ffacd0b85a97d-429a7e86b07mr3600391f8f.49.1761665698923;
        Tue, 28 Oct 2025 08:34:58 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm21334532f8f.6.2025.10.28.08.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:34:58 -0700 (PDT)
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
 Re: [PATCH v4 03/16] mtd: rawnand: sunxi: Replace hard coded value by a
 define
Date: Tue, 28 Oct 2025 16:34:57 +0100
Message-ID: <2017172.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20251028073534.526992-4-richard.genoud@bootlin.com>
References:
 <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-4-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 28. oktober 2025 ob 08:34:56 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The user data length (4) used all over the code hard coded.
> And sometimes, it's not that trivial to know that it's the user data
> length and not something else.
> Moreover, for the H6/H616 this value is no more fixed by hardware, but
> could be modified.
>=20
> Using a define here makes the code more readable.
>=20
> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


