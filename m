Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE7E156960
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 21:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713215088; cv=none; b=PZvF3MHSjDlLw7FA0/6G6EG6njfnLMiIIBEJuJzQd4AwCqZZ6Tkwr7myszNnIHeZlB+jMooaDr40ttFTv4vL08UVKqHWgXq+c/DwSbKDbr7jgTI+irkYXwtdFSsO8GSYQJxMMZF2qdRkuqzIbSFwpBBTfYNIS/+5IEMaw5laRIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713215088; c=relaxed/simple;
	bh=97xpVeSkjoCm8WD/aULES1/pfpLnChuVXu2gEYOb/ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BhvUeXpS90be49woJICKCzBOUlzv2VAx4LeGrnFt7dDW/uxWQFXM8Y1gja9l6xHqkTMy2wlmw/AkTgn+DmIdXp8bTlf/74P+eiTnQ3a1TJdug2RVZSbdTMs0dUPdYomrI8tVRn0I79k7SBRW7z6urbkhqxpH/FlCnyp+fWKyNqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffW5y3Q6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffW5y3Q6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41885eeb104so2764445e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 14:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713215085; x=1713819885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97xpVeSkjoCm8WD/aULES1/pfpLnChuVXu2gEYOb/ts=;
        b=ffW5y3Q6Wjc3P70EpUgiyhjanUJbVj5PZfjuO+VflRyePyoLgO3xJOOFtaVOgdaIuP
         yVXKSffMS64umAj008UaMJWb9KMMAD7ap1GJXm+KYsMFATFTBZ8iirxP+A8toOfVIA1y
         3xskVXeoPxEATrnW2Kv6Kg+nHCNDGldbRiWDj8zIz/B0vy22B4hbYHE4shOb3fVyASyC
         Sml7MBHGAY/jGnd94KnJODMQDg7B1LsyOXnE9Wz0vzZh3+ucKDW6/fsNehWpbAbXquWy
         wm00wxdEYshsmbn1E12f5mXVwNDLrgYR95YOpeNGcFMxmMSkzSfRwnSf1RvAUJxcfoTx
         oJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713215085; x=1713819885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97xpVeSkjoCm8WD/aULES1/pfpLnChuVXu2gEYOb/ts=;
        b=RwmRKBS/nefSTt/XR8jDDceCwBWEJvI/HBMXcXPfxVEZ3pEeV8Ica5lzEvnA9Hnd9U
         +7YKnACdsUil+gu497Z03KjhrjBfpjyuqYbViafHsBwfBjBgVmST3e8oZHSvahAbez7Y
         7Gwqe4g6c6W6/5Eu2eQsUh1rAOHL2x62IcMcNmuB3gbrWovn0FNc1nQs8snwJ3G9wQPh
         HmgIZU1KwMPKYXxkgwW7mfGcIW1c+q8YOyi8QhuGcSKbFwuK26J/tzrT8JK6SE5P9cD+
         9sXiZYuM+UX7qWcPgZac86sicR1XC9sV0Sxd5e9SL05ohlDyJJn1On8IxFbqprbAY5Vo
         VXXA==
X-Forwarded-Encrypted: i=1; AJvYcCU7rTSKYJUdCVIe7Ns50LGHZdI5h1f/oCorULDwEEcAc1+Q48hhx0s3zoT4ouhaxTklqXNcoQPJWahFdDDPVfNgElo+KGc73cbAKdk=
X-Gm-Message-State: AOJu0Yy7OPRzzteI/jHsXUCu4O7qClV5U6/IlnUTtZ1eU8BswZ9GsPhS
	hOT4SBosi1aM3sYP8/7WsB8HtBFWZznPD90l4RTS9NAHoImNog/+
X-Google-Smtp-Source: AGHT+IENL+o6WLoa1B8krTaz77tBzWXU8btV+nzk0jjj8+LBP0PzHiHWy7wFv8qmW7Yq9JylgKtHog==
X-Received: by 2002:a05:600c:3582:b0:416:9cf8:cf05 with SMTP id p2-20020a05600c358200b004169cf8cf05mr8226650wmq.18.1713215084928;
        Mon, 15 Apr 2024 14:04:44 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id d5-20020a05600c3ac500b0041888577f1esm857952wms.10.2024.04.15.14.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 14:04:44 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: samuel@sholland.org, sboyd@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Chad Wagner <wagnerch42@gmail.com>
Subject:
 Re: [PATCH] clk: sunxi-ng: h6: Reparent CPUX during PLL CPUX rate change
Date: Mon, 15 Apr 2024 23:04:43 +0200
Message-ID: <2929835.e9J7NaK4W3@jernej-laptop>
In-Reply-To:
 <CAGb2v651T28yrkaAbX3ckV8gEsYXdGgHMgCb3Jdmbej2OnNyLQ@mail.gmail.com>
References:
 <20231013181712.2128037-1-jernej.skrabec@gmail.com>
 <CAGb2v651T28yrkaAbX3ckV8gEsYXdGgHMgCb3Jdmbej2OnNyLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 2. marec 2024 ob 12:42:11 GMT +2 je Chen-Yu Tsai napisal(a):
> On Sat, Oct 14, 2023 at 2:17=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > While PLL CPUX clock rate change when CPU is running from it works in
> > vast majority of cases, now and then it causes instability. This leads
> > to system crashes and other undefined behaviour. After a lot of testing
> > (30+ hours) while also doing a lot of frequency switches, we can't
> > observe any instability issues anymore when doing reparenting to stable
> > clock like 24 MHz oscillator.
> >
> > Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 C=
CU")
> > Reported-by: Chad Wagner <wagnerch42@gmail.com>
> > Link: https://forum.libreelec.tv/thread/27295-orange-pi-3-lts-freezes/
> > Tested-by: Chad Wagner <wagnerch42@gmail.com>
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>=20

Applied.

Best regards,
Jernej



