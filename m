Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2668D21B9FE
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Feb 2025 19:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907972; cv=none; b=fU0TbTSdTyaQ76spYgU+mrCGwENk9gFRkeFcp0Y2o2fW3Cr0SkwaVfjEJQfmUUs/TA7GXhxoWHEIFCI91UBEGRWLSsk6pegvieGy9qJYQbYnKx58YO+owJyOgMUdBnJwRPgQesDz53yePs6xiEvVkm4+c9wc8w5xSDSQ23VJXbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907972; c=relaxed/simple;
	bh=yrjCylDVvM1JzrFd8ihuKPjDtBMnkU0vBwOAngnuvGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c83xRH12UFkHHSgrCejO6+5blEFC0ogPnuhYk+NBm418vPkMNmwnbocUgb+4+HcUue27BWe8Q+DogwfHoMuPd8m67iVYNLL/olAHMcvbEgUBiEou8X7a3+W1Qy8hxA3NvYAnbeoXufuwiOdw1K57jJCbLpbHla7FEAIgPxGg/oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOSlzyuO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOSlzyuO"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43690d4605dso37654755e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Feb 2025 11:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739907968; x=1740512768; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrjCylDVvM1JzrFd8ihuKPjDtBMnkU0vBwOAngnuvGU=;
        b=eOSlzyuOSx0qcQE2y18pXGWZzQ9i5ZSJMBUDBc2+jUE5kmjnmIBM6yhNBkAXqKVuVF
         HN0XQqglM4TsWtAusqH6vw0IHpdt0XQ9JvZPnjmYyI0wU64xQE2ruD12BksWJ9tO1C4i
         6Nc7hLDlpCcab4TSv85iYxzcsvthQxo+UPEy32oAWfwMk5ESDUhEKZLCEfOYXdS9UCDh
         mevFVfpSEM1Owz0+AtLUgmFdqcIcGouLjhEIT4BOWXUuzMbhJNhgCvQi+enJCkY0Q/2y
         YbaSOn5anMXAZgs7lznsh0GC+F5nyTe2XxGrckEY1QNN7EKWcIb+SKJoyptlheP8bdkM
         rKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907968; x=1740512768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrjCylDVvM1JzrFd8ihuKPjDtBMnkU0vBwOAngnuvGU=;
        b=Zz3s8m444CdK/CvVkYxEqACkgTsFU6TNPJ40rUK7fxSxymeCfgEI6eC06tlSIQJV+0
         9MsxwXXGM6dZCpDyh7UzF7HkdOE8WK6qcMrxHvl+Y8bDU+B6tMtGY7o7eaLbri/80kz8
         yTm+z1iRR09w1YIoXZP1E/+6ZLbTvFhJ8NwSGW2c9B3JLEtqdtQjt+qnTuyqfqRW4l0T
         PhSiv40B2N/0YycKt6FmgbMpBiQS8w1EPUcdf1dsthHAf994tNqqW9MfQOT2IVARzAc9
         Esy7wHpLoJyTcWDcaQ4fQ5GGgChLabIO6iWg48b3MbC7nYwzul91VIKkLXskWlmmhBI2
         UfQA==
X-Forwarded-Encrypted: i=1; AJvYcCXQUKzX7MXFhkbnUMwLVIrv8MwJbuMgbJY8HxzFmWaI7RKTf9qAd12a77k2NhedXX7DAdtlCYfOePfirg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNnG7LI2cHeAC3qzaEagb/1guy/u9XTFJtX+hIEpbo1KwdLLod
	F3jnFVPBFxDg5YGPx2+S2SZ4lp3elNCwbjpn2pBLFSRy7PVlcsc+
X-Gm-Gg: ASbGncsyQxPh+swXqbt/xW495kWAM1xBf+UQ17CYY1tKpmKamg4yyXB5oytxUg86Z7n
	7eZRwSiseHnrjw85+W8xBNgEcIsGBFyV4w1AcEhPZaonGhRL7tXE045XE2G824FJTmhv+CXiaNc
	QKsxc389vOaDXNGHjIzVdhrhy9ozV8N+orvAiZVdz16gobjnIbSYUjt2XsDr6hoyNpMY4h2jgsP
	xNm1PjsskMt4HuODtU+Tg7zJTb+FnE8u6KVLWFQuTrj2UQHnIMuWQo4wCuCg8+AB977LrFAVBLk
	XcebbwESHYc/Jg0H9sQS42jLI/u42lNvpas3upuIi0neyR1A9cfT/nQzf65Q2KhdLXA=
X-Google-Smtp-Source: AGHT+IFA6p9n50aVJnqGFUk/7jRV35aPeAFF0EkhsdD9wheQ/uYJENSRNYwnKizaauIZeKc29AB6rw==
X-Received: by 2002:a05:600c:1c84:b0:439:8c80:6af2 with SMTP id 5b1f17b1804b1-4398c806da5mr61455325e9.21.1739907966616;
        Tue, 18 Feb 2025 11:46:06 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43984924201sm68753485e9.6.2025.02.18.11.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:46:06 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/15] clk: sunxi-ng: a523: add USB mod clocks
Date: Tue, 18 Feb 2025 20:46:05 +0100
Message-ID: <2220848.Mh6RI2rZIc@jernej-laptop>
In-Reply-To: <20250214125359.5204-11-andre.przywara@arm.com>
References:
 <20250214125359.5204-1-andre.przywara@arm.com>
 <20250214125359.5204-11-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 14. februar 2025 ob 13:53:54 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Add the clocks driving the USB subsystem: this just covers the two
> clocks creating the 12 MHz rate for the OHCI (USB 1.x) device. The rest
> of the USB clocks are either gate clocks (added later) or created
> internal to the USB IP.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


